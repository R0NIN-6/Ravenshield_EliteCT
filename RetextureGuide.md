How to import new textures for an enemy. 

Make sure you have: 
1. Rainbow Six 3 Unreal Editor (Found in your Ravenshield system folder)
2. Map Build Converter(http://www.mediafire.com/file/v7bb0wmaiw825jn/Map+Build+Converter.zip )
3. Twi's SDK2 (http://www.moddb.com/mods/raven-shield-software-development-kit )
4. Image-editing software. I used GIMP, which is free, and everything worked perfectly. If you prefer Photoshop then that works too, just note you'll get like 7 days free and then you'll have to pay from there to keep using. 

steps:
1. Export whatever texture from 'Texture Browser' in UE as .tga image.
2. Edit the photo however you wish, and export to the new NewOperativeFolder as .tga (do not check "RLE" compression if using GIMP, for photoshop I believe you need to select 32-bit.)
3. Back in UE, from TB go to file>new and enter Package name as 'xxx_T' and name whatever you want. (keep track of what your naming in Unreal Editor vs later when we get to the SDK. Use this text file if you need to)
4. You should have a red box that says 'Shader' and name from above, and also '(0x0)'. 
5. Now go to File>import and select your .tga file and click 'ok' in the next menu. You'll see it now next to the red box. 
6. Save IMMEDIATELY, you can leave it in the textures folder. After saving, delete the red box and save again. If you try deleting the red box BEFORE saving you will likely get strange errors and UE will crash. 
7. You can now close UE. Copy the 'xxx_T.utx' file into the 'textures' folder located in the 'code enviroment' in the main SDK2 folder.  
8. Open up the Map Build Converter (its Retard_Maps.exe LOL)
9. Select 'Browse for the File' right next to 'convert', select the file that you just placed in the 'code enviroment'. Click convert, look for success message, and close the program. 
10. Run the SDK2 toolbelt (blue command prompt), type '156' and press enter. This sets the program to version 1.56, which is necessary.
11. Now type 'new' and you'll be prompted to enter a name for your project and the name of it's first class. This names should correspond to the 'package' and 'name' from what you did earlier in UE, but not be the same.
12. Now type 'open' and then enter the project name from the previous step to open the folder. You could also just open the folder from your code enviroment. Either way, you will have a .uc file which you can now open and edit with a text editor.
13. Your source code will depend on the nature of the tango. Look in SourceCode156>R6Characters and then find the .uc for the tango your's is based off. 
14. In the toolbelt, type compile, and when prompted enter the project name. This is the name of the folder that contains the .uc file. Look for the success message, and close the toolbelt.
15. You will now have a .u file in the SDK2 main folder. Rename it to .utx, and then copy it into the textures folder of your actual Ravenshield directory, along with the .utx file you left there in step 6.
16. Now the tango is ready to be added into a map. Open the template folder, and find a map's template file for custom missions ('MP-' followed the name). I use a small map like presidio for this so I can quickly make sure it's working. 
17. Set the number of tangos to 1, set it's percent to 100, and enter your tango. The format is: projectname.firstclass . Save and run the map in Terrorist Hunt and find your tango.

package: Myskin_T
name: R6TParamilitary12MASK

project name: MySkin
1st class: PMmask1

