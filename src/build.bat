@echo off
echo ~~~~ starting build ~~~~

REM /nolog is dont show MS info at run
REM /c is compile dont link
REM /Zi is debug info
REM /Cp is preserve cases
ml64 /nologo /c /Zi /Cp %1.asm
cl /nologo /O2 /Zi /utf-8 /EHa /Fe%1.exe main.cpp %1.obj