@echo off
title Windows command Runner Launcher

:check
echo checking...
echo 1/4
if exist %USERPROFILE%/wcr/wcr.bat (goto check2) else (goto error)

:error
echo Some File Missing...
goto ask

:ask
set /P ans="Do You Want To Download File Now?(y/n)"
if %ans%=="y" (goto update)
if %ans%=="n" (exit /B)
echo Please type y or n.
goto ask

:check2
echo 2/4
if exist %USERPROFILE%/wcr/com.cfg (goto check3) else (goto cfgset)

:check3
echo 3/4
if exist %USERPROFILE%/wcr/resec.cfg (goto check4) else (goto cfgset)

:check4
echo 4/4
if exist %USERPROFILE%/wcr/updater.bat (goto ok) else (goto error)

:cfgset
set /P com="Input command:"
echo %com% > %USERPROFILE%/wcr/com.cfg
set /P resec="Repeat times:"
echo %resec% > %USERPROFILE%/wcr/resec.cfg

:update
echo Updateing...
cd %USERPROFILE%
mkdir wcr
cd wcr
echo Deleteing...
del wcr.bat
del updater.bat
echo Downloading...
curl https://raw.githubusercontent.com/AvianJay/win-command-runner/main/wcr.bat --output wcr.bat
curl https://raw.githubusercontent.com/AvianJay/win-command-runner/main/updater.bat --output updater.bat
echo Updated.Ready to Check.
ping 127.0.0.1 -n 1 -w 1000 > nul
goto check1

:ok
set /P laun="What Do You Want To Do?(l=launch/u=update/s=Set Command and Repeat Time/ul=Update Launcher):"
if %laun%==l (cd %USERPROFILE%/wcr & start wcr.bat & exit /B)
if %laun%==u (goto update)
if %laun%==s (goto cfgset)
if %laun%==ul (cd %USERPROFILE%/wcr & start updater.bat & exit /B)
echo Please Type l or u or s or ul.
goto ok
