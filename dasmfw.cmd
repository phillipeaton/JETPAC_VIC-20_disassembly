@echo off
REM dasmfw.exe  -dasm=6502  -info="jetpac.nfo"  -out "jetpac.asm"  "jetpac_2000-3fff.bin"
dasmfw.exe  -dasm=6502  -info="jetpac.nfo"  -out "jetpac.a65"  -offset=2000  "jetpac_2000-3fff.bin"
pause