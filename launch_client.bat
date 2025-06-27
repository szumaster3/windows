@echo off
title Logs

set SCRIPT_DIR=%~dp0
set JAVA_HOME=%SCRIPT_DIR%jre
set PATH=%JAVA_HOME%\bin;%PATH%

netstat -an | findstr "0.0.0.0:43595" > NUL
if %ERRORLEVEL% equ 1 (
    echo Server is not running on port 43595.
    pause
    exit
)

pushd %~dp0\game

start /b java -Xmx1G -jar client.jar

:waitclient
netstat -an | findstr "0.0.0.0:43595" > NUL
if %ERRORLEVEL% equ 1 (
    echo Waiting for client to initialize...
    timeout /t 2 > NUL
    goto waitclient
)

popd