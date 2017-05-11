\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chords-common}[2017/02/14 Layouts for typesetting chords and lyrics]

%% \LoadClassWithOptions{article}
\LoadClassWithOptions{extarticle}

\usepackage[pdftex]{hyperref}
\usepackage[usenames]{color}
\usepackage{parskip}
\usepackage{changepage}
\usepackage{gtrcrd}
\usepackage{units}
\usepackage{lastpage}
\usepackage{ifthen}
\usepackage{fancyvrb}
\usepackage[T1]{fontenc}
\usepackage{multicol}
\usepackage{fancybox}
\usepackage{marginnote}
\usepackage{amsmath}
\usepackage{geometry}
\usepackage[dvipsnames]{xcolor}
\usepackage{roboto}

%% https://en.wikibooks.org/wiki/LaTeX/Colors
\newcommand{\TT}[1]{\texttt{\textbf{#1}}}
\newcommand{\colorTT}[2]{\textcolor{#2}{\TT{#1}}}
\newcommand{\ttb}[1]{\colorTT{#1}{blue}}
\newcommand{\ttr}[1]{\colorTT{#1}{red}}
\newcommand{\ttg}[1]{\colorTT{#1}{ForestGreen}}
\newcommand{\ttv}[1]{\colorTT{#1}{Violet}}
\newcommand{\ttp}[1]{\colorTT{#1}{Purple}}
\newcommand{\ttf}[1]{\colorTT{#1}{Fuchsia}}

\setlength{\columnseprule}{.25pt}
\setlength{\crdheight}{2.5ex}

\widowpenalties 1 10000
\raggedbottom

%% if lastpage@lastpage is not set, assume 1
\ifcsname lastpage@lastpage \endcsname
\else
   \newcommand{\lastpage@lastpage}[0]{1}
\fi

\setlength{\parskip}{1em plus1em minus.8em}
\setlength{\parindent}{0cm}

\renewcommand{\crdfont}{\normalfont \small \sffamily \bfseries \color{blue}}

\newcommand{\strum}{}
\newcommand{\TITLE}{}
\newcommand{\AUTHOR}{}
\newboolean{titleSet}
\newboolean{authorSet}
\setboolean{titleSet}{false}
\setboolean{authorSet}{false}
\newcommand{\songtitle}[1]{\hypersetup{pdftitle = {#1}} \renewcommand{\TITLE}{#1}\setboolean{titleSet}{true}}
\newcommand{\songauthor}[1]{\hypersetup{pdfauthor = {#1}} \renewcommand{\AUTHOR}{#1}\setboolean{authorSet}{true}}
\newcommand{\songnote}[1]{\renewcommand{\strum}{#1}}

\newcommand{\chorus}[1]{\begin{adjustwidth}{2em}{0pt} #1 \end{adjustwidth}}

\newlength{\repeatOffset}
\setlength{\repeatOffset}{.5ex}

\newcommand{\rpt}[4]{#2[#3\normalfont\footnotesize\sffamily{\hspace{\repeatOffset}(#1)}]{#4}}

\newcommand{\twobars}[3][]{\rpt{2}{#2}{#1}{#3}}
\newcommand{\halfbar}[3][]{\rpt{\(\frac{1}{2}\)}{#2}{#1}{#3}}
\newcommand{\threebars}[3][]{\rpt{3}{#2}{#1}{#3}}
\newcommand{\fourbars}[3][]{\rpt{4}{#2}{#1}{#3}}
\newcommand{\onebar}[3][]{\rpt{1}{#2}{#1}{#3}}

\newcommand{\intro}[1]{\textsc{Intro: }\raisebox{-2ex}{{\crdfont #1}}}
\newcommand{\outro}[1]{\textsc{Outro: }\raisebox{-1.6ex}{{\crdfont #1}}}

\newenvironment{Summary}{\vfill\begin{flushright}}{\end{flushright}}
\newcommand{\summarize}[1]{\texttt{#1}}

\newlength{\singleindent}
\setlength{\singleindent}{1em}

\newcommand{\indentone}[1]{\begin{adjustwidth}{\singleindent}{0pt} #1 \end{adjustwidth}}
\newcommand{\indenttwo}[1]{\begin{adjustwidth}{2\singleindent}{0pt} #1 \end{adjustwidth}}
\newcommand{\indentthree}[1]{\begin{adjustwidth}{3\singleindent}{0pt} #1 \end{adjustwidth}}

\newcommand{\chart}[2][2in]{\shadowbox{%
\begin{minipage}{#1}
\large
\begin{centering}
\texttt{#2}
\end{centering}
\end{minipage}}}

\newlength{\marginChartOffset}
\setlength{\marginChartOffset}{.4in}
\newlength{\marginChartHorizOffset}
\setlength{\marginChartHorizOffset}{0em}

\newcommand{\marginChart}[2][2in]{\marginnote{\hspace{-#1}\hspace{\marginChartHorizOffset}\chart[#1]{#2}}[\marginChartOffset]}

% Computer Modern TT
%% \newenvironment{typewriter}{\fontfamily{lcmtt}\selectfont}{\par}
% Latin Modern TT
\newenvironment{typewriter}{\fontfamily{lmtt}\selectfont}{\par}
\newenvironment{courier}{\fontfamily{courier}\selectfont}{\par}

%% \AtBeginDocument{\begin{typewriter}}
%% \AtEndDocument{\end{typewriter}}

%% \AtBeginDocument{\begin{courier}}
%% \AtEndDocument{\end{courier}}

\newenvironment{chord-processor}{}{}
