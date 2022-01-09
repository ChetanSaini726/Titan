@echo off
REM used indirectly by calling with setup.bat as argument like 'setup.bat [build|...|clean]'
if "%~1" == "" echo "Please enter a valid argument"
if "%~1" == "gen" goto gen
if "%~1" == "compile" goto compile
if "%~1" == "run" goto run
if "%~1" == "cleanbuild" goto cleanbuild
if "%~1" == "cleanall" goto cleanall
if "%~1" == "help" goto help


REM arguments used if setup.bat is called with no arguments or run manually
:arguments
set /p arg= "Usage: [gen|compile|run|cleanbuild|cleanall|end]: "
if "%arg%" == "gen" goto gen
if "%arg%" == "compile" goto compile
if "%arg%" == "run" goto run
if "%arg%" == "cleanbuild" goto cleanbuild
if "%arg%" == "cleanall" goto cleanall
if "%arg%" == "help" goto help
if "%arg%" == "end" goto end


REM Want help?
:help
goto arguments


REM Kill this batch file now
:end
exit


REM Only Generates SolutionItems
:gen
call Externals\premake\premake5.exe vs2022
goto arguments


REM Generates SolutionItems(if not exist) and Compile Solution with desired configurations
:compile
if not exist "*.sln" call Externals\premake\premake5.exe vs2022 else continue

if not defined DenEnvDir (
    call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
)
set solution="Titan.sln"

set /p cfg= "Enter the build configuration (Debug/Release/Shipping): "
set /p type= "Enter the build type (Build/Rebuild/Clean): "

MSBuild %solution% -t:"%type%" -p:Configuration="%cfg%" -p:Platform=x64
goto arguments


REM Runs the executable of TitanEditor
:run
if not defined DenEnvDir (
    call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
)

set /p cfgrun= "Enter the build configuration (Debug/Release/Shipping): "

if not exist .\Build\bin\%cfgrun%-windows-x86_64\TitanEditor\TitanEditor.exe (
    echo "TitanEditor.exe not compiled for %cfgrun% configuration. Please compile first for desired configuration."

    goto arguments
) else continue

REM Set directory to Project directory
cd TitanEditor

set proj="TitanEditor.vcxproj"

REM Running MSBuild with 'Run' command
MSBuild %proj% -t:"Run" -p:Configuration="%cfgrun%" -p:Platform=x64

REM Set directory back to Solution directory
cd ..
goto arguments


REM Delete only Output Build folder
:cleanbuild
rmdir /s /q .\Build
goto arguments


REM Delete all projects files in Solution directory
:cleanall
call Externals\premake\premake5.exe clean
goto arguments