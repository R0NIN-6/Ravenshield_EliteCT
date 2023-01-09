$RavenshieldPath = "enter full path to Ravenshield install"
$AthenaSwordSound = get-childitem -Path "$RavenshieldPath\mods\athenasword\sounds\" -Recurse -Directory
$IronWrathSound = get-childitem -Path "$RavenshieldPath\mods\ironwrath\sounds\" -Recurse -Directory
Move-Item $AthenaSwordSound,$IronWrathSound -Destination "$Ravenshield\sounds" -Force