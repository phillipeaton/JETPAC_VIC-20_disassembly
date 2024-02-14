@echo off

REM Ensure mame.exe is in your path under Windows, don't know about Linux/Mac.

REM Command line options:
REM vic20p          Name of the MAME driver for VIC-20.
REM -quik <path>    Loads the specified ROM.
REM -rompath <path> Path to the BIOS ROMs for the VIC-20 driver.
REM -exp <8k etc.>  Add expansion RAM to the emulated VIC-20, increase to 16k if you want to add to the code!
REM -nomax          Don't open full-screen, open in a window so you can see the debug windows. 
REM -natural        Use your regular keyboard layout, I use a Dvorak keyboard layout, so I need this, you might not.
REM -debug          Run MAME in debug mode.
REM -debugger_font_size <size>  Text size used in debug windows.

mame.exe vic20p  -quik ..\bin_orig\jetpac.prg  -rompath .\roms  -exp 8k  -nomax -natural -debug -debugger_font_size 10

REM pause
