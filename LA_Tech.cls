\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LA_Tech}[2011/12/23 My Class]

%% Load base
\LoadClass[12pt]{report}

%% Load additional packages and commands.
\usepackage{tocloft}
\usepackage[labelfont=bf]{caption} %For bold label for figures and tables (for indented captions, use the "hang" option.
\usepackage[calcwidth]{titlesec}
\usepackage{fancyhdr}

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

\setlength{\intextsep}{24pt plus 2pt minus 4pt}
\setlength{\belowcaptionskip}{-4pt}

\newlength{\SpaceBeforeChapter}
\setlength{\SpaceBeforeChapter}{0.55in}

% To create triple spacing, we use single spacing, then add 3ex to create triple spacing ~ there may be a more correct way to do this
\titleformat{\chapter}[display]{\singlespacing\centering\large\bfseries}{\MakeUppercase{\chaptertitlename}~\thechapter}{4ex}{\setlength{\parskip}{0pt}\large\uppercase}[\setlength{\parskip}{0pt}]%{0pt}]
\titlespacing{\chapter}{0pt}{\SpaceBeforeChapter}{2.5ex}

% Section headers should have a triple space before them (3ex), and a double space after (2ex)
\titleformat{\section}[block]{\singlespacing\centering\normalsize\bfseries}{\thetitle}{1ex}{\normalsize}
\titlespacing{\section}{0pt}{3ex}{0ex}

% Subsection headers should have a double space before them (2ex), and a double space after (2ex)
% And they should not be centered
\titleformat{\subsection}{\singlespacing\normalsize\bfseries}{\thetitle}{1ex}{}
\titlespacing{\subsection}{0pt}{3pt}{0ex}
%\titlespacing{\subsection}{0pt}{2ex}{0ex} %original LMK, double space better expressed with 3pt

%spacing for subsubsections
\titlespacing{\subsubsection}{0pt}{3pt}{0ex}

\captionsetup[table]{singlelinecheck=off}


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
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

\renewcommand{\baselinestretch}{2.0}

\let\olditemize=\itemize
\let\endolditemize=\enditemize
\renewenvironment{itemize}{%
	\vspace{-.15in} %hard codes the vertical space before the environment
	\begin{olditemize}%
		\setlength{\parsep}{0ex}
		\setlength{\topsep}{0ex}
		\setlength{\partopsep}{0ex}
		\setlength{\parskip}{0pt}%
		\setlength{\itemsep}{0pt}%
}%
{%
	\end{olditemize}%
}

\let\oldenumerate=\enumerate
\let\endoldenumerate=\endenumerate
\renewenvironment{enumerate}{%
\vspace{-.15in} %hard codes the vertical space before the environment
	\begin{oldenumerate}%
		\setlength{\parsep}{0ex}
		\setlength{\topsep}{0ex}
		\setlength{\partopsep}{0ex}
		\setlength{\parskip}{0pt}%
		\setlength{\itemsep}{0pt}%
}%
{%
	\end{oldenumerate}%
}

%This is to avoid widows, orphans, and hypenations at the end of a page.
\brokenpenalty=10000
\widowpenalty=10000
\clubpenalty=10000

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

\endinput