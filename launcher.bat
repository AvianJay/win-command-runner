@echo off
title Windows command Runner

:check
echo checking...
echo 1/3
if exist %USERPROFILE%/wcr/wcr.bat (goto check2) else (goto error)

:error
echo Some File Missing...
goto ask

:ask
set /P ans="Do You Want To Download File Now?(y/n)"
if %ans%="y" (goto update)
if %ans%="n" (exit /B)
echo Please type y or n.
goto ask

:check2
echo 2/3
if exist %USERPROFILE%/wcr/com.cfg (goto check3) else (goto cfgset)

:check3
echo 3/3
if exist %USERPROFILE%/wcr/resec.cfg (goto ok) else (goto cfgset)

:cfgset
set /P com="Input command:"
echo %com% > %USERPROFILE%/wcr/com.cfg
set /P resec="Repeat times:"
echo %resec% > %USERPROFILE%/wcr/resec.cfg

:update
cd %USERPROFILE%
mkdir wcr
curl
