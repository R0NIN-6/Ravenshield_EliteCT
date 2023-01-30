@echo off
echo.
del backup.ini
copy ravenshield.ini backup.ini > nul
copy ravenshield.config ravenshield.ini > nul
REM set /P Xname=Please enter the name of the project to compile: 
REM echo.
fart -q ravenshield.ini RSTSDKSAMPLEPACKAGE <EnterProjectHere>
ucc make
del ravenshield.ini
copy backup.ini ravenshield.ini > nul
move <ProjectName>.u ..\..\