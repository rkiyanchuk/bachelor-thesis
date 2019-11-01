%&latex
% Copyright 2011 Ruslan Kiyanchuk (c) <ruslan.kiyanchuk@gmail.com>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dstu3008}[2012/05/06 Structure and typography guidelines.
Documentation. Scintific and Technical Reports.]
\typeout{Note that this tries to fulfill DSTU 3008-95
  requirements but it is unofficial}

\LoadClassWithOptions{report}

% CLASS OPTIONS
% =============

\RequirePackage{extsizes}

% Online and print versions need different settings.
% Default to hardcopy submission.
\newif\ifonline
\onlinefalse
\DeclareOption{online}{\onlinetrue}
\DeclareOption{hardcopy}{\onlinefalse}
\DeclareOption{14pt}{\renewcommand\@ptsize{14}}
\DeclareOption{timesnewroman}{\renewcommand{\rmdefault}{ftm}}
\ProcessOptions


% ADDITIONAL PACKAGES AND FEATURES
% ================================

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{array}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{longtable}	 % for wrapping tables over multiple pages
\RequirePackage{caption}
\RequirePackage[ruled]{algorithm2e}
\RequirePackage{listingsutf8}
\RequirePackage[compact]{titlesec}
\RequirePackage{tocloft}
\RequirePackage[title, titletoc]{appendix}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{totcount} % for counting number of pages, figures, etc. in abstract
%\RequirePackage{rotating}	% for sideways figures and tables


% MULTILANGUAGE SETTINGS AND DECLARATIONS
% =======================================

\RequirePackage{fontspec}
\setmainfont{CMU Serif}

\RequirePackage[ukrainian,english]{babel}

\addto\captionsenglish{\renewcommand{\refname}{\MakeUppercase{References}}}
\addto\captionsenglish{\renewcommand{\bibname}{\MakeUppercase{References}}}
\addto\captionsenglish{\renewcommand{\appendixname}{APPENDIX}}
\addto\captionsenglish{\renewcommand{\appendixpagename}{APPENDICES}}
\addto\captionsenglish{\renewcommand{\appendixtocname}{APPENDICES}}

\addto\captionsukrainian{\renewcommand{\abstractname}{\MakeUppercase{Реферат}}}
\addto\captionsukrainian{\renewcommand{\contentsname}{\MakeUppercase{Зміст}}}
\addto\captionsukrainian{\renewcommand{\appendixname}{\MakeUppercase{Додатки}}}
\addto\captionsukrainian{\renewcommand{\refname}{\MakeUppercase{Перелік посилань}}}
\addto\captionsukrainian{\renewcommand{\bibname}{\MakeUppercase{Перелік посилань}}}
\addto\captionsukrainian{\renewcommand{\figurename}{Рисунок}}
\addto\captionsukrainian{\renewcommand{\tablename}{Таблиця}}
\addto\captionsukrainian{\renewcommand{\lstlistingname}{Лістинг}}
\addto\captionsukrainian{\renewcommand{\listalgorithmcfname}{Список алгоритмів}}
\addto\captionsukrainian{\renewcommand{\algorithmcfname}{Алгоритм}}

\addto\captionsrussian{\renewcommand{\abstractname}{Реферат}}
\addto\captionsrussian{\renewcommand{\contentsname}{Содержание}}
\addto\captionsrussian{\renewcommand{\appendixname}{Приложения}}
\addto\captionsrussian{\renewcommand{\refname}{Список литературы}}
\addto\captionsrussian{\renewcommand{\bibname}{Список литературы}}
\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}}
\addto\captionsrussian{\renewcommand{\tablename}{Таблица}}
\addto\captionsrussian{\renewcommand{\lstlistingname}{Листинг}}
\addto\captionsrussian{\renewcommand{\listalgorithmcfname}{Список алгоритмов}}
\addto\captionsrussian{\renewcommand{\algorithmcfname}{Алгоритм}}



% TYPOGRAPHY
% ===========

% Disallow page breaks at hyphens (this will give some underfull vbox's,
% so an alternative is to use \brokenpenalty=100 and manually search
% for and fix such page breaks)
\brokenpenalty=10000

\sloppy

\pagestyle{myheadings}
\RequirePackage{geometry}
\geometry{left=20mm,right=10mm,top=20mm,bottom=20mm}
\setlength{\parindent}{5ex}

\RequirePackage{setspace}
\onehalfspacing

\DeclareCaptionLabelSeparator{hyphen}{ -- }
\captionsetup[figure]{format=hang, labelsep=hyphen}
\captionsetup[table]{format=hang, labelsep=hyphen, singlelinecheck=off}

\titleformat{\chapter}{\center\normalfont\normalsize}{\thechapter}{1pc}{\MakeUppercase}[\thispagestyle{myheadings}]
\titleformat{\section}{\normalfont\normalsize}{\hspace{5ex}\thesection}{1pc}{}
\titleformat{\subsection}{\normalfont\normalsize}{\hspace{5ex}\thesubsection}{1pc}{}
\titleformat{\subsubsection}[hang]{\normalfont\normalsize}{\hspace{5ex}\thesubsubsection}{1pc}{}
% for "structural elements" that must not be numbered.
\newcommand{\Chapter}[1]{\chapter*{\protect\uppercase{#1}}\addcontentsline{toc}{chapter}{\protect\uppercase{#1}}}

\titlespacing*{\chapter}{0pt}{-2em}{2em}
\titlespacing*{\section}{0pt}{1em}{1em}
\titlespacing*{\subsection}{0pt}{1em}{1em}
\titlespacing*{\subsubsection}{0pt}{1em}{1em}

% TOC Settings
% ------------

\renewcommand{\cfttoctitlefont}{\vspace*{-4em}\hfill\normalsize\normalfont\MakeUppercase}
\renewcommand{\cftaftertoctitle}{\hfill\vspace*{-3em}}
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\setcounter{secnumdepth}{4}
% prevent hyphenation
\renewcommand{\@tocrmarg}{2.55em plus1fil}
% fix first page numbering
\addtocontents{toc}{\protect\thispagestyle{myheadings}}
% show subsubsections
\setcounter{tocdepth}{4}
\renewcommand{\cftchapdotsep}{\cftdotsep}

% Bibliography settings
% ---------------------

\bibliographystyle{ugost2003}
\makeatletter 
\def\bibleftdelim{}
\def\bibrightdelim{.}
\def\@biblabel#1{\bibleftdelim #1\bibrightdelim}
\makeatother

% Enumerations and lists
% ----------------------

% add brackets to footnote numberings
\renewcommand{\thefootnote}{\arabic{footnote})}
% Enumerations appearance
%\renewcommand{\alph}[1]{\asbuk{#1}}
\renewcommand{\theenumi}{\alph{enumi})}
\renewcommand{\labelenumi}{\alph{enumi})}
\renewcommand{\theenumii}{\arabic{enumii})}
\renewcommand{\labelenumii}{\arabic{enumii})}
\renewcommand{\theenumiii}{\arabic{enumiii})}
\renewcommand{\labelenumiii}{\arabic{enumii}.\arabic{enumiii})}
% Itemize appearance
\renewcommand{\labelitemi}{$-$}
\renewcommand{\labelitemii}{$-$}
\renewcommand{\labelitemiii}{$-$}
\renewcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont #1}
% get rid of spaces before, after lists and between bullets.
\RequirePackage{enumitem}
\setitemize{noitemsep, topsep=0pt, parsep=0pt, itemindent=5ex}
\setenumerate{noitemsep, topsep=0pt, parsep=0pt, itemindent=5ex}
\setdescription{noitemsep, topsep=0pt, parsep=0pt, itemindent=5ex}
\setlist{noitemsep, topsep=0pt, parsep=0pt}

\DeclareCaptionFormat{table}{{\parbox{\textwidth}{\hspace*{5ex}\normalsize\normalfont #1#2#3}}}
\captionsetup[table]{format=table}

% LISTINGS FORMAT
% ---------------

% Caption customizations for code listings
\DeclareCaptionFont{white}{\color{black}}
\DeclareCaptionFormat{listing}{{\parbox{\textwidth}{\hspace{5ex}\normalsize\normalfont #1#2#3}}}
\captionsetup[lstlisting]{
    format=listing,
    singlelinecheck=false,
}

\lstdefinelanguage{Sage}[]{Python}
{morekeywords={True,False,sage,with}, sensitive=true}

% listings package customizations
\lstset{
    language=Sage,
    basicstyle=\footnotesize\ttfamily\singlespacing, 
    extendedchars=false,
    inputencoding=utf8,  % listings file encoding
    keepspaces=true,  % need to correctly process spaces in cyrillic files
    keywordstyle=\textbf,
    xleftmargin=13pt,
    framexleftmargin=10pt,
    framexrightmargin=3pt,
    framexbottommargin=4pt,
    frame=single,  % adds a frame around the code
    captionpos=t,  % place position at top
    belowcaptionskip=0pt,
    tabsize=4,	% sets default tabsize to 4 spaces
    showspaces=false,  % show spaces adding particular underscores
    showstringspaces=false,  % underline spaces within strings
    showtabs=false,  % show tabs within strings adding particular underscores
    breaklines=true,  % sets automatic line breaking
    numbers=left,  % where to put the line-numbers
    numberstyle=\scriptsize,  % the size of the fonts that are used for the line-numbers
    stepnumber=1,  % the step between two line-numbers. If it's 1 each line will be numbered
    numbersep=15pt  % how far the line-numbers are from the code
}


% FEATURES
% ========

\usepackage{nomencl}
\makenomenclature
\renewcommand{\nomname}{List of abbreviations}
\newcommand{\abbr}[2]{\nomenclature{#1}{ --- #2.}}

% Counting total number of items
% ------------------------------
\RequirePackage{etoolbox}
\newcounter{totfigures}
\newcounter{tottables}
\makeatletter
\AtEndDocument{%
  \addtocounter{totfigures}{\value{figure}}%
  \addtocounter{tottables}{\value{table}}%
  \immediate\write\@mainaux{%
    \string\gdef\string\totfig{\number\value{totfigures}}%
    \string\gdef\string\tottab{\number\value{tottables}}%
  }%
}
\makeatother
\pretocmd{\chapter}{\addtocounter{totfigures}{\value{figure}}}{}{}
\pretocmd{\chapter}{\addtocounter{tottables}{\value{table}}}{}{}

\regtotcounter{page}


\RequirePackage{hyperref}
\hypersetup{
unicode=true,
colorlinks = true,
linkcolor = black,
citecolor = black,
urlcolor = black,
}
