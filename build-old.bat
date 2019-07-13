@echo off
title Building KSE
set PATH=C:\Strawberry\perl\site\bin;C:\Strawberry\perl\bin;%PATH%
if exist kse.exe del kse.exe
set /p DEBUG="Is this a debug build? (Y/N) "
if "%DEBUG%"=="N" (
	set D="--gui"
) else if "%DEBUG%"=="n" (
	set D="--gui"
)
call pp %D% -u -o kse.exe kse.pl
perl icon.pl kse.exe boba.ico
cd kpf-qt
call build.msvc.bat -b
cd ..
mkdir dist
copy kse.exe dist\kse.exe
copy boba.bmp dist\boba.bmp
copy kpf-qt\bin\win64\KPF.exe dist\KPF.exe
copy kpf-qt\bin\win64\Qt5Core.dll dist\Qt5Core.dll
copy kpf-qt\bin\win64\Qt5Gui.dll dist\Qt5Gui.dll
copy kpf-qt\bin\win64\Qt5Widgets.dll dist\Qt5Widgets.dll
echo d | xcopy kpf-qt\bin\win64\platforms dist\platforms /S /E /Y
pause
