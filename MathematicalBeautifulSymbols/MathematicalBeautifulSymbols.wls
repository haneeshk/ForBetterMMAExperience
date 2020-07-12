(* For Atom, use soft wrap *)
$SessionID


SS=Framed[Style[#,FontColor->White],Background->Black,FrameMargins->{{20,20},{30,30}},ImageMargins-> 0,Frame -> True, FrameStyle->Directive[Black, 25]] &;


D[Sin[p]^2,p]//SS


D[Sin[p]^2,p]//TraditionalForm//SS


pi=\[Pi];


Plot[Sin[10 x],{x,-pi,pi},PlotStyle->{White,Thickness[0.002]},AspectRatio->{pi,1}]//SS


Get["/Users/haneeshkesari/Downloads/MaTeX/MaTeX/MaTeX.m"];


Format[jNi]:=MaTeX["{\\color{white} ^j\!\\boldsymbol{N}_i}",Preamble->{"\\usepackage{color}"}];


Format[p]:=MaTeX["{\\color{white} ^j\!\\mathbb{P}_i}",Preamble->{"\\usepackage{color}"}];


p//SS


jNi+jNi^2//SS
(1+2)//SS


RotationMatrix[jNi ,{1,1,1}]//MatrixForm//TraditionalForm//SS


Plot[Sin[अ],{अ,-π,π}]//SS




D[Sin[अ]^2,अ]//SS
%//Simplify//SS

Format[x]:=ई
(* Format[x]:=Subscript[ई,ε] *)
x//SS
Prime/@Range[10]//SS

N[#^2+Sin[#]] & /@ Range[0,1,0.1]//SS
2+2//SS
