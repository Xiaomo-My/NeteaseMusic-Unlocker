@echo off
cd %~dp0files
title UnblockNeteaseMusic �޸� by NULL ^& С��
echo.
echo ���������nondanee���еĳ���Ľ����ɣ���Ҫ��������һ�����ýű���ɵ�ϻ��ˣ�
echo Դ���ַ��https://github.com/nondanee/UnblockNeteaseMusic
echo.
echo �޸� by NULL ^& С��
echo ����Ŀ��ַ��https://github.com/xiaoyv404/NeteaseMusic-Unlocker/
echo ���ű�Ϊһ���Խű�������������ϣ������ٴ����л��Ƹ����ˣ�������������ԭ�ļ���
echo.
echo.
echo ���������ʼ���ýű�
pause >nul
if not exist C:\"Program Files (x86)"\Netease\CloudMusic\ ( goto nosoftware )
set software=C:\"Program Files (x86)"\Netease\CloudMusic\
set lnkaddress="C:\Program Files (x86)\Netease\CloudMusic\
goto node
:nosoftware
cls
set /p software=�뽫���������ְ�װĿ¼����˴���cloudmusic.exe����Ŀ¼����C:\Program Files (x86)\Netease\CloudMusic��:
echo Ŀ¼Ϊ��%software%�������ȷ�ϣ���������ʧ��
echo ����ѡ���������˽ű�������ѡ��
pause
:node
node
if %ERRORLEVEL% == 0 ( goto next ) else ( goto id )
:next
NSudoLG.exe -Wait -U:S -P:E 7za.exe x UNMfiles1.7z -o%software%
if %ERRORLEVEL% == 0 ( goto 1 ) else ( 
    cls
    echo.
    echo ��ѹʧ�ܣ������Ƿ���Ȩ�ޣ�������
    pause
    goto next
 )
:id
cls
echo.
echo δ����Node.js���Ƿ�����Ѿ����ɵ�Node.js������Ӱ���������򣩣���yes/no��
set id=y
set /p id=��ѡ��:
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
echo ��Ǹ�����Ȱ�װNode.js����������PATH
echo ��������˳�...
pause >nul
exit
:yes
NSudoLG.exe -Wait -U:S -P:E 7za.exe x UNMfiles2.7z -o%software%
if %ERRORLEVEL% == 0 ( goto 1 ) else ( 
    cls
    echo.
    echo ��ѹʧ�ܣ������Ƿ���Ȩ�ޣ�������
    pause
    goto yes
 )
:1
cls
echo.
del C:\Users\Public\Desktop\����������.lnk
echo oShellLink.TargetPath = %lnkaddress%Start.exe" >> Shortcut.vbs
echo oShellLink.WindowStyle = 1 >> Shortcut.vbs
echo oShellLink.IconLocation = %lnkaddress%cloudmusic.exe, 0" >> Shortcut.vbs
echo oShellLink.Description = "����������" >> Shortcut.vbs
echo oShellLink.WorkingDirectory = %lnkaddress%" >> Shortcut.vbs
echo oShellLink.Save >> Shortcut.vbs
start Shortcut.vbs
start killcloudmusic.bat
%software%cloudmusic.exe
MOVE /Y Config C:\Users\"%username%"\AppData\Local\Netease\CloudMusic
start %software%Start.exe
cls
echo.
echo �ű�������ɣ�
echo enjoy youself��
echo.
echo ��������˳�...
pause >nul