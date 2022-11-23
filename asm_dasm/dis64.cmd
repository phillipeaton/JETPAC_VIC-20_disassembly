REM @echo off

REM Node.js is a JavaScript runtime engine, install it first.
REM Download Dis64 repo from git and run "npm install" from the Dis64 directory, it creates a package.json in a subdirectory.
REM Or maybe it's the "npm init -y" command that did that from the same place. Hell, I don't remember, but you need to do both.
REM Anyway, to make this work I hacked "process.js" "baseAddr = 8192" because my binary starts at $2000 and the following command disassembles correctly:

X:\SkyDrive\_PJE\Programming\Forth\CamelForth6809\git\Dis64>npm run dis64 -- --in "X:\SkyDrive\_PJE\Programming\Forth\CamelForth6809\git\JETPAC_VIC-20_disasse
mbly\jetpac_2000-3fff.bin" --range 0x201C-0x3fff --model vic208k+

REM That gives you:
REM //Standard imports
REM #import "./syslabels.asm"
REM
REM //Potential screen buffer locations
REM .label SCREEN_BUFFER_0 = $1000
REM
REM //Start of disassembled code
REM * = $201c "Base Address"
REM
REM     L_201c:
REM         rti
REM         sei
REM         ldx #$ff
REM         txs
REM

REM Pause doesn't work, as npm starts another process
pause