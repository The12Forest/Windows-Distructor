@echo off
@REM Lösche den Virus
attrib -r "C:\Script"
echo Deleting the Script dir...
rd /s /q "C:\Script"

@REM Lösche den Autostart-Eintrag
echo Deleting the Autostart entry...
del /f "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Scripts\Startup\Microsoft-Teams.bat"

@REM Show hidden files on Desktop
cd /d %USERPROFILE%\Desktop
echo Show hidden files on Desktop...
attrib -h -s /s /d *
attrib +h +s desktop.ini

pause