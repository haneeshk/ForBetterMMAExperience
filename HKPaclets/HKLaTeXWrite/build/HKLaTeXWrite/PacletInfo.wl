(* ::Package:: *)

PacletObject[
  <|
    "Name" -> "HKLaTeXWrite",
    "Version" -> "1.5.0",
    "WolframVersion" -> "12.0+",
    "Dependencies" -> {
      "MaTeX"
    },
    "Extensions" -> {
      {
        "Kernel",
        "Root" -> "Kernel",
		"Context" -> "HKLaTeXWrite`",
        "Symbols" -> {"HKLaTeXWrite`ReplaceSelectionWithFunction"},
		"AdditionalKernelFiles" -> {"HKLaTeXWrite.mx"}
      }
    }
  |>
]
