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

:: check if asuka folder exists
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
cd "C:\Users\%USERNAME%\AppData\Local\asuka"
echo ------------------------------------------------------------------
echo    “If you’ve lived long enough, you learn to live with death…”
echo        - Asuka Langley.
echo ------------------------------------------------------------------
echo.
