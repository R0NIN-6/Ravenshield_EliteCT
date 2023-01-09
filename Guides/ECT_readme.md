# **Elite Counter-Terror 2.06**
## Rainbow Six 3 Single-Player Mod
by AC11b and the community  
[Gameplay videos](https://www.youtube.com/@ac11b63)  

<a href="https://www.moddb.com/mods/elite-counter-terror" title="View Elite Counter-Terror on Mod DB" target="_blank"><img src="https://button.moddb.com/popularity/medium/mods/35509.png" alt="Elite Counter-Terror" /></a>

>                                                SHOOT-MOVE-COMMUNICATE-KILL 

## **Stand-alone Install instructions**
ECT contains new code classes and icons. There are 2 ways to install depending on your preference
- If you have ECT 1.27 or prior, I recommend removing it and doing a fresh install of the game. Version 2 and forward will not be compatible due to a new folder structure. 
1. On a **vanilla** install, Copy the contents of "StandaloneFiles/VanillaVersion" into your Ravenshield directory. 
	- Advanced users may prefer to edit their Ravenshield.mod file manually, to do so make sure to swap the default AI, pawn, and player controller class as well as add the actor package at the bottom.
	- This version will see fewer updates because the majority of development is spent on the other versions, as of 2.06 it has the same features excpet for those that are related to other mods, i.e. team using their lasers)	
2. On a Ravenshield copy with the latest **Supply Drops (Oct 2020 - patch 1)** installed, copy the contents of "StandaloneFiles/SupplyDropsVersion" files into the Ravenshield/directory. 
    - You will see "ECT v2.x | SD by Twi" in the bottom right corner of the main menu if installed correctly. 
	- I try to avoid putting anyting in the main directory but custom sound packs only work if they are there. 
	- If you want to edit your SupplyDrops.mod file manually, make sure you swap the default AI, pawn, and player controller class. You do not need to add the actor package at the bottom because it is compiled differently.  
### *The only requirement is OpenRVS 1.5 regardless of the version you use*  
# ECT Rainbow AI features: 
- Based off Jose21Crisis's Rainbow AI Enhancer V2 (which is itself an upgrade of Malleus AI). The improved team FOV, single-shot firing, and team NVG animations in those mods are present here as well. 
- Overhauls Rules of Engagement: AI will not engage with unsilenced weapons when not in assault mode and if in infiltrate they will switch to silenced secondary weapons.  
Example: You have 2 teams, and the rear member in each formation carries a unsilenced shotgun and a silenced pistol. When the team is in infiltrate, the rear member will switch to secondary and engage freely. When the team switches to assault, the rear member will switch back to the unsilenced primary and engage targets. This works for both when ROE is switched by the player or it is set from the mission plan. 
- Radio Silence: Disables all verbal communication for your team, meant to simulate extreme stealth situations. Using with NVGs and IR lasers is highly recommended for the ultimate tactical edge! Can be switched on/off and is agnostic of ROE. In v1 this was tied to ROE but I disabled that after feedback. Team will always use hand-signals in infil/recon.
	- To enable this optional feature, open your 'User.ini' file (located in Ravenshield\Save\Profiles) and add the value `ToggleRadioSilence` to any unassigned key UNDER the section `[Engine.Input]`. This key will now toggle silence on/off. Currently still in testing and it gets reset whenever the active player dies and switches to another member, or when a flash-bang goes off.
- Overhauls room clearing and breaching: The first 2 members into a room will attack the opposite corners and then shift their sights on the center room, and the remaining members will file into the room. When in infiltrate and recon team will crouch run into position, to avoid letting anyone on the other side hear them approaching. 
- When your team moves out, there will be a ripple effect so that the rear team-member in the formation can hold their position for a split second longer then the previous men to avoid colliding and keep each other covered. 
- Overhauls team speed and stance for when they are given an order to move out, throw a grenade, or interact with an object (see guide below)
- Fast move order from your team, when holding shift you'll see "fast move" icon and your teammates will sprint (or crouch run) to the target location instead of walking (works even if the target location is out of sight). The Player's tone in the command is also different from the normal move command. 
- Teammates give verbal cue when they are reloading (sometimes "weapons dry" and other times "reloading")
- AI teams will now turn on their night vision when they are in low-light, and turn them off when back in light. 
 
## Rules of Engagement (RoE) guide:
### **Assault**
- Violence of action - Engage all targets on sight, and will switch to loud primary weapon if carrying secondary 
Movement - Walking-standing by default, sprint with fast-move modifier
- Speed/Stance for AI teams between waypoints
	- Blitz: Sprint
	- Normal: Walk 
	- Cautious: crouch-run
### **Infilitrate**
- Violence of action - Engage all targets on sight, but only if weapon is silenced. If primary is not silenced, they will switch to secondary if that is silenced
Movement - Crouch-walking by default, crouch-run with fast-move modifier
- Speed/Stance for AI teams between waypoints
	- Blitz: Walk
	- Normal: crouch-run 
	- Cautious: crouch-run
### **Recon**
- Violence of action - Team will not engage unless fired upon 
Movement - Crouch-walking by default, crouch-run with fast-move modifier
- Speed/Stance for AI teams between waypoints
	- Blitz: Walk
	- Normal: crouch-run 
	- Cautious: crouch-run  
## Tested for compatibility with:
1. Jo92's WeaponPack and HQ Quality weapon sounds (Recommended if you want the laser feature for the AI)
2. Twi's Realistic Smoke mod (Recommended for realism and visuals)
3. Jugulator's Goggle HUD v3 (Recommended for immersion and is very subtle, you'll barely notice it)
	*How to switch on Goggles HUD on Supply Drops:
	1. Add the texture file to the 'mods/EliteCounterTerror/assets/' folder 
	2. type `overlay GHUD_t.GG` into the console.
	3. For the NVG overlay, type `nvgoverlay GHUD_T.nvg`
4. Any rainbow skin pack (All of Apkin's releases are recommended)
## Contact
If you have any suggestions or any questions on compiling/modding please let me know!  
- Youtube: Watch ECT in action(https://www.youtube.com/@ac11b63)
- Discord: ac11b#9459
- Github: I moved my guides and development tools to my [repository](https://github.com/R0NIN-6/Ravenshield_EliteCT) . Learn how to set-up an automated development enviroment for modding and much more!  

## **Change Log**
### Version 2.06 Update (1/8/2022)
- Made an improvement to my communication code and eliminated the need for the additional sound package. The other benefit to the new system is the female voices for any additional voice commands like "reloading" and the new "Move" command for the Fast Move are automatically applied.
- Updated my code to make the Fast Move always reliable.
- Added a different move voice command for Fast Move, it is a more aggressive tone.
- Added a 5-second delay for AI entering a room for Gas/Smoke grenade orders, this was based on a discussion with another player on Discord and I agreed it would be a good addition. A potential upgrade would be to make the delay dynamic based on the size of the room and the time for the gas/smoke to engulf it. 
### Version 2.05 Update (12/30/2022)
- Updated the vanilla Rainbow AI version to be on par with the SD version (no laser support, no terrorist changes yet)
- Room clearing updated across the board and improved from v1, no more crouch-clearing 
- AI teams will now turn on their night vision when they are in low-light, and turn them off when back in light. After struggling through the snowy night airport custom map, I realized the AI teams were probably not seeing well because they aren't programmed to handle darkness and turn on NVGs. So I added a little check anytime the AI team enters their patrolling state. If they enter a well-lit area, they will turn them off. There aren't alot of really dark maps to test this on so I will be making my own night version of maps. 
- New ROE feature: AI will switch to silenced weapons if their primary is not silenced and they are in infiltrate. This works for player and AI teams. 
- AI Grenade Move To command now incorporates ROE to determine stance/speed (i.e. they will crouch-walk to position and throw the grenade still crouched if in infiltrate/recon)
- Re-introduced radio silence, now as an executable function but the user has to manually go to 'user.ini'. It doesn't stay on when you die or when a flash-bang goes off around you. 
- Re-introduced a feature from v1 where terrorists will return to the fight if they surrender but are not secured within 8 seconds and left alone
### Version 2.041 Update (12/23/2022)
- Moved all the supplemental guides, scripts, and code out of the download and into my Github page (link above) and cleaned up readme.
### Version 2.04 Update (12/12/2022)
- Updated Rainbow AI so team will now use the Fast Move even if they can't see the target location
- Added a slight delay for AI turning on lasers after the player to look more realistic
- Enemies can also use lasers if they have compatible weapons 
- Improved enemy chance to detect where they are being shot from
- Updated source code folder
### Version 2.03 Update (12/12/2022)
- Added some code to detect when you have a laser turned on and switches the AI's on, if they have them too. AI team members following the player will only turn them on when you do as I player, while AI teams will turn them on by default if they have them. Next, I am working on giving the team will a tactical boost because of increased awareness of muzzle directions. You'll need Jo92's weapon pack for this, the Supply Drop weapons do not feature lasers. 
- Brought back some of the changes to room clearing, like the AI crouch-walking up to a door when in Infiltrate and Recon.  
### Version 2.02 patch (12/8/2022)
- Fixed the code so that when you have multiple teams you will get the "reloading" voice. 
### Version 2.01 patch (12/7/2022)
- Fixed a SD version bug that was breaking gameplay whenever the player died. 
### Version 2.00 (12/2022)
- I made changes to the folder structure that broke almost all features in my old code and started fresh. This was done to make the mod more like Twi's Supply Drop which is installed as a self-contained folder and thus does not put anything into the main directory. I still included a version that you can install onto a vanilla copy but as mentioned above you need OpenRVS 1.3 at a minimum. The Supply Drop version will be the same in terms of features but I had to compile it differently therefore it required a seperate version and much more testing.

An expansion pack with a collection of ECT+SD+Mercerneraries enemy pack+Updated Template files+other mods/community improvements is in development!