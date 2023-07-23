\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dart}[2023/07/23 LaTeX class for multi-languages article under Domitian]

\LoadClass{article}

\let\np=\newpage
\def\newpage{
    \pagestyle{fancy}
    \np
    \thispagestyle{plain}
    }

\DeclareOption{twocolumn}{\twocolumn
    \raggedright
    \setlength{\columnsep}{0.3in}
    \setlength{\columnseprule}{0.4pt}
    \def\newpage{
        \setlength{\columnseprule}{0pt}
        \np
        \setlength{\columnseprule}{0.4pt}
        }
    \makeatletter
    \renewcommand\tableofcontents{
        \chapter*{\contentsname
        \@mkboth{
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}
           }
        \@starttoc{toc}
        }
    }
\ExecuteOptions{}
\ProcessOptions

\DeclareRobustCommand*{\subtitle}[1]{\gdef\@subtitle{#1}}

\renewcommand\maketitle{
    \par
    \begingroup
        \renewcommand\thefootnote{\@fnsymbol\c@footnote}
        \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}
        \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{
            \hss\@textsuperscript{\normalfont\@thefnmark}}##1}
        \if@twocolumn
            \ifnum \col@number=\@ne
                \@maketitle
            \else
                \twocolumn[\@maketitle]
            \fi
        \else
            \newpage
            \global\@topnum\z@
            \@maketitle
        \fi
        \thispagestyle{plain}\@thanks
    \endgroup
    \setcounter{footnote}{0}
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
    }

\def\@maketitle{
    \newpage
    \null
    \vskip 2em
    \begin{center}
    \let \footnote \thanks
        {\bfseries\LARGE \@title \par}
        \vskip .5em
        \@subtitle
        \vskip 1em
        {\large
            \lineskip .5em
            \begin{tabular}[t]{c}
                \@author
            \end{tabular}\par}
        \vskip 1em
        {\large \@date}
    \end{center}
    \par
    \vskip 2em
    }

\def\title#1{\gdef\@title{#1}\gdef\printtitle{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}\gdef\printsubtitle{#1}}
\def\author#1{\gdef\@author{#1}\gdef\printauthor{#1}}
\def\date#1{\gdef\@date{#1}\gdef\printdate{#1}}

\RequirePackage[russian,spanish,french,english]{babel}

\RequirePackage{ctex}
\ctexset{punct=banjiao}
\xeCJKsetup{CJKmath=true}

\usepackage{mathpazo}
\usepackage{fontspec}
\setmainfont{Domitian}
\setsansfont{Arial}
\setmonofont{Andale Mono}
\defaultfontfeatures[Domitian]{Ligatures=Discretionary}

\RequirePackage[letterpaper]{geometry}

\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage{pdfpages}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=gold,
    filecolor=gold,
    urlcolor=gold,
    %pdftitle={},
    %pdfauthor={},
    pdfpagemode=FullScreen,
    }

\usepackage{xcolor}
\definecolor{linen}{RGB}{249,245,236}
\definecolor{sepia}{RGB}{98,44,44}
\definecolor{gold}{RGB}{206,160,82}
\pagecolor{linen}
\color{sepia}

\RequirePackage{amsfonts,amsmath,amssymb,amsthm}
\usepackage{yhmath}
\usepackage{mathrsfs}
\everymath{\displaystyle}
\renewcommand{\le}{\leqslant}
\renewcommand{\ge}{\geqslant}
\DeclareMathOperator{\sgn}{sgn}

\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\usepackage{tikz}
\usetikzlibrary{calc}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\setlength{\headheight}{15pt}
\fancyhead[L]{\printdate}
\fancyhead[C]{\bfseries\printtitle}
\fancyhead[R]{\printauthor}

\usepackage{ltxtable}
\renewcommand{\arraystretch}{1.2}
\usepackage{float}

\RequirePackage{enumitem}
%\renewcommand{\theenumi}{(\arabic{enumi})}

\endinput
