# chord-processor

Racket based pre-processor and LaTeX styles for formatting guitar and ukulele chords charts. It can create full page (8.5" x 11") annotated chord and lyrics charts, or condensed versions intended to fit 1/4 page in landscape orientation. Ideal for printing 4 songs per page and cut into highly portable song sheets.

* [Sample markup](sample.cwb)

Sample Output:

<object data="output/sample.pdf" width="550" height="425" type='application/pdf'/>

Dependencies:
 * [Racket](http://racket-lang.org/)
 * LaTeX / latexmk
   * http://www.ctan.org/pkg/gtrcrd
   * http://www.ctan.org/pkg/gchords
