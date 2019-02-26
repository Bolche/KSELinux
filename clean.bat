@echo off

rem This script is to clean up everything not KSE.
rem Meaning KPF and the updater and all related files
rem and dirs are all removed

echo Removing Executables
if exist KSE.exe del KSE.exe

echo Cleaning up any logs generated
if exist KSE_log.txt del KSE_log.txt
if exist KSE_Error.txt del KSE_Error.txt
if exist logs rmdir /S /Q logs
if exist dist rmdir /S /Q dist

echo Cleaning all KPF libraries
if exist *.dll del *.dll
if exist platforms rmdir /S /Q platforms
cd kpf-qt
call build.msvc -c
cd ..
echo Complete!
pause
