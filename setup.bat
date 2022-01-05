@echo off

if "%~1" == "" goto end
if "%~1" == "build" goto build
if "%~1" == "clean" goto clean
:end
exit

:build
call Externals\premake\premake5.exe vs2022
exit

:clean
call Externals\premake\premake5.exe clean
exit