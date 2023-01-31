# Creating a Custom Voice Package
If Rainbow Six 3 has a flaw, it's the fact that all male and female operatives use the same voice. The team is supposed to be international and has an extremely diverse cast of operatives, so it's a little disappointing when they all sound alike. It also hurts you tactically because you don't have awareness on who in your team is talking. Several years ago, an individual reached out to me and shared some lines he recorded himself and I actually got them working in-game. We have continued to collaborate on the project and almost have an entire voice package complete, when we are ready we will release it as an add-on for ECT. This guide will use an entirely different approach to create a new voice pack and focus more on the editing and programming stages. I will use [Murf AI](https://murf.ai/), a ***text-to-speech*** generation tool that has limitless potential. With the completed voice pack, I'll go over the next steps I used to get them working as a dynamic voice pack that adjusts based on the position of the character in the team. Rainbow Six 3 has a very advanced communication system, and every order is followed up with a response from next member in the rank. For example, if the voice pack is for a European female operative, it should apply the correct voice based on whether she is the Player-controlled Team Leader, an AI-Led Team Leader, or the second member in the player's team that carries out the player's commands such as "move out" and "open the door". Also, the audio has to match the vanilla radio chatter with a distortion effect and a radio *break* sound at the start of the audio.

## Create Lines in Murf AI
1. Choose an AI voice based on the accent, nationality, and gender.
2. Open the Vanilla Voice packages in the Unreal Editor, and create a corresponding line for each in the Murf editor. Make sure to include all variations for Green, Red, Gold teams. 
   1. These are the files containing Rainbow voices:
   2. I will create a template file soon with all the lines to expedite. 
3. Adjust the pitch/tone of individual lines as you see fit.
4. Export the audio (requires a premium subscription)

## Create Radio Break Prefix
Each time a line comes over the radio in the game, there a quick "break" sound before the voice. Here is a quick method I used to create one to easily insert it into the new sounds.
1. Open any Rainbow voice asset in the Unreal Editor, and use an audio recording tool of your choice to capture that sound. 
2. Open the audio in Audacity and make trims as needed, it should only be about 0.3 seconds in total. 
3. Amplify the sound if needed by going to **Effects->Volume and Compression->Amplify**. For me, a value less than 10 DB was fine and anything over was too much.
4. Export as a file named Prefix so that it can be used again, but keep this window open to make the next step easier.  

## Format Audio in Audacity
This section assumes you have created an entire package using Murf or by recording them yourself. The goal in this stage will be to format the audio files for Unreal and apply a radio effect to match the originals. There should be around 50 total lines, so doing this one-by-one on each is not practical. This is where one of the great features of Audacity comes into play: **Macros**, formerly known as Chains. This is a sequence of events that you can script together and process effects in bulk on multiple objects. This will also ensure the effects are consistent throughout and no mistakes are made.

1. Gather all your custom lines into a single folder, give the folder a logical name such as "FullList_Raw".
2. Open Audacity, and without opening an audio file go to **Tools->Macro Manager**.
3. Select New, enter a name, and create a Macro that can apply a radio effect on a group of files. Using this video for reference, you'll need a Filter Curve EQ, High-Pass Filter, Distortion, and normalize command. The final command should be Export as Wav else they won't be saved. 
* This is my example with all values shown:
![Audacity Macro Radio Effect](../Assets/Images/AudacityMacroManager.PNG)
* Double click on the Filter Curve EQ command to edit the graph, here's mine:  
![Audacity Filter Curve EQ Graph](../Assets/Images/Audacity_FilterCurveEQ.PNG)
4. At the bottom of the Macro Manager, next to `Apply Macro to:`, select **Files**.
2. Browse to your folder from Step 1, and select ALL the files (drag or `CTRL+A`). Click Ok and watch for the output showing the operation completed on each file.
3. The files are sent to this location by default: **Username\Documents\Audacity\Macro-output**
4. Locate the folder, and move/cut the files to a new folder to avoid possible duplicates in the future. Add a postfix to the new folder name such as "_RadioEdit01" for tracking.  

### Inserting the Radio Pre-fix
It may be possible to integrate this step into a Macro, but I have not discovered the correct commands yet. Instead, I will use a simply copy-paste operation at the start of all tracks.
1. In Audacity, go to **Import->Audio...**, browse to the folder, and select all the newly created files. 
2. Save this as a Project in Audacity to have a checkpoint. Give it a logical name such as "FullList_NotFormatted.aup".
* This will be the restore point if exporting goes wrong, so don't save over this Project, use "save as" and enter a new file-name instead.
3.  Go to your other window of Audacity with the Prefix sound open, and select the wavelength. Then select "Edit->Copy"
4.  Back in your project window, drag the cursor from the **beginning of the first track** straight down  to the last track. In other words, the cursor should be at the **start point of all tracks** but not have any region highlighted. 
* Think of this as doing a **columnar insert** in a text file. If you have a text file with 10 lines and wanted to insert a character at the start of each line at the same time, you would hold `Alt` and drag the cursor down from the start of the first line to the start of the last line. Then, the character(s) you type are inserted at that position and push the lines to the right. This is what we are doing, with audio. 
* Dragging down with a large number of assets can be a problem. Alternatively, use this Macro to automate the process and select all start points (note the Track Count value, any number greater than the number of tracks will work) with no risk of error:
![Audacity Macro to select all track start points](../Assets/Images/AudacityMacro_SelectStartAll.PNG)  
* Select *Project* next to **Apply Macro to:** and the Macro will run on all the tracks open in the project, close the tool.
5. Go to **Edit->Paste** and the Prefix will be inserted to all tracks. 
* To listen to an individual tracks and check it sounds fine, press `CTRL+U` first to mute all tracks and then you can right-click on an individual track, unmute it, and play. 
6. This is a great time to check all the track names match the sound, make it short but descriptive to make the programming part much easier. 
7. Unmute all tracks again before proceeding.
8. Create a new checkpoint by going to **Save Project->Save Project As** and label it so you know these tracks are ready for export. 

### Export All Tracks in Correct Format

1. The first step is to change the sample rate, select all tracks with `CTRL+A` and then select **Tracks->Resample...** from the toolbar.
2. Enter **44100 Hz**  as the new *Sample Rate* and press enter. Verify all tracks are at the new Sample Rate:
![Audacity Track Sample Rates](../Assets/Images/Audacity_SampleRate.PNG)  
3. With all tracks still selected, go to **File->Export->Export Multiple...** to open the dialogue box.
4. Specify a folder location to save the files, set the *Encoding Options* to **Signed 16-Bit PCM** and if desired enter a custom pre-fix for all the filenames or use the default setting of using the track name as the filename. Example:  
![Audacity Export Multiple Tracks](../Assets/Images/Audacity_ExportingFiles.PNG)
5. Click Export and close Audacity, it is now time to move to the **Import** stage in the Unreal Editor.

### Import Audio Files into Unreal Editor
The Editor has a slow, outdated interface that makes it painful to use at times, and in my experience audio has to imported very carefully else you can crash the editor, lose unsaved work, or worst case override a vanilla sound asset. Custom sound packages, unlike other custom assets, have to be in the main Ravenshield folder, so it makes sense to give your packages very clear names to ensure you are not modifying vanilla sound. Take your time here and do it right. 
1. Open the Unreal Editor (`Unrealed.exe`) and go the "Sound" tab in the Asset Browser.
2. Go to **File->Import Sample** and browse to the folder you exported all your sound files in. 
3. Select all with CTRL+A or highlight all. 
4. In the Prompt box, Enter a name for your sound package, and then check the box for `space`. Select `Ok All` to import all the sounds with their respective file name
* This is why it is very important to check the tracks have appropiate names in Audacity, or you can always just rename the files from Window Explorer prior to *Importing*. I do not recommend attempting to rename them within the Sound browser.
5. If importing was successful, the sounds will be listed in the browser in a new sound package.
6. Save the package first in the root sounds folder, and then immediately after in the Code Environment Sounds folder.
7. Play any voice line for preview, and then close the Unreal Editor when ready to move on to the programming stage.

### Using Sound Package in UnrealScript classes
This stage is in development
1. Create a VoiceManager Actor class
2. Import audio data at start of file
3. Using tick or timer, check every tick for the position of the appropriate character (who will have the new voice applied) and swap their voices in the respective class. 