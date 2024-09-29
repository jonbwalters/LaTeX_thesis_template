\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LA_Tech}

%% Load base
\LoadClass[12pt]{report}

%% Load additional packages and commands.
\usepackage{hyperref}
\usepackage{tocloft}
\usepackage[labelfont=bf]{caption} %For bold label for figures and tables (for indented captions, use the "hang" option.
\usepackage[calcwidth]{titlesec}
\usepackage{fancyhdr}
\usepackage{indentfirst,microtype}
\usepackage{amsmath}
\usepackage[absolute]{textpos}
\usepackage{setspace}
\usepackage{enumitem}
%% Additional TeX/LaTeX code...

%This is to avoid widows, orphans, and hypenations at the end of a page.
\brokenpenalty=10000
\widowpenalty=10000
\clubpenalty=10000

\AtBeginDocument{\setlength\abovedisplayskip{3pt}}
\AtBeginDocument{\setlength\belowdisplayskip{3pt}}


\let\oldfigure=\figure
\let\endoldfigure=\endfigure
\renewenvironment{figure}{%
	\begin{oldfigure}%
}%
{%
	\vspace{-12pt}
	\end{oldfigure}%
}

\let\oldtable=\table
\let\endoldtable=\endtable
\renewenvironment{table}{%
	\begin{oldtable}%
}%
{%
	\vspace{-12pt}
	\end{oldtable}%
}


% Paragraph formatting..................................
% double spacing
\renewcommand{\baselinestretch}{2.0}
\setlength{\parskip}{0in}
% first line indent
\setlength{\parindent}{0.5in}

% Margins.............................................
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

\setlength{\intextsep}{24pt}
\setlength{\belowcaptionskip}{0em}
%\setlength{\abovecaptionskip}{0em}
%\setlength{\floatsep}{1em plus 2pt minus 2pt}

% Header formatting..........................................
\newlength{\SpaceBeforeChapter}
\setlength{\SpaceBeforeChapter}{0.55in}

% To create triple spacing, we use single spacing,
% then add 3ex to create triple spacing
% ~ there may be a more correct way to do this
\titleformat{\chapter}[display]
	{\singlespacing\centering\large\bfseries}
	{\MakeUppercase{\chaptertitlename}~\thechapter}
	{4ex}{\setlength{\parskip}{0pt}\large\uppercase}
	[\setlength{\parskip}{0pt}]
\titlespacing{\chapter}{0pt}{\SpaceBeforeChapter}{2.5ex}

% Section headers should have a triple space before them (3ex),
% and a double space after (2ex)
\titleformat{\section}[block]
	{\singlespacing\centering\normalsize\bfseries}
	{\thetitle}{1ex}{\normalsize}
\titlespacing{\section}{0pt}{3ex}{0ex}

% Subsection headers should have a double space before them (2ex),
% and a double space after (2ex)
% And they should not be centered
\titleformat{\subsection}{\singlespacing\normalsize\bfseries}{\thetitle}{1ex}{}
\titlespacing{\subsection}{0pt}{3pt}{0ex}
%\titlespacing{\subsection}{0pt}{2ex}{0ex} %original LMK, double space better expressed with 3pt

%spacing for subsubsections
\titlespacing{\subsubsection}{0pt}{3pt}{0ex}

% using caption....................................................
\captionsetup[table]{singlelinecheck=off}

% Using toclft.................................................
\renewcommand{\cfttoctitlefont}{\large\bfseries}
\renewcommand{\cftloftitlefont}{\large\bfseries}
\renewcommand{\cftlottitlefont}{\large\bfseries}
\setlength{\cftbeforeloftitleskip}{42pt}
\setlength{\cftafterloftitleskip}{12pt}
\setlength{\cftbeforepartskip}{0pt}
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}

\renewcommand{\cftpartfont}{\normalfont}
\renewcommand{\cftpartpagefont}{\normalfont}
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftchappresnum}{CHAPTER }
\renewcommand{\cftpartpresnum}{PART }
\renewcommand{\cftfigpresnum}{Figure }
\renewcommand{\cftfigaftersnum}{:}
\renewcommand{\cfttabaftersnum}{:}
\renewcommand{\cftchapnumwidth}{7em}
\renewcommand{\cftfignumwidth}{5.5em}
\renewcommand{\cfttabnumwidth}{5.5em}

\renewcommand{\cftpartleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftdotsep}{0}
\cftsetpnumwidth{1.3em} %1 in LMK's thesis, increased to take care of wide roman numerals

\setlength{\cftchapindent}{0pt}
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}

\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}

\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}


% using fancyhdr ............................................
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]
{\markboth{\textit{\chaptername\ \thechapter.\ #1}}{}}
% the header
\lhead{}%{\textit{Your Name}}
\chead{}%{\leftmark}
\rhead{\thepage}
% the footer
\cfoot{}
\rfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Using amsmath...........................................
% THIS WILL FORCE EQUATION NUMBERS TO START OVER WITH EACH
% NEW CHAPTER
\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}

% Using enumitem...........................................
\setlist{nosep}

% Redefining \maketitle....................................
\newcommand*{\project}[1]{\gdef\@project{#1}%
}
\newcommand*{\@project}{Final Year Project}
\newcommand*{\previousdegree}[1]{\gdef\@degree{#1}%
}
\newcommand*{\@college}{Enter college}
\newcommand*{\college}[1]{\gdef\@college{#1}%
}
\newcommand*{\@degree}{Previous degree(s)}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}%
}
\newcommand*{\@supervisor}{\texttt{\string\supervisor} currently
not set. Please fix this.}
\renewcommand*{\maketitle}{%
	\begin{titlepage}
	\setlength{\lineskip}{14pt}
	\textblockorigin{1.5in}{1in}
	\centering

	\vspace*{4\lineskip}
	{ \normalsize \textbf{
		\@title
	}\par}
	by\\
	{\@author\unskip, \@degree\strut\par}
	
	\begin{textblock*}{\textwidth}(0pt, 29\lineskip)
		\begin{singlespace}%
		A Dissertation Presented in Partial Fulfillment \\
		of the Requirements for the Degree \\
		{\@project\unskip\strut}
		\end{singlespace}
	\end{textblock*}

	\begin{textblock*}{\textwidth}(0pt, 39\lineskip)
		\begin{singlespace}
		COLLEGE OF \@college\\
		LOUISIANA TECH UNIVERSITY
		\end{singlespace}
	\end{textblock*}
	
	\begin{textblock*}{\textwidth}(0pt, 44\lineskip)
		\@date
	\end{textblock*}
	
	\end{titlepage}
}

\endinput