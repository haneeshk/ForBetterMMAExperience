Get@URLDownload[
  "https://raw.githubusercontent.com/haneeshk/ForBetterMMAExperience/\
master/CreateCountDown.wl"]

CreateCountDownPalette = 
 CreatePalette[Grid[{{CreateCountDown[#]}}], 
   WindowTitle -> 
    "Timer for: " ~~ ToString[#] ~~ " Min" ~~ ", started: " ~~ 
     DateString[{"Hour12", ":", "Minute", " ", "PM"}]] &
