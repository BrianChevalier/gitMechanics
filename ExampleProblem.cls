\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ExampleProblem}

\DeclareOption{Dynamics}{
	%Dynamics mastery goals
	\newcommand{\posvec}{B}
	\newcommand{\secposvec}{\section*{\posvec. Position Vector}}
	\newcommand{\geom}{A.1}
	\newcommand{\secgeom}{\section*{\geom. Problem Setup and Geometry}}
	\newcommand{\velocityandacceleration}{C}
	\newcommand{\secvelocityandacceleration}{\section*{\velocityandacceleration. Velocity and Acceleration}}
	\newcommand{\FBD}{D}
	\newcommand{\secFBD}{\section*{\FBD. Free Body Diagram}}
	\newcommand{\linearmomentum}{E.1}
	\newcommand{\seclinearmomentum}{\section*{\linearmomentum. Balance of Linear Momentum}}
}

\ProcessOptions

% This class builds on the article class
\LoadClass[]{article}

% Load needed packages
\RequirePackage{background}
\RequirePackage{tikz}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{pdfpages}
\RequirePackage{gensymb}
\RequirePackage{hyperref}
\RequirePackage{multicol}
\RequirePackage{paracol}

\RequirePackage[
	top    = 3.75cm,
	bottom = 2.00cm,
	left   = 3.00cm,
	right  = 3.00cm]{geometry}

% Make links clickable
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

\setlength\parindent{0pt}
\setlength{\parskip}{\baselineskip}
\globalcounter*

% Define needed new commands for title page
\newcommand*{\coursenum}[1]{\gdef\@coursenum{#1}}
\newcommand*{\@coursenum}{\texttt{\string\coursenum} currently not set. Please define this.}

\newcommand*{\coursetitle}[1]{\gdef\@coursetitle{#1}}
\newcommand*{\@coursetitle}{\texttt{\string\coursetitle} currently not set. Please define this.}

\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand*{\@subtitle}{\texttt{\string\subtitle} currently not set. Please define this.}

\newcommand*{\titleimage}[1]{\gdef\@titleimage{#1}}
\newcommand*{\@titleimage}{../../default-title-image.pdf}
%\newcommand*{\@titleimage}{example-image-c} %if image not set

\newcommand*{\university}[1]{\gdef\@university{#1}}
\newcommand*{\@university}{\texttt{\string\university} currently not set. Please define this.}


\RequirePackage{xcolor}
\definecolor{keypurple}{HTML}{B26AE1}
\definecolor{notapurple}{HTML}{B09CFF}

\definecolor{PPTblue}{HTML}{DCE6F2}
\definecolor{PPTdarkblue}{HTML}{4F82BD}
% --- BACKGROUND 
\backgroundsetup{
opacity=1,
angle=0,
scale=1,
contents = {
	\begin{tikzpicture}[opacity=0.5]
	\draw[PPTblue, ultra thick] (-7,0) rectangle (10,25);
	\draw[step=0.5cm,gray, very thin] 
		(-7,0) grid 
		(10,25);
	\begin{scope}[opacity=1]
		\fill[PPTblue] 
(-7,23) rectangle (10,25);
	\node[
		align=right,
		PPTdarkblue,
		text width=5cm] at 
		(7,24.5)
		{\@author};
	\node[align=right,
		PPTdarkblue,
		text width=5cm] at 
		(7,23.7)
		{\@subtitle};
	\node[align=left,
		PPTdarkblue,
		text width=5cm] at 
		(-4,24.5)
		{\@coursenum -- \textit{\@coursetitle}};
	\node[
		align=left,
		PPTdarkblue,
		text width=5cm] at 
		(-4,23.7)
		{\@university};
	\end{scope}
	\end{tikzpicture}
	}
}

\newcommand{\problemstatement}[2]{
% Begin paracolumn
\setcolumnwidth{5cm,4cm}
\begin{paracol}{2}
% Input problem statement text
\section*{\@title}
#1

\switchcolumn

% Input problem image
\centering
#2
\end{paracol}
}

\endinput
