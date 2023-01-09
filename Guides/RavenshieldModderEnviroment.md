# The Unofficial Ravenshield Modder's Integrated Development Environment 
## Tools:
- Twi's SDK: Sets up the compiler and code folder structure with a command-line interface. My favorite part of the SDK is the ability to "strip" the source code and comments from your package, which helps protect your code and greatly reduces file sizes.
- Visual Studio Code: Set up a workspace for your project and use the Unreal Script extension by Eliot van Uytfanghe to get text highlighting and intellisense-like assistance. It's not perfect but worth using.
- Notepad++: Use for searching within files. An important part of compiling new classes is knowing the inheritance of the object and how it is referenced. 
- Unreal Editor: Found in the 'system' folder of the Ravenshield main folder.
- Map Convertor: Tool used to change the version of new assets, a critical step in importing them into the game. 
- Github Desktop: Optional for setting up a repository to protect your code. 
- Everything: A powerful searching tool, helpful for managing multiple game installs and projects.

## Set up Ravenshield SDK
- Extract the files to any location on your machine.
- Locate the file `SDKtoolbelt.bat` and right click->create a shortcut on the desktop or wherever is convenient. 
- Run the tool, it should be a command-line prompt with a blue background. Type `new` and enter the name of your project when prompted.
- Close the toolbelt, navigate to the `Code Enviroment` folder and find your new project folder. For any future projects, you can simply copy and paste this folder and rename it.
- Your new `.uc` code files will go in the `classes` folder within your project folder. 

## Set up Workspace in Visual Studio Code
1. Go to `File->Add folder to Workspace` and first add the `1.56 Source Code` folder from the SDK.
2. Visual Studio Code should prompt you in the bottom right-corner to install the Unreal extension as soon as it detects a .uc file type. Agree to install, the extension or install it [manually](https://marketplace.visualstudio.com/items?itemName=EliotVU.uc).
3. Go back to `File->Add folder to Workspace` and now add the folder for the project you created in the previous section. Now you can view or edit your classes, or create new ones.
4. Save this workspace by going to `File->Save Workspace As` and save the workspace file to any location. You can now open it in future sessions (if it doesn't open automatically) by going to `File->Open workspace from file`.
5. The extension works by indexing the source code folder, and using that as a library for you when you create new classes. 
- For example, if you create a new AI class the extension will give you *intellisense-like* prediction assistance with the dot operator, and will give you an error cue if you try to use an object that is not available to that class. 
- The error messaging from the extension is far from perfect so always try to compile first from the SDK and always go by the error from the SDK output. The compiler error messaging on the other hand is surprisingly very accurate, it will almost always point you exactly to the code that needs fixing. The extension is just there for guidance and has no effect whatsoever on the compiler.

## Set up automation Pipeline
* This section assumes you have a project already set up that compiles successfully. This will help you set up an automated system for compiling, stripping
1. Locate the [Ravenshield-CompileMove](Tools/../../Tools/Ravenshield-CompileMove.ps1) Powershell file in this repo.
   - Edit all variables to match your system path and project name
2. Locate the batch file