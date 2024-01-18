# JETPAC for VIC-20 Disassembly and Reverse Engineering

A reverse-engineering of the 6502 binary image to assembly source code of the classic VIC-20 game JETPAC by ULTIMATE PLAY THE GAME.

1. [Introduction](#introduction)

2. [Project Status](#project-status)

3. [Tools Used](#tools-used)

4. [Disassembly and Reassembly Instructions](#disassembly-and-reassembly-instructions)

5. [Repository Contents](#repository-contents)

## Introduction

JETPAC was one of my favourite games on the VIC-20 in the early '80s, the smooth movement of the sprites and excellent game play mechanics made it a standout title. I wanted to look into the code to see how it all works.

[Back to top](#jetpac-for-vic-20-disassembly-and-reverse-engineering)

## Project Status

After 200+ commits over 18 months, it's probably as completed as I will make it:

- Code/Data/Graphics sections are identified.
- Variables are labelled and described.
- Memory map is complete (see Excel spreadsheet).
- Zero Page and other variables are identified.
- Code labels and commenting is complete.
- User-Defined Graphics characters have been identified (see Excel spreadsheet).

[Back to top](#jetpac-for-vic-20-disassembly-and-reverse-engineering)

## Tools Used

- **Debugger** - MAME debugger was used for single stepping the code and to create the inital code/data separation using the `trackpc` instruction. Functionality appears significantly better than that available in VICE.

- **Disassemblers** -
  
  - **Dasmfw** disassembler was used to disassemble the code, which reads hand-crafted info files and uses them to format the binary code into source code files. Single stepping the code in MAME debugger and subsequest creation of the info files is the vast majority of the work needed.
  
  - **Infiltrator** diasssembler was used to check the code/data separation and provide a list of label references than was then fed into dasmfw for easy reference.
  
  - **Ghidra** Function Graph was used later on in the project to visualise the most complex of routines that weren't practical to understand as linear source code or to manually flowchart on paper. Paint.net was used to piece together the graph screenshots.

- **Automated Source Code Editing** - GNU sed was used for tweaking the disassembled source code (because dasmfw doesn't support local variables yet).

- **Assembler** - Dasmfw for 6502 by default produces source code that can be assembled with the as65 assembler, which is what was used. Other assemblers, e.g. 64tass, can also be targetted by dasmfw using parameters, but this has not yet been attempted.

- **Build System** - GNU Make was used to sequence the disassembly, post-editing, reassembly and comparison to original binary image. GNU md5sum was used for comparing original and recompiled binary files.

- **File Comparison** - Beyond Compare was used for comparing binary memory dumps for discovering variables, data structures etc.

- **Other Stuff** - Microsoft Excel was used for making lookup tables of memory maps for I/O, screens, colours, User-Defined Graphics and more. Microsoft Word was used for creating the code listing overview picture.

[Back to top](#jetpac-for-vic-20-disassembly-and-reverse-engineering)

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

I've never tried this, but dasmfw is C++ program designed to be easy to compile for your platform. as65 is available as a Linux version, which may also work on Mac. The other utils are standard Unix tools so are probably available on Linux / Mac by default.

[Back to top](#jetpac-for-vic-20-disassembly-and-reverse-engineering)

## Repository Contents

See also the further readme files in the lower level directories of the repository.

- [bin_orig](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/bin_orig) - Original program binary image file that gets disassembled.

- [dasmfw](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/dasmfw) - Info files to control the disassembly, sed script file, source code gets built here.

- [bin](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/bin) - New program binary image file that gets reassembled.

- [Infiltrator](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/Infiltrator) - Files used to confirm data/code separation and create source code cross-reference comments.

- [MAME_debug](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/MAME_debug) - Files to run MAME debugger, config settings, VIC-20 ROMs, JETPAC .prg file.

- [utils](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/utils) - [make](https://www.gnu.org/savannah-checkouts/gnu/make/) and programs called by make.

- [docs](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/tree/main/docs) - Note and technical documentation of the VIC-20 and the JETPAC program.

[Back to top](#jetpac-for-vic-20-disassembly-and-reverse-engineering)

## An Analysis of the Source Code

The project originally started off to find out how the smooth sprite graphics worked, I had an idea in my head, but wanted to see if this was indeed how it was done. However, JETPAC was not built on existing set of libraries, the original Sinclair ZX Spectrum version of the game was completely original and the VIC-20 version was a port of that.

The graphics engine was not standalone, it's completely embedded into the rest of the game code, so I, inevitibly, ended up reverse a lot more than just a sprite engine. In the end I just decided to do all of it. The point then became how to reveal the secrets of the VIC-20 version of the game, given it was the only ULTIMATE game produced on the VIC-20 and thus is somewhat unique.

### Source Code Map

The complete binary disassembly process generates a single source code file, to which I have added large-font banners to all the important routines so they can be seen from a source code map, shown below, to get an overall 'feel' for the code. The key routines that are called from Main Loop have banners with horizontal lines top and bottom e.g. DISPLAY LASERS near the start of the file.

<img title="" src="docs\JETPAC_source_code_map.PNG" alt="" width="1026" height="">

The source code can be, roughly, viewed as four parts:

1. Program Start / Initialise / Game Select / Main Loop

2. Object handlers called from Main Loop

3. Routines for reading control and drawing text and objects to the screen

4. User-Defined Graphics data

### Program Start - Initial Hardware Configuration

JETPAC requires an 8KiB memory expansion and, once the program has been loaded into memory between \$2000 and \$3FFF.

Execution starts at \$201D, where it sets up the interrupt handler vectors, erases variable memory, sets-up the VIA I/O ports and configures the VIC chip. 

The VIC chip configures the Screen RAM, Used-Defined Graphics RAM and Colour RAM mapping parameters to 11 rows by 23 columns, with each character being 16x8 pixels wide by 16 pixels high, and in this mode, colour tiles are also 16x8 pixels. 

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/fd7f216bcb76b5fe6a971eb5903b52bf7b668cb4/dasmfw/jetpac.a65#L400C1-L437C133>

### Game Select

The game select screen flashes the chosen options, by inverting the characters already drawn onto the screen on a continual basis until start game is selected. The keyboard is read to select game options and space starts the game. 

### Init Laser Objects

There are a maximum of four laser objects used at any one time. The initialisation routine works out where Jetman is onscreen and the direction he faces, whether the new laser being created will screen-wrap, the vertical height of Jetman's gun and then creates an object with these parameters, together with a random length and colour from a colour table using the IRQ timer.

### DISPLAY LASERS

(Graph Function dump)

This subroutine is called from main loop and is used to update one of the lasers on display.

Once a laser has been fired, over several animation frames, it increases in length to a predetermined size, then decays in four sections by having bits removed from the screen i.e. it starts off as a solid line then becomes dotted and eventually disappears.

The patterns of dots are predetermined from a data table and current decay state is stored in the object record itself.

### Load ZP Parameters

This utility routine is used to load multiple 16-bit static data values, e.g. addresses, into one or more Zero Page variables. 

The routine is called from 30+ places in the code than any other routine. 

The data to be loaded is assembled directly after the call to the routine, which then utilizes the return address to get the data, incrementing the eventual return address as it goes along. 

When `$FF` is encountered, the routine returns to continue after the call and data.

### IRQ Interrupt handler

The game utilises a VIA timer to:

- Prioritize object list updates to the Jetman object (so he's always responsive)

- Create a random number generator, in conjunction with the TV Raster

- Increments 16 bit counter used in various places in the code. 

### Main Loop / GOTO NEXT OBJECT

`Main_Loop` gets next active object type from the object table and, using an indexed jump table, uses it to jump to the appropriate object handler and when the processing for each object has completed, `GOTO_NEXT_OBJECT` is called.

GOTO NEXT OBJECT prioritises object cases for Jetman, laser beam and sound objects and initiates spawning of new aliens when needed.

In the code, object handlers called directly by Main Loop are written in bold e.g. `DISPLAY_LASERS`.

### Timer Interrupt Handlers

Once the timer has triggered an IRQ interrupt, this routine will stash the next  object to be handled, update Jetman next, then restoring the next object and serves to regulate Jetman's movement update speed

### SOUND UPDATE

Sounds are processed by the object handler, just like the display sprites. 

Data entered into the sound object by other object handlers is used to index into a jump table to process the various sound routines.

The sounds are quite simple and don't take up much memory, but are effective.

### VALUABLES

Valuable objects have movement, can be picked up by Jetman and can change colour, depending on which valuable they are.

Like the sound object, a jump table is used to jump to the appropriate handler.

### ANIMATE EXPLOSIONS

When an object explodes, e.g. an alien is hit by a laser, it's object type is changed to an Explosion and subsequent calls to this routine will animate the explosion though a list of explosion graphics from a data table and then ending.

Explosions are set to random colours, except green, which is reserved for platforms. 

### Alien Waves

The eight alien waves and two rocket ships of the original Spectrum version were reduced to only four and two respectively for the VIC-20 version of the game, probably due to memory constraints.

Each alien on each wave has it's own object in the object table and is handled separately.

### WAVE 0 FUZZBALL

Wave 0 fuzzballs are simply objects that float across the screen with a randomly generated trajectory, either parallel with the planet surface or slowly falling to each, and any contact will cause them to explode.

The first test, common to all waves, is whether the alien has been hit by a laser, if it has, the common score routine calculates the increased score based on the wave.

Otherwise, the alien is tested to see if it has collided with a platform, which, for Wave 0, this causes it to morph into an explosion object, else it's new position on screen is stored to it's object record and it is redrawn.

### WAVE 1 CROSS

Wave 1 is similar to Wave 0, except the alien graphic is different and collisions with platform result in the alien bouncing off in a different direction.

### WAVE 2 SPHERE

Wave 2 is similar to Wave 1, except the alien graphic is different and the alien will also change direction on a random basis, based on the random number produced by the IRQ and Raster interrupt values.

### WAVE 3 SAUCER

Wave 3 is similar to Wave 0, except the alien graphic is different and the alien direction is dictated by the position of Jetman - they home in on him.

### Spawn Objects (\$2B4B)

These routines handle creation of new objects depending on game parameters, e.g. whether Jetman is on-screen, whether all Ship Parts and Fuel Cells have been collected. 

The position of the new object is semi-randomly chosen from look-up table of X-axis start positions.

### SHIP ASCEND/DESCEND (\$2E17/\$2E4E)

When the ascend/decent objects are triggered at end of level, Jetman is removed from the screen and the ship goes up and comes back down again to the next Wave. 

Because it will not fit on the screen until the ship is a several lines off the bottom, the rocket flame has a delay before it is displayed.

### SHIP BOTTOM MODULE (\$2E74)

The rocket ship consists of 3 modules (or parts) and, during normal play, the bottom part is always in the same place, but when the modules that are on the platforms at the start of levels are collected and dropped onto the base, this routine draws the extra modules, coloured depending on the number fo Fuel Cells collected and dropped. 

Additionally, dependent on Fuel Cells collected, this routine collision detects Jetman with the ship for end of level detection.

### SHIP PART OR FUEL (\$2F8E)

The objects on-screen for Ship Modules and Fuel Cells and Valuables share some of the same object list locations, so this routine has some calculations and masks to manage the objects list parameters appropriately.

### Jetman Collide Ship Fuel (\$2FEE)

This collision test can result in a Fuel Cell or Ship Module object being picked up and following Jetman around.

Note the picked-up object isn't updated on-screen as often as Jetman so they move along in jumps after Jetman. 

In my mind, this characteristic is one of the memorable aspects of JETPAC and gives the game an extra liveliness. 

### Test Platform Collision

A complicated routine that is used for testing all on-screen objects whether they have collided with a platform e.g. objects falling from the top of the screen, Jetman or Aliens flying in any direction. 

The collision testing sets bits in a return status byte that is the tested by the calling routine to see whether the collision is of relevance.

See the flowchart and source code for more insight.

### JETMAN FLYING (\$31BF)

Possibly the most complicated routine in the program.

Routine reads the controls then tests if Jetman has collided with a platform, if so, Jetman's position and direction are updated.

Additionally, if the fire button was pressed, laser shots are initiated. 

### JETMAN STANDING (\$332C)

Similar to JETMAN FLYING, but without the Platform Collision tests.

### Read Keyboard Joystick (\$33F7)

Depending on user-selected game options, Joystick or keyboard controls are read, both are read through the VIA I/O interface chips.

The keyboard control is quite novel in the way it allows several different keys to be used to play the game, which are grouped based on the hardware keyboard matrix. 

### Convert XY to UDG RAM Address (\$351D)

Due to the way that the game code configures the VIC chip to be a memory-mapped display, this and a few other routines are needed to convert object X-Y positions to actual memory addresses for object for bitmap and colour display purposes.

This routine utilizes a pre-calculated address look-up table to speed up the process.

### Display Object (\$3601)

Another quite complicated routine and probably where the game spends the majority of it's processing time. 

Generally, the object to be displayed will be moving, so it is given two sets of parameters, one for the objects current position and another for the new position. 

Remember that objects are drawn on the screen using XORing what's there already, which allows on-screen objects to overlap with minimal processing complications. 

The routine will firstly compare the positions of the objects and then erase the lines of the old object that will not be replaced e.g. if the object is moving upwards, you can remove some of the bottom lines from it. 

The objects are then processed in 8 bit columns e.g. 2 or 3 columns to display Jetman, and for each column, the old object bitmap is XOR'd away and then immediately replaced with the new object bitmap, one byte at a time. 

### Colourize Object (\$381F)

Updates the colour map tiles based on the X-Y position of the object it's given, works probably the same way as Sinclair Spectrum games and thus gives you the same colour clash characteristic.

Routine checks to ensure it's not changing the green colour map tiles of the platforms.

### User-Defined Graphics Data Lookup Table - Jetman and Aliens (\$385F)

### User-Defined Graphics Data Lookup Table - Ship Modules, Fuel Cell, Valuables ($3C87)