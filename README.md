<!-- markdownlint-disable MD033 -->
# JETPAC for VIC-20 Disassembly and Reverse Engineering

A reverse-engineering of the 6502 binary image to assembly source code of the classic VIC-20 game JETPAC by ULTIMATE PLAY THE GAME.

JETPAC was one of my favourite games on the VIC-20 in the early '80s, the smooth movement of the sprites and excellent game play mechanics made it a standout title. I wanted to look into the code to see how it all works.

After 200+ commits over 18 months, it's probably as completed as I will make it:

- Code/Data/Graphics sections are identified.
- Variables are labelled and described.
- Memory map is complete (see Excel spreadsheet).
- Zero Page and other variables are identified.
- Code labels and commenting is complete.
- User-Defined Graphics characters have been identified (see Excel spreadsheet).

This repository contains:

1. [Tools Used](#tools-used)

1. [Repository Contents](#repository-contents)

1. [Disassembly and Reassembly Instructions](#disassembly-and-reassembly-instructions)

1. [Source Code Highlights](#source-code-highlights)

## Tools Used

- **Debugger** - [MAME](https://www.mamedev.org/) debugger was used for single stepping the code and to create the initial code/data separation using the `trackpc` instruction. Functionality appears significantly better than that available in VICE.

- **Disassemblers** -
  
  - **[dasmfw](https://github.com/Arakula/dasmfw)** disassembler was used to disassemble the code, which reads hand-crafted info files and uses them to format the binary code into source code files. Single stepping the code in MAME debugger and subsequent creation of the info files is the vast majority of the work needed.
  
  - **[Infiltrator](https://csdb.dk/release/?id=100129)** disassembler was used to check the code/data separation and provide a list of label references than was then fed into dasmfw for easy reference.
  
  - **[Ghidra](https://ghidra-sre.org/)** Function Graph was used later on in the project to visualize the most complex of routines that weren't practical to understand as linear source code or to manually flowchart on paper. Paint.net was used to piece together the graph screenshots.

- **Automated Source Code Editing** - [GNU sed](https://www.gnu.org/software/sed/) was used for tweaking the disassembled source code (because dasmfw doesn't support local variables yet).

- **Assembler** - Dasmfw for 6502 by default produces source code that can be assembled with the [Kingswood as65](https://www.kingswood-consulting.co.uk/assemblers/) assembler, which is what was used. Other assemblers, e.g. [64tass](https://sourceforge.net/projects/tass64/), can also be targeted by dasmfw using parameters, but this has not yet been attempted.

- **Build System** - [GNU Make](https://www.gnu.org/software/make/) was used to sequence the disassembly, post-editing, reassembly and comparison to original binary image. GNU md5sum was used for comparing original and recompiled binary files.

- **File Comparison** - [Beyond Compare](https://www.scootersoftware.com/) was used for comparing binary memory dumps for discovering variables, data structures etc.

- **Other Stuff** - [Microsoft Excel](https://www.microsoft.com/) was used for making lookup tables of memory maps for I/O, screens, colours, User-Defined Graphics and more. [Microsoft Word](https://www.microsoft.com/) was used for creating the code listing overview picture.

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

## Disassembly and Reassembly Instructions

The basic approach is:

1. Use [dasmfw](https://github.com/Arakula/dasmfw) to disassemble the original binary image and create source code based on instructions in info files that dasmfw reads.

2. Use [sed](https://www.gnu.org/software/sed/) to add local variable names to Zero Page memory addresses (because dasmfw doesn't have this feature implemented yet).

3. Use [as65](https://www.kingswood-consulting.co.uk/assemblers/) to reassemble the source code back to a binary image.

4. Use [md5sum](https://www.gnu.org/software/coreutils/) to compare the original binary image and the newly reassembled binary image to ensure they are identical.

The info files mentioned above are used to tell dasmfw how the source code should be disassembled. They are developed by observing and/or single-stepping the program code running in the MAME debugger and updating the info files with appropriate disassembly commands.

### Windows

The makefile in the root of the repository contains all these steps, running `make` will perform the above steps. All the tools for running the makefile are provided for Windows in the repository, you should be able to run `make` from the command prompt.

### Linux / Mac

I've never tried this, but dasmfw is C++ program designed to be easy to compile for your platform. as65 is available as a Linux version, which may also work on Mac. The other utils are standard Unix tools so are probably available on Linux / Mac by default.

[Back to top](#jetpac-for-vic-20-disassembly-and-reverse-engineering)

## Source Code Highlights

The project originally started off to find out how the smooth sprite graphics worked, I had an idea in my head, but wanted to see if this was indeed how it was done. However, JETPAC was not built on existing set of libraries, the original Sinclair ZX Spectrum version of the game was completely original and the VIC-20 version was a port of that.

The graphics engine was not standalone, it's completely embedded into the rest of the game code, so I, inevitably, ended up reverse a lot more than just a sprite engine. In the end I just decided to do all of it. The point then became how to reveal the secrets of the VIC-20 version of the game, given it was the only ULTIMATE game produced on the VIC-20 and thus is somewhat unique.

This section presents an overview of the complete program and highlights some noteworthy sections of code as described by the text. Most of the routines are relatively easy to understand by looking directly at the code. However, some of the code routines are sufficiently complex that, to be understood, they need to be flowcharted.

### Source Code Map

The complete binary disassembly process generates a single source code file, to which I have added large-font banners to all the important routines so they can be seen from a source code map, shown below, to get an overall 'feel' for the code. Because the banners are all in capital letters, the object handler routine banners that are called from Main Loop have horizontal lines top and bottom e.g. for JETMAN_FLYING.

<img title="" src="docs\JETPAC_source_one_pager.png" alt="JETPAC Source One-pager" width="1500" height="">

### Ghidra SRE

To provide flowcharts, after initially drawing everything out on paper, I used the Ghidra software reverse engineering (SRE) tools. Whilst Ghidra is really geared towards compiled high-level programs on modern hardware e.g. Intel x86, good results for 8-bit assembly programs are also possible, but you have to work at it.

The diagrams presented here were created at the end of the reverse engineering process and so address labels had to be loaded into Ghidra using a script to get any from of usable flowchart (or Function Graph in Ghidra terms).

Additionally, Ghidra is somewhat automated regarding separation of code subroutines, you can't control it (without changing the code) and having assembly subroutines called from a jump table doesn't help, so the flowcharts may be incomplete, have missing comments/value names and should be viewed together with the reverse engineered source code listing, where commentary etc. is much richer.

Ghidra is an interactive tool and lets you analyze the code is a much more visual and interactive way than raw assembly source code, if you have some time to get a handle on it, it can provide a level of insight that just isn't possible with linear code analysis.

### Source Code Listing

The source code can be, roughly, viewed as three parts, plus graphics data:

1. Program Initialize / Game Select / Main Loop

1. Object handlers called from Main Loop

1. General routines e.g. reading controls, drawing text & objects to the screen

1. User-Defined Graphics data

### Program Initialize / Game Select / Main Loop

#### [Program Initialize](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L478)

JETPAC requires an 8kb memory expansion and, once the program has been loaded into memory between \$2000 and \$3FFF, execution starts at \$201D, where it sets up the interrupt handler vectors, erases
variable memory, sets-up the VIA I/O ports and configures the VIC chip.

The VIC chip configures the Screen RAM, Used-Defined Graphics RAM and Colour RAM mapping parameters to 11 rows by 23 columns, with each character being 16x8 pixels wide by 16 pixels high, and in this mode, colour tiles are also 16x8 pixels.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L400-L437>

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L513-L520>

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L522-L560>

#### [Game Select](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L595)

The game select screen flashes the chosen options, by inverting the characters already drawn onto the screen on a continual basis until start game is selected. The keyboard is read to select game options and space starts the game.

#### [Init Laser Objects](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L677)

There are a maximum of four laser objects used at any one time. The initialization routine works out where Jetman is onscreen and the direction he faces, whether the new laser being created will screen-wrap, the vertical height of Jetman's gun and then creates an object with these parameters, together with a random length and colour from a colour table using the IRQ timer.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L664-L712>

#### [Main Loop](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2015)

`Main_Loop` gets next active object type from the object table and, using an indexed jump table, uses it to jump to the appropriate object handler and when the processing for each object has completed, `GOTO_NEXT_OBJECT` is called.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L1992-L2027>

### Objects and Handlers

Simply put, the essence of JETPAC is up to 15 objects, each with a set of properties and methods, displayed moving on screen, with the bare minimum of background static objects i.e. the platforms and scores.

Thus, the object table and object handlers are the core of the game. The following pictures show a screenshot of JETPAC during play and a memory dump of the object table and some commentary.

<img title="" src="docs\JETPAC_gameplay_objects.png" alt="JETPAC Gameplay Objects" width="400" height=""> <img title="" src="docs\JETPAC_object_table.png" alt="JETPAC Object Table" width="400" height="">

The byte 00 denotes object type, 01-04 typically X position & direction, Y position & direction, 05-07 various other parameters e.g. colour.

```text
Addr  00 01 02 03 04 05 06 07 ASCII       Object Description
---------------------------------------------------------------------------------------------------
0380  81 25 F8 6C FC 01 00 00   .%ølü...  Jetman facing left, flying, white 
0388  00 9B A1 A5 A5 A5 07 01   ..¡¥¥¥..  Laser shot not active
0390  90 93 A1 A5 A5 15 07 02   ..¡¥¥...  Laser shot right active, red 
0398  90 8B A1 A5 0D 45 04 03   ..¡¥.E..  Laser shot right active, cyan (recoloured by next laser)
03A0  90 83 A1 AD 1D 41 01 07   ..¡-.A..  Laser shot right active, yellow
03A8  0C 00 00 00 00 00 00 00   ........  Sound currently not being played
03B0  09 70 02 AF 03 00 00 00    p.¯....  Ship base module, 2 of 6 fuel cells, Base+Mid+Top modules
03B8  04 98 00 2B 01 04 18 18   ...+....  Fuel Cell, purple
03C0  0E 18 00 3E 00 01 28 18   ...>..(.  Valuable, gemstone (multicolour cycle)
03C8  06 60 FB A8 FD 04 03 00   .`û¨ý...  Wave 3 Saucer, purple
03D0  06 79 FB 6F 04 04 03 00   .yûo....  Wave 3 Saucer, purple
03D8  06 6E FB 28 04 04 03 00   .nû(....  Wave 3 Saucer, purple
03E0  03 7D 00 A6 02 07 03 00   .}.¦....  Explosion, yellow
03E8  06 69 FB A1 FB 04 03 00   .iû¡û...  Wave 3 Saucer, purple
03F0  06 63 FB A1 FB 04 03 00   .cû¡û...  Wave 3 Saucer, purple
```

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2205-L2232>

Using Ghidra Function Graph view, we can map of all the object handlers called from Main Loop in one picture.

<img title="" src="ghidra\graph_screenshots\Overview.png" alt="JETPAC Object Handler Overview" width="1500" height="">

Note, this picture is just to give a feel for the code, you can zoom in, but not so you can read it comfortably. To look at all the flowcharts, you need to open the project in Ghidra for yourself.

#### [GOTO NEXT OBJECT](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2063)

GOTO NEXT OBJECT prioritizes object cases for Jetman, laser beam and sound objects and initiates spawning of new aliens when needed.

In the code, object handlers called directly by Main Loop are written in bold e.g. `DISPLAY_LASERS`.

#### [JETMAN FLYING](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L5691)

The most complicated routine in the program.

<img title="" src="ghidra\graph_screenshots\JETMAN_FLYING.png" alt="JETPAC Object Handler JETMAN FLYING" width="1500" height="">

Routine reads the controls then tests if Jetman has collided with a platform, if so, Jetman's position and direction are updated.

Additionally, if the fire button was pressed, laser shots are initiated.

#### [JETMAN STANDING](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L5923)

Similar to JETMAN FLYING, but without the Platform Collision tests.

<img title="" src="ghidra\graph_screenshots\JETMAN_STANDING.png" alt="JETPAC Object Handler JETMAN STANDING" width="1500" height="">

#### [ANIMATE EXPLOSIONS](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2997)

When an object explodes, e.g. an alien is hit by a laser, it's object type is changed to an Explosion and subsequent calls to this routine will animate the explosion though a list of explosion graphics from a data table and then ending.

Explosions are set to random colours, except green, which is reserved for platforms.

#### [SHIP PART OR FUEL](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L4799)

The objects on-screen for Ship Modules and Fuel Cells and Valuables share some of the same object list locations, so this routine has some calculations and masks to manage the objects list parameters appropriately.

#### Alien Waves

The eight alien waves and two rocket ships of the original Spectrum version were reduced to only four and two respectively for the VIC-20 version of the game, probably due to memory constraints.

Each alien on each wave has it's own object in the object table and is handled separately.

##### [WAVE 0 FUZZBALL](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L3913)

Wave 0 fuzzballs are simply objects that float across the screen with a randomly generated trajectory, either parallel with the planet surface or slowly falling to each, and any contact will cause them to explode.

The first test, common to all waves, is whether the alien has been hit by a laser, if it has, the common score routine calculates the increased score based on the wave.

Otherwise, the alien is tested to see if it has collided with a platform, which, for Wave 0, this causes it to morph into an explosion object, else it's new position on screen is stored to it's object record and it is redrawn.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L3900-L3957>

##### [WAVE 1 CROSS](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L3261)

Wave 1 is similar to Wave 0, except the alien graphic is different and collisions with platform result in the alien bouncing off in a different direction.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L3248-L3271>

##### [WAVE 2 SPHERE](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L3291)

Wave 2 is similar to Wave 1, except the alien graphic is different and the alien will also change direction on a random basis, based on the random number produced by the IRQ and Raster interrupt values.

##### [WAVE 3 SAUCER](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L3389)

Wave 3 is similar to Wave 0, except the alien graphic is different and the alien direction is dictated by the position of Jetman - they home in on him.

#### [SHIP ASCEND](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L4420) / [SHIP DESCEND](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L4477)

When the ascend/decent objects are triggered at end of level, Jetman is removed from the screen and the ship goes up and comes back down again to the next Wave.

Because it will not fit on the screen until the ship is a several lines off the bottom, the rocket flame has a delay before it is displayed.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L4411-L4502>

#### [SOUND UPDATE](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2272)

Sounds are processed by the object handler, just like the display sprites.
a
Data entered into the sound object by other object handlers is used to index into a jump table to process the various sound routines.

The sounds are quite simple and don't take up much memory, but are effective.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2238-L2302>

#### [VALUABLES](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2716)

Valuable objects have movement, can be picked up by Jetman and can change colour, depending on which valuable they are.

Like the sound object, a jump table is used to jump to the appropriate handler.

#### [DISPLAY LASERS](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L868)

This subroutine is called from main loop and is used to update one of the lasers on display.

<img title="" src="ghidra\graph_screenshots\DISPLAY_LASERS.png" alt="JETPAC Object Handler DISPLAY LASERS" width="1500" height="">

Once a laser has been fired, over several animation frames, it increases in length to a predetermined size, then decays in four sections by having bits removed from the screen i.e. it starts off as a solid line then becomes dotted and eventually disappears.

The patterns of dots are predetermined from a data table and current decay state is stored in the object record itself.

### General routines e.g. reading controls, drawing text & objects to the screen

#### [Load ZP Parameters](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L1882)

This utility routine is used to load multiple 16-bit static data values, e.g. addresses, into one or more Zero Page variables.

The routine is called from 30+ places in the code than any other routine.

The data to be loaded is assembled directly after the call to the routine, which then utilizes the return address to get the data, incrementing the eventual return address as it goes along.

When `$FF` is encountered, the routine returns to continue after the call and data.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L1835-L1937>

#### [IRQ Interrupt Handler](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L1960)

The game utilizes a VIA timer to:

- Prioritize object list updates to the Jetman object (so he's always responsive)

- Create a random number generator, in conjunction with the TV Raster

- Increments 16 bit counter used in various places in the code.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L1958-L1986>

#### [Timer Interrupt Handler](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2169)

Once the timer has triggered an IRQ interrupt, this routine will stash the next  object to be handled, update Jetman next, then restoring the next object and serves to regulate Jetman's movement update speed

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L2139-L2185>

#### [Spawn Objects](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L3610)

These routines handle creation of new objects depending on game parameters, e.g. whether Jetman is on-screen, whether all Ship Parts and Fuel Cells have been collected.

The position of the new object is semi-randomly chosen from look-up table of X-axis start positions.

#### [Jetman Collide Ship Fuel](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L4943)

This collision test can result in a Fuel Cell or Ship Module object being picked up and following Jetman around.

Note the picked-up object isn't updated on-screen as often as Jetman so they move along in jumps after Jetman.

In my mind, this characteristic is one of the memorable aspects of JETPAC and gives the game an extra liveliness.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L4925-L4972>

#### [Test Platform Collision](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L5188)

A complicated routine that is used for testing all on-screen objects whether they have collided with a platform e.g. objects falling from the top of the screen, Jetman or Aliens flying in any direction.

<img title="" src="ghidra\graph_screenshots\Test_Platform_Collision.png" alt="JETPAC Object Handler Test Platform Collision" width="1500" height="">

The collision testing sets bits in a return status byte that is the tested by the calling routine to see whether the collision is of relevance.

See the flowchart and source code for more insight.

#### [Read Keyboard Joystick](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L6105)

Depending on user-selected game options, Joystick or keyboard controls are read, both are read through the VIA I/O interface chips.

The keyboard control is quite novel in the way it allows several different keys to be used to play the game, which are grouped based on the hardware keyboard matrix.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L6059-L6182>

#### [Convert XY to UDG RAM Address](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L6469)

Due to the way that the game code configures the VIC chip to be a memory-mapped display, this and a few other routines are needed to convert object X-Y positions to actual memory addresses for object for bitmap and colour display purposes.

This routine utilizes a pre-calculated address look-up table to speed up the process.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L6443-L6511>

#### [Display Object](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L6856)

Another quite complicated routine and probably where the game spends the majority of it's processing time.

<img title="" src="ghidra\graph_screenshots\Display_Object.png" alt="JETPAC Object Handler Display Object" width="1500" height="">

Display_Object

Generally, the object to be displayed will be moving, so it is given two sets of parameters, one for the objects current position and another for the new position.

Remember that objects are drawn on the screen using XORing what's there already, which allows on-screen objects to overlap with minimal processing complications.

The routine will firstly compare the positions of the objects and then erase the lines of the old object that will not be replaced e.g. if the object is moving upwards, you can remove some of the bottom lines from it.

The objects are then processed in 8 bit columns e.g. 2 or 3 columns to display Jetman, and for each column, the old object bitmap is XOR'd away and then immediately replaced with the new object bitmap, one byte at a time.

#### [Colourize Object](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L7433)

Updates the colour map tiles based on the X-Y position of the object it's given, works probably the same way as Sinclair Spectrum games and thus gives you the same colour clash characteristic.

Routine checks to ensure it's not changing the green colour map tiles of the platforms.

<https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L7416-L7497>

### User-Defined Graphics Data Lookup Tables

The graphics data is mostly referenced by two address lookup tables.

#### [Jetman and Aliens](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L7515)

The first lookup table is for Jetman and the alien graphics for each of the four waves and they are characterized by being having animated horizontal movement during the game.

Each UDG frame data ends with some values describing e.g. the number of lines the object data contains and width in columns, but note the data is read from the high-byte downwards for efficient CPU-cycle loops.

Jetman has four frames of animation for standing/walking or flying  in each direction, the alien graphics have two frames each.

#### [Ship Modules, Flames, Fuel Cell, Valuables, Explosions and Platforms](https://github.com/phillipeaton/JETPAC_VIC-20_disassembly/blob/906f2c404933ebfa5af458bcecabfc5d900ac8df/dasmfw/jetpac.asm#L8570)

The second block of graphics data has a separate lookup table with addresses for the rocket ship, fuel cell and valuables.

Additionally, graphics data is also present for flames, explosions, fuel cell and platforms, but they are addressed directly, not via any lookup table.
