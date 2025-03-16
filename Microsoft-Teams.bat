@echo off
@REM powershell -Command "C:\Script\script.ps1"
start /B powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Script\first-run.ps1"
start /B powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Script\script.ps1"
