@echo off
title KSE Build Script

:: Set to 64 to build KPF in 64 bit
set ARCH=32

:: Skip pausing in KPF build script
set SKIP_PAUSE="true"

:: Setting system paths with needed toolchain locations
set HERE=%~dp0
set PATH=C:\Strawberry\perl\site\bin;C:\Strawberry\perl\bin;%PATH%

:: Delete old kse binary
if exist kse.ese del kse.exe

:: Compile new kse binary and add icon to output
echo.
echo Compiling KSE...
call pp --gui -u -o kse.exe kse.pl
perl icon.pl kse.exe boba.ico

:: compile KPF, and move it over
echo.
echo Compiling KPF
cd %HERE%\kpf-qt
call build.bat -b
cd %HERE%
robocopy "%HERE%\kpf-qt\bin\windows" "%HERE%\dist" /E /XF FILE .gitkeep ^
/XF FILE setup.iss /NFL /NDL /NJH /NJS /nc /ns /np
copy /Y kse.exe dist\kse.exe
echo KSE Build complete!
pause
