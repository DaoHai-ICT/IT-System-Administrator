chcp 65001 >nul
@echo off
title Enable Wifi Adapter - IT TEAM -= SSIT TERMINAL =-
mode con: cols=123 lines=35
chcp 65001 >nul
color f0
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo  Run CMD as Administrator...
    goto goUAC 
) else (
 goto goADMIN )

:goUAC
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:goADMIN
    pushd "%CD%"
    CD /D "%~dp0"
@echo      === WIFI DANG DUOC TAT - VUI LONG DOI MOT CHUT ===
netsh interface set interface Wi-Fi disabled
	
@echo      === WIFI DANG DUOC BAT LAI - VUI LONG DOI MOT CHUT ===
netsh interface set interface Wi-Fi enabled	
:kt 
cls 
echo #===============================================# 
echo HOAN THANH QUA TRINH - VUI LONG KET NOI LAI WIFI SSIT-YARD
echo IT TEAM - SSIT TERMINAL
echo UNG DUNG SE TU DONG THOAT SAU 5S
echo #===============================================# 
timeout /t 5