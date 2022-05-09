@echo off
REM Requires a raw binary file to work, will not work on a FLEX CMD file directly, which has individual records in it.
REM Create a raw binary manually using a hex editor from the CMD file, or by using dasmfw to create an assembler file and then assemble it to a non-FLEX binary, or some other tool to extract the file.
REM This command below not tested, I created the original cmd file some time ago, but didn't save it.
REM -c=CPU type, -e=Code Entry Point, -o=Base address of code

REM dasmx.exe -c6502 -t -e0x1210 -o0x11FF jetpac.prg
REM dasmx.exe -c6502 -t -e0x201D -o0x0000 jetpac_filler.prg
REM dasmx.exe -c6502 -t -e0x201D -o0x11ff jetpac_filler.prg
dasmx.exe -c6502 -t -e0x201D -o0x2000 jetpac_2000-3fff.bin
pause
