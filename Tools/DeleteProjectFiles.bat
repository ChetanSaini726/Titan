@echo off
pushd %~dp0\..\
del /s *.sln
del /s *.vcxproj 
del /s *.filters
del /s *.user
@echo successfully deleted all project files
popd
pause