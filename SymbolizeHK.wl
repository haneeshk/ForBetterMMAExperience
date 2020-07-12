(* ::Package:: *)

BeginPackage["SymbolizeHK`",{"MaTeX`"}];

SymbolizeHK::usage="xi=SymbolizeHK[\"\\\\xi\",xiVar];
eta=SymbolizeHK[\"\\\\eta\"];
xi and eta will be shortcuts to the
variable xiVar and some authomatically created symbols;
These symbols will be rendered as \\xi
 and \\eta ";
 
Begin["Private`"];

MaTeXFontSize=11;
MaTeXPreamble={"\\usepackage[prefix=sol]{xcolor-solarized}","\\usepackage[scaled]{helvet}",
"\\usepackage[T1]{fontenc}","\\renewcommand\\familydefault{\\sfdefault}"};


SymbolizeHK[latexStr_]:=Module[{Img,Symb},
Img=MaTeX[latexStr,FontSize->MaTeXFontSize,Preamble->MaTeXPreamble];
Format[Symb]:=MaTeX[latexStr,FontSize->14,FontSize->MaTeXFontSize, Preamble->MaTeXPreamble];
Interpretation[Img,Symb]
]


SymbolizeHK[latexStr_,Symb_]:=Module[{Img},
Img=MaTeX[latexStr,FontSize->MaTeXFontSize,Preamble->MaTeXPreamble];
Format[Symb]:=MaTeX[latexStr,FontSize->14,FontSize->MaTeXFontSize, Preamble->MaTeXPreamble];
Interpretation[Img,Symb]
]
End[];
EndPackage[]
