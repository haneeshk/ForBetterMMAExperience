(* ::Package:: *)

BeginPackage["DuplicateNotebook`"]
NewName::usage="Create a time stamp appended file name."
DupNb::usage="DuplicateNotebook[nb], creates a duplicate version of nb"


Begin["Private`"]


NewName[nb_]:=Module[{dummy},
dummy=FileNameSplit[StringDelete[NotebookFileName[nb],".nb"]];
FileNameJoin[Flatten@{dummy[[1;;-2]],"."~~dummy[[-1]]~~"_"~~DateString[DateObject[],{"DayName","_","MonthNameShort","_","Day","_","Year","_","Hour12","_","Minute","_","AMPM","_",".nb"}]}]
]

DupNb[nb_]:=
Module[{NewDuplicateNotebookName,DuplicateNotebook},
NewDuplicateNotebookName=NewName[nb];
DuplicateNotebook=NotebookPut[NotebookGet[InputNotebook[]],(*Background\[Rule]GrayLevel[0.95],*)"ClosingSaveDialog"->False,WindowTitle->NewDuplicateNotebookName];
SetSelectedNotebook[InputNotebook[]];
NotebookSave[DuplicateNotebook,NewDuplicateNotebookName];
];


End[]


EndPackage[]
