# JETPAC for VIC-20 Disassembly and Reverse Engineering

A reverse-engineering of the 6502 binary image to assembly source code of the classic VIC-20 game JETPAC by ULTIMATE PLAY THE GAME.

1. [Introduction](#introduction)

2. [Project Status](#project-status)

3. [Tools Used](#tools-used)

4. [Disassembly and Reassembly Instructions](#disassembly-and-reassembly-instructions)

5. [Repository Contents](#repository-contents)

## Introduction

JETPAC was one of my favourite games on the VIC-20 in the early '80s, the smooth movement of the sprites and excellent game play mechanics made it a standout title. I wanted to look into the code to see how it all works.

[Back to top](#JETPAC for VIC-20 Disassembly and Reverse Engineering)

## Project Status

After 200+ commits over 18 months, it's probably as completed as I will make it:

- Code/Data/Graphics sections are identified.
- Variables are labelled and described.
- Memory map is complete (see Excel spreadsheet).
- Zero Page and other variables are identified.
- Code labels and commenting is complete.
- User-Defined Graphics characters have been identified (see Excel spreadsheet).

[Back to top](#JETPAC for VIC-20 Disassembly and Reverse Engineering)

## Tools Used

- **Debugger**
  MAME debugger was used for single stepping the code and to create the inital code/data separation using the `trackpc` instruction. Functionality appears significantly better than that available in VICE.

- **Disassembler 1**
  Dasmfw disassembler was used to disassemble the code, which reads hand-crafted info files and uses them to format the binary code into source code files. Single stepping the code in MAME debugger and subsequest creation of the info files is the vast majority of the work needed.

- **Disassembler 2**
  Infiltrator diasssembler was used to check the code/data separation and provide a list of label references than was then fed into dasmfw for easy reference.

- **Disassembler 3** Ghidra Function Graph was used later on in the project to visualise the most complex of routines that weren't practical to understand as linear source code or to manually flowchart on paper. Paint.net was used to piece together the graph screenshots.

- **Automated Source Code Editing**
  GNU sed was used for tweaking the disassembled source code (because dasmfw doesn't support local variables yet).

- **Assembler**
  Dasmfw for 6502 by default produces source code that can be assembled with the as65 assembler, which is what was used. Other assemblers, e.g. 64tass, can also be targetted by dasmfw using parameters, but this has not yet been attempted.

- **Build System**
  GNU Make was used to sequence the disassembly, post-editing, reassembly and comparison to original binary image. GNU md5sum was used for comparing original and recompiled binary files.

- **File Comparison**
  Beyond Compare was used for comparing binary memory dumps for discovering variables, data structures etc.

- **Other Stuff**
  Microsoft Excel was used for making lookup tables of memory maps for I/O, screens, colours, User-Defined Graphics and more. Microsoft Word was used for creating the code listing overview picture.

[Back to top](#JETPAC for VIC-20 Disassembly and Reverse Engineering)

## Disassembly and Reassembly Instructions

The basic approach is:

1. Use [dasmfw](https://github.com/Arakula/dasmfw) to disassemble the original binary image and create source code based on instructions in info files that dasmfw reads.

2. Use [sed](https://www.gnu.org/software/sed/) to add local variable names to Zero Page memory addresses (because dasmfw doesn't have this feature implemented yet).

3. Use [as65](https://www.kingswood-consulting.co.uk/assemblers/) to reassemble the source code back to a binary image.

4. Use [md5sum](https://www.gnu.org/software/coreutils/) to compare the origianal binary image and the newly reassembled binary image to ensure they are identical.

The info files mentioned above are used to tell dasmfw how the source code should be disassembled. They are developed by observing and/or single-stepping the program code running in the MAME debugger and updating the info files with appropriate disassembly commands.

### Windows

The makefile in the root of the repository contains all these steps, running `make` will perform the above steps. All the tools for running the makefile are provided for Windows in the repository, you should be able to run `make` from the command prompt.

### Linux / Mac

I've never tried this, but dasmfw is simple C++ program designed to be easy to compile for your platform. as65 is available as a Linux version, which may also work on Mac. The other utils are standard Unix tools so are probably available on Linux / Mac by default.

[Back to top](#JETPAC for VIC-20 Disassembly and Reverse Engineering)

## Repository Contents

See also the further readme files in the lower level directories of the repository.

- [bin_orig](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/bin_orig) - Original program binary image file that gets disassembled.

- [dasmfw](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/dasmfw) - Info files to control the disassembly, sed script file, source code gets built here.

- [bin](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/bin) - New program binary image file that gets reassembled.

- [Infiltrator](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/Infiltrator) - Files used to confirm data/code separation and create source code cross-reference comments.

- [MAME_debug](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/MAME_debug) - Files to run MAME debugger, config settings, VIC-20 ROMs, JETPAC .prg file.

- [utils](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/utils) - [make](https://www.gnu.org/savannah-checkouts/gnu/make/) and programs called by make.

- [docs](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/docs) - Note and technical documentation of the VIC-20 and the JETPAC program.
