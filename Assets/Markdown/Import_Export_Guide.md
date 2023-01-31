# Importing and Exporting Assets in the Unreal Editor

## Images

* TGA with a Transparency channel
* Resolution is in powers of 2

### Example using GIMP

1. Open an image in GIMP.
2. Save as a GIMP project (`.XCF`) if you plan on doing more editing on this image in the future.
3. Add a transparency channel by selecting **Layer->Transparency->Add Alpha Channel**. 
4. Set the resolution to a value that is a power of 2 (i.e. 1024x1024) by going to Image->Scale Image.
5. Make any edits, add effects/masks before moving on.
6. Save the Project and Select *Export As* when ready. Enter `.TGA` as the File Extension. When prompted, uncheck **RLE Compression** and click OK.
   * Import will fail if RLE Compression is selected. Spaces anywhere in the filepath are not recommended.  
7. Open the Unreal Editor (`Unrealed.exe`) and go the *Texture* tab in the Asset Browser.
8. Select Import, and browse to the file created in step 6.
9. Enter the Package Name, an optional group name, and the name of the sound in the box. 
10. If the Image imported successfully, your new package and texture will be displayed in the tab.
11. Save the Package. If the asset will be used in a new Code Class, save a copy to the `Code Environment/Textures` folder. 



### Importing Texture data in Unrealscript

1. Use the Map Convertor tool to change the new `.UTX` that **is in the Code Environment**, not the game folder. 
2. At the top of your Unrealscript class, add the following macro:
```
#exec OBJ LOAD FILE=..\Textures\<PackageName>.uax PACKAGE=<PackageName>
```
3.  To refererence a texture asset within the package, use the syntax:
```
Texture'<PackageName>.<TextureName>'
```

### Exporting

1. Open the Texture pack from the Texture tab in the Asset Browser
2. Right click on Texture and select Export as TGA.

## Audio

* WAV
* 16-bit PCM Mono
* 44100 hz
  
### Example using Audacity

1. Open an audio file in Audacity.
2. Save as an Audacity Project (`.AUP`) if you plan on doing more editing in the future.
3. If the track is "Stereo", change to Mono by right-clicking on it and selecting "Split Stereo to Mono" and delete the second track. 
4. Make any cuts, add effects/filters before moving on
5. Change the Project Sample rate to **44100 Hz**
6. Export the file as a `.WAV` file type (Export->Export as Wav) and select **16-Bit PCM**. 
   * **IMPORTANT**: Ensure the new file does *not have any spaces* in the name or entire filepath. Spaces in the filepath are known to crash the editor when importing audio.
7. Open the Unreal Editor (`Unrealed.exe`) and go the "Sound" tab in the Asset Browser.
8. Select Import, and browse to the file created in step 5.
9. Enter the Package Name, an optional group name, and the name of the sound in the box. Again, no spaces. The Engine will insert a `Play_` prefix to the sound.
   * If the sound will be heard in a 3D space, check the box for `Space`. I usually do this for all my sounds but there may be a case where it isn't desired.
10. If the audio imported successfully, your new package and sound will be displayed and you can play it from within the Asset Browser.
11. Save the Package. If the asset will be used in a new Code Class, save a copy to the `Code Environment/Sounds` folder. 
* The engine will automatically generate a `.SB0` file that is associated with the `.UAX` file. Do not move or modify this file. 

### Importing Audio data in Unrealscript

1. Use the Map Convertor tool to change the new `.UAX` that **is in the Code Environment**, not the game folder. 
2. At the top of your Unrealscript class, add the following macro:
```
#exec OBJ LOAD FILE=..\Sounds\<PackageName>.uax PACKAGE=<PackageName>
```
3.  To refererence a sound asset within the package, use the syntax:
```
Sound'<PackageName>.<TrackName>'
```
### Example for multiple Files
See this [guide](CustomVoicePack.md) for an example on how to export multiple files. 
### Exporting

Exporting audio from the Editor does not seem to work. 

## Static Mesh
ASE 