# Ravenshield Modding Repository 
A Repository for Unreal script and development tools used for creating Ravenshield modifications. 

Elite Counter-Terror download: https://www.moddb.com/mods/elite-counter-terror

# Guides
- [Move Sound Files](Move-SoundFiles.ps1)
Powershell script to copy audio files from the Athena Sword/Iron Wrath directories into the main directory. This solves a major vanilla bug that left all AS/IW weapons and maps with missing audio. The old solution was to download the ALLr6 sound patch but if you want to avoid downloading 1 GB+ of files you can just move the existing files. Once they are in the Ravenshield sounds folder, they don't need to be anywhere else. This step is highly encouraged to get the full experience! You most likely have to run the script from an elevated shell for it to work.
- [Compile and Move new code classes](Ravenshield-CompileMove.ps1)
Powershell script that works with the batch file in the repo to automate the process of compiling a new class, renaming it, moving to the right folder, and starting the game. After many hours doing this manually I can say it will save you alot of time and pain if you want to start developing new classes. Open the .ps1 and .bat files enter your project name into both files to configure properly.
- [Importing new textures](RetextureGuide.md)
My "Retexture Guide" which you can use to import custom textures into the game.
- [Enable EAX](SetRegistryEAX.ps1)
Powershell script to quickly get EAX audio enabled in the game which will give a noticeable upgrade to audio, it is a work in progress. You have to run the script from an elevated shell and enter your ravenshield path in the script for it to work. (source and how to set-up manually: https://www.pcgamingwiki.com/wiki/Tom_Clancy%27s_Rainbow_Six_3:_Raven_Shield#Restore_3D_audio_and_EAX) 
- [Increase enemy count in Custom Missions](IncreaseEnemyCount.md)
I created this guide to modify an internal setting  and unlock the enemy count past 35 in custom missions. 
https://www.pcgamingwiki.com/wiki/Tom_Clancy%27s_Rainbow_Six_3:_Raven_Shield#Restore_3D_audio_and_EAX) 
- [Edit Template Files to change Enemies and Hostages](TemplateEditing.md)
I created this guide to help players change the enemy presets for any map to experiment with different and more challenging terrorist combinations, also applies to hostages. 
- [Restore Ferry Boat map](MP_Multi2.ini)
Copy the file 'MP_Multi2.ini' to 'mods/athenasword/maps/', the Ferry Boat map will now show up in the custom mission map list.
- [Bulk export textures and upscale](RvSBulkImageConvert.ps1) 
In Progress: A Powershell script that can export all textures from the game in bulk, convert to png, and then run each file through an AI-improvement algorithm called ESRGAN that runs on Python. 
- [Bulk edit Template files](BulkEdit-TemplateFiles.ps1) 
In Progress: A Powershell script that can process bulk editing of template files for enemy and hostage types. 
