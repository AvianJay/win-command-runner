@echo off
title Windows Command Runner Updater

set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto start ) else ( goto getPrivileges )

:getPrivileges
exit /B

:start
echo Checking...
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
set l="%SystemDrive%\Program Files\Windows Command Runner\"
) ELSE (
set l="%SystemDrive%\Program Files (x86)\Windows Command Runner\"
)
%SystemDrive%
if %l%=="" (
echo Can't find launcher folder.
set /p l=Please Type launcher folder.EX:"C:\Program Files (x86)\Windows Command Runner"
)
%SystemDrive%
cd %l%
echo Updateing Launcher...
echo Deleteing...
del launcher.bat
echo Downloading...
curl https://raw.githubusercontent.com/AvianJay/win-command-runner/main/launcher.bat --output launcher.bat
echo Updated.
pause
exit /B
