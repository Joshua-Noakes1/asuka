@echo off
title QADT - Quick App Launcher V1
color f5
mkdir C:\Azgard\
cd C:\Azgard\
goto Menu

:Menu
cd "C:\Azgard\"
cls
echo ------------------------------
echo   QADT - Quick App Launcher
echo ------------------------------
echo.
echo 0 - Download Essentials
echo 1 - Programs
echo.
echo 99 - Exit
echo.
set /P MENU=Type options: 
if %MENU%==0 goto Essentials
if %MENU%==1 goto Prog
if %MENU%==99 exit
goto Menu

:Prog
cd "C:\Azgard\"
cls
echo ------------------------------
echo   QADT - Quick App Launcher
echo ------------------------------
echo.
echo 1 - AnyDesk
echo 2 - Explorer ++
echo 3 - Brave
echo 4 - Brave (With Proxy)
echo 5 - Remote Desktop
echo 6 - Process Hacker
echo 7 - 7Zip
echo 8 - VLC
echo 9 - HFS
echo 10 - Powershell
echo 11 - CMD
echo.
echo 98 - Main Menu
echo 99 - Exit
echo.
set /P PROG=Type options: 
if %PROG%==1 start /d "dl_ess\Misc\" dl_ess\Misc\AnyDesk.exe
if %PROG%==2 start /d "dl_ess\Misc\" dl_ess\Misc\Explorer++.exe
if %PROG%==3 start /d "C:\Azgard" dl_ess\Brave\brave.exe
if %PROG%==4 start /d "C:\Azgard" dl_ess\Brave\brave.exe --proxy-server="http://digital-ocean1.joshuanoakes.co.uk:8080"
if %PROG%==5 start /d "C:\Windows\system32" mstsc.exe
if %PROG%==6 start /d "dl_ess\ProcessHacker64\" dl_ess\ProcessHacker64\ProcessHacker.exe
if %PROG%==7 start /d "dl_ess\7Zip\" dl_ess\7Zip\7zFM.exe
if %PROG%==8 start /d "dl_ess\VLC\" dl_ess\VLC\vlc.exe
if %PROG%==9 start /d "dl_ess\Misc\" dl_ess\Misc\hfs.exe
if %PROG%==10 start /d "C:\Azgard" powershell.exe
if %PROG%==11 start /d "C:\Azgard" dl_ess\Misc\CMD.bat
if %PROG%==98 goto Menu
if %PROG%==99 exit
goto Prog

:Essentials
cls
echo Downloading
powershell -command "iwr -outf dl_ess.zip https://cdn.joshuanoakes.co.uk/cdn/dl/dl_ess.zip"
echo Download complete 
powershell -command "Expand-Archive 'dl_ess.zip' 'dl_ess\'"
del dl_ess.zip
goto Menu