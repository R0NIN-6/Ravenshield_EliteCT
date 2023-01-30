<#
This script will create an automated sequence for the following:
1. Compile your mod and check for errors
2. Strip the source code
3. If successful rename to .utx, and move to game directory (some advanced mods keep the .u extension, for now we'll use .utx)
4. Send previous file to a backup folder with time-stamp appended to name
5. Optional - run the game

To use, edit the values to match your system and then edit the 2 batch files as specified in my IDE guide:
compile_Custom.bat
Strip_Custom.bat
#>

#First step, get a time data object. This will be used for our filenames and timing our script
$StartTime = $(get-date)

cls
#Create a variable with the time stamp in the format mm-dd-yy-hour-minutes
$TimeStamp ="{0:yyyy_MM_dd_HH_mm_ss_ms}" -f ([datetime]$StartTime)
#This should match the name of your project folder 
$ProjectName ="Your Project Name"
#The location of the file created by the SDK after compiling and stripping
$Compiled_U_File = "<path to Ravenshield SDK>\SDK2\$ProjectName.u"
#Where the file will reside within the Game directory (You don't have to use the same name here, but for the guide's sake we will keep it conisistent)
$GameDir_File = "<path to Ravenshield\mods\$ProjectName.utx"
#Arbitrary location where backup files will be stored
$Backup_Dir ='path to any folder'

#First step, check if a compiled file already exists in the SDK and move it out to backup
if(Test-Path -PathType Leaf -Path $Compiled_U_File)
{
    Move-item -Path $Compiled_U_File -Destination "$Backup_Dir\$ProjectName-1$TimeStamp" -Force
}

#Execute the batch file you are using, has to be in 'code enviroment/system' and have your project name added within it (see guide)
&'path to SDK\Code enviroment\system\compile_Custom.bat' 
#Execute the strip batch file you are using, same as above
#Only uncomment when you are releasing your mod for download
#&'path to SDK\Code enviroment\system\strip_Custom.bat' 

#If compile and strip was successful, the file will exist at the defined location and script can proceed
if(Test-Path -PathType Leaf -Path $Compiled_U_File)
{
    Write-Output "Compile success"

    if(Test-Path -PathType Leaf -Path $GameDir_File)
    {
        Write-Output "Backing up old file"
        Move-Item -Path $GameDir_File -Destination "$Backup_Dir\$ProjectName-2$TimeStamp" -Force 
    }
    Write-Output "Moving file to game directory"
    Move-Item -Path $Compiled_U_File -Destination $GameDir_File -Force 
    Write-Output "Files copied, Game is ready to start"
    #If desired, uncomment to automatically start the game
    #& '<full system path to game directory\ravenshield\system\RavenShield.exe' 
}
else
{
    #If the file doesn't exist, compile failed and the error will be shown in the output
    Write-Host "Compile failed, check error message" -ForegroundColor Red
}

$elapsedTime = $(get-date) - $StartTime
write-host "Script completed in" $elapsedTime.TotalSeconds "seconds."