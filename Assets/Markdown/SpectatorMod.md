# Creating a Spectator Controls Mod
The motivation for creating this mod was to enhance the Spectator (Observer) game mode, which even in the vanilla state is one of the golden features of this game. As a First-person shooter game in 2023, there are certain elements that may feel outdated but in Spectator you get to see the squad AI take the lead. The specific design goals are:

1. Create better viewpoints for the mode, add a zoom feature, and enable night-vision.
2. Enable the Halt/Regroup command for the current team only (by default, only the 'All Teams Hold/Move' works in this mode).
3. Make the mode more useful for testing other mods and mission plans by adding controls for the Game speed, so that you can rapidly get to a certain point in your plan. It also improves the 'route' console command, which shows the AI's path and destination.

This guide will cover the development of the mod For the mod documentation and download link, visit this [page](../ECT/ECT_Spectator.md)
## How to Mod 
All the code for the Spectator mode is handled in a state within the `R6PlayerController` class, the main controller for all human-initiated functions. In the standard First-Person action mode, the PC controls everything from shooting to moving, and in spectator mode it does the same for the available key commands. This made customizing the mode far more simple than most mods because all the functions are defined within the scope of the state. It also makes integration into other mods very convenient, if one is already developing their own custom player controller class they can simply add the new `CameraPlayer` state code, and it will not impact the rest of the class or anything related to FPS mode. For this guide's sake, we will be building strictly for a vanilla version with no other mods. In a future guide I'll cover how I intregated into Elite Counter Terror.

## Create a New Player Controller Class
Our class will resemble the following psuedocode
```java
class SpectatorPC extends R6PlayerController;
//define variables at the class level, you cannot define them at the state level

state CameraPlayer
{
    //define functions and executable functions that will be mapped to keys

    //Edit existing code where needed
    simulated function BeginState()
    {
        // .....
    }
    simulated function EndState()
    {
        // .....
    }
    /* 
    .
    .
    .
    */
}

//Set default values, if needed
defaultproperties
{
    // ...
}
```