\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{antiquebook}
\LoadClass[12pt]{book}

\usepackage{amsmath,amssymb,amsthm,etoolbox}
\usepackage[left=.5in,right=.5in,top=0.4in,]{geometry}
\usepackage{xcolor,color,fancyhdr,}
\usepackage{changepage}
\usepackage{tikz}
\usetikzlibrary{calc}

\usepackage{titletoc,tocloft,fmtcount}
\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}
%\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\contentsname}{\parbox{\linewidth}{\centerline{\normalfont\LARGE OBSAH}~\\[-1.5cm]}}
\renewcommand{\chaptername}{KAPITOLA}

\renewcommand{\thesection}{$\S$\arabic{section}\hspace{.1em}.\hspace{.2em}}
%\addtolength{\cftchapnumwidth}{70pt}
\newcommand{\ornamentfontcmd}{\scshape}
\ifPDFTeX
  \newcommand{\SetOrnamentFont}[1]{% pdfTeX can't use fontspec here
    \renewcommand{\ornamentfontcmd}{\scshape}% keep fallback
  }
\else
  \newcommand{\SetOrnamentFont}[1]{%
    \renewcommand{\ornamentfontcmd}{\fontspec{#1}}%
  }
\fi
	\makeatletter
	\renewcommand*\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne\relax
		\addpenalty{-\@highpenalty}%
		% increase vertical space for a more spacious ToC (makes ToC longer)
		\addvspace{1.1em \@plus\p@}%
		\setlength\@tempdima{3em}%
		\begingroup
	% initialize chapter number to empty, then capture any numberline text
	\let\@chapternumber\@empty
	\def\numberline##1{\xdef\@chapternumber{##1}}%
	\setbox0=\vbox{\centering #1.\vspace{1.6\baselineskip}}% Could be more than one line
	\centering
	\leavevmode
	% If this ToC entry has an (empty) chapter number, it is an unnumbered
	% chapter (e.g., Introduction). In that case, do not print the "CHAPTER"
	% header line; only print the title stored in box0. Otherwise print the
	% usual uppercase chapter heading line with number.
	\ifx\@chapternumber\@empty
	  % nothing: skip the "CHAPTER ..." line
	\else
	  \hyperlink{\Hy@tocdestname}{\vspace{1.6\baselineskip} \MakeUppercase\chaptername\hspace{.5em}\@chapternumber.}\\
	\fi
	\unvbox0
	\par
	\nobreak
	\global\@nobreaktrue
	\everypar{\global\@nobreakfalse\everypar{}}%
	\endgroup
	\fi}
\makeatother

\usepackage{hyperref,titlesec,xifthen,iftex,authoraftertitle,}

\ifPDFTeX
	\usepackage{pdfrender, xcolor,relsize}
	\usepackage[T1]{fontenc}
\else
	\usepackage[]{unicode-math}
	\newcommand{\fakestretch}{1.}
	\newcommand{\scale}{1.1}

	\setmainfont{CenturymodernTT-Regular.otf}[ItalicFont=CenturymodernTT-Italic.otf,BoldItalicFont=CenturymodernTT-Italic.otf,SmallCapsFont={CenturymodernTT-SC.otf},BoldFont=CenturymodernTT-Regular.otf,BoldFeatures={SmallCapsFeatures={FakeBold=2}, FakeBold=2},BoldItalicFeatures={FakeBold=2},Scale=\scale,FakeStretch=\fakestretch,]
	\setsansfont{NewCMSans10-Book.otf}[,Scale=\scale,FakeStretch=\fakestretch]
	\setmonofont{NewCMMono10-Book.otf}[,Scale=\scale,FakeStretch=\fakestretch]
	\setmathfont{NewCMMath-Book-custom2.otf}[,Scale=\scale,FakeStretch=\fakestretch,]% texgyreschola-math.otf KpMath-Regular.otf,KpMath-Light.otf

	\setmathfont{CenturymodernTT-Italic.otf}[range={it,"007D,frak,"2018-"2022,{up/Greek},{it/Greek},"22EF,"2217-"2219,"2229-"222B,"2208,"2022,"211C,"2111},Scale=\scale,FakeStretch=\fakestretch,]
	%\setmathfont{CenturymodernTT-Regular.otf}[range={it/{num,"03BB},up/{num,"03BB},\mid,},Scale=\scale,FakeStretch=\fakestretch,FakeBold=\fakemathbold]
	\setmathfont{CenturymodernTT-Regular.otf}[range={it/{num,"03BB},up/{num,"03BB},"002D,"005E-"0060,"00A7,"03BB,"007B-"007D,"002F, "005F,"00A7,\mid,},Scale=\scale,FakeStretch=\fakestretch,]
	\setmathfont{CenturymodernTT-Italic.otf}[range={frak,"221E,},Scale=\scale,FakeStretch=\fakestretch,]
	\setmathfont{CenturymodernTT-Italic.otf}[range={bb,"2022,"22EF,"2217-"2219,"2229-"222B,"2208,"2022,"2260,"22C4,"002F,"00B1,"0021,"002D},Scale=\scale,FakeStretch=\fakestretch,]
	%\setmathfont[range={{up/Greek},{it/Greek},} ,Scale=\scale,FakeStretch=1.05\fakestretch,FakeBold=\fakemathbold]{ModernMT-Extended-New.otf}
	%\setmathfont{NewCMMath-Book-custom.otf}
	%\setmathfont{CenturymodernTT-Italic.ttf}[range={},Scale=\scale,FakeBold=\fakemathbold,FakeStretch=\fakestretch]%,{it/{greek}},{up/{greek}},

	\newfontfamily{\sumfont}{CenturymodernTT-Italic.otf}[]% GFSSolomos.otf,lmroman17-regular.otf,lmromanslant17-regular.otf,Theano Didot Regular V1.otf
	\makeatletter
	\RenewDocumentCommand{\sum@}{}{\DOTSB\baskervillesum}
	\AtBeginDocument{%
		\RenewDocumentCommand{\sum}{}{\mathop{\sum@}\slimits@}%
	}
	\NewDocumentCommand{\baskervillesum}{}{%
		\mathchoice
		{\makebaskervillesum{1.6}}% displaystyle
		{\makebaskervillesum{1.2}}% textstyle
		{\makebaskervillesum{1}}% scriptstyle
		{\makebaskervillesum{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervillesum}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\sumfont Σ}}}%
	}
	\newfontfamily{\prodfont}{CenturymodernTT-Italic.otf}[FakeStretch=.9\fakestretch]%OldStandard-Italic.otf,ModernExtT-Theano.otf
	\makeatletter
	\RenewDocumentCommand{\prod@}{}{\DOTSB\baskervilleprod}
	\AtBeginDocument{%
		\RenewDocumentCommand{\prod}{}{\mathop{\prod@}\slimits@}%
	}
	\NewDocumentCommand{\baskervilleprod}{}{%
		\mathchoice
		{\makebaskervilleprod{1.8}}% displaystyle
		{\makebaskervilleprod{1.2}}% textstyle
		{\makebaskervilleprod{1}}% scriptstyle
		{\makebaskervilleprod{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervilleprod}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\prodfont ∏}}}%
	}
	\newfontfamily\intfont{CenturymodernTT-Italic.otf}[FakeStretch=1.1]% OldStandard-Italic.otf,latinmodern-math.otf,Erewhon-Math.otf
	\makeatletter
	\NewDocumentCommand{\int@}{}{\DOTSB\baskervilleint}
	\AtBeginDocument{%
		\RenewDocumentCommand{\int}{}{\mathop{\int@}\slimits@}%
	}
	\NewDocumentCommand{\baskervilleint}{}{%
		\mathchoice
		{\makebaskervilleint{1.8}}% displaystyle
		{\makebaskervilleint{1.2}}% textstyle
		{\makebaskervilleint{1}}% scriptstyle
		{\makebaskervilleint{0.7}}% scriptscriptstyle
	}
	\NewDocumentCommand{\makebaskervilleint}{m}{%
		\vcenter{\hbox{\scalebox{#1}{\intfont ∫}}}%
	}
	\newfontfamily\titlefont{CenturymodernTT-Regular.otf}[]
	\defaultfontfeatures{Mapping=tex-text}
	\newcommand{\wb}[2]{\fontsize{#1}{#2}\usefont{U}{webo}{xl}{n}}
	\newcommand{\wbc}[3]{\vspace*{#1}\begin{center}
			\wb{#2}{#2}#3\end{center}\vspace*{#1}}
	% Fix pmatrix for custom brackets
	\ExplSyntaxOn
	\box_new:N \l_masum_box
	\RenewDocumentEnvironment{pmatrix}{}
	{
		\hbox_set:Nw \l_masum_box
		\c_math_toggle_token
		\begin{matrix}
		}
		{
		\end{matrix}
		\c_math_toggle_token
		\hbox_set_end:
		\scaleleftright[.8ex]{(}{\box_use:N \l_masum_box}{)}
	}

	\box_new:N \l_masum_box_vm
	\RenewDocumentEnvironment{vmatrix}{}
	{
		\hbox_set:Nw \l_masum_box_vm
		\c_math_toggle_token
		\begin{matrix}
		}
		{
		\end{matrix}
		\c_math_toggle_token
		\hbox_set_end:
		\scaleleftright[.5ex]{|}{\box_use:N \l_masum_box_vm}{|}
	}

	\box_new:N \l_masum_box_new
	\RenewDocumentEnvironment{cases}{}
	{
		\hbox_set:Nw \l_masum_box_new
		\c_math_toggle_token
		\begin{matrix}
		}
		{
		\end{matrix}
		\c_math_toggle_token
		\hbox_set_end:
		\scaleleftright[1.2ex]{\{}{\box_use:N \l_masum_box_new}{}
	}
	\ExplSyntaxOff
	\makeatletter
	\let\fontspec@setsansfont\setsansfont
	\def\setsansfont{%
		\let\Alegreya@boldstyle\AlegreyaSans@boldstyle
		\let\setsansfont\fontspec@setsansfont
		\setsansfont
	}
\makeatother
\fi

\usepackage[,nopostdot,]{glossaries}
\usepackage{makeidx}

% Ornament font API is defined earlier in the file (uses \fontspec when available)

\usepackage{nomencl}
\renewcommand{\nomname}{Notations}
\makenomenclature
%\glstoctrue
\makeindex
\makeglossaries

\titleformat{\chapter}[display]{\LARGE}{\normalfont\large\centering\MakeUppercase\chaptername\hspace{.5em}\thechapter.}{1ex}{\centering\vspace{1ex}\ifthenelse{\value{chapter}>0}{\MakeUppercase}{}}[\vspace{1ex}]
\titleformat{\section}[display]{\LARGE}{}{1ex}{\raggedright\ifthenelse{\value{section}>0}{\thesection\;}{}\vspace{.2in}}[]
%\titleformat{\subsection}[display]{\bfseries\scshape\Large}{}{1ex}{\centering\ifthenelse{\value{section}>0}{$\S\S$\thesubsection\;}{}}[\titlerule]

\newtheorem{theorem}{\textbf{\textbf{Theorem}}}
%\numberwithin{theorem}{chapter}
%\renewcommand{\thetheorem}{\arabic{theorem}}
\theoremstyle{definition}
\newenvironment{definition}[1][]{\par\medskip\noindent \textit{\textbf{{\ifthenelse{\isempty{#1}}{Definition.}{#1.}}}} \rmfamily}{\medskip}

\usepackage{scalerel}
\newcommand{\floor}[1]{\ifxetex{\squarebracket{#1}}\else{\left\lfloor{#1}\right\rfloor}\fi}
\newcommand{\ceiling}[1]{\left\lceil{#1}\right\rceil}
\ifxetex\renewcommand{\binom}[2]{\scaleleftright[.8ex]{(}{\genfrac{}{}{0pt}{0}{#1}{#2}}{)}}\fi
\newcommand{\parenthesis}[1]{\ifxetex{\scaleleftright[.8ex]{(}{#1}{)}}\else{\left(#1\right)}\fi}
\newcommand{\curlybrace}[1]{\ifxetex{\scaleleftright[1.2ex]{\{}{#1}{\}}}\else{\left\{#1\right\}}\fi}
\newcommand{\squarebracket}[1]{\ifxetex{\scaleleftright[1.2ex]{\kern 4pt[}{#1}{]\kern 4pt}}\else{\left[#1\right]}\fi}
\newcommand{\qr}[2]{\parenthesis{\frac{#1}{#2}}}
\newcommand{\bigo}[1]{O\parenthesis{#1}}
\newcommand{\func}[2]{\kern3pt#1\parenthesis{#2}}
\DeclareMathOperator{\ord}{ord}
\newcommand{\F}[1]{\mathbb{F}_{#1}}
\DeclareMathOperator{\rad}{rad}
\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}

\renewcommand*{\chapterautorefname}{Kapitola}
\renewcommand*{\sectionautorefname}{Sekce}
\renewcommand*{\subsectionautorefname}{Podsekce}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}

\usepackage{extramarks}
\AtBeginEnvironment{theorem}{\addtocounter{theorem}{1}%
	\extramarks{\thetheorem}{}\addtocounter{theorem}{-1}}

\pagestyle{fancy}
% Ensure header sits lower on the page and satisfy fancyhdr requirements
% Header includes decorative TikZ; increase headheight to avoid warnings
\setlength{\headheight}{44pt}
\setlength{\headsep}{20pt}
\fancypagestyle{fancy}{
\fancyhf{}
% Replace the simple headrule with a decorative, retro-style rule:
% two thin lines with an ornamental glyph centered between them.
% Use \titlefont if available; otherwise fall back to small caps.
\renewcommand{\headrulewidth}{0pt}% we draw the rule manually below
	\renewcommand{\headrule}{%
		\vskip-8pt
		\nointerlineskip
		\begin{tikzpicture}[x=1pt,y=1pt,yshift=1pt]
			\coordinate (HW) at (\headwidth,0pt);
			% Position ornament gap to the right of text (approx 40% of width)
			\coordinate (C) at ($ (0pt,0pt)!0.65!(HW) $);
			% ornament total width (approx) and gap from lines
			% half-width + gap = 14pt (choose so lines do not touch ornament)
			\def\linedist{10pt}
	
			% left short line (ends before ornament)
			\draw[line width=0.6pt,color=black!80] (0pt,0pt) -- ($(C)+(-\linedist,0)$);
			% right short line (starts after ornament)
			\draw[line width=0.6pt,color=black!80] ($(C)+(\linedist,0)$) -- (HW);
	
			% centered ornament only
			\node at (C) { {\color{black}\itshape{vk}} };
		\end{tikzpicture}
		\vskip4pt
	}
	\fancyhead[L]{\hspace*{0.5cm}\small\itshape \nouppercase\leftmark: \nouppercase\rightmark}
	\fancyhead[CE]{}
	\fancyhead[R]{\thepage}
	\fancyhead[CO]{}% no center-odd header
}

\setcounter{secnumdepth}{3}

% Keep section numbering continuous across chapters
\usepackage{chngcntr}
\counterwithout{section}{chapter}

% Restore the visual style for section numbers (ensure symbol stays)
\renewcommand{\thesection}{$\S$\arabic{section}\hspace{.1em}.\hspace{.2em}}

% Reduce spacing in the table of contents so it fits more compactly
% Uses lengths provided by the tocloft package
% Make the table of contents larger/more spacious so it spans about two pages
\setlength{\cftbeforechapskip}{1.4em}
\setlength{\cftbeforesecskip}{0.3em}
\setlength{\cftparskip}{0.4em}

% Define a temporary pagestyle for the ToC: keep page numbers but remove the
% header text so "CONTENTS" doesn't repeat on subsequent ToC pages.
\fancypagestyle{toc}{%
	\fancyhf{}%
	\fancyfoot[C]{\thepage}% keep page number at center footer
	\setlength{\headsep}{0pt}% no header, so remove header spacing on ToC pages
	\renewcommand{\headrulewidth}{0pt}% no header rule
}

% Redefine \tableofcontents to use a larger font and the temporary pagestyle
\AtBeginDocument{%
	\let\oldtableofcontents\tableofcontents
	\renewcommand{\tableofcontents}{%
		\clearpage
		\pagestyle{toc}% apply toc pagestyle for all ToC pages
		\begingroup\vspace*{-3em}\oldtableofcontents\endgroup% make ToC text larger
		\clearpage
		\pagestyle{fancy}% restore normal pagestyle
	}%
}

% Make ToC entry fonts a bit larger to match the larger ToC
\renewcommand{\cftchapfont}{\normalsize}
\renewcommand{\cftsecfont}{\small}
\renewcommand{\cftchappagefont}{\small}
\renewcommand{\cftsecpagefont}{\small}

\theoremstyle{definition}
\newtheorem{problem}{\text{Problem}}
\newcommand*{\problemautorefname}{Problem}
\newtheorem*{remark}{\text{Remark}}
\newtheorem*{note}{\text{Note}}
\newtheorem*{solution}{\text{Solution}}


% Redefine proof environment to use bold upright text
\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \normalfont\bfseries
        #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\renewcommand{\proofname}{\normalfont\bfseries Proof}
\makeatother


% Indent proof, note, and solution environments to the right
\AtBeginEnvironment{proof}{\begin{adjustwidth}{2em}{}}
\AtEndEnvironment{proof}{\end{adjustwidth}}
\AtBeginEnvironment{note}{\begin{adjustwidth}{1em}{}}
\AtEndEnvironment{note}{\end{adjustwidth}}
\AtBeginEnvironment{solution}{\begin{adjustwidth}{1em}{}}
\AtEndEnvironment{solution}{\end{adjustwidth}}
%\numberwithin{problem}{chapter}

%\usepackage{graphicx}
%\usepackage{eso-pic}
%\AddToShipoutPictureBG{\includegraphics[width=\paperwidth,height=\paperheight]{background}}
