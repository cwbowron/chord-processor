\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chords}[2013/05/15 Layouts for typesetting chords and lyrics]

\LoadClassWithOptions{chords-common}

\geometry{
  top=.75in,
  inner=.5in,
  outer=0.5in,
  bottom=.5in,
  headheight=3ex,
  headsep=4ex,
}

\usepackage{fancyhdr}
\fancypagestyle{big}{%
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
% Show page numbers if more than 1 page
\fancyhead[R]{\ifthenelse{\lastpage@lastpage=1}
{\strum{}}
{\ifthenelse{\thepage=1}{\strum{}\hspace{1em}}{\TITLE\space--\space\AUTHOR \hspace{1em}}\thepage}}

\fancyhead[L]{\ifthenelse{\thepage=1}
{{\large \textbf{\TITLE}} -- {\large\AUTHOR}}
{}}}

\pagestyle{big}

\newcommand{\x}[2]{\CHORD{#1}{#2}}
