BeginPackage["mmaFuncsHK`"]

 (*MessageName[cellsHK,"usage"]= "Display palette to display various cells";*)
 cellsHK::usage="Display palette to display various cells";

Begin["Private`"]

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
      NotebookDelete@
       Cells[nb, CellStyle -> "Output" || "Print" || "Echo"]]]
    }
   }]
   
   ]

End[]
EndPackage[]
