@echo off

:: Cleaning local KSE binaries
if exist dist rmdir /S /Q dist
if exist kse.exe del kse.exe
if exist KSE_Log.txt del KSE_Log.txt
if exist KSE_Error.txt del KSE_Error.txt

:: Cleaning compiled KPF files
set SKIP_PAUSE="true"
set HERE=%~dp0
cd %HERE%\kpf-qt
call clean.bat
cd %HERE%
echo Complete!
pause
