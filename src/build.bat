@echo off
echo ~~~~ starting build ~~~~
ml64 /nologo /c /Zi /Cp %1.asm
cl /nologo /O2 /Zi /utf-8 /EHa /Fe%1.exe c.cpp %1.obj