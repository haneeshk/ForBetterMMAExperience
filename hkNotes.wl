BeginPackage["hkNotes`"]

Get["/Users/haneeshkesari/Downloads/MaTeX/MaTeX/MaTeX.m"];

SetOptions[MaTeX,BasePreamble->{"\\usepackage{lmodern,exscale}",
"\\usepackage{amsmath,amssymb}",
"\\usepackage{mathtools}",
"\\newcommand{\\bs}[1]{\\boldsymbol{#1}}",
"\\newcommand{\\ag}[1]{\\left[ #1 \\right]}",
"\\newcommand{\\grp}[1]{\\underbracket[0.140ex][0.2ex]{#1}}",
"\\newcommand{\\pr}[1]{\\left( #1 \\right)}",
"\\newcommand{\\brs}[1]{\\left\\{ #1 \\right\\}}"
}];
LaTeXMaTeX::usage="Formats a string using MaTeX"
Begin["Private`"]

LaTeXMaTeX[BoxData[x_],StandardForm]:=Module[{y},y=StringReplace[x,"\""->""];y=StringReplace[y,"\n"..->""];MaTeX[y]
]

End[]
EndPackage[]
