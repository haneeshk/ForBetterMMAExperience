(*Get@URLDownload[LocalSymbol["Githubpath"] <> "InlineLaTeX.wl"]*)
(*Alt + M*)
(*Need to escape backslashs *)

Needs["MaTeX`"]
AppendTo[$ContextPath, "LaTeXHK`"]


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
 
LaTeXHK`LIA[s_] := 
   PopupWindow[MaTeX[#1, FontSize -> s], 
     "LIA[" <> ToString[s] <> "][\"" <> 
      StringReplace[#1, "\\" -> "\\\\"] <> "\"]"] &
      
      
      
      
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
