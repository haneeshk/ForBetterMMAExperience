(* ::Package:: *)

BeginPackage["ComplexSymbols`"]


AssignLabels::usage=
  "AssignLabels[listOfStrings] assigns the given labels to package-assigned internal symbols using the Notation package, and returns those symbols. Because the labels are assigned using a custom style added during ComplexSymbols initialization, these labels will be displayed using the full formatting of the initial string definition."


SymbolPalette::usage=
  "SymbolPalette[paletteTitleString,listOfSymbols,paletteWidthInColumns] creates a palette with the given title consisting of buttons corresponding to each of the symbols in the given list. The buttons are arranged in the number of columns specified."


EscMenu::usage=
  "EscMenu[shortcutString,menutTitleString,listOfSymbols] assigns an escape alias shortcut to a menu with the given title, where the menu consists of the symbols in the given list."


UnassignLabels::usage=
  "UnassignLabels[listOfSymbols] removes the assignments for selected labels originally assigned in the AssignLabels function."


UnassignAllLabels::usage=
  "UnassignLabels[] removes all of the label assignments that are still assigned using the AssignLabels function."


AllSymbols::usage=
  "AllSymbols[] returns a list of all of the symbols currently assigned within the ComplexSymbols package."


runningsymbollist::usage=""


Begin["Private`"]


Notation`AutoLoadNotationPalette=False;


Needs["Notation`"]


runningsymbolindex=1;


runningsymbollist=<||>;


constructnextsymbol:=Symbol["complexsymbol"<>ToString[runningsymbolindex++]];


complexSymbolStyle=Cell[StyleData["complexSymbols"],StyleMenuListing->None,
    TagBoxOptions->{SyntaxForm->"symbol"},ShowStringCharacters->False,
    ShowAutoStyles->False,ZeroWidthTimes->True,FontWeight->Plain,FontFamily->"Times",
    TemplateBoxOptions->{DisplayFunction->(RowBox[{#}]&),SyntaxForm->"symbol"}];


customComplexSymbolstyle={Cell[StyleData[StyleDefinitions->placeholder]],complexSymbolStyle};


startingStyles=StyleDefinitions/.Options[EvaluationNotebook[],StyleDefinitions];


If[FreeQ[startingStyles,"complexSymbols"],
  If[Head[startingStyles]===Notebook,AppendTo[startingStyles[[1]],complexSymbolStyle];
      SetOptions[EvaluationNotebook[],StyleDefinitions->startingStyles],
    SetOptions[EvaluationNotebook[],StyleDefinitions->Notebook[customComplexSymbolstyle/.placeholder->
    startingStyles]]],Null];


AssignLabels[list_]:=Block[{symbollist={},tmpsymbol},
  Do[AppendTo[symbollist,tmpsymbol=constructnextsymbol];
     AssociateTo[runningsymbollist,tmpsymbol->list[[i]]];
     Notation[DoubleLongLeftRightArrow[
       ParsedBoxWrapper@TemplateBox[{"\""<>list[[i]]<>"\""},"complexSymbols",
                       Editable->False,Selectable->False],
       ParsedBoxWrapper@SymbolName[tmpsymbol]]],
    {i,Length[list]}];
  symbollist]


AllSymbols[]:=If[Length[runningsymbollist]==0,{},Keys[runningsymbollist]]


SymbolPalette[name_,list_,width_]:=
  CreatePalette[Multicolumn[
      PasteButton@@@({list,list}\[Transpose]),width], 
    WindowTitle->name,Saveable->False,StyleDefinitions->Notebook[customComplexSymbolstyle/.placeholder->"Palette.nb"]]


moveTo[tag_,i_,ntags_]:=FrontEnd`BoxReferenceFind[
  FE`BoxReference[#,{tag<>"_"<>ToString[Mod[i,ntags,1]]},
  FE`SearchStart->"StartFromBeginning"]]&


chooseMeBox[(label_:>value_),func_,tag_,i_,ntags_]:=
  TagBox[PanelBox[ToBoxes@Pane[label],
         Appearance->{"Default"->FrontEnd`FileName[{"Popups","CodeCompletion"},"CARectBG.9.png"],
         "Hover"->FrontEnd`FileName[{"Popups","CodeCompletion"},"row_hover.9.png"],
         "Pressed"->FrontEnd`FileName[{"Popups","CodeCompletion"},"row_hover.9.png"],
       FEPrivate`If[FEPrivate`SameQ[FrontEnd`CurrentValue[FrontEnd`EvaluationBox[],
         "SelectionOver"],True],"Pressed",Automatic]},
         BoxID->tag<>"_"<>ToString[i]],
       With[{d=moveTo[tag,i+1,ntags],u=moveTo[tag,i-1,ntags]},
         EventHandlerTag[{"ReturnKeyDown":>func[value],
           "MouseClicked":>func[value],
           "DownArrowKeyDown":>FrontEndExecute[d[EvaluationNotebook[]]],
           "UpArrowKeyDown":>FrontEndExecute[u[EvaluationNotebook[]]],
           "RightArrowKeyDown":>FrontEndExecute[d[EvaluationNotebook[]]],
           "LeftArrowKeyDown":>FrontEndExecute[u[EvaluationNotebook[]]],
           Method->"Preemptive",PassEventsDown->False,PassEventsUp->False}]]];


chooserBox[label_,rules_,tag_]:=
  With[{ntags=Length@rules},
    PanelBox[GridBox[Prepend[{TagBox[PanelBox[ToBoxes@Pane[label],
          Appearance->{"Default"->FrontEnd`FileName[{"Popups","CodeCompletion"},"CARectBG.9.png"]}],
        With[{d=moveTo[tag,1,ntags],
          u=moveTo[tag,ntags,ntags]},
          EventHandlerTag[{"DownArrowKeyDown":>FrontEndExecute@d[EvaluationNotebook[]],
                           "UpArrowKeyDown":>FrontEndExecute@u[EvaluationNotebook[]],
                           "RightArrowKeyDown":>FrontEndExecute@d[EvaluationNotebook[]],
                           "LeftArrowKeyDown":>FrontEndExecute@u[EvaluationNotebook[]],
                           Method->"Preemptive",PassEventsDown->False,PassEventsUp->False}]
          ]]}]@MapIndexed[{chooseMeBox[#,NotebookWrite[Nest[ParentBox,
                    EvaluationBox[],3],#]&,tag,#2[[1]],ntags]}&,rules],
          GridBoxSpacings->{"Rows"->{{0}}}],
          Appearance->{"Default"->FrontEnd`FileName[{"Popups","CodeCompletion"},"top_left.9.png"]},BoxID->tag]]


EscMenu[shortcut_,tag_,list_]:=
  Block[{},CurrentValue[EvaluationNotebook[],{InputAliases,shortcut}]=
    With[{baseBox=chooserBox[tag,(#:>ToBoxes[#])&/@list,tag]},
      DynamicBox[FEPrivate`If[FrontEnd`SameQ[FrontEnd`EvaluationCell[],$Failed],
      PanelBox[tag,Appearance->{"Default"->FrontEnd`FileName[{"Popups","CodeCompletion"},
      "top_left.9.png"]}],baseBox]]];]


UnassignLabels[list_]:=Block[{},
  Do[RemoveNotation[DoubleLongLeftRightArrow[
       ParsedBoxWrapper@TemplateBox[{"\""<>runningsymbollist[list[[i]]]<>"\""},
                       "complexSymbols",Editable->False,Selectable->False],
       ParsedBoxWrapper@SymbolName[list[[i]]]]];
       runningsymbollist=KeyDropFrom[runningsymbollist,list[[i]]],
    {i,Length[list]}]
  ]


UnassignAllLabels[]:=runningsymbollist=UnassignLabels[AllSymbols[]]


Print["Complex Symbols Package Loaded"]


End[]


EndPackage[]
