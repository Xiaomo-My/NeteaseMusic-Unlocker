@echo off
cd %~dp0files
title UnblockNeteaseMusic 修改 by NULL ^& 小宇
echo.
echo 本程序基于nondanee大佬的程序改进而成（主要还是做了一键配置脚本，傻瓜化了）
echo 源码地址：https://github.com/nondanee/UnblockNeteaseMusic
echo.
echo 修改 by NULL ^& 小宇
echo 本项目地址：https://github.com/xiaoyv404/NeteaseMusic-Unlocker/
echo 本脚本为一次性脚本，运行完后即作废，请勿再次运行或复制给他人，如需分享请分享原文件！
echo.
echo.
echo 按任意键开始配置脚本
pause >nul
if not exist C:\"Program Files (x86)"\Netease\CloudMusic\ ( goto nosoftware )
set software=C:\"Program Files (x86)"\Netease\CloudMusic\
set lnkaddress="C:\Program Files (x86)\Netease\CloudMusic\
goto node
:nosoftware
cls
set /p software=请将网易云音乐安装目录拖入此处（cloudmusic.exe所在目录，如C:\Program Files (x86)\Netease\CloudMusic）:
echo 目录为：%software%，请谨慎确认，否则会造成失败
echo 如有选错，请重启此脚本，重新选择
pause
:node
node
if %ERRORLEVEL% == 0 ( goto next ) else ( goto id )
:next
NSudoLG.exe -Wait -U:S -P:E 7za.exe x UNMfiles1.7z -o%software%
if %ERRORLEVEL% == 0 ( goto 1 ) else ( 
    cls
    echo.
    echo 解压失败，请检查是否有权限，并重试
    pause
    goto next
 )
:id
cls
echo.
echo 未发现Node.js，是否加入已经集成的Node.js（不会影响其他程序）？（yes/no）
set id=y
set /p id=请选择:
if "%id%"=="yes" goto yes
if "%id%"=="Yes" goto yes
if "%id%"=="YES" goto yes
if "%id%"=="y" goto yes
if "%id%"=="Y" goto yes
if "%id%"=="no" goto no
if "%id%"=="No" goto no
if "%id%"=="NO" goto no
if "%id%"=="n" goto no
if "%id%"=="N" goto no
goto id
:no
cls
echo.
echo 抱歉，请先安装Node.js并将其列入PATH
echo 按任意键退出...
pause >nul
exit
:yes
NSudoLG.exe -Wait -U:S -P:E 7za.exe x UNMfiles2.7z -o%software%
if %ERRORLEVEL% == 0 ( goto 1 ) else ( 
    cls
    echo.
    echo 解压失败，请检查是否有权限，并重试
    pause
    goto yes
 )
:1
cls
echo.
del C:\Users\Public\Desktop\网易云音乐.lnk
echo oShellLink.TargetPath = %lnkaddress%Start.exe" >> Shortcut.vbs
echo oShellLink.WindowStyle = 1 >> Shortcut.vbs
echo oShellLink.IconLocation = %lnkaddress%cloudmusic.exe, 0" >> Shortcut.vbs
echo oShellLink.Description = "网易云音乐" >> Shortcut.vbs
echo oShellLink.WorkingDirectory = %lnkaddress%" >> Shortcut.vbs
echo oShellLink.Save >> Shortcut.vbs
start Shortcut.vbs
start killcloudmusic.bat
%software%cloudmusic.exe
MOVE /Y Config C:\Users\"%username%"\AppData\Local\Netease\CloudMusic
start %software%Start.exe
cls
echo.
echo 脚本运行完成！
echo enjoy youself！
echo.
echo 按任意键退出...
pause >nul