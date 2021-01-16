(* ::Package:: *)

BeginPackage["mmaFuncsHK`",{"SymbolizeHK`"}]

 (*MessageName[cellsHK,"usage"]= "Display palette to display various cells";*)
 cellsHK::usage="Display palette to display various cells";


 Args::usage =
         "Gives the arguments of a functions.
 		For example:

 		1. Args[f[x]] \[Rule] x
 		2. Args[f[x,y]] \[Rule] Sequence[x,y]
 		3. Args[f[{x,y}]]\[Rule] List[x,y]";

 	SetAttributes[Args,{HoldAll}]

 	notesHK::usage =
         "Collatz[n] gives a list of the iterates in the 3n+1 problem,
         starting from n. The conjecture is that this sequence always
         terminates";

      EditNotes::usage =
         "Collatz[n] gives a list of the iterates in the 3n+1 problem,
         starting from n. The conjecture is that this sequence always
         terminates.";

      EditHist::usage =
         "Collatz[n] gives a list of the iterates in the 3n+1 problem,
         starting from n. The conjecture is that this sequence always
         terminates.";



Begin["Private`"]

Args[h_[x___]] := x;
Attributes[Args]={ReadProtected};

notesHK[x_, tag_String:"history"] := Module[{txt = MessageName[x, tag], txtColor = Black,
   color = Lighter[Gray, 0.85]},
  CellPrint[
   TextCell[
    Panel[Style[txt, txtColor, FontFamily -> "Times New Roman",
      FontSize -> 14], Background -> color], "Print", "PrintUsage
    ", Background -> color, CellFrame -> {{0, 0}, {0, 1}}]]]

EditNotes[x_, tag_:"history"] :=
  Module[{txt = MessageName[Args, tag]},
   Text@ToExpression@ BoxData[ToBoxes[txt]]];

EditHist[x_, tag_:"history"] := Module[{NB = EvaluationNotebook[],
   nb = CreateDocument[{Cell[EditNotes[x,tag], "Text"]}]},
  DialogInput[DialogNotebook[{TextCell["Click to proceed"],
     Button["Proceed",
      NotebookFind[nb, "Text", All, CellStyle];
      SelectionMove[nb, All, CellContents];
      SetSelectedNotebook[nb];
      FrontEndTokenExecute["Copy"];
      SetSelectedNotebook[NB];
      Paste[];
      SelectionMove[NB, "Previous", CellContents];
      SelectionMove[NB, "After", CellContents];
      NotebookApply[NB, "\";"];
      SelectionMove[NB, "Before", CellContents];
      NotebookApply[NB, ToString[x] <> "::" <> ToString[tag] <> "=\""];
      SelectionMove[NB, All, CellContents];
      FrontEndTokenExecute["Copy"];
      SelectionMove[NB, All, Cell];
      NotebookDelete[NB];
      FrontEndTokenExecute["Paste"];
      SelectionMove[NB, All, Cell];
      SelectionEvaluate[NB];
      DialogReturn[]]}]]]


      cellsHK[]:=Module[{},
      CreatePalette@Grid[
        {{Button["Hide Inputs", Module[{nb}, nb = SelectedNotebook[];
            NotebookFind[SelectedNotebook[], "Input", All, CellStyle];
            SetOptions[NotebookSelection[nb], CellOpen -> False,
             ShowCellBracket -> False]]],

          Button["Show Inputs", Module[{nb}, nb = SelectedNotebook[];
            NotebookFind[SelectedNotebook[], "Input", All, CellStyle];
            SetOptions[NotebookSelection[nb], CellOpen -> True,
             ShowCellBracket -> True]]]},
         {
          Button["Hide Output", Module[{nb}, nb = SelectedNotebook[];
            NotebookFind[SelectedNotebook[], "Output", All, CellStyle];
            SetOptions[NotebookSelection[nb], CellOpen -> False,
             ShowCellBracket -> False]]],

          Button["Show Output", Module[{nb}, nb = SelectedNotebook[];
            NotebookFind[SelectedNotebook[], "Output", All, CellStyle];
            SetOptions[NotebookSelection[nb], CellOpen -> True,
             ShowCellBracket -> True]]]},
         {
          Button["Hide Text", Module[{nb}, nb = SelectedNotebook[];
            NotebookFind[SelectedNotebook[], "Text", All, CellStyle];
            SetOptions[NotebookSelection[nb], CellOpen -> False,
             ShowCellBracket -> False]]],

          Button["Show Text", Module[{nb}, nb = SelectedNotebook[];
            NotebookFind[SelectedNotebook[], "Text", All, CellStyle];
            SetOptions[NotebookSelection[nb], CellOpen -> True,
             ShowCellBracket -> True]]]
          },



         {
          Button["Delete Output", Module[{nb}, nb = SelectedNotebook[];
            NotebookDelete@Cells[nb, CellStyle -> "Output" || "Print" || "Echo"]]],

      Button["Quit Kernel", Module[{nb}, nb = SelectedNotebook[];
            Quit[]]]
         }
         }];


         ];

      cellsHK[option_:1]:=Module[{},Print["Hello Kitty"]]; (*This is an overloaded vertsion of the cellsHK function*)



End[]
EndPackage[]
