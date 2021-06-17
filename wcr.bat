@echo off
set /P com=<com.cfg
set /P resec=<resec.cfg
title Windows Command Runner

:re
%com%
ping 127.0.0.1 -n %resec% -w 1000 > nul
goto re
