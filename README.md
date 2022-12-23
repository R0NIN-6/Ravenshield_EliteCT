# Ravenshield_EliteCT
Repository for Unreal script and development tools used for creating Ravenshield mods

Elite Counter-Terror download: https://www.moddb.com/mods/elite-counter-terror

# Guides
1. Powershell script to quickly get EAX audio enabled in the game which will give a noticeable upgrade to audio, it is a work in progress. You have to run the script from an elevated shell and enter your ravenshield path in the script for it to work. (source and how to set-up manually: https://www.pcgamingwiki.com/wiki/Tom_Clancy%27s_Rainbow_Six_3:_Raven_Shield#Restore_3D_audio_and_EAX) 
2. Powershell script to copy audio files from the Athena Sword/Iron Wrath directories into the main directory. This solves a major vanilla bug that left all AS/IW weapons and maps with missing audio. The old solution was to download the ALLr6 sound patch but if you want to avoid downloading 1 GB+ of files you can just move the existing files. Once they are in the Ravenshield sounds folder, they don't need to be anywhere else. This step is highly encouraged because I will be including the AS/IW weapons in the next update and they sound really nice! You most likely have to run the script from an elevated shell for it to work.
3. Powershell script that works with a batch file to automate the process of compiling a new class, renaming it, moving to the right folder, and starting the game. After many hours doing this manually I can say it will save you alot of time and pain if you want to start developing new classes. Look in the 'Dev Tools' folder and enter your project name into both files. 
4. An .ini file that you can put in your Athena Sword maps folder that will restore the Ferry map in custom missions. Copy the file 'MP_Multi2.ini' to 'mods/athenasword/maps/', the map will now show up in the custom mission map list. 
5. My "Retexture Guide" which you can use to import custom textures into the game. 
