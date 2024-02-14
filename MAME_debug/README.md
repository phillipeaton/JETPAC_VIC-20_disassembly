# MAME Debugger Work Area

VIC-20 JETPAC was reverse-engineered using MAME Debugger to single-step the program. A recent version of MAME (2023 onwards) is required due to a bug in the VIC-20 MAME driver in previous versions that affected the VIA inputs and Jetman was not controllable.

- **MAME_Debug_VIC-20_JETPAC.cmd** - Assuming MAME is in your path, use the cmd file to run MAME with the options and the paths to the necessary BIOS files and Jetpac.prg file that the project is based on.

- **VIC-20_JETPAC_comments.txt** - MAME can import code comments that get displayed next to the raw assembly language displayed in the debugger. further instructions in the file. Due to the on-screen layout of the comments in the debugger, you may or may not find this useful (I don't really use them), so this file has not really been managed and is out of date, think of it as an example.

- **roms** - Directory containing VIC BIOS ROMs. You might not need all of these, I'm not sure.

- **cfg** - Config files created/updated by MAME when started or closed to store persistent session settings e.g. debugger window positions.

Some other subdirectories will be created in this directory by MAME as required.
