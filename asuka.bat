:: Asuka - https://github.com/joshua-noakes1/asuka
@echo off

:: set environment variables for Asuka
set ASUKA_HOME=C:\Users\%USERNAME%\AppData\Local\asuka
set CURRENT_VERSION=0.0.2
set VERSION=%CURRENT_VERSION%
set POWERSHELL_VERSION=7.2.1
title Asuka - %CURRENT_VERSION%

:: Check for curl at the system level
if not exist "C:\Windows\system32\curl.exe" (
    :: curl is not found exit
    echo "Curl is not installed on this system. Asuka needs curl to run."
    pause
    exit /b 2
)

:: Check if asuka folder exists
if not exist "C:\Users\%USERNAME%\AppData\Local\asuka" (
    mkdir "C:\Users\%USERNAME%\AppData\Local\asuka"
)

:: Check for update
@for /f %%R in ('curl -sSL https://raw.githubusercontent.com/joshua-noakes1/asuka/main/VERSION') do ( Set VERSION=%%R )
if not %CURRENT_VERSION%==%VERSION% (
    echo "Asuka is out of date. Updating to %VERSION%"
    curl -kSL -o "asuka.bat" "https://raw.githubusercontent.com/joshua-noakes1/asuka/main/dist/asuka.png" :: bypass fortiguard
    echo "Asuka has been updated. Please run Asuka again."
    pause
    exit /b 2
) 

:: main menu
:main
cd "C:\Users\%USERNAME%\AppData\Local\asuka"
cls
echo ------------------------------------------------------------------
echo    "If you've lived long enough, you learn to live with death"
echo        - Asuka Langley.
echo ------------------------------------------------------------------
echo:
echo 1. Launch Powershell
echo:
echo 98. Reset Asuka
echo 99. Exit
echo:
set /P CHOICE=Type option: 
if %CHOICE%==1 (
    :: check if powershellv7 is installed - https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/PowerShell-7.2.1-win-x64.zip
    cls

    :: check if powershellv7 is installed
    if not exist "C:\Users\%USERNAME%\AppData\Local\asuka\ps7" (
        mkdir "C:\Users\%USERNAME%\AppData\Local\asuka\ps7"
    )
    if not exist "C:\Users\%USERNAME%\AppData\Local\asuka\ps7\pwsh-auska.exe" (
        echo "Downloading Powershell %POWERSHELL_VERSION%"
        curl -kSL -o "C:\Users\%USERNAME%\AppData\Local\asuka\powershell.zip" "https://github.com/PowerShell/PowerShell/releases/download/v%POWERSHELL_VERSION%/PowerShell-%POWERSHELL_VERSION%-win-x64.zip"
        cls
        echo "Unzipping Powershell %POWERSHELL_VERSION%"
        powershell -command "Expand-Archive -LiteralPath C:\Users\%USERNAME%\AppData\Local\asuka\powershell.zip C:\Users\%USERNAME%\AppData\Local\asuka\ps7 "
        del /f "C:\Users\%USERNAME%\AppData\Local\asuka\powershell.zip"
        move "C:\Users\%USERNAME%\AppData\Local\asuka\ps7\pwsh.exe" "C:\Users\%USERNAME%\AppData\Local\asuka\ps7\pwsh-auska.exe"
        cls
        echo "Powershell %POWERSHELL_VERSION% has been installed"
    )

    :: launch powershell
    start /d "C:\Users\%USERNAME%\AppData\Local\asuka\" C:\Users\%USERNAME%\AppData\Local\asuka\ps7\pwsh-auska.exe
    goto main
)
if %CHOICE%==98 (
    :: kill all instances of Asuka - Nooooo don't turn me into fanta rei, pop- 
    taskkill /f /im "C:\Users\%USERNAME%\AppData\Local\asuka\ps7\pwsh-auska.exe"
    rmdir /s /q "C:\Users\%USERNAME%\AppData\Local\asuka"
    mkdir "C:\Users\%USERNAME%\AppData\Local\asuka"
    goto main
)
if %CHOICE%==99 ( 
    cls
    exit /b 0
)
goto main

:: Utilitiy functions