(* ::Package:: *)

CreateCoundtDown[tmin_]:=Module[{},Dynamic@ProgressIndicator[Clock[{0,60*tmin,1},60*tmin],{60*tmin,1}]]
