#lang racket

(require racket/path)

(define BEGIN-PROCESSING "\\begin{chord-processor}")
(define END-PROCESSING "\\end{chord-processor}")

(define (process-line text add-null)
  (let ([chords (list)])

    (define (char n)
      (and (< n (string-length text)) (string-ref text n)))
    
    (define (finalize-results str)
      (values
       (string-append
        (if (prepend-null? str) "\\null" "")
        str
        (if (append-backslash-backslash? str) "\\\\" ""))
       chords))

    (define (append-backslash-backslash? result)
      (string-contains? result " "))

    (define (prepend-null? result)
      (and add-null
           (> (string-length result) 0)
           (eq? (string-ref result 0) #\~)))

    (define (space-scan n result)
      (case (char n)
        [(#f) (find-chords n "")]
        [(#\space) (space-scan (add1 n) (string-append "~" result))]
        [else (find-chords n result)]))
    
    (define (find-chord-change-word n result require-bracket?)
      (let ([ch (char n)])
        (cond
          [(not ch) (find-chords n (string-append result "}"))]
          [(and (eq? ch #\}) require-bracket?)
           (find-chords (add1 n) (string-append result "}"))]
          [(and (not require-bracket?) (member ch '(#\space #\- #\, #\')))
           (find-chords (add1 n) (string-append result "}" (string (char n))))]
          [else
           (find-chord-change-word (add1 n) (string-append result (string ch)) require-bracket?)])))

    (define (find-chords n result)
      (case (char n)
        [(#f) (finalize-results result)]
        [(#\<)
         (let loop ([n (add1 n)] [chord ""])
           (case (char n)
             [(#f) (raise (format "Missing > in `~A`" text))]
             [(#\>)
              (set! chords (append chords (list chord)))
              (case (char (add1 n))
                [(#f #\<) (find-chords (add1 n) (string-append result (format " \\x{~A}{...}" chord)))]
                [(#\{) (find-chord-change-word (+ n 2) (string-append result (format "\\x{~A}{" chord)) #t)]
                [else (find-chord-change-word (+ n 2) (string-append result (format "\\x{~A}{" chord)) #f)])]
             [else (loop (add1 n) (string-append chord (substring text n (add1 n))))]))]
        [else
         (find-chords (add1 n) (string-append result (substring text n (add1 n))))]))

    (set! text (string-trim text #px"\\s+" #:left? #f #:right? #t))
    (space-scan 0 "")))

(define (process-port)
  (let loop ([x (read-line)]
             [processing #f]
             [last-line #f])
    (cond 
      ((eof-object? x) (values))
      ((string-contains? x END-PROCESSING)
       (displayln x)
       (loop (read-line) #f x))
      ((string-contains? x BEGIN-PROCESSING)
       (displayln x)
       (loop (read-line) #t x))
      (processing
       (let-values ([(text chords) (process-line x (and last-line (> (string-length last-line) 0)))])
         (displayln text)
         (loop (read-line) #t text)))
      (else
       (displayln x)
       (loop (read-line) #f x)))))

(define (print-port)
  (do ((x (read-line) (read-line)))
    ((eof-object? x))
    (displayln x)))

(define (generate-latex input-file)
  (with-input-from-file input-file process-port))

(define (main)
  (let ([args (vector->list (current-command-line-arguments))])
    (if (empty? args)
        (displayln "No file specified!")
        (let ([filename (first args)])
          (with-output-to-file
              (path-replace-extension filename ".tex")
            (lambda ()
              (generate-latex (first args)))
            #:exists 'replace)))))

;;;(print (current-command-line-arguments))
;;; (generate-latex "Springsteen.cwb")

;;(process-line "    <D> To this day when I <D> hear that song, I <D> see you standin' there <D> on that lawn")
;;(process-line "     ")

;(process-line "<D> To this day when I <D> hear that song, I <D> see you standin' there <D> on that lawn ")
;(process-line "<G> {Dis}count shades, <G> store bought tan --- <Bm> flip-flops and <A> cut-off jeans ")
;(process-line "Some<D>where between that <D>{set}ting sun, <D> I'm on fire and <D> born to run ")
;(process-line "You <G> looked at me and <G> I was done, but --- <Bm> ... we're just getting <A> started")
;
;(process-line "   <D> ... When I think about <D> you, <A> ... I think about <A> 17 ")
;(process-line "   <Bm> ... I think about <Bm> my old Jeep, <G> ... I think about the <G> stars in the sky ")
;(process-line "   <Bm> ... Funny  how a <Bm> {mel}ody, <A> ... sounds like a <A> {mem}ory  ")
;(process-line "   <D> ... Like the <D> {sound}track to a <G> Ju--ly <G> {Sat}urday <Em> night <Em>{...} <A><A>")
;(process-line "   Spring<D>steen ... <D>{...} <D><D><G><G><Bm><A>")

(main)
