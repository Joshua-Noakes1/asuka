@echo off
title QADT - Quick And Dirty Tool
color f5

mkdir C:\Azgard
cd C:\Azgard
echo Downloading
powershell -command "iwr -outf dl_ess.zip https://cdn.joshuanoakes.co.uk/cdn/dl/dl_ess.zip"
echo Download complete 
powershell -command "Expand-Archive 'dl_ess.zip' 'dl_ess\'"
del dl_ess.zip

:Menu
cls
echo ------------------------------
echo QADT - Quick And Dirty Tool
echo ------------------------------
echo.
echo 1 - Software
echo 2 - Setup Workspace 
echo 99 - Exit
echo.
set /P MENU=Type options: 
if %MENU%==1 goto program
if %MENU%==2 goto setwork
if %MENU%==99 exit
goto Menu

:program
cls
echo ------------------------------
echo QADT - Quick And Dirty Tool
echo ------------------------------
echo.
echo 1 - Anydesk
echo 99 - Exit
echo.
set /P PROGRAM=Type options: 
if %PROGRAM%==1 start dl-ess/software/anydesk.exe
if %PROGRAM%==99 exit

:setwork
cls
echo Configuring Workspace
mkdir Save
