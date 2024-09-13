\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LA_Tech}[2011/12/23 My Class]

%% Load base
\LoadClass[12pt]{report}

%% Load additional packages and commands.
\usepackage{tocloft}


%% Additional TeX/LaTeX code...

\AtBeginDocument{\setlength\abovedisplayskip{3pt}}
\AtBeginDocument{\setlength\belowdisplayskip{3pt}}

\renewcommand{\cfttoctitlefont}{\large\bfseries}
\renewcommand{\cftloftitlefont}{\large\bfseries}
\renewcommand{\cftlottitlefont}{\large\bfseries}
\setlength{\cftbeforeloftitleskip}{42pt}
\setlength{\cftafterloftitleskip}{12pt}
\setlength{\cftbeforepartskip}{0pt}
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}

\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}

\setlength{\parskip}{0in}
\setlength{\parindent}{0.5in}
\setlength{\textwidth}{6in}% 8.5 - 1in - 1.5in = 6in
\setlength{\textheight}{9in}% 11 - 1in - 1in = 9in
% The height of the header
\setlength{\headheight}{0.202in}
% the space between the header and the start of the document is 0.5 - .202, because we want 1in margins
\setlength{\headsep}{0.298in}
% We want the page number to display 0.5 inches from the bottom of the text
\setlength{\footskip}{0.5in }
% This will make the right margin 1in + 0.5
\setlength{\oddsidemargin}{0.5in}
\setlength{\evensidemargin}{0.5in}
% No horizontal offset is needed
\setlength{\hoffset}{0pt}
% We want the header to begin showing at 1.0in + \voffset ~ which is 0.5 for the page number
\setlength{\voffset}{-0.5in}
\setlength{\topmargin}{0pt}


\endinput