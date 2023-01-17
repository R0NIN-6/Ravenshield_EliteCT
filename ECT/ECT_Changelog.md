# **Change Log**

### Version 2.07 Update (1/17/2022)
- This update took a thorough review of all room-clearing code and features many more improvements.
  - All the room calculations are done by the first member entering a room, and the next member in simply goes off what the person in front does, and so on down the line. This makes the new system more adaptable to differing room layouts and door positions.
    - Example: If the first member goes right, the second checks left but there is more space to go straight, but not very far due to the layout. The 3rd member's only option is to the same direction as the first member if there is space, but only halfway there. The 4th and last member (in the case of a full AI-led team) will not enter because that would put potential put them in the fatal funnel. The 4th member only enters in favorable rooms that have space to both directions.  
    - This is based on the *US Army Infantry Rifle Platoon and Squad* (FM 3-21.8) technique for Entering and Clearing a room, I am working on a diagram for this to add to the guide section. 
  - The animation for opening doors is now slightly faster for medium and light pawns. I am working on an improved system that is based on a combination of factors: operative's assault skill, whether they are carrying a primary or secondary, and the armor-level
- Tested and refined by observing AI-led teams in Spectator mode on as many maps as possible. The priority is to ensure they never get stuck or de-synchronized in a room-clear. This will be a continuous effort.

### Version 2.062 Patch (1/12/2022)
- I fixed the repeating "Reloading" verbal cue for AI teammates carrying Pump Shotguns. Previously, when an AI teammate was carrying a pump shotgun and reloading, they would repeat the "weapons dry/reloading" with each loaded shell. They will now only call it out at the start of reloading, and if there are enemies around they may not say it all.
- AI-led teams were leaving their NVGs on during the day if they stepped into a dark shadow. To workaround this, I programmed the AI to check the mission time from the localization file at the start of the map, and use that to determine if it is daytime. If it is daytime, they will not use NVGs at all until I found a way to dynamically check for shadows. If it is night or pre-dawn (Before 0700 or after 1900), they will check at the beginning of a new patrol route and if they are in very low light, they'll swith them on and then switch them back on in light. I tested it on the Nuke Reactor map and it works as intended, they turned them on when they went into the pitch-black tunnel and then back off when they came into a lightened area. I will continue to refine it as I test on maps with a contrast of light and dark areas. The map must have a "date/time" string in the localization file.
### Version 2.061 Patch (1/9/2022)
- A change to enemy surrendering I re-introduced in 2.05 seems to have caused enemies to die suddenly when you send the AI to arrest them. Until I fix this and take a thorough look at the process, I'll leave the terrorist AI to vanilla. This was only on the Supply Drops version.
- Also on the SD version, the 'frag and move' order for your team seems to have disappeared, most likely because Supply Drops uses a custom class to replace the Vanilla frag class with a new mesh and explosion effects. Again, I've disabled this change until a permanent solution is found.
- The readme in the download has been reduced and this online readme has been created using markdown to format text. This changelog will be kept in the online version only.
### Version 2.06 Update (1/8/2022)
- Made an improvement to my communication code and eliminated the need for the additional sound package. The other benefit to the new system is the female voices for any additional voice commands like "reloading" and the new "Move" command for the Fast Move are automatically applied.
- Updated my code to make the Fast Move always reliable.
- Added a different move voice command for Fast Move, it is a more aggressive tone.
- Added a 5-second delay for AI entering a room for Gas/Smoke grenade orders, this was based on a discussion with another player on Discord and I agreed it would be a good addition. A potential upgrade would be to make the delay dynamic based on the size of the room and the time for the gas/smoke to engulf it. 
### Version 2.05 Update (12/30/2022)
- Updated the vanilla Rainbow AI version to be on par with the SD version (no laser support, no terrorist changes yet)
- Room clearing updated across the board and improved from v1, no more crouch-clearing 
- AI teams will now turn on their night vision when they are in low-light, and turn them off when back in light. After struggling through the snowy night airport custom map, I realized the AI teams were probably not seeing well because they aren't programmed to handle darkness and turn on NVGs. So I added a little check anytime the AI team enters their patrolling state. If they enter a well-lit area, they will turn them off. There aren't a lot of really dark maps to test this on so I will be making my own night version of maps. 
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
- I made changes to the folder structure that broke almost all features in my old code and started fresh. This was done to make the mod more like Twi's Supply Drop which is installed as a self-contained folder and thus does not put anything into the main directory. I still included a version that you can install onto a vanilla copy but as mentioned above you need OpenRVS 1.3 at a minimum. The Supply Drop version will be the same in terms of features but I had to compile it differently therefore it required a separate version and much more testing.