REM @echo off
npm run dis64 -- --in "X:\SkyDrive\_PJE\Programming\Forth\CamelForth6809\git\jetpac\jetpac_0000-3fff.bin" --range 0x2000-0x3fff --model vic208k+
REM Pause doesn't work, as npm starts another process
pause