@echo off
title 2009Scape Logs

set SCRIPT_DIR=%~dp0

set JAVA_HOME=%SCRIPT_DIR%jre

set PATH=%JAVA_HOME%\bin;%PATH%

set _JAVA_OPTIONS=

netstat -an | findstr "0.0.0.0:43595" > NUL
if %ERRORLEVEL% equ 0 (
    echo Port 43595 is in use.
    pause
    exit
)

pushd %~dp0\game

start /b java -Xmx2G -jar server.jar

:waitserver
netstat -an | findstr "0.0.0.0:43595" > NUL
if %ERRORLEVEL% equ 1 (
    echo Server is starting, please wait...
    timeout /t 2 > NUL
    goto waitserver
)

popd
