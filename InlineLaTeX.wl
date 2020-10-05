(* ::Package:: *)

(*Get@URLDownload[LocalSymbol["Githubpath"] <> "InlineLaTeX.wl"]*)
(*Alt + M*)
(*Need to escape backslashs *)

Needs["MaTeX`"]
AppendTo[$ContextPath, "LaTeXHK`"]
Unprotect[MaTeX`Developer`Texify];
MaTeX`Developer`Texify[TextCell[code_,___]]:=ToString[code]


PreableHK="\\usepackage[scr=boondoxo]{mathalfa}
\\DeclareFontEncoding{FML}{}{}
\\DeclareFontSubstitution{FML}{fncmi}{m}{it}
\\DeclareSymbolFont{fourierletters}{FML}{fncmi}{m}{it}
\\SetSymbolFont{fourierletters}{normal}{FML}{fncmi}{m}{it}
\\DeclareMathSymbol{\\fP}{\\mathalpha}{fourierletters}{`E}
\\DeclareSymbolFont{Nperm}{OML}{cmss}{bx}{it}

\\SetSymbolFont{Nperm}{bold}{OML}{cmss}{bx}{it}
\\DeclareMathSymbol{\\nw}{\\mathalpha}{Nperm}{`w}
\\newcommand{\\unit}[1]{\\ensuremath{\\, \\mathrm{#1}}}


\\usepackage{amssymb,amsmath,yhmath, amsthm}
\\newtheorem{theorem}{Theorem}[section]
\\usepackage{bm}

%figure
\\usepackage{caption, subcaption}
%\\usepackage{lineno}
%\\linenumbers

\\usepackage{tabu}   
\\usepackage{longtable}   
\\usepackage[table]{xcolor}
\\definecolor{tableHeader}{RGB}{182, 75, 71}   
%\\definecolor{tableLineOne}{RGB}{245, 245, 245}  
\\definecolor{tableLineOne}{RGB}{224, 224, 224}  
\\definecolor{tableLineTwo}{RGB}{224, 224, 224}
\\newcommand{\\tableHeaderStyle}{\\rowfont{\\leavevmode\\color{white}\\bfseries}\\rowcolor{tableHeader}}
\\usepackage{multirow}



\\usepackage[T1]{fontenc}
% \\usepackage{cite}
\\usepackage{tikz}
\\newcommand*\\circled[1]{\\tikz[baseline=(char.base)]{
\\node[shape=circle,draw,inner sep=1pt] (char) {#1};}}


\\usepackage{enumitem}
\\usepackage{pifont}% http://ctan.org/pkg/pifont
\\newcommand{\\cmark}{\\ding{51}}%
\\newcommand{\\xmark}{\\ding{55}}%
\\usepackage{epstopdf}
\\usepackage{xr}
\\usepackage{hyperref}
\\hypersetup{
colorlinks = true,
citecolor = blue,
linkcolor = blue
}

\\newcommand{\\tbp}[1]{\\tilde{{\\mathpzc{#1}}}}
\\newcommand{\\bp}[1]{{\\mathpzc{#1}}}






% Special font for physical quantities
\\newcommand{\\forcemag}{f}
\\newcommand{\\physF}{\\boldsymbol{\\mathfrak{f}}} %
\\newcommand{\\physB}{\\mathscr{b}} % Width of the thin film
\\newcommand{\\physE}{{\\mathpzc{E}}}
\\newcommand{\\physkc}{\\mathscr{k}_{\\rm c}}
\\newcommand{\\ndkc}{k_{\\rm c}}
\\newcommand{\\physh}{\\mathscr{h}} %
\\newcommand{\\physe}{\\hat{\\mathbscr{e}}} %
\\newcommand{\\physf}{\\hat{\\boldsymbol{\\mathfrak{f}}}}
\\newcommand{\\physm}{\\mathscr{m}} %
\\newcommand{\\physu}{\\mathbscr{u}}
\\newcommand{\\physw}{\\mathscr{w}}
\\newcommand{\\rtple}[1]{\\boldsymbol{#1}}


\\renewcommand{\\u}[1]{\\boldsymbol{#1}}
\\newcommand{\\OriginRefEucldPtSpace}{O_{\\mathrm{ R}}}
\\newcommand{\\MapManifoldToRefEucldPtSpace}{\\kappa_{\\mathrm{ R}}}
\\renewcommand{\\t}[1]{\\tilde{#1}}
\\renewcommand{\\b}[1]{\\mathbb{#1}}
\\renewcommand{\\c}[1]{\\mathcal{#1}}
\\newcommand{\\lsc}[2][\\mathscr{l}]{{}^{ #1 }\\! #2}
\\newcommand{\\lscH}[1]{\\lsc[H]{#1}}
\\newcommand{\\dsf}[1]{\\Delta\\boldsymbol{\\sf #1}}
\\newcommand{\\tpsb}[1]{\\left. #1 \\right.^{\\sf T}}
\\newcommand{\\tps}[1]{\\left( #1 \\right)^{\\sf T}}
\\newcommand{\\usf}[1]{\\u{\\sf #1}}
\\newcommand{\\busf}[1]{\\bar{\\usf{ #1}}}
\\newcommand{\\tu}[1]{\\tilde{\\u{ #1}}}
\\newcommand{\\tusf}[1]{\\tilde{\\usf{ #1}}}
\\newcommand{\\btusf}[1]{\\bar{\\tusf{ #1}}}
\\newcommand{\\pr}[1]{\\left( #1 \\right)}
\\newcommand{\\encl}[1]{\\left. #1 \\right.}
\\newcommand*{\\subfigurewdith}{0.8\\textwidth}
\\newcommand{\\D}[1]{D\\hspace{-.1em}#1}
\\newcommand{\\Dr}{D\\hspace{-.1em}\\varrho}
\\newcommand{\\Drp}{\\Dr^{+}}
\\newcommand{\\Drm}{\\Dr^{-}}
\\newcommand{\\Dro}{\\dot{\\rho}}
\\newcommand{\\DDro}{\\ddot{\\rho}}
\\newcommand{\\Df}{\\dot{f}}
\\newcommand{\\DDf}{\\ddot{f}}
\\newcommand{\\Drop}{\\Dro^{+}}
\\newcommand{\\Drom}{\\Dro^{-}}
\\newcommand{\\Dl}{\\dot{l}}
\\newcommand{\\Da}{\\dot{a}}
\\newcommand{\\DDl}{\\ddot{l}}
\\newcommand{\\DF}{\\dot{F}}
\\newcommand{\\DDF}{\\ddot{F}}
\\newcommand{\\Dlp}{\\Dl^{+}}
\\newcommand{\\Dlm}{\\Dl^{-}}
\\newcommand{\\Dam}{\\Da^{-}}
\\newcommand{\\Deq}{\\mathcal{D}^{\\circ}}
\\newcommand{\\Dst}{\\mathcal{D}^{\\stable}}
\\newcommand{\\Dnt}{\\mathcal{D}^{\\odot}}
\\newcommand{\\Dunst}{\\mathcal{D}^{\\otimes}}
\\newcommand{\\conf}{\\boldsymbol{\\kappa}}
\\newcommand{\\confp}{\\tilde{\\boldsymbol{\\kappa}}}






\\newcommand{\\hlc}[2][yellow]{ {\\sethlcolor{#1} \\hl{#2}} }
\\usepackage{wrapfig}




% \\usepackage{amsmath}
% \\usepackage[small]{eulervm}
  \\DeclareMathAlphabet{\\mathvz}{OT1}{LinuxBiolinumT-OsF}{m}{sl}

  \\DeclareMathAlphabet{\\mathlib}{OT1}{LinuxLibertineT-OsF}{m}{it}
  \\DeclareMathAlphabet{\\mathbio}{OT1}{LinuxBiolinumT-OsF}{m}{it}
\\DeclareMathAlphabet{\\mathpzc}{OT1}{pzc}{m}{it}





%\\usepackage[prefix=sol]{xcolor-solarized}
\\usepackage{booktabs}
\\usepackage{float}
% \\usepackage{mathptmx}
\\usepackage{pdflscape}
\\usepackage{threeparttable}
\\usepackage{tabto}

\\usepackage{sectsty}
 \\sectionfont{\\fontsize{16}{16}\\selectfont}

%CUSTOM COMMANDS
\\newcommand{\\norm}[1]{\\ensuremath \\lVert #1 \\rVert}
\\newcommand{\\bs}[1]{\\ensuremath{\\mathbf{#1}}}
\\newcommand{\\pD}[2]{\\frac{\\partial #1}{\\partial #2}}
\\renewcommand{\\D}[2]{\\frac{\\mathrm{d} #1}{\\mathrm{d} #2}}
\\newcommand{\\dx}[1]{\\,\\mathrm{d} #1}
\\newcommand{\\ex}{{\\bm{\\hat{e}}}_1}
\\newcommand{\\ey}{{\\bm{\\hat{e}}}_2}
\\newcommand{\\ez}{{\\bm{\\hat{e}}}_3}
\\newcommand{\\ei}{{\\bm{\\hat{e}}}_i}
\\newcommand{\\ej}{{\\bm{\\hat{e}}}_j}
\\newcommand{\\er}{{\\bm{\\hat{e}}}_r}
\\newcommand{\\et}{{\\bm{\\hat{e}}}_\\theta}
\\newcommand{\\ep}{{\\bm{\\hat{e}}}_\\phi}
\\usepackage{xspace}
\\newcommand{\\TA}{\\textit{Ta.\\@}\\xspace}
\\newcommand{\\EA}{\\textit{Ea.\\@}\\xspace}
\\newcommand{\\subf}[1]{\\pr{\\textsf{#1}}}
\\newcommand{\\ra}[1]{\\renewcommand{\\arraystretch}{#1}}







\\newcommand{\\notimplies}{%
  \\mathrel{{\\ooalign{\\hidewidth$\\not\\phantom{=}$\\hidewidth\\cr$\\implies$}}}}



\\usepackage[obeyFinal]{todonotes}
\\setlength\\marginparwidth{2.5in}
\\renewcommand{\\>}{$\\Rightarrow$}

%\\usepackage[nomarkers,figuresonly]{endfloat}
";


SetOptions[MaTeX,"Preamble"->{"\\usepackage[scr=boondoxo]{mathalfa}
\\DeclareFontEncoding{FML}{}{}
\\DeclareFontSubstitution{FML}{fncmi}{m}{it}
\\DeclareSymbolFont{fourierletters}{FML}{fncmi}{m}{it}
\\SetSymbolFont{fourierletters}{normal}{FML}{fncmi}{m}{it}
\\DeclareMathSymbol{\\fP}{\\mathalpha}{fourierletters}{`E}
\\DeclareSymbolFont{Nperm}{OML}{cmss}{bx}{it}

\\SetSymbolFont{Nperm}{bold}{OML}{cmss}{bx}{it}
\\DeclareMathSymbol{\\nw}{\\mathalpha}{Nperm}{`w}
\\newcommand{\\unit}[1]{\\ensuremath{\\, \\mathrm{#1}}}


\\usepackage{amssymb,amsmath,yhmath, amsthm}
\\newtheorem{theorem}{Theorem}[section]
\\usepackage{bm}

%figure
\\usepackage{caption, subcaption}
%\\usepackage{lineno}
%\\linenumbers

\\usepackage{tabu}   
\\usepackage{longtable}   
\\usepackage[table]{xcolor}
\\definecolor{tableHeader}{RGB}{182, 75, 71}   
%\\definecolor{tableLineOne}{RGB}{245, 245, 245}  
\\definecolor{tableLineOne}{RGB}{224, 224, 224}  
\\definecolor{tableLineTwo}{RGB}{224, 224, 224}
\\newcommand{\\tableHeaderStyle}{\\rowfont{\\leavevmode\\color{white}\\bfseries}\\rowcolor{tableHeader}}
\\usepackage{multirow}



\\usepackage[T1]{fontenc}
% \\usepackage{cite}
\\usepackage{tikz}
\\newcommand*\\circled[1]{\\tikz[baseline=(char.base)]{
\\node[shape=circle,draw,inner sep=1pt] (char) {#1};}}


\\usepackage{enumitem}
\\usepackage{pifont}% http://ctan.org/pkg/pifont
\\newcommand{\\cmark}{\\ding{51}}%
\\newcommand{\\xmark}{\\ding{55}}%
\\usepackage{epstopdf}
\\usepackage{xr}
\\usepackage{hyperref}
\\hypersetup{
colorlinks = true,
citecolor = blue,
linkcolor = blue
}

\\newcommand{\\tbp}[1]{\\tilde{{\\mathpzc{#1}}}}
\\newcommand{\\bp}[1]{{\\mathpzc{#1}}}






% Special font for physical quantities
\\newcommand{\\forcemag}{f}
\\newcommand{\\physF}{\\boldsymbol{\\mathfrak{f}}} %
\\newcommand{\\physB}{\\mathscr{b}} % Width of the thin film
\\newcommand{\\physE}{{\\mathpzc{E}}}
\\newcommand{\\physkc}{\\mathscr{k}_{\\rm c}}
\\newcommand{\\ndkc}{k_{\\rm c}}
\\newcommand{\\physh}{\\mathscr{h}} %
\\newcommand{\\physe}{\\hat{\\mathbscr{e}}} %
\\newcommand{\\physf}{\\hat{\\boldsymbol{\\mathfrak{f}}}}
\\newcommand{\\physm}{\\mathscr{m}} %
\\newcommand{\\physu}{\\mathbscr{u}}
\\newcommand{\\physw}{\\mathscr{w}}
\\newcommand{\\rtple}[1]{\\boldsymbol{#1}}


\\renewcommand{\\u}[1]{\\boldsymbol{#1}}
\\newcommand{\\OriginRefEucldPtSpace}{O_{\\mathrm{ R}}}
\\newcommand{\\MapManifoldToRefEucldPtSpace}{\\kappa_{\\mathrm{ R}}}
\\renewcommand{\\t}[1]{\\tilde{#1}}
\\renewcommand{\\b}[1]{\\mathbb{#1}}
\\renewcommand{\\c}[1]{\\mathcal{#1}}
\\newcommand{\\lsc}[2][\\mathscr{l}]{{}^{ #1 }\\! #2}
\\newcommand{\\lscH}[1]{\\lsc[H]{#1}}
\\newcommand{\\dsf}[1]{\\Delta\\boldsymbol{\\sf #1}}
\\newcommand{\\tpsb}[1]{\\left. #1 \\right.^{\\sf T}}
\\newcommand{\\tps}[1]{\\left( #1 \\right)^{\\sf T}}
\\newcommand{\\usf}[1]{\\u{\\sf #1}}
\\newcommand{\\busf}[1]{\\bar{\\usf{ #1}}}
\\newcommand{\\tu}[1]{\\tilde{\\u{ #1}}}
\\newcommand{\\tusf}[1]{\\tilde{\\usf{ #1}}}
\\newcommand{\\btusf}[1]{\\bar{\\tusf{ #1}}}
\\newcommand{\\pr}[1]{\\left( #1 \\right)}
\\newcommand{\\encl}[1]{\\left. #1 \\right.}
\\newcommand*{\\subfigurewdith}{0.8\\textwidth}
\\newcommand{\\D}[1]{D\\hspace{-.1em}#1}
\\newcommand{\\Dr}{D\\hspace{-.1em}\\varrho}
\\newcommand{\\Drp}{\\Dr^{+}}
\\newcommand{\\Drm}{\\Dr^{-}}
\\newcommand{\\Dro}{\\dot{\\rho}}
\\newcommand{\\DDro}{\\ddot{\\rho}}
\\newcommand{\\Df}{\\dot{f}}
\\newcommand{\\DDf}{\\ddot{f}}
\\newcommand{\\Drop}{\\Dro^{+}}
\\newcommand{\\Drom}{\\Dro^{-}}
\\newcommand{\\Dl}{\\dot{l}}
\\newcommand{\\Da}{\\dot{a}}
\\newcommand{\\DDl}{\\ddot{l}}
\\newcommand{\\DF}{\\dot{F}}
\\newcommand{\\DDF}{\\ddot{F}}
\\newcommand{\\Dlp}{\\Dl^{+}}
\\newcommand{\\Dlm}{\\Dl^{-}}
\\newcommand{\\Dam}{\\Da^{-}}
\\newcommand{\\Deq}{\\mathcal{D}^{\\circ}}
\\newcommand{\\Dst}{\\mathcal{D}^{\\stable}}
\\newcommand{\\Dnt}{\\mathcal{D}^{\\odot}}
\\newcommand{\\Dunst}{\\mathcal{D}^{\\otimes}}
\\newcommand{\\conf}{\\boldsymbol{\\kappa}}
\\newcommand{\\confp}{\\tilde{\\boldsymbol{\\kappa}}}






\\newcommand{\\hlc}[2][yellow]{ {\\sethlcolor{#1} \\hl{#2}} }
\\usepackage{wrapfig}




% \\usepackage{amsmath}
% \\usepackage[small]{eulervm}
  \\DeclareMathAlphabet{\\mathvz}{OT1}{LinuxBiolinumT-OsF}{m}{sl}

  \\DeclareMathAlphabet{\\mathlib}{OT1}{LinuxLibertineT-OsF}{m}{it}
  \\DeclareMathAlphabet{\\mathbio}{OT1}{LinuxBiolinumT-OsF}{m}{it}
\\DeclareMathAlphabet{\\mathpzc}{OT1}{pzc}{m}{it}





%\\usepackage[prefix=sol]{xcolor-solarized}
\\usepackage{booktabs}
\\usepackage{float}
% \\usepackage{mathptmx}
\\usepackage{pdflscape}
\\usepackage{threeparttable}
\\usepackage{tabto}

\\usepackage{sectsty}
 \\sectionfont{\\fontsize{16}{16}\\selectfont}

%CUSTOM COMMANDS
\\newcommand{\\norm}[1]{\\ensuremath \\lVert #1 \\rVert}
\\newcommand{\\bs}[1]{\\ensuremath{\\mathbf{#1}}}
\\newcommand{\\pD}[2]{\\frac{\\partial #1}{\\partial #2}}
\\renewcommand{\\D}[2]{\\frac{\\mathrm{d} #1}{\\mathrm{d} #2}}
\\newcommand{\\dx}[1]{\\,\\mathrm{d} #1}
\\newcommand{\\ex}{{\\bm{\\hat{e}}}_1}
\\newcommand{\\ey}{{\\bm{\\hat{e}}}_2}
\\newcommand{\\ez}{{\\bm{\\hat{e}}}_3}
\\newcommand{\\ei}{{\\bm{\\hat{e}}}_i}
\\newcommand{\\ej}{{\\bm{\\hat{e}}}_j}
\\newcommand{\\er}{{\\bm{\\hat{e}}}_r}
\\newcommand{\\et}{{\\bm{\\hat{e}}}_\\theta}
\\newcommand{\\ep}{{\\bm{\\hat{e}}}_\\phi}
\\usepackage{xspace}
\\newcommand{\\TA}{\\textit{Ta.\\@}\\xspace}
\\newcommand{\\EA}{\\textit{Ea.\\@}\\xspace}
\\newcommand{\\subf}[1]{\\pr{\\textsf{#1}}}
\\newcommand{\\ra}[1]{\\renewcommand{\\arraystretch}{#1}}







\\newcommand{\\notimplies}{%
  \\mathrel{{\\ooalign{\\hidewidth$\\not\\phantom{=}$\\hidewidth\\cr$\\implies$}}}}



\\usepackage[obeyFinal]{todonotes}
\\setlength\\marginparwidth{2.5in}
\\renewcommand{\\>}{$\\Rightarrow$}

%\\usepackage[nomarkers,figuresonly]{endfloat}"}];


LaTeXHK`M[x_, fnt_: 14, blp_: Bottom] := 
 Module[{exp}, 
  exp = MaTeX[ToString[x], FontSize -> fnt, ContentPadding -> True, 
    "DisplayStyle" -> False]
  (*Graphics[exp, BaselinePosition -> blp]*)]
SetAttributes[M, HoldAll]




(* LaTeXHK`LIA[s_] := 
 PopupWindow[MaTeX[#, FontSize -> s] , 
   StringReplace[#, "\\" -> "\\\\"]] & 
 *)
 
LaTeXHK`LIA[s_] := PopupWindow[M[#1,s],Style[StringReplace[#1,"\\"->"\\\\"],FontSize->40]]&
LaTeXHK`M1:=LIA[14];
      
      
LeftSuperscript /: MakeBoxes[LeftSuperscript[braw_, supraw_], form_] :=
  With[{
      b = MakeBoxes[braw, form],
      sup = MakeBoxes[supraw, form]
    },
    TemplateBox[{b, sup}, "LeftSuperscript"]
  ];

LeftSubscript /: MakeBoxes[LeftSubscript[braw_, subraw_], form_] := 
  With[{
      b = MakeBoxes[braw, form],
      sub = MakeBoxes[subraw, form]
    },
    TemplateBox[{b, sub}, "LeftSubscript"]
  ];

LeftSubsuperscript /: 
  MakeBoxes[LeftSubsuperscript[braw_, subraw_, supraw_], form_] := 
  With[{
      b = MakeBoxes[braw, form],
      sub = MakeBoxes[subraw, form],
      sup = MakeBoxes[supraw, form]
    },
    TemplateBox[{b, sub, sup}, "LeftSubsuperscript"]
  ];      
