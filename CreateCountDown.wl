(* ::Package:: *)

CreateCountDown[ttotal_]:=Module[{tbegin=AbsoluteTime[],min=60,x},
x:=(AbsoluteTime[]-tbegin)/(min *ttotal);
Grid[{{Dynamic[Refresh[PaddedForm[Grid[{{ttotal*(1-x),"minutes"}}],{6,2},NumberPadding->{"0", "0"}],UpdateInterval->1]],
Dynamic[Refresh[ProgressIndicator[x,{ttotal,0}],UpdateInterval->1]],Dynamic[Refresh[PaddedForm[Grid[{{x*ttotal,"minutes"}}],{6,2},NumberPadding->{"0", "0"}],UpdateInterval->1]]}}]]
