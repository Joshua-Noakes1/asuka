:: Asuka - https://github.com/joshua-noakes1/asuka
@echo off

:: Environment variables for Asuka
set CURRENT_VERSION=0.0.1
set VERSION=0.0.0
set FILEPATH=%~f0
set UPDATE_URL=https://raw.githubusercontent.com/joshua-noakes1/asuka/master/asuka.bat

:: Check for curl at the system level
if exist "C:\Windows\system32\curl.exe" (
    set CURL_EXISTS=1
    for /F %%I in ('curl -sS https://raw.githubusercontent.com/joshua-noakes1/asuka/master/VERSION') do set VERSION=%%I
    if %CURRENT_VERSION%==%VERSION% (
        echo "Asuka is up to date"
        exit
    ) else (
        echo "Asuka is outdated"
        echo "Downloading update..."
        curl -sS -o %FILEPATH% %UPDATE_URL%
        echo "Update complete, Restarting Asuka..."
        %FILEPATH%
        exit
    )
) else (
    :: curl is not found exit
    set CURL_EXISTS=0
    echo "Curl is not installed on this system. Asuka needs curl to run."
    exit /b 2
)

:: check if asuka folder exists
if exist "C:\Users\%USERNAME%\AppData\Local\asuka" (
    set ASUKA_FOLDER_EXISTS=1
) else (
    set ASUKA_FOLDER_EXISTS=0
    mkdir "C:\Users\%USERNAME%\AppData\Local\asuka"
    set ASUKA_FOLDER_EXISTS=1
)

:: main menu
:main
cd "C:\Users\%USERNAME%\AppData\Local\asuka"
echo ------------------------------------------------------------------
echo    “If you’ve lived long enough, you learn to live with death…”
echo        - Asuka Langley.
echo ------------------------------------------------------------------
echo.

