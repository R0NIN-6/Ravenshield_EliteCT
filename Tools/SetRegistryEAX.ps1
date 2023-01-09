$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
$RavenshieldPath = "enter full path to Ravenshield install"
$DSOALFiles = get-childitem -path "$ScriptDir\DSOAL-Files\"
Copy-Item -Path $DSOALFiles -Destination "$Ravenshield/system/"
#set registry key value in 4 locations:

New-ItemProperty -path "HKCU:\Software\Classes\CLSID\{47D4D946-62E8-11CF-93BC-444553540000}" -Name "InprocServer32" -Value "dsound.dll"
New-ItemProperty -path "HKCU:\Software\Classes\CLSID\{3901CC3F-84B5-4FA4-BA35-AA8172B8A09B}" -Name "InprocServer32" -Value "dsound.dll"
New-ItemProperty -path "HKLM:\Software\Classes\WOW6432Node\CLSID\{47D4D946-62E8-11CF-93BC-444553540000}" -Name "InprocServer32" -Value "dsound.dll"
New-ItemProperty -path "HKLM:\Software\Classes\WOW6432Node\CLSID\{3901CC3F-84B5-4FA4-BA35-AA8172B8A09B}" -Name "InprocServer32" -Value "dsound.dll"