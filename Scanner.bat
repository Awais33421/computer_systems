@echo off
:: Scanner.bat - verifies or repairs Windows system files

:: Accept argument from main menu: repair or verify
set task=%1

if /i "%task%"=="repair" (
    echo Running SFC /scannow to repair system files...
    sfc /scannow
) else if /i "%task%"=="verify" (
    echo Running SFC /verifyonly to check system files...
    sfc /verifyonly
) else (
    echo Invalid argument. Use "repair" or "verify".
)

echo Task completed.
pause