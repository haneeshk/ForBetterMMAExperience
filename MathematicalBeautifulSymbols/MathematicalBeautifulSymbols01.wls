2+2


SuperscriptˍjˍˍBolfˍSansˍNˍˍSubscriptˍi=2.3

SuperscriptˍjˍˍBolfˍSansˍNˍˍSubscriptˍi
SS=Framed[Style[#,FontColor->White],Background->Black,FrameMargins->{{20,20},{30,30}},ImageMargins-> 0,Frame -> True, FrameStyle->Directive[Black, 25]] &;
Get["/Users/haneeshkesari/Downloads/MaTeX/MaTeX/MaTeX.m"];
Format[SuperscriptˍjˍˍBolfˍSansˍNˍˍSubscriptˍi]:=MaTeX["{\\color{white} ^j\!\\boldsymbol{\\mathsf{N}}_i}",Preamble->{"\\usepackage{color}"}];
ClearAll[SuperscriptˍjˍˍBolfˍSansˍNˍˍSubscriptˍi]
SuperscriptˍjˍˍBolfˍSansˍNˍˍSubscriptˍi=2.3
x=SuperscriptˍjˍˍBolfˍSansˍNˍˍSubscriptˍi;
Format[jNi]:=MaTeX["{\\color{white} ^j\!\\boldsymbol{N}_i}",Preamble->{"\\usepackage{color}"}];
jNi[ξ_,η_]:= ξ η

jNi[ξ,η]//SS

Echo[HoldForm[#]^2==ReleaseHold[#]^2 & /@{HoldForm@SuperscriptˍjˍˍBolfˍSansˍNˍˍSubscriptˍi}]//SS
