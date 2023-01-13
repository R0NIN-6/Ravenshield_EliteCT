# **Elite Counter-Terror 2.062**

# Rainbow Six 3 Single-Player Mod

by AC11b and the Ravenshield community  
<a href="https://www.moddb.com/mods/elite-counter-terror" title="View Elite Counter-Terror on Mod DB" target="_blank"><img src="https://button.moddb.com/popularity/medium/mods/35509.png" alt="Elite Counter-Terror" /></a>

<span align="center"> <h1>SHOOT-MOVE-COMMUNICATE-KILL</h1> </span>

## **Install Instructions**

ECT contains new code classes and icons. There are 2 ways to install depending on your preference. [^1]

[^1]: If you have ECT 1.27 or prior, I recommend removing it and doing a fresh install of the game. Version 2 and forward will not be compatible due to a new folder structure. 
1. On a **vanilla** install with OpenRVS[^4], Copy the contents of *`StandaloneFiles/VanillaVersion`* into your Ravenshield directory.[^2] 
[^2]: Advanced users may prefer to edit their **`Ravenshield.mod`** file manually, to do so make sure to swap the default AI, pawn, and player controller class as well as add the actor package at the bottom. Refer to my **`.mod`** file to see the correct naming convention.

* This version will see fewer updates because the majority of development is spent on the other versions, as of 2.06 it has the same features except for those that are related to other mods, i.e. team using their lasers).  

2. On a Ravenshield copy with the latest **Supply Drops (Oct 2020 + patch 1)** installed, copy the contents of *`StandaloneFiles/SupplyDropsVersion`* files into the Ravenshield directory.[^3] 
* You will see `ECT v2.062 | SD by Twi` in the bottom right corner of the Supply Drop main menu if installed correctly. 

[^3]: If you want to edit your `SupplyDrops.mod` file manually, make sure you swap the default AI, pawn, and player controller class. You do not need to add the actor package at the bottom because it is compiled differently than the vanilla version.  
* To force the game to launch directly into the Supply Drops menu, open the file **`Ravensheild/System/OpenRVS.ini`** and enter `SupplyDrop` for the value of `ForceStartMod`, under the section titled `[OpenRVS.OpenMods]`.  

3. To validate the mod is active while in-game, open the console with the Tilde ``'`'`` key and look for the string :  

```
Elite Counter-Terror v2.062 initialized | Missiontime is : <In-game mission Time>
```

[^4]: The only requirement is _OpenRVS 1.5_ by Twi regardless of the version you use.  

## ECT Rainbow AI features

- Based off Jose21Crisis's Rainbow AI Enhancer V2 (which is itself an upgrade of Malleus AI). The improved team FOV, single-shot firing, and team NVG animations in those mods are present here as well.  
- Overhauls **Rules of Engagement**
  - AI will not engage with unsilenced weapons when not in assault mode and if in infiltrate they will switch to silenced secondary weapons.  
  - Example: You have 2 teams, and the rear member in each formation carries a unsilenced shotgun and a silenced pistol. When the team is in infiltrate, the rear member will switch to secondary and engage freely. When the team switches to assault, the rear member will switch back to the unsilenced primary and engage targets. This works for both when ROE is switched by the player or it is set from the mission plan.  
- **Radio Silence**: Disables all verbal communication for your team, meant to simulate extreme stealth situations. Using with NVGs and IR lasers is highly recommended for the ultimate tactical edge! Can be switched on/off and is agnostic of ROE. In v1 this was tied to ROE but I disabled that after feedback. Team will always use hand-signals in infiltrate or recon.
	- To enable this optional feature, open your 'User.ini' file (located in Ravenshield\Save\Profiles) and add the value `ToggleRadioSilence` to any unassigned key UNDER the section `[Engine.Input]`. This key will now toggle silence on/off. Currently still in testing and it gets reset whenever the active player dies and switches to another member, or when a flash-bang goes off.
- Overhauls **room clearing**
  - The first 2 members into a room will attack the opposite corners and then shift their sights on the center room, and the remaining members will file into the room. When in infiltrate and recon team will crouch run into position, to avoid letting anyone on the other side hear them approaching.  
- When your team moves out, there will be a ripple effect so that the rear team-member in the formation can hold their position for a split second longer then the previous men to avoid colliding and keep each other covered.  
- Overhauls **team speed** and stance for when they are given an order to move out, throw a grenade, or interact with an object (see guide below)
- Fast move order from your team, when holding shift you'll see "fast move" icon and your teammates will sprint (or crouch run) to the target location instead of walking (works even if the target location is out of sight). The Player's tone in the command is also different from the normal move command.  
- Teammates give verbal cue when they are reloading (sometimes "weapons dry" and other times "reloading")
- AI teams will now turn on their night vision when they are in low-light, and turn them off when back in light. This is influenced by the local time in the mission and they will not use NVGs on day-time maps.  

## Rules of Engagement (RoE) guide

| RoE | Violence of Action | Movement|
| ----------- | ----------- |----------- |
| _Assault_ | Engage all targets on sight, and will switch to loud primary weapon if carrying secondary  |Walking-standing by default, sprint with fast-move modifier|
| _Infiltrate_ | Engage all targets on sight, but only if weapon is silenced. If primary is not silenced, they will switch to secondary if that is silenced |Crouch-walking by default, crouch-run with fast-move modifier|
| _Recon_ | Team will not engage unless fired upon  |Crouch-walking by default, crouch-run with fast-move modifier|

## Movement for AI-Led Teams

* Speed and RoE for AI-led teams is set in the mission planning mode. Right-click on the symbol in-between waypoints to change.  

|  | Assault |Infiltrate |Recon|
| ----------- | ----------- |----------- |----------- |
| **Blitz** | Sprint |Crouch-run|Crouch-run|
| **Normal** | Walk |crouch-walk|crouch-walk|
| **Cautious** | Crouch-run |crouch-walk|crouch-walk|

## Tested for compatibility with the following Mods **ONLY**

1. Jo92's WeaponPack : Recommended if you want the laser feature for the AI
2. Twi's Realistic Smoke mod : Recommended for realism and visuals
3. Jugulator's Goggle HUD v3 : Recommended for immersion and is very subtle, you'll barely notice it.  
   * How to switch on Goggles HUD on Supply Drops:
   	1. Add the texture file to the `mods/SupplyDrop/assets/` folder 
   	2. type `overlay GHUD_t.GG` into the console.
   	3. To enable the NVG overlay, type `nvgoverlay GHUD_T.nvg`
   	4. Type `overlay` or `nvgoverlay` to remove.
4. Any Rainbow equipment pack, all of Apkin's releases are recommended  

* Playing with any other mods is not tested or recommended

## Contact

|  |  |
| ----------- | ----------- |
| _Discord_ | Send feedback/bugs to `ac11b#9459` and join the [ECT Server](https://discord.gg/EsXJdzu2) for updates |
| _Youtube_ | Watch ECT in [action](https://www.youtube.com/@ac11b63) with other great user-made content on a series of my favorite maps |
| _Github_ | I host this readme plus a collection of development resources on my [repository](https://github.com/R0NIN-6/Ravenshield_EliteCT) |

## Change Log

* moved to a separate [document](ECT_Changelog.md)

## Footnotes
