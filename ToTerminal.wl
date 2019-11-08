(* ::Package:: *)

BeginPackage["TerminalFuncs`"];

OpenNB::usage=""
ToTerminal::usage=""

Begin["`Private`"];
TerminalNb
OpenNB[fname_]:=Module[{dir,fns,nb},dir=If[ToString[NotebookDirectory[]]==ToString[$Failed],Directory[],NotebookDirectory[]];
fns=FileNames[FileNameJoin[{dir,fname}]];
If[fns==={},(nb=CreateNotebook[];
SetOptions[nb,AutoScroll->False,FontFamily->"Courier",WindowSize->{800,500},WindowMovable->False,WindowMargins->{{Automatic,0}, {Automatic, 0}}];
NotebookSave[nb,FileNameJoin[{dir,fname}]];),nb=NotebookOpen[fns[[1]]]];
Return[nb];];

ToTerminal[input_,nbName_:"log.nb"]:=
Module[{DateHK},
TerminalNb=OpenNB[nbName];
SetOptions[TerminalNb,(*Background\[Rule]Black,*)FontFamily->"Courier",(*FontColor\[Rule]White,*)WindowSize->{800,500},WindowMovable->False,WindowMargins->{{Automatic,0}, {Automatic, 0}},Magnification->1.5];
DateHK=DateString[{"DayNameShort",", ","MonthNameShort"," ","Day",", ","Year","\n","Hour12Short",":","Minute"}];
SelectionMove[TerminalNb,Before,Notebook];
NotebookWrite[TerminalNb,Cell[BoxData@ToBoxes[Evaluate[ReleaseHold[input]]],"Output",CellLabel->ToString[HoldForm[input]]],Before]];
End[];
EndPackage[];







