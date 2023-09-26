@echo off
setlocal EnableDelayedExpansion

for /f "tokens=2 delims==" %%i in ('wmic bios get serialnumber /value') do (
    for /f "delims=" %%j in ("%%i") do set "serial=%%j"
)
color 0F 
echo.
echo HASH-IT V V 1.0.0
echo.
echo Please wait...

cd /d "%userprofile%\Downloads\HASH-IT"
Powershell -ExecutionPolicy Bypass -File "Reg.ps1"
cls

set "filepath=%~dp0%serial%.csv"

:filecheck
if exist "%filepath%" (
    for %%A in ("%filepath%") do set "filesize=%%~zA"
    if !filesize! == 0 (
        goto filezero
    ) else (
        color 02
        echo.
        echo HASH-IT V 1.0.0
        echo.
        echo Congratulations - this process was successful!
        echo %serial%.csv has been created and ready for Intune Autopilot Import
    )
) else (
    color 0C
    echo.
    echo HASH-IT V 1.0.0
    echo.
    echo It seems there was an error gathering information. 
    echo Something went wrong, and we suggest deleting the file created, if any,
    echo and running as an administrator. If this continues, try the manual codes.
)
echo.
echo.
pause
exit

:filezero
color 0C
echo.
echo HASH-IT V 1.0.0
echo.
echo Please delete '%serial%.csv', right click register.bat , and run as administrator.
echo.
echo.
pause
exit