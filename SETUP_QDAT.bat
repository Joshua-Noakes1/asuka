@echo off
title QADT - Quick App Launcher Setup
color f5
cls

echo Configuring...
mkdir C:\Azgard
move dl_ess.tx C:\Azgard\dl_ess.zip
powershell -command "Expand-Archive 'C:\Azgard\dl_ess.zip' 'C:\Azgard\'"
move QDAT.tx QDAT.bat
start /d "C:\Azgard" QDAT.bat
exit