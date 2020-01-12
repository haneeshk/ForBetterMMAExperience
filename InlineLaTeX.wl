(*Get@URLDownload[LocalSymbol["Githubpath"] <> "InlineLaTeX.wl"]*)
(*Alt + M*)
(*Need to escape backslashs *)

Needs["MaTeX`"]
ClearAll[M]
M[x_, fnt_: 14, blp_: Bottom] := 
 Module[{exp}, 
  exp = MaTeX[ToString[x], FontSize -> fnt, ContentPadding -> True, 
    "DisplayStyle" -> False]
  (*Graphics[exp, BaselinePosition -> blp]*)]
SetAttributes[M, HoldAll]
