@echo off
color 0A
title MANTENIMIENTO V.2 - SYSTEM UTILITY

::---------------------------
:MENU
cls
echo =================================================
echo             MANTENIMIENTO V.2
echo =================================================
echo.
echo [1] Repair System
echo [2] Verify Only
echo [3] DISM Repair
echo [4] Netstat Connections
echo [5] Exit
echo.
set /p choice=Enter your option [1-5]: 

::---------------------------
:: Validate input
if "%choice%"=="1" goto REPAIR
if "%choice%"=="2" goto VERIFY
if "%choice%"=="3" goto DISM
if "%choice%"=="4" goto NETSTAT
if "%choice%"=="5" goto EXIT

cls
echo =================================================
echo           INVALID OPTION SELECTED
echo =================================================
pause
goto MENU

::---------------------------
:REPAIR
cls
echo =================================================
echo               SYSTEM REPAIR
echo =================================================
echo.
echo Running system repair, please wait...
echo.
call Scanner.bat repair
echo.
echo SYSTEM REPAIR COMPLETED
pause
goto MENU

::---------------------------
:VERIFY
cls
echo =================================================
echo             SYSTEM VERIFICATION
echo =================================================
echo.
echo Verifying system files (no changes)...
echo.
call Scanner.bat verify
echo.
echo SYSTEM VERIFICATION COMPLETED
pause
goto MENU

::---------------------------
:DISM
cls
echo =================================================
echo             DISM SYSTEM REPAIR
echo =================================================
echo.
call :RunDISM
echo.
echo DISM REPAIR COMPLETED
pause
goto MENU

::---------------------------
:NETSTAT
cls
echo =================================================
echo            NETWORK CONNECTIONS (NETSTAT)
echo =================================================
echo.
echo Saving active network connections to NetstatLog.txt...
netstat -a -n -o > %USERPROFILE%\Desktop\NetstatLog.txt
echo Done! Check your Desktop for NetstatLog.txt
pause
goto MENU

::---------------------------
:EXIT
cls
echo =================================================
echo              EXITING PROGRAM
echo =================================================
pause
exit

::---------------------------
:RunDISM
echo Running DISM commands to repair Windows image...
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
goto :eof
::---------------------------