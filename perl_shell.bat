@ECHO OFF
GOTO begin
:setenv
set PATH=C:\Strawberry\c\bin;C:\Strawberry\perl\bin;%PATH%
set PERL5LIB=%~dp0
GOTO :EOF
:begin

IF "%1" EQU "setenv" (
    ECHO.
    ECHO Setting environment for Perl
    CALL :setenv
) ELSE (
    SETLOCAL
    TITLE Perl Shell
    PROMPT %username%@%computername%$S$P$_#$S
    START "" /B %COMSPEC% /K "%~f0" setenv
)

