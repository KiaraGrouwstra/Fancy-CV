\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

% \RequirePackage[quiet]{fontspec}
% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
% 
% \newfontfamily\bodyfont[]{Helvetica Neue}
% \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
% \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
% 
% \defaultfontfeatures{Mapping=tex-text}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}
% 
% \setmathfont{XITS Math}

%%% modified by Karol Kozioł for ShareLaTex use
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
% \RequirePackage{fontawesome}
% Set the FontAwesome font to be up-to-date.
% \newfontfamily\FA[Path=\@fontdir]{FontAwesome}

\newfontfamily\bodyfont
[Path=\@fontdir,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[Path=\@fontdir]{Lato-Light.ttf}
\newfontfamily\headingfont[Path=\@fontdir]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}
%%%

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        % blue\or%
        % red\or%
        % orange\or%
        % green\or%
        % purple\else%
        awesome-red\else%
        % headercolor\fi%
        awesome-red\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifblank{##3}{}{##3\space}#1%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}

%%%%%%%%%%%%%%
% Awesome CV %
%%%%%%%%%%%%%%

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
\def\@photo{#2}
\@for\tmp:=#1\do{%
  \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
    {\let\@photoshape\tmp}{}%
  \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
    {\let\@photoedge\tmp}{}%
  \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
    {\let\@photoalign\tmp}{}%
}%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
% \newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\mobile}[1]{\href{tel://#1}{#1}} % \faMobile\acvHeaderIconSep

% Defines writer's email (optional)
% Usage: \email{<email adress>}
% \newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\email}[1]{\href{mailto://#1}{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
% \newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\homepage}[1]{\href{https://#1}{#1}}

% % Defines writer's github (optional)
% % Usage: \github{<github-nick>}
% % \newcommand*{\github}[1]{\def\@github{#1}}
% \newcommand*{\github}[1]{\href{https://github.com/#1}{\faGithubAlt\acvHeaderIconSep#1}}

% % Defines writer's gitlab (optional)
% % Usage: \gitlab{<gitlab-nick>}
% % \newcommand*{\gitlab}[1]{\def\@gitlab{#1}}
% \newcommand*{\gitlab}[1]{\href{https://gitlab.com/#1}{\faGitlab\acvHeaderIconSep#1}}

% % Defines writer's stackoverflow profile (optional)
% % Usage: \stackoverflow{<so userid>}{<so username>}
% %   e.g.https://stackoverflow.com/users/123456/sam-smith
% %       would be \stackoverflow{123456}{sam-smith}
% % \newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}
% \newcommand*{\stackoverflow}[2]{\href{https://stackoverflow.com/users/#1}{\faStackOverflow\acvHeaderIconSep#2}}

% % Defines writer's linked-in (optional)
% % Usage: \linkedin{<linked-in-nick>}
% % \newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
% \newcommand*{\linkedin}[1]{\href{https://linkedin.com/in/#1}{\faLinkedinSquare\acvHeaderIconSep#1}}

% % Usage: \twitter{<twitter handle>}
% % \newcommand*{\twitter}[1]{\def\@twitter{#1}}
% \newcommand*{\twitter}[1]{\href{https://twitter.com/#1}{\faTwitter\acvHeaderIconSep#1}}

% % Defines writer's skype (optional)
% % Usage: \skype{<skype account>}
% % \newcommand*{\skype}[1]{\def\@skype{#1}}
% \newcommand*{\skype}[1]{\href{skype://#1?call}{\faSkype\acvHeaderIconSep#1}}

% % Defines writer's reddit (optional)
% % Usage: \reddit{<reddit account>}
% \newcommand*{\reddit}[1]{\href{https://reddit.com/user/#1}{\faReddit\acvHeaderIconSep#1}}

% % Defines writer's xing (optional)
% % Usage: \xing{<xing name>}
% \newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's twitter (optional)
% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
% if an optional argument is provided, use it to redefine \enclname
\ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
\def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}


% %-------------------------------------------------------------------------------
% %                Commands for utilities
% %-------------------------------------------------------------------------------
% % Use to align an element of tabular table
% \newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
% \newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
% \newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% % Use to draw horizontal line with specific thickness
% \def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% % Use to execute conditional statements by checking empty string
% \newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
\newcommand*{\drawphoto}{%
  \ifthenelse{\isundefined{\@photo}}{}{%
    \newlength{\photodim}
    \ifthenelse{\equal{\@photoshape}{circle}}%
      {\setlength{\photodim}{1.3cm}}%
      {\setlength{\photodim}{1.8cm}}%
    \ifthenelse{\equal{\@photoedge}{edge}}%
      {\def\@photoborder{darkgray}}%
      {\def\@photoborder{none}}%
    \begin{tikzpicture}%
      \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
    \end{tikzpicture}
  }%
}
\newlength{\headertextwidth}
\newlength{\headerphotowidth}
\ifthenelse{\isundefined{\@photo}}{
  \setlength{\headertextwidth}{\textwidth}
  \setlength{\headerphotowidth}{0cm}
}{%
  \setlength{\headertextwidth}{0.76\textwidth}
  \setlength{\headerphotowidth}{0.24\textwidth}
}%
\begin{minipage}[c]{\headerphotowidth}%
  \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
\end{minipage}
\begin{minipage}[c]{\headertextwidth}
  \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
  \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
  \\[\acvHeaderAfterNameSkip]%
  \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
  \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
  \headersocialstyle{%
    \newbool{isstart}%
    \setbool{isstart}{true}%
    \ifthenelse{\isundefined{\@mobile}}%
      {}%
      {%
        📞\acvHeaderIconSep\@mobile%
        \setbool{isstart}{false}%
      }%
    \ifthenelse{\isundefined{\@email}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{mailto:\@email}{✉️\acvHeaderIconSep\@email}%
      }%
    \ifthenelse{\isundefined{\@homepage}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{http://\@homepage}{🏠\acvHeaderIconSep\@homepage}%
      }%
    \ifthenelse{\isundefined{\@github}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://github.com/\@github}{\faGithubSquare\acvHeaderIconSep\@github}%
      }%
    % \ifthenelse{\isundefined{\@gitlab}}%
    %   {}%
    %   {%
    %     \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
    %     \href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}%
    %   }%
    \ifthenelse{\isundefined{\@stackoverflowid}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\acvHeaderIconSep\@stackoverflowname}%
      }%
    \ifthenelse{\isundefined{\@linkedin}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://linkedin.com/in/\@linkedin}{\faLinkedinSquare\acvHeaderIconSep\@linkedin}%
      }%
    % \ifthenelse{\isundefined{\@twitter}}%
    %   {}%
    %   {%
    %     \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
    %     \href{https://twitter.com/\@twitter}{\faTwitter\acvHeaderIconSep\@twitter}%
    %   }%
    % \ifthenelse{\isundefined{\@skype}}%
    %   {}%
    %   {%
    %     \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
    %     \faSkype\acvHeaderIconSep\@skype%
    %   }%
    \ifthenelse{\isundefined{\@extrainfo}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \@extrainfo%
      }%
  } \\[\acvHeaderAfterSocialSkip]%
  \ifthenelse{\isundefined{\@quote}}%
    {}%
    {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
\end{minipage}%
\begin{minipage}[c]{\headerphotowidth}%
  \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
\end{minipage}
}

