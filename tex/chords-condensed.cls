\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chords-condensed}[2017/02/14 Layouts for typesetting chords and lyrics]

\LoadClassWithOptions{chords-common}

\usepackage{gtrcrd}
\usepackage{gchords}

\geometry{
  %% paperheight=4.0in,
  paperheight=4.25in,
  paperwidth=5.5in,
  heightrounded,
  %% top=20pt,
  %% headsep=6pt,
  %% top=7ex,
  top=.5in,
  %% top=.375in,
  headsep=1.5ex,
  inner=16pt,
  outer=16pt,
  bottom=4pt,
}

%% No column divider
\setlength{\columnseprule}{0pt}

\setlength{\parskip}{4pt plus1em minus1em}

%% Setup header: Title -- Author
\usepackage{fancyhdr}
\fancypagestyle{condensed}{%
\renewcommand{\headrulewidth}{.25pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhead{}
\fancyfoot{}
\fancyhead[L]{\TITLE\ifthenelse{\boolean{authorSet}}{~--~\AUTHOR}}}

\pagestyle{condensed}

\smallchords

\newcommand{\ukeA}{\def\strings{4}\chord{t}{p2,p1,o,o}{A}}
\newcommand{\ukeAm}{\def\strings{4}\chord{t}{p2,o,o,o}{Am}}
\newcommand{\ukeAseven}{\def\strings{4}\chord{t}{o,p1,o,o}{A7}}

\newcommand{\ukeBb}{\def\strings{4}\chord{t}{p3,p2,p1,p1}{B$\flat$}}
\newcommand{\ukeBbm}{\def\strings{4}\chord{t}{p3,p1,p1,p1}{B$\flat$m}}
\newcommand{\ukeBbseven}{\def\strings{4}\chord{t}{p1,p2,p1,p1}{Bb7}}

\newcommand{\ukeB}{\def\strings{4}\chord{t}{p4,p3,p2,p2}{B}}
\newcommand{\ukeBm}{\def\strings{4}\chord{t}{p4,p2,p2,p2}{Bm}}
\newcommand{\ukeBseven}{\def\strings{4}\chord{t}{p4,p3,p2,o}{B7}}

\newcommand{\ukeC}{\def\strings{4}\chord{t}{o,o,o,p3}{C}}
\newcommand{\ukeCMajSeven}{\def\strings{4}\chord{t}{o,o,o,p2}{Cmaj7}}
\newcommand{\ukeCm}{\def\strings{4}\chord{t}{o,p3,p3,p3}{Cm}}
\newcommand{\ukeCseven}{\def\strings{4}\chord{t}{o,o,o,p1}{C7}}

\newcommand{\ukeCsharpm}{\def\numfrets{7}\def\strings{4}\chord{t}{p6,p4,p4,p4}{C$\sharp$m}}

\newcommand{\ukeD}{\def\strings{4}\chord{t}{p2,p2,p2,o}{D}}
\newcommand{\ukeDm}{\def\strings{4}\chord{t}{p2,p2,p1,o}{Dm}}
\newcommand{\ukeDseven}{\def\strings{4}\chord{t}{p2,p2,p2,p3}{D7}}

\newcommand{\ukeE}{\def\strings{4}\chord{t}{p1,p4,o,p2}{E}}
\newcommand{\ukeEalt}{\def\strings{4}\chord{t}{p4,p4,p4,p2}{E (alt)}}
\newcommand{\ukeEm}{\def\strings{4}\chord{t}{o,p4,p3,p2}{Em}}
\newcommand{\ukeEseven}{\def\strings{4}\chord{t}{p1,p2,o,p2}{E7}}

\newcommand{\ukeEb}{\def\strings{4}\chord{t}{o,p3,p3,1}{Eb}}

\newcommand{\ukeF}{\def\strings{4}\chord{t}{p2,o,p1,o}{F}}
\newcommand{\ukeFm}{\def\strings{4}\chord{t}{p1,o,p1,p3}{Fm}}
\newcommand{\ukeFseven}{\def\strings{4}\chord{t}{p2,p3,p1,o}{F7}}

\newcommand{\ukeFsharp}{\def\strings{4}\chord{t}{p3,p1,p2,p1}{F$\sharp$}}
\newcommand{\ukeFsharpm}{\def\strings{4}\chord{t}{p2,p1,p2,o}{F$\sharp$m}}

\newcommand{\ukeG}{\def\strings{4}\chord{t}{o,p2,p3,p2}{G}}
\newcommand{\ukeGm}{\def\strings{4}\chord{t}{o,p2,p3,p1}{Gm}}
\newcommand{\ukeGseven}{\def\strings{4}\chord{t}{o,p2,p1,p2}{G7}}

\makeatletter

\def\@chords{}
\def\@lastChord{}

\newcommand{\stanzaChords}{\texttt{\@chords}}

\newcommand{\x}[2]{\ifthenelse{\equal{#1}{\@lastChord}}
{\edef\@chords{\@chords{}- }}
{\edef\@chords{\@chords{}#1 }}%
\def\@lastChord{#1}%
\textbf{#2}}

\newenvironment{stanza}
{\def\@chords{/ }%
\def\@lastChord{}%
\let\oldnewline\newline%
\renewcommand{\newline}{\edef\@chords{\@chords{}/ }\oldnewline\null}}
{\let\newline\oldnewline}

\makeatother