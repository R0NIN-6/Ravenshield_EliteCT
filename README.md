# Ravenshield Modding Repository

## Elite Counter-Terror

### **Elite Counter-Terror** is a modification for Tom Clancy's Rainbow Six 3 that alters how the squad artificial intelligence performs.  

<a href="https://www.moddb.com/mods/elite-counter-terror/downloads/elite-counter-terror-v2" title="Download Elite Counter-Terror v2.06 - Mod DB" target="_blank"><img src="https://button.moddb.com/download/medium/242254.png" alt="Elite Counter-Terror v2.06" /></a>
 <!-- Link to ECT Docs Home when it's ready -->
- View the [readme](ECT/ECT_readme.md)  
- View the [change-log](ECT/ECT_Changelog.md)
- Watch gameplay [videos](https://www.youtube.com/@ac11b63)  

 <!-- Add Table of Contents here -->

# Table of Contents
- [1.0 Guides](#guides)
   - [1.1 The Unofficial Ravenshield IDE](Guides/Ravenshield_IDE_Guide.md)
   - [1.2 File Type Overview](Guides/Ravenshield_File_Types.md)
   - [1.3 File Import and Export](Guides/Import_Export_Guide.md) 
   - [1.4 Testing and Debugging](Guides/Debugging.md) 
   - [1.5 Importing new textures](Guides/RetextureGuide.md) 
   - [1.6 Increase enemy count in Custom Missions](Guides/IncreaseEnemyCount.md)
   - [1.7 Editing Enemy and Hostage Template Files](Guides/TemplateEditing.md)
   - [1.8 Restore Ferry Boat map](Guides/MP_Multi2.ini)  
- [2.0 Developer Resources](#development-tools)
   - [2.1 Compile Classes with Powershell](Tools/Ravenshield-CompileMove.ps1)
   - [2.1 Move Sound Files](Tools/Move-SoundFiles.ps1)
   - [2.3 Enable EAX](Tools/SetRegistryEAX.ps1)
   - [2.4 ]
- [3.0 Templates](#templates)
   - [3.1 Custom Actor](Templates/CustomActor.uc)
   - [3.2 Custom AI](Templates/CustomAI.uc)
   - [3.3 Enemy Template file](Templates/EnemyTemplateFile.tpt)
   - [3.4 Hostage Template file](Templates/HostageTemplateFile.tph)
   - [3.5 Markdown Readme Template](Templates/MarkdownReadme.md)
- [4.0 Elite Counter-Terror](#elite-counter-terror)
  - [4.1 Readme](ECT/ECT_readme.md) 
  - [4.2 Change-log](ECT/ECT_Changelog.md) 
  <!-- Add more as you expand the documentation for ECT ---> 

## Guides

### These guides can help you learn the Ravenshield modding environment

- [Ravenshield IDE Set-up](Guides/Ravenshield_IDE_Guide.md)  
My Ravenshield IDE (Integrated Development Environment) guide will help you take advantage of modern tools to create an automated pipeline for your mods from a single interface, just like the latest versions of Unreal. 
- [Ravenshield File Type Overview](Guides/Ravenshield_File_Types.md)  
A run-down of the several different file extensions seen in the game and modding directory.  
- [File Import and Export Guide](Guides/Import_Export_Guide.md)  
Images, audio, and mesh objects all have to be formatted correctly to allow importing them, this guide will show you all you need for each asset type. 
- [Testing and Debugging Guide](Guides/Debugging.md)  
Establishing a system for testing and debugging is critical for a successful mod, in this guide I share the techniques I developed in my own environment using Notepad++ and simple Regular Expressions.  
- [Importing new textures](Guides/RetextureGuide.md)  
My Re-texture Guide to import custom textures into the game.
- [Increase enemy count in Custom Missions](Guides/IncreaseEnemyCount.md)  
I created this guide to modify an internal setting  and unlock the enemy count past 35 in custom missions. 
- [Edit Template Files to change Enemies and Hostages](Guides/TemplateEditing.md)  
I created this guide to help players change the enemy presets for any map to experiment with different and more challenging terrorist combinations, also applies to hostages. 
- [Restore Ferry Boat map](Guides/MP_Multi2.ini)  
Copy the file `MP_Multi2.ini` to `mods/athenasword/maps/`, the Ferry Boat map will now show up in the custom mission map list.

## Development tools  

### These scripts were created to turbo-charge mod development and reduce errors

- [Compile and Move new code classes](Tools/Ravenshield-CompileMove.ps1)  
Powershell script that works with the batch file in the repo to automate the process of compiling a new class, renaming it, moving to the right folder, and starting the game. After many hours doing this manually I can say it will save you a lot of time and pain if you want to start developing new classes. This will also ensure you don't make errors during this tedious process. Open the .ps1 and .bat files enter your project name into both files to configure properly. More info [here](Guides/Ravenshield_IDE_Guide.md#set-up-automation-pipeline)
- [Move Sound Files](Tools/Move-SoundFiles.ps1)  
Powershell script to copy audio files from the Athena Sword/Iron Wrath directories into the main directory. This solves a major vanilla bug that left all AS/IW weapons and maps with missing audio. The old solution was to download the ALLr6 sound patch but if you want to avoid downloading 1 GB+ of files you can just move the existing files. Once they are in the Ravenshield sounds folder, they don't need to be anywhere else. This step is highly encouraged to get the full experience! You most likely have to run the script from an elevated shell for it to work.
- [Enable EAX](Tools/SetRegistryEAX.ps1)  
Powershell script to quickly get EAX audio enabled in the game which will give a noticeable upgrade to audio, it is a work in progress. You have to run the script from an elevated shell and enter your Ravenshield path in the script for it to work. [Source](https://www.pcgamingwiki.com/wiki/Tom_Clancy%27s_Rainbow_Six_3:_Raven_Shield#Restore_3D_audio_and_EAX)
- [Bulk export textures and upscale](Tools/RvSBulkImageConvert.ps1)  
In Progress: A Powershell script that can export all textures from the game in bulk, convert to png, and then run each file through an AI-improvement algorithm called ESRGAN that runs on Python. 
- [Bulk edit Template files](Tools/BulkEdit-TemplateFiles.ps1)  
In Progress: A Powershell script that can process bulk editing of template files for enemy and hostage types. 

## Templates

### These files can be used as starting points for your code, enemy configurations, or documentation

- [Custom Actor](Templates/CustomActor.uc)
- [Custom AI](Templates/CustomAI.uc)
- [Enemy Template file](Templates/EnemyTemplateFile.tpt)
- [Hostage Template file](Templates/HostageTemplateFile.tph)
- [Markdown Readme Template](Templates/MarkdownReadme.md)  
It is standard practice to include a 'readme' text file with your mod, but trying to format simple text becomes unwieldy and gets worse as the file expands. You can go the additional step and create a formatted version and host it, I've also seen others created in HTML. I chose to create mine in Markdown because my change-log expanded too long and it seemed more efficient to keep that in an online version, and Github became the logical choice. I still keep the local version in the download but reduced it to the installation and feature guide only. The ease of formatting with Markdown also allows you to add headers and links to create a nice complement to your mod.