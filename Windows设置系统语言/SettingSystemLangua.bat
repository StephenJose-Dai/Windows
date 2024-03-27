@echo off
title 更改系统语言

:MENU
cls
echo =====================
echo 1. 中文(简体)
echo 2. English
echo =====================
echo 请选择要设置的语言(输入对应序号):
set /p choice=

if "%choice%"=="1" (
    reg add "HKCU\Control Panel\Desktop" /v PreferredUILanguages /t REG_SZ /d zh-CN /f
    reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d zh-CN /f
    goto RESTART
)

if "%choice%"=="2" (
    reg add "HKCU\Control Panel\Desktop" /v PreferredUILanguages /t REG_SZ /d en-US /f
    reg add "HKCU\Control Panel\International" /v LocaleName /t REG_SZ /d en-US /f
    goto RESTART  
)

echo 无效选项，请重试
pause
goto MENU

:RESTART
echo 语言设置已更改，需要重启Windows才能生效。
pause
shutdown /r /t 0
