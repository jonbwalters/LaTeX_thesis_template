\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LA_Tech}

%% Load base
\LoadClass[12pt]{report}

%% Load additional packages and commands.
\RequirePackage{hyperref}
\RequirePackage{tocloft}
\RequirePackage[labelfont=bf]{caption} %For bold label for figures and tables (for indented captions, use the "hang" option.
\RequirePackage[calcwidth]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage[nopatch=footnote]{microtype}
\RequirePackage{indentfirst}
\RequirePackage{amsmath}
\RequirePackage[absolute]{textpos}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{array}
%% Additional TeX/LaTeX code...

%This is to avoid widows, orphans, and hypenations at the end of a page.
\brokenpenalty=10000
\widowpenalty=10000
\clubpenalty=10000

\AtBeginDocument{\setlength\abovedisplayskip{3pt}}
\AtBeginDocument{\setlength\belowdisplayskip{3pt}}

% Adjusting the spacing before and after floats, behavior affected by captions package
\setlength{\intextsep}{24pt plus 2pt minus 2pt} % Vertical space above and below [h] floats
\setlength{\textfloatsep}{24pt plus 2pt minus 2pt} % vertical space above/below [b]/[t] floats
\setlength{\abovecaptionskip}{12pt plus 1pt minus 1pt} % Between caption and figure/table
\setlength{\belowcaptionskip}{0pt} % Additional space between captions and text

\captionsetup[table]{singlelinecheck=false}

\let\oldtable=\table
\let\endoldtable=\endtable
\renewenvironment{table}{%
	\renewcommand*{\arraystretch}{1}
	\begin{oldtable}%
}%
{%
	\end{oldtable}%
}

% Paragraph formatting..................................
% double spacing
\renewcommand{\baselinestretch}{2.0}
\setlength{\parskip}{0in}
% first line indent
\setlength{\parindent}{0.5in}
\renewcommand*{\arraystretch}{0.5}

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


% Header formatting..........................................
\newlength{\SpaceBeforeChapter}
\setlength{\SpaceBeforeChapter}{0.55in plus 4pt minus 4pt}

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


%spacing for subsubsections
\titlespacing{\subsubsection}{0pt}{3pt}{0ex}

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
\newcommand*{\@project}{
	\textcolor{red}{PhD/Masters of ...}
	\ClassWarningNoLine{LA_Tech}{Set project}
}
\newcommand*{\project}[1]{\gdef\@project{#1}}

\newcommand*{\@degree}{
	\textcolor{red}{Previous degree(s)}
	\ClassWarningNoLine{LA_Tech}{Set previous degrees}
}
\newcommand*{\previousdegree}[1]{\gdef\@degree{#1}}

\newcommand*{\@college}{
	\textcolor{red}{Enter college}
	\ClassWarningNoLine{LA_Tech}{Set college}
}
\newcommand*{\college}[1]{\gdef\@college{#1}}

\newcommand*{\@work}{
	\textcolor{red}{Dissertation/Thesis}
	\ClassWarningNoLine{LA_Tech}{Set work}
}
\newcommand*{\work}[1]{\gdef\@work{#1}}

\date{
	\textcolor{red}{August 2025}
	\ClassWarningNoLine{LA_Tech}{Set date}
}
\author{
	\textcolor{red}{Your Name}
	\ClassWarningNoLine{LA_Tech}{Set name}
}
\title{
	\textcolor{red}{
	THESIS TITLE GOES HERE IN CAPITAL LETTERS, SPLIT FOR \\
	INVERTED PYRAMID FORM
	}
	\ClassWarningNoLine{LA_Tech}{Set title}
}


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
		A \@work\ Presented in Partial Fulfillment \\
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

\newcommand*{\tableofcontentstech}{
	% Tables of contents
	\newpage
	\begin{singlespace}
		% This configures the space before the title
		\renewcommand{\cftbeforetoctitleskip}{.6in}
		% this configures the space after the title
		\renewcommand{\cftaftertoctitleskip}{1em}
		% This makes the title LIST OF TABLES, centered in Large bfseries
		\renewcommand{\contentsname}{TABLE OF CONTENTS}
		\renewcommand{\cfttoctitlefont}{\hfill\large\bfseries}
		\renewcommand{\cftaftertoctitle}{\hfill}
		% This changes the chapter font to the same as a section (no bold)
		\renewcommand{\cftchapfont}{\cftsecfont}
		% this add dots
		\renewcommand{\cftchapdotsep}{\cftsecdotsep}
		% This unnbolds the dots and page numbers
		\renewcommand{\cftchapleader}{\normalfont\cftdotfill{\cftsecdotsep}}
		\renewcommand{\cftchappagefont}{\normalfont}
		\setlength{\cftparskip}{1.0\baselineskip}%
		\tableofcontents
	\end{singlespace}
}

\newcommand*{\listoftablestech}{
	% list of tables
	\newpage
	\begin{singlespace}
		\phantomsection
		\addcontentsline{toc}{chapter}{LIST OF TABLES}
		% This configures the space before the title
		\renewcommand{\cftbeforelottitleskip}{.6in}
		% this configures the space after the title
		\renewcommand{\cftafterlottitleskip}{1em}
		% This makes the title LIST OF TABLES, centered in bfseries
		\renewcommand{\listtablename}{LIST OF TABLES}
		\renewcommand{\cftlottitlefont}{\hfill\large\bfseries}
		\renewcommand{\cftafterlottitle}{\hfill}
		
		\setlength{\cftparskip}{1.0\baselineskip}
		\renewcommand{\cfttabpresnum}{Table~}
		% This will correct the indent so the above added text doesn't distort it
		
		\newlength{\mylenTable}
		\settowidth{\mylenTable}{\cfttabpresnum\cfttabaftersnum}
		\hyphenpenalty=100000
		
		\listoftables
	\end{singlespace}
}
	
	
\newcommand*{\listoffigurestech}{
	\newpage
	\begin{singlespace}
		\phantomsection
		\addcontentsline{toc}{chapter}{LIST OF FIGURES}
		% This configures the space before the title
		\renewcommand{\cftbeforeloftitleskip}{.6in}
		% this configures the space after the title
		\renewcommand{\cftafterloftitleskip}{1em}
		% This makes the title LIST OF FIGURES, centered in Large bfseries
		\renewcommand{\listfigurename}{LIST OF FIGURES}
		\renewcommand{\cftloftitlefont}{\hfill\large\bfseries}
		\renewcommand{\cftafterloftitle}{\hfill}
		% This cause double spacing between entries, single spacing with line wraps
		\setlength{\cftparskip}{1.0\baselineskip}
		\renewcommand{\cftfigpresnum}{Figure~}
		% This will correct the indent so the above added text doesn't distort it
		\newlength{\mylenFigure}
		\settowidth{\mylenFigure}{\cftfigpresnum\cftfigaftersnum}
		\hyphenpenalty=100000
		\listoffigures
	\end{singlespace}
}
		

% Adding column types for tabularx using array
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{L}{X}



\endinput