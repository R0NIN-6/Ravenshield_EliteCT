@echo off
echo.
Set /P Xname=Please enter the name of the project to strip (including extension): 
echo.
move ..\..\%Xname% ..\System
ucc editor.stripsourcecommandlet %Xname%
move %Xname% ..\..\