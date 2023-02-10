# Creating a Custom Voice Package - Part 2

## Using Sound Package in UnrealScript classes
This stage is in development
1. Create a VoiceManager Actor class
2. Import audio data at start of file
3. Using tick or timer, check every tick for the position of the appropriate character (who will have the new voice applied) and swap their voices in the respective class. 

## Create a Voice Manager actor class
My design for this mod was to create a package that was not dependant on any other classes and could be easily run on whatever flavor of Rainbow Six 3 is desired. The class will be an invisible actor that lives in the Game-world and has to be  Our class will resemble the following psuedocode
```java
// Load the Unreal Audio asset and create a handle to its data
#exec OBJ LOAD FILE=..\Sounds\CustomVoicePack1.utx Package=CustomVoicePack1
//define class name and base class (actor)
class MyVoiceManager extends actor;

// Declare Global variables and our array
var <R6Rainbow> aOperativeArry; // the array is dynamic aka does not have a set size, it will adjust every time the perspective changes
var const bool bObservorMode; // This boolean is Constant because it will be set at the beginning of the mission and not change

// Define our functions
function BuildArray()
{
   //use a for loop to iterate through all team members with the built in Team arrays, and use that to populate our own array
}
function 
//Called once immediately at the start of the map, we only use it to enable the timer, and set it to repeat every 0.1 seconds
function PostNetBeginPlay()
{
   SetTimer(0.1,true);
}

function Timer()
{
   // all behavior handled here, it should have be broken into phases and use variables to control what gets executed
}
```