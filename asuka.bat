:: Asuka - https://github.com/joshua-noakes1/asuka
@echo off

:: set environment variables for Asuka
set ASUKA_HOME=C:\Users\%USERNAME%\AppData\Local\asuka
set ASUKA_CURL=%ASUKA_HOME%-curl\bin\curl.exe
set CURRENT_VERSION=0.0.3
set VERSION=%CURRENT_VERSION%
set POWERSHELL_VERSION=7.2.1

title Asuka - %CURRENT_VERSION%

:: Check if asuka folder exists
if not exist "%ASUKA_HOME%" (
    mkdir "%ASUKA_HOME%"
)

:: Check if asuka-curl folder exists
if not exist "%ASUKA_HOME%-curl" (
    mkdir "%ASUKA_HOME%-curl"
)

:: Check for curl
if not exist "%ASUKA_CURL%" (
    :: curl is not found, using powershell to download curl to the user's local directory
    echo "Curl is not installed on this system. Downloading..."
    powershell -command "[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12; [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Joshua-Noakes1/asuka/main/curl/curl.zip', '%ASUKA_HOME%-curl\curl.zip')"
    cls
    echo "Extracting curl..."
    powershell -command "Expand-Archive -LiteralPath '%ASUKA_HOME%-curl\curl.zip' '%ASUKA_HOME%-curl'"
    powershell -command "Remove-Item -Path '%ASUKA_HOME%-curl\curl.zip'"
    cls
    echo "Curl has been installed."
    pause
)

:: Check for update
@for /f %%R in ('curl -skSL https://raw.githubusercontent.com/joshua-noakes1/asuka/main/VERSION') do ( Set VERSION=%%R )
if not %CURRENT_VERSION%==%VERSION% (
    echo "Asuka is out of date. Updating to %VERSION%"
    %ASUKA_CURL% -kSL -o "asuka.bat" "https://raw.githubusercontent.com/joshua-noakes1/asuka/main/dist/asuka.png"
    cls
    echo "Asuka is now running version %VERSION%."
    pause
    start /d "%~dp0" /i asuka.bat
    exit /b 2
) 

:: main menu
:main
cd "%ASUKA_HOME%"
cls
echo ------------------------------------------------------------------
echo    "If you've lived long enough, you learn to live with death"
echo        - Asuka Langley.
echo ------------------------------------------------------------------
echo:
echo 1. Launch Powershell
echo:
echo 97. Kill all Asuka processes
echo 98. Reset Asuka
echo 99. Exit
echo:
set /P CHOICE=Type option: 
if %CHOICE%==1 (
    :: check if powershellv7 is installed - https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/PowerShell-7.2.1-win-x64.zip
    cls

    :: check if powershellv7 is installed
    if not exist "%ASUKA_HOME%\ps7" (
        mkdir "%ASUKA_HOME%\ps7"
    )
    if not exist "%ASUKA_HOME%\ps7\pwsh-auska.exe" (
        echo "Downloading Powershell %POWERSHELL_VERSION%"
        %ASUKA_CURL% -kSL -o "%ASUKA_HOME%\powershell.zip" "https://github.com/PowerShell/PowerShell/releases/download/v%POWERSHELL_VERSION%/PowerShell-%POWERSHELL_VERSION%-win-x64.zip"
        cls
        echo "Extracting Powershell %POWERSHELL_VERSION%"
        powershell -command "Expand-Archive -Force -LiteralPath %ASUKA_HOME%\powershell.zip %ASUKA_HOME%\ps7"
        powershell -command "Remove-Item -Path '%ASUKA_HOME%\powershell.zip'"
        move "%ASUKA_HOME%\ps7\pwsh.exe" "%ASUKA_HOME%\ps7\pwsh-auska.exe"
        cls
        echo "Powershell %POWERSHELL_VERSION% has been installed"
    )

    :: launch powershell
    start /d "%ASUKA_HOME%\" %ASUKA_HOME%\ps7\pwsh-auska.exe
    goto main
)
if %CHOICE%==97 (
    :: kill all instances of asuka - Nooooo don't turn me into fanta rei, pop- 
    taskkill /f /im pwsh-auska.exe
    goto main
)
if %CHOICE%==98 (
    :: kill all instances of Asuka - Nooooo don't turn me into fanta rei, pop- 
    taskkill /f /im pwsh-auska.exe
    rmdir /s /q "%ASUKA_HOME%"
    mkdir "%ASUKA_HOME%"
    goto main
)
if %CHOICE%==99 ( 
    cls
    exit /b 0
)
goto main