:: Asuka - https://github.com/joshua-noakes1/asuka
@echo off

:: set environment variables for Asuka
set CURRENT_VERSION=0.0.1

:: Check for curl at the system level
if not exist "C:\Windows\system32\curl.exe" (
    :: curl is not found exit
    echo "Curl is not installed on this system. Asuka needs curl to run."
    exit /b 2
)

:: Check if asuka folder exists
if not exist "C:\Users\%USERNAME%\AppData\Local\asuka" (
    mkdir "C:\Users\%USERNAME%\AppData\Local\asuka"
)

:: Check for update
@for /f %%R in ('curl -s https://raw.githubusercontent.com/joshua-noakes1/asuka/main/VERSION') do ( Set VERSION=%%R )
if not %CURRENT_VERSION%==%VERSION% (
    echo "Asuka is out of date. Updating to %VERSION%"
    curl -s -o asuka.bat https://raw.githubusercontent.com/joshua-noakes1/asuka/main/asuka.png :: bypass fortiguard
    echo "Asuka has been updated. Please run Asuka again."
    exit /b 2
) 

:: main menu
:main
cd "C:\Users\%USERNAME%\AppData\Local\asuka"
cls
echo ------------------------------------------------------------------
echo    “If you’ve lived long enough, you learn to live with death…”
echo        - Asuka Langley.
echo ------------------------------------------------------------------
echo.
echo 1. Launch Powershell
echo.
echo 99. Exit
echo.
set /P CHOICE=Type option: 
if %CHOICE%==1 start /d "C:\Users\%USERNAME%\AppData\Local\asuka\" C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
if %CHOICE%==99 ( 
    cls
    exit /b 0
)
goto main