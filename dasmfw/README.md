<!-- markdownlint-disable MD033 -->
# DisASseMblerFrameWork Working Area

Dasmfw accepts a binary file and one or more info (`*.nfo`) files, and uses the info files to covert the data in the binary into valid source code that can be reassembled.

A list of all the dasmfw options can be found on it's GitHub repository. Note, you need to clone or download the files as the documentation is an HTML file that doesn't render in the GitHub browser, you need to open a local copy in your browser.

Info files can call other info files, the first info file is passed to the dasmfw disassembler on the command line, see the makefile.

The info files are (in order of loading):

- **nfo_include.nfo** - a list of other info files to include.

- **nfo_options.nfo** - sets command line option for the disassembler e.g. CPU type, output formatting, input file name, starting address of code etc.

- **nfo_memory_map.nfo** - Loads all the relevant memory-space addresses into dasmfw as labels e.g. Stack, Screen RAM, Character ROM, IRQ IRQ Vectors, VIC Registers, VIA 1 & 2 Registers.

- **nfo_separators.nfo** - Adds a line of dashes or equals signs under each of the `JMP/BRA` or `RTS` instructions, to make them easier to see. You could comment this out of nfo_include.nfo.

- **nfo_code_data.nfo** - Distinguishing between program code and data is fundamental to a successful reverse-engineering effort. The cleanest method I have found is to declare everything as data and then work out the code areas. This was quickly achieved (~90 minutes) by running as many parts of the program in MAME as is possible with the `trackpc` debugging option enabled. This highlights all code that was executed and the highlighted addresses was manually transcribed into this file.

- **nfo_variables.nfo** - Documents all variables with labels and descriptive comments that are included in the source code. Generally, the Zero Page locations are given a generic name and are then renamed with local labels in the sed stage after dasmfw has created it's output file.

- **nfo_banners.nfo** - This file creates four-line high comment text. I like to visualize code as much as possible and adding this large banner-style text into the text allows me to create a Microsoft Word document 'map' of the code, an example screen-dump this is shown in the main README.md file in the root of this repository. You could comment this out of nfo_include.nfo.

- **nfo_jetpac.nfo** - Main file where most of the type/size/formatting/semantics of the reverse-engineered source core are entered.

- **nfo_labels.nfo** - Contains address label code comments showing where each of the labels are called from, in the rest of the code. Dasmfw doesn't include this functionality natively, but was able to create it using the Infiltrator disassembler, see that directory for more info.

# sed (Serial Editor) Script

- **jetpac.sed** is a script that is run after dasmfw has completed creation of the source code, based on the info files. It is required to work around a missing feature in dasmfw, that of local labels, which is especially necessary for 6502 code, because zero-page memory locations are often used to store data short-term for diffing reasons in different subroutines. The sed script replaces the generic `ZPxx` labels with `ZPxx_Local_Description` within a specific address range.
