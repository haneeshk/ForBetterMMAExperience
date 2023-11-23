(* ::Package:: *)

BeginPackage["HaneeshPackages`",{"MaTeX`"}]
MonthCalendar::usage=
"MonthCalendar[Year,Month]"
WMeaning::usage="WMeaning[word]"
HKmail::usage="HKmail[Receiver,Heading,Messg,file]"
WSyn::usage="WSyn[word], gives synonyms"
pdConv::usuage="pdConv[expression], gives the partial derivative in \!\(\*FractionBox[\(\[PartialD]\\\ f\), \(\[PartialD]x\)]\) format"


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





Begin["`Private`"]


WMeaning[Word_]:=Module[{wrd=ToLowerCase[Word]},Style[TableForm[StringReplace[WordData[wrd,"Definitions","List"],z:(StartOfString|WhitespaceCharacter~~_):>ToUpperCase[z]]],{Large,Darker[Red],FontSize->12,FontFamily->"Times New Roman"}]]

MonthCalendar[Year_,Month_]:=Module[{Yr=Year,Mo=Month},With[{year=Yr,month=Mo,daynames=RotateLeft[{Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday}],abbrevs=RotateLeft[{"Su","Mo","Tu","We","Th","Fr","Sa"}]},Labeled[TableForm[Partition[Range[QuantityMagnitude[DateDifference[{year,month},If[month==12,{year+1,1},{year,month+1}]]]],7,7,{DayName[{year,month,1}]/. Thread[daynames->Range[7]],1},""],TableHeadings->{None,abbrevs},TableSpacing->{1,1}],Style[DateString[DateObject[{year,month}]],Red],Top]]]


WSyn[Word_]:=Module[{wrd=ToLowerCase[Word]},Style[TableForm[StringReplace[WordData[wrd,"Synonyms","List"],z:(StartOfString|WhitespaceCharacter~~_):>ToUpperCase[z]]],{Large,Darker[Red],FontSize->12,FontFamily->"Times New Roman"}]]

HKmail[Receiver_,Heading_,Messg_,file_]:=Module[{Rc=Receiver,Hd=Heading,Mss=Messg, fl=file},SendMail["To"->Rc,"Subject"->Hd,"Body"->Mss,"From"->"haneesh_kesari@brown.edu","Server"->"smtp.gmail.com","UserName"->"haneesh_kesari@brown.edu","Password"->"AppliedMechanicsLab9(","PortNumber"->587,"EncryptionProtocol"->"StartTLS","Attachments"->fl]]

pdConv[f_]:=TraditionalForm[f/.Derivative[inds__][g_][vars__]:>
Apply[Defer[D[g[vars],##]] &,
Transpose[{{vars},{inds}}]/.
{{var_,0} :> Sequence[],{var_,1}:> {var}}]]

LaTeXMaTeX[BoxData[x_],StandardForm]:=Module[{y},y=StringReplace[x,"\""->""];y=StringReplace[y,"\n"..->""];MaTeX[y]
]


End[]
EndPackage[]



