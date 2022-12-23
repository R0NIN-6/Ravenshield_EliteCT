#Compile ETC, if successful rename to .utx, move to game directory, and run the game
#edit the values to match your system and then edit the batch file 
cd '<full system path>\SDK2\Code Environment\system'

$file = '<path to Ravenshield SDK>\SDK2\<classname>.u'

#point to the batch file you are using, has to be in 'code enviroment/system'
$Process = Start-Process -Wait -PassThru -FilePath .\compile_ETC.bat 


$Process.StandardError
if(Test-Path -PathType Leaf -Path $file)
{
Remove-Item -Path '<full system path to game directory\ravenshield\textures\<class name>.utx' -Force 
Move-Item -Path $file -Destination '<full system path to game directory\ravenshield\textures\<class name>.utx' -Force 
& '<full system path to game directory\ravenshield\system\RavenShield.exe' #mod=AthenaSword
}
else
{
Write-Host "Compile failed" -ForegroundColor Red
}