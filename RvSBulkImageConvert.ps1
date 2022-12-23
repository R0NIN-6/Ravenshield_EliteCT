$Inputdirectory = "C:\Users\alcanto\Desktop\UmodelExport\\"
$OutputDirectory = "C:\Users\alcanto\Desktop\ConvertedPNGs"
$TextureSubFolders = gci -Path $Inputdirectory -Recurse -Directory -Filter Texture | select fullname
$strFolder =""
$folderName =""
foreach($folder in $TextureSubFolders)
{
    #$folder = 
    $strFolder =$folder.FullName
    Write-Output "full path: $strFolder"
    $folderName= $strFolder.TrimStart($Inputdirectory)
    set-location $strFolder
    #Start-Process -Wait -PassThru -filepath 'c:\Program Files\ImageMagick-7.1.0-Q16-HDRI\magick.exe' -argumentlist " mogrify -format png *.tga"
    #Move-Item -Path .\ -Filter *.png -Destination "$OutputDirectory\$folderName" -Force
    Write-Output "Folder name for out: $folderName"
  # ls
    $strFolder =""
    $folderName=""
}