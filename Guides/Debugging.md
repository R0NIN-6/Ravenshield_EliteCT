# Debugging and Testing Your Work
This section assumes you have a working mod that compiles and is being loaded properly in-game. However, you notice that something is off or not behaving as you intended in the code. To fix, you will need a system for gathering data in game and getting immediate output. In my rookie days of modding, I would use the `Log` function to write strings to a log file in the system folder. Now, there's nothing wrong with this, it's very reliable from anywhere in your code and can get you valuable data. However, when you search your string in the log file it will be mixed in with 1000's of other lines of internal logs and you will burn yourself out very quickly if you have to exit the game, sift through your logs, and then try to think back what was happening on screen. After taking a break from Ravenshield and spending some time in Unreal Engine 4, I became more savvy at generating on-screen output *while* I had the game running to observe variables and data in real-time. I saw that UE4 has built-in functions to get the PlayerController from any location in the code, and Unreal 2 is actually no different. When I came back to my Elite Counter-Terror code and saw all the log statements spread throughout my code and scrapped it all. I replaced it with on-screen logging and it took my development to a new level. I can now sit back and watch an AI-led team go through rooms, and watch the output from my code that calculates room distances and positions when they initiate a room-clear. When I see something abnormal, I can save screenshots or a video, and then go back to my code and pinpoint it very quickly. 

This is the function that I use to print messages to the screen with a sample string:
```c++
R6PlayerController(GetCanvas().Viewport.Actor).ClientMessage(" This message is from: " $self);
```
Breaking down the above statement:
1. The section within the first parenthesis, `GetCanvas().Viewport.Actor` gets processed first. At a very high-level, it is a built-in function for the engine that returns a reference to the Viewport object, which then gets a reference to it's base actor class.
2. The `actor` object gets *cast* to an `R6PlayerController` type, which matches the Player's PC class. 
3. Now `ClientMessage` function is available to the object with the `dot operator` since it is defined in the Player Controller class. 
4. `ClientMessage` supports formatted strings to print the values of variables, this is invaluable. In my example above, `self` is a reference to the class where the code lives. If you are familiar to C-language or Unreal Engine 4, this is akin to using `this`. 
5. If the code is in a class called MyActor which is derived from the base `actor` class, your message should be:
```
This message is from: MyActor01
```

Repeat this process until the code is as refined as you wish, and then prepare for your next upload. But first, you'll have to remove all those on-screen messages and compile again. This introduces the next dilemna; how can you quickly find all your `ClientMessage` statements in a class that is potentially 1000's of lines, comment them out, but keep them intact so that I can easily find them if I need to go back to debugging? There are many ways one could programmatically do this, but I settled on using Regular Expressions in my search.  

## Searching For Patterns with Regular Expressions (RegEx)
I use Notepad++ for searching through files because as I've mentioned elsewhere the interface is superior to VS Code's built-in searching mechanism. Not only that, it's a nice to have a separation of tools so that I am not trying to do too much from VS Code and potentially making an edit in the wrong location. 
1. Open your `.uc` file in Notepad++ with syntax highlighting on (set language to `java` or `C`), or files if your mod contains multiple classes. Close any other files in this window of Notepad++.
2. Open the search tool, and in the bottom left check `Regular Expression` in the search mode, as seen below.
![Notepad++ Search with Regular Expressions](../Images/NP%2B%2BRegEx.PNG)
3. The value in the search field is:
```
^\s*R6PlayerController\(GetCanvas\(\).Viewport.Actor\).ClientMessage\(
```
- Enter it exactly as shown, every symbol has a purpose in Regular Expression syntax. Breaking down each component:  
    * `^\s*` signifies **zero or more non-whitespace characters** in RegEx. This ensures that the line will be found regardless of how many spaces or indentations lie before the statement. 
    - The string `R6PlayerController\(GetCanvas\(\).Viewport.Actor\).ClientMessage\(` corresponds to the statement in code. The opening and closing Parenthesis symbols have a meaning in RegEx, so just like you do in any code language you must **Escape** that character with a `\` so that is treated literally. 
1. Before any replacing takes place, use this search string or your own and confirm it is finding every line you need by selecting **Find All in Current Document** in the search window. This will output every line that matches in a very convenient pane at the bottom. 

## Find and Replace 

## Reverse the Process

## Project : Automating our Process
### WARNING: This is a very fragile process that can lead to disaster if you are not an advanced Powershell user
As soon as a task becomes repeated and the steps are consistent, it is possible to turn it into a Powershell script. By incorporating RegEx into a script, we can do the same process as above, finding and replacing our Message statements, but can use programming to add a date string into our replace strings so that we can keep a timeline of when these statements are commented or uncommented. By doing this from code and not manually, the strings will have a consistent format and will really pay off in the long run.  
Example:
1. Write 1 script for enabling messages and another corresponding script for disabling. Make sure both have the same format for date strings, such as `MMDDYY`. Don't add time because that would make every string unique and defeat the purpose. 
2. Save a backup copy of any file you intend to edit in a location outside of the SDK environment. Add "backup" and a date string to the file-name if necessary.  
   * Or, of course, build this into the start of your script with just a few lines. See [My Compile Script](../Tools/Ravenshield-CompileMove.ps1) for an example on how to move files to a backup directory. 
3. Add an output of all found lines and confirmation prompt before replacing. You may even add a password for extra protection!
4. Run the disable messaging script, and the replaced statements will have the following syntax (note the coloring)

```java
//***This line was commented out on: <date> ClientMessage("<Message>");
```

1. Fast forward to when the EnableMessage script is needed. Now that my strings have a date in them, and because Powershell created that object, I can use simple searching for dates to find specific lines, or have it scan for all. The best practice is to add parameters to the script so that you can run it either way. 
* Example: The area of code I want to enable messaging for was editing in the last week, and those are the only statements I want to re-enable. I use that as my date span, use RegEx to find `ClientMessage()` statements with that date, and uncomment them. Include a prefix comment block at the start of the line, such as

```java
/*This line was un-commented on: <date> */ ClientMessage("<Message>");
```

The statement after the comment block closes will still be treated as a normal line, and now contains a date string. 