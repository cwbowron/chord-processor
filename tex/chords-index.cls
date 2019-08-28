\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chords-index}[2017/02/14 Layouts for typesetting chords and lyrics]

\LoadClassWithOptions{chords-condensed}

\geometry{
  includehead,
  %% paperheight=4.0in,
  paperheight=4.00in,
  paperwidth=6.00in,
  heightrounded,
  %% top=20pt,
  %% headsep=6pt,
  %% top=7ex,
  %% top=.375in,
  top=.125in,
  %% top=.375in,
  %% headsep=1.5ex,
  headsep=4pt,
  inner=16pt,
  outer=16pt,
  %% bottom=4pt,
  %% bottom=.125in
  bottom=.125in
}

%% https://tex.stackexchange.com/questions/88133/fancyhdr-not-centering-after-changed-geometry {
\makeatletter
\ifcsname f@nch@setoffs\endcsname\else%
%% If \fancy@setoffs does not exist, then we assume old version define it to be
%% fancy@setoffs, which is the old name for it:
\let\f@nch@setoffs\fancy@setoffs
\fi
\makeatother

\makeatletter
\newcommand{\resetHeadWidth}{\f@nch@setoffs}
\makeatother

\resetHeadWidth
%% https://tex.stackexchange.com/questions/88133/fancyhdr-not-centering-after-changed-geometry }
