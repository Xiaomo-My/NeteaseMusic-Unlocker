@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
if /i "%PROCESSOR_IDENTIFIER:~0,3%"=="x86" (set "bit=x86") else (set "bit=x64")
set /a errorlevel=
if exist "%TEMP%\consoleSettingsBackup.reg" regedit /S "%TEMP%\consoleSettingsBackup.reg"&DEL /F /Q "%TEMP%\consoleSettingsBackup.reg"&goto :mainstart
regedit /S /e "%TEMP%\consoleSettingsBackup.reg" "HKEY_CURRENT_USER\Console"
echo REGEDIT4>"%TEMP%\disablequickedit.reg"
echo [HKEY_CURRENT_USER\Console]>>"%TEMP%\disablequickedit.reg"
(echo "QuickEdit"=dword:00000000)>>"%TEMP%\disablequickedit.reg"
regedit /S "%TEMP%\disablequickedit.reg"
DEL /F /Q "%TEMP%\disablequickedit.reg"
start "" "cmd" /c "%~dpnx0"&exit
:mainstart
cd /d %~dp0files
title NeteaseMusic-Unlocker
mode con lines=30 cols=120
:mouse
cls
echo.
echo.
echo        ###     ## ##      ## ##      ## ###     ## ##        #######   ######  ##    ##  ######## ########
echo        ####    ## ###    ### ##      ## ####    ## ##       ##     ## ##    ## ##   ##   ##       ##     ##
echo        ## ##   ## ####  #### ##      ## ## ##   ## ##       ##     ## ##       ##  ##    ##       ##    ##
echo        ##  ##  ## ## #### ## ##      ## ##  ##  ## ##       ##     ## ##       #####     ######   ########
echo        ##   ## ## ##  ##  ## ##      ## ##   ## ## ##       ##     ## ##       ##  ##    ##       ##   ##
echo        ##    #### ##      ## ##      ## ##    #### ##       ##     ## ##    ## ##   ##   ##       ##    ##
echo        ##     ### ##      ##  ########  ##     ### ########  #######   ######  ##    ##  ######## ##     ##
echo.
echo.
echo                ===================================================================================
echo                          ��Ŀ��ַ��https://github.com/xiaoyv404/NeteaseMusic-Unlocker/
echo                ===================================================================================
echo                ���ű�Ϊһ���Խű�������������ϣ������ٴ����л��Ƹ����ˣ�������������ԭ�ļ���
echo                ===================================================================================
echo.
echo.
echo                                             ��========================��              
echo                                              ^|                       ^|
echo                                              ^|        ��ʼ����       ^|
echo                                              ^|                       ^|
echo                                             ��========================��
ConsExt /event
set /a xy=%errorlevel%
set /a X=%xy:~0,-3%
set /a Y=%xy%-1000*%X%
if %y% gtr 18 if %y% lss 22 if %x% gtr 44 if %x% lss 70 goto start
goto mouse
:start 
cls
for /f "tokens=2* " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Netease\cloudmusic" /v "install_dir"') do set software=%%j
if "%software%"=="" ( goto nosoftware ) else ( goto node )
:nosoftware
cls
echo.
echo �޷��Զ���ȡ���������ְ�װĿ¼�����ֶ�����!
echo ��ʽ��C:\Program Files ^(x86^)\Netease\CloudMusic����Ҫ���ţ����Ҫ�ӡ�\��
set /p software=Ŀ¼Ϊ��
echo �������Ŀ¼Ϊ��%software%
echo �����Ƿ���ȷ��
pause
:node
node
if %ERRORLEVEL% == 0 ( goto next ) else ( goto nonode )
:next
cls
echo.
echo ���ڽ�ѹ�ļ�
NSudoLG.exe -Wait -ShowWindowMode:Hide -U:S -P:E 7za.exe x UNMfiles1.7z -aoa -o"%software%"
if %ERRORLEVEL% == 0 ( goto 1 ) else ( 
    cls
    echo.
    echo ��ѹʧ�ܣ������Ƿ���Ȩ�ޣ�������
    pause
    goto next
 )
:nonode
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
goto nonode
:no
cls
echo.
echo ��Ǹ�����Ȱ�װNode.js����������PATH
echo ��������˳�...
pause >nul
exit
:yes
cls
echo.
echo ���ڽ�ѹ�ļ�
NSudoLG.exe -Wait -ShowWindowMode:Hide -U:S -P:E 7za.exe x UNMfiles2.7z -aoa -o"%software%"
if %ERRORLEVEL% == 0 ( goto 1 ) else ( 
    cls
    echo.
    echo ��ѹʧ�ܣ������Ƿ���Ȩ�ޣ�������
    echo ��������˳�...
    pause >nul
    exit
 )
:1
echo ���ڴ��������ݷ�ʽ
for /f "tokens=2* " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do set Dsektop=%%j
del C:\Users\Public\Desktop\����������.lnk
echo set oShellLink = WshShell.CreateShortcut("%Dsektop%\����������.lnk") >> Shortcut.vbs
echo oShellLink.TargetPath = "%software%\Start.exe" >> Shortcut.vbs
echo oShellLink.WindowStyle = 1 >> Shortcut.vbs
echo oShellLink.IconLocation = "%software%\cloudmusic.exe, 0" >> Shortcut.vbs
echo oShellLink.Description = "����������" >> Shortcut.vbs
echo oShellLink.WorkingDirectory = "%software%" >> Shortcut.vbs
echo oShellLink.Save >> Shortcut.vbs
NSudoLG.exe -U:S -P:E Shortcut.vbs
start Shortcut.vbs
echo ���ڸ������ô������������
start /B killcloudmusic.bat
"%software%\cloudmusic.exe"
MOVE /Y Config C:\Users\"%username%"\AppData\Local\Netease\CloudMusic
cls
echo.
echo �ű�������ɣ�
echo enjoy youself��
echo.
echo ��������˳�...
pause >nul