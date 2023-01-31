#---------------------------------------------------------------------------------
# The Raven-shell SDK
# Note: This code is meant to be an enterprise-grade script and is not suitable for tutorials because of it's length, see my other scripts for shorter samples that you can go line-by-line and test with. 
# Version 0.00.00
# 
# Notes:
# 
<#
.SYNOPSIS
Compile Ravenshield Code
.DESCRIPTION
The purpose of this script is to create a full-fledged Ravenshield SDK for Powershell, including a robust set of configurations. 
.PARAMETER ConfigFile
Specifices the configuration file for the build. This should be the master file, on first run a working copy Config_computerName.xml will be
created in the current directory. If no value is specified, defaults to Config,xml in the current directory.
.PARAMETER ResetConfigFile
Create a new configuration file. Initial values are hard-coded within the script. Then manually edit the file as needed.
.PARAMETER ProjectName
Specifies a Project Name (If not found and createNew is true, the project will be created)
TODO: Finish Parameters
.EXAMPLE

.NOTES
Last Updated: 1/31/2023
.LINK
None
#>

#---------------------------------------------------------------------------------
# Parameters
#---------------------------------------------------------------------------------

param([string]$ConfigFile = "Config.xml",
      [switch]$ResetConfigFile = $false,
      [switch]$UseConfig = $false,
      [string]$ProjectName = "",
      [switch]$Strip = $false,
      [switch]$Backup = $false,
      [switch]$StartGame = $false,
      [Alias('Compile2')][switch]$AdvancedCompile = $false,
      [switch]$MoveToGameDir = $false,
      [switch]$CreateNew = $false
)
$StartTime = $(get-date)

#---------------------------------------------------------------------------------
# Global Variables
#---------------------------------------------------------------------------------
$ScriptDir          = Split-Path $script:MyInvocation.MyCommand.Path
$ScriptPath         = $script:MyInvocation.MyCommand.Path



#---------------------------------------------------------------------------------
# Begin Common Functions /////////////////////////////////////////////////////////
#---------------------------------------------------------------------------------

#---------------------------------------------------------------------------------

Function LogMessage {

    param([string]$dataStream,$ForegroundColor="Gray",$BackgroundColor="default")
    
    $message = $("{0:yyyy.MM.dd HH:mm:ss}: {1}" -f (Get-Date),$dataStream)
    If ($ActivityLogFileName) { Add-Content $ActivityLogFileName $message }
    If ($BackgroundColor -eq "default") {
		Write-Host $message -ForegroundColor $ForegroundColor
	} Else {
    	Write-Host $message -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor
	}
}
$TranscriptFile      = Join-Path -Path (Get-Item -Path "$ScriptDir") -ChildPath ("{0}-{1}.log" -f "RvS_Compile_Transcript",(get-date -Format yyyy-MM-dd))
Start-Transcript -path $TranscriptFile -Append
$ActivityLogFileName = Join-Path -Path (Get-Item -Path "$ScriptDir") -ChildPath ("{0}-{1}.log" -f "RvS_Compile",(get-date -Format yyyy-MM-dd))
If (!(Test-Path $ActivityLogFileName)) { $bb = New-Item $ActivityLogFileName -type file }
& echo "     " | Tee-Object -Append -FilePath $ActivityLogFileName
LogMessage ("-----------------------------------------------")


<#
If ($Update) {
    LogMessage ("{0}" -f "Skype for Busiess Server Install Initiated (Update)")
} Else {
    LogMessage ("{0}" -f "Skype for Busiess Server Install Initiated")
}
#>
LogMessage ("{0}" -f "Ravenshield Powershell SDK Initiated")

#---------------------------------------------------------------------------------
# Reset Config File option
#---------------------------------------------------------------------------------
If ($ResetConfigFile) { 
 $newConfigFile = [pscustomobject][ordered] @{
        RavenshieldGameDirectory             = ""
        RavenshieldCodeEnviroment                 = ""
        Strip                        = "False"
        MoveCompiledFile                = "False"
        TargetPath                = ""

    } | export-clixml $ConfigFile
    LogMessage ("{0} {1}" -f "Config File reset:",$ConfigFile)
    $config = import-clixml $ConfigFile
    $config

    $localConfigFilePath = $config.TargetPath+'InstallStatus_'+$env:computername+'.xml'
    $localConfig = [pscustomobject][ordered] @{
        Stage = "1"
        Version = ""
    } | export-clixml $localConfigFilePath
    LogMessage ("{0} {1}" -f "Local File reset:",$localConfigFilePath)
    Import-Clixml $localConfigFilePath
    Exit
}


#---------------------------------------------------------------------------------
# Done
#---------------------------------------------------------------------------------

$elapsedTime = $(get-date) - $StartTime
LogMessage ("{0} {1} {2}" -f "Install Completed in", $elapsedTime.TotalSeconds, "seconds")