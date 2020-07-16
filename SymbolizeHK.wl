(* ::Package:: *)

BeginPackage["SymbolizeHK`",{"MaTeX`"}];

SymbolizeHK::usage="xi=SymbolizeHK[\"\\\\xi\",xiVar];
eta=SymbolizeHK[\"\\\\eta\"];
xi and eta will be shortcuts to the
variable xiVar and some authomatically created symbols;
These symbols will be rendered as \\xi
 and \\eta ";
 
Begin["Private`"];

MaTeXFontSize=14;
MaTeXPreambleIn={"\\usepackage[prefix=sol]{xcolor-solarized}","\\usepackage[scaled]{helvet}",
"\\usepackage[T1]{fontenc}","\\renewcommand\\familydefault{\\sfdefault}"};


MaTeXPreambleOut={
"\\usepackage[prefix=sol]{xcolor-solarized}",
"\\usepackage[scaled]{helvet}",
"\\color{solgreen}",
"\\usepackage[T1]{fontenc}",
"\\renewcommand\\familydefault{\\sfdefault}"};


SymbolizeHK[latexStr_,Symb_]:=Module[{ImgIn,ImgOut,stri},
ImgIn=MaTeX[latexStr,FontSize->MaTeXFontSize,Preamble->MaTeXPreambleIn];
stri=latexStr;
stri=StringReplace[stri,"\\color{"~~Shortest[x__]~~"}"->""];
ImgOut=MaTeX[stri,Preamble->MaTeXPreambleOut];
(*ImgOut=Rotate[ImgOut,\[Pi]/30];*)
Format[Symb]:=ImgOut;
Interpretation[ImgIn,Symb]
]
End[];
EndPackage[]


SymbolizeHK[latexStr_]:=Module[{Symb},
SymbolizeHK[latexStr,Symb_]
(*Img=MaTeX[latexStr,FontSize->MaTeXFontSize,Preamble->MaTeXPreamble];
Format[Symb]:=Img;
Interpretation[Img,Symb]*)
]


SymbolizeHK2[Img_,Symb_]:=Module[{ImgIn,ImgOut},
ImgIn=Img;
ImgOut=ImageEffect[Img,"EdgeStylization"];
Format[Symb]:=ImgOut;
Interpretation[ImgIn,Symb]]


(*To Do*)
(*Need to add options to this function and allow it to change the Font Size*)
