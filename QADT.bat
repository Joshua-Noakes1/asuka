@echo off
title QADT - Quick And Dirty Tool
color f5

mkdir C:\QADT
cd C:\QADT

:Menu
cls
echo ------------------------------
echo QADT - Quick And Dirty Tool
echo ------------------------------
echo.
echo 1 - Download Essentials
echo 2 - Setup Workspace 
echo 99 - Exit
echo.
set /P MENU=Type options: 
if %MENU%==1 goto dless
if %MENU%==2 goto setwork
if %MENU%==99 exit
goto Menu

:dless
cls
echo Downloading
powershell -command "iwr -outf dl_ess.zip https://cdn.joshuanoakes.co.uk/cdn/dl/dl_ess.zip"
echo Download complete 
powershell -command "Expand-Archive 'dl_ess.zip' 'dl_ess\'"
del dl_ess.zip
goto Menu

:setwork
cls
echo Configuring Workspace
mkdir Save
