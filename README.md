# Ravenshield Modding Repository 

## Elite Counter-Terror
### **Elite Counter-Terror** is a modifcation for Tom Clancy's Rainbow Six 3 that alters how the squad artificial intelligence performs.  
- Download the latest version from [ModDb](https://www.moddb.com/mods/elite-counter-terror)  
- View the formatted [readme](Guides/ECT_readme.md)  
- View the [change-log](Guides/ECT_readme.md#change-log)
- Watch my gameplay [videos](https://www.youtube.com/@ac11b63) 
## Guides
### These guides can help you learn the Ravenshield modding enviroment
- [Ravenshield IDE Set-up](Guides/RavenshieldModderEnviroment.md)  
My Ravenshield Modder's IDE (Integrated Development Environment) guide will help you take advantage of modern tools to create a highly-efficient process for your work.  
- [Importing new textures](Guides/RetextureGuide.md)  
My "Retexture Guide" which you can use to import custom textures into the game.
- [Increase enemy count in Custom Missions](Guides/IncreaseEnemyCount.md)  
I created this guide to modify an internal setting  and unlock the enemy count past 35 in custom missions. 
- [Edit Template Files to change Enemies and Hostages](Guides/TemplateEditing.md)  
I created this guide to help players change the enemy presets for any map to experiment with different and more challenging terrorist combinations, also applies to hostages. 
- [Restore Ferry Boat map](Guides/MP_Multi2.ini)  
Copy the file 'MP_Multi2.ini' to 'mods/athenasword/maps/', the Ferry Boat map will now show up in the custom mission map list.
## Development tools 
### These scripts were created to turbo-charge mod development and reduce errors.
- [Compile and Move new code classes](Tools/Ravenshield-CompileMove.ps1)  
Powershell script that works with the batch file in the repo to automate the process of compiling a new class, renaming it, moving to the right folder, and starting the game. After many hours doing this manually I can say it will save you alot of time and pain if you want to start developing new classes. This will also ensure you don't make errors during this tedious process. Open the .ps1 and .bat files enter your project name into both files to configure properly.
- [Move Sound Files](Tools/Move-SoundFiles.ps1)  
Powershell script to copy audio files from the Athena Sword/Iron Wrath directories into the main directory. This solves a major vanilla bug that left all AS/IW weapons and maps with missing audio. The old solution was to download the ALLr6 sound patch but if you want to avoid downloading 1 GB+ of files you can just move the existing files. Once they are in the Ravenshield sounds folder, they don't need to be anywhere else. This step is highly encouraged to get the full experience! You most likely have to run the script from an elevated shell for it to work.
- [Enable EAX](Tools/SetRegistryEAX.ps1)  
Powershell script to quickly get EAX audio enabled in the game which will give a noticeable upgrade to audio, it is a work in progress. You have to run the script from an elevated shell and enter your ravenshield path in the script for it to work. [Source]
- [Bulk export textures and upscale](Tools/RvSBulkImageConvert.ps1)  
In Progress: A Powershell script that can export all textures from the game in bulk, convert to png, and then run each file through an AI-improvement algorithm called ESRGAN that runs on Python. 
- [Bulk edit Template files](Tools/BulkEdit-TemplateFiles.ps1)  
In Progress: A Powershell script that can process bulk editing of template files for enemy and hostage types. 
## Templates
### These files can be used as starting points for your custom classes or enemy configurations
- Custom Actor
- Custom AI
- Enemy Template file
- Hostage Template file