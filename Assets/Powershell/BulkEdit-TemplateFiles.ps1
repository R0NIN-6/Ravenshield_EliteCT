#add this to all MP* files with a random distribution of numbers
$EnemyString = "NbOfPawn=18
010, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
010, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
005, Enter enemy type (package.name)
"

$EnemyTptFiles = gci -Path 'C:\Rainbow Six 3\Future\Mods\EliteCounterTerror\template' -recurse -file -Filter *tpt
#todo find correct placement within file and replace text
