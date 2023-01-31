//A template file for creating a custom actor class, and getting a reference to the player controller in game
class CustomActor extends actor;
//define variables
var R6PlayerController aR6PC;

//define functions

//This is called when the mission mode starts
function PostNetBeginPlay()
{
    //Use GetCanvas().Viewport.Actor and cast it to R6PlayerController to always get a reference to your main Player Controller class
    aR6PC=R6PlayerController(GetCanvas().Viewport.Actor);
    //Use ClientMessage to print text to the screen, this is invaluable for testing and creating mods
    aR6PC.ClientMessage("From CustomAI class | Player Object: "$aR6PC);

}

//set default properties
defaultproperties
{
}