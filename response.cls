\LoadClass[10pt,a4paper]{article}
\usepackage[utf8]{inputenc}
\usepackage{lipsum} % to generate some filler text
\usepackage{fullpage}
\usepackage{color}

% import Eq and Section references from the main manuscript where needed
% \usepackage{xr}
% \externaldocument{manuscript}

% package needed for optional arguments
\usepackage{xifthen}
% define counters for reviewers and their points

\usepackage{fancyhdr}
\usepackage[headsep=1cm,headheight=2cm,textwidth=18cm]{geometry}
\usepackage{tabularx}
\newcounter{point}
\setcounter{point}{0}
\def\Reviewer{XXX}
\def\ReviewerId{}

%\setlength\parindent{0pt}% インデントなし
\pagestyle{empty}% ページ番号削除

\pagestyle{fancy}
%\fancyhead[R]{\title}
\fancyhead[L]{\author, \title}
\fancyfoot{}

%\AtBeginEnvironment{quote}{\smaller}

% This refines the format of how the reviewer/point reference will appear.
\renewcommand{\thepoint}{\ifx\ReviewerId{}\ReviewerId.\fi\arabic{point}} 

% command declarations for reviewer points and our responses
\newcommand{\reviewersection}[2]
{
    \def\Reviewer{#1}
    \def\ReviewerId{#2}
    \setcounter{point}{0}
    \bigskip \clearpage \section*{Response to #1 #2}
}

\newenvironment{point}
   {\refstepcounter{point} \bigskip \noindent {\textbf{\Reviewer~Point~\thepoint} } ---\ }
   {}

\newenvironment{response}
   {\medskip \noindent \begin{sf}\textbf{Author response}:\  }
   {\medskip \end{sf}}

\newenvironment{action}
   {\noindent \begin{sf}\textbf{Author action}:\  }
   {\end{sf}}

\newenvironment{change}[1][]
    {\begin{quotation} \noindent \textsf{\underline{Changes in the new manuscript (#1)}} \medskip \\ \color{blue}}
    {\color{black} \end{quotation}}

\newcommand{\shortreply}[2][]{\medskip \noindent \begin{sf}\textbf{Reply}:\  #2
	\ifthenelse{\equal{#1}{}}{}{ \hfill \footnotesize (#1)}%
	\medskip \end{sf}}
 