<!-- markdownlint-disable MD033 -->
# Infiltrator Working Area

Infiltrator was used to create a list of address cross-references showing where a label was called from somewhere else in the code. This list was then manually converted to an info file and used by dasmfw to include the labels in the reverse-engineered source code.

This process was performed after quite a lot of disassembly had already been done, but on hindsight, it would have been beneficial to have done it earlier as it provides great insight into the code.

Infiltrator typically loads a .prg file, but, like dasmfw, doesn't expect code that needs to be relocated as all the absolute jumps will be offset from the expected target address. Fortunately, the .prg file has a simple format; it starts with a 16-bit memory address where the data should go followed by the data.

Thus using a hex file editor on a copy of the original binary prg file, I removed the original address $1201 (little-endian, remember) at the first two bytes of the file and all the BASIC program/relocator routine bytes (plus the data for resetting the VIC, and the user-defined graphics data at the end of the jetpac.prg file), and replaced them with the address of where the remaining code should be (starting at $201C, followed by the $40 which is the `rti` instruction at address $201C).

<img title="" src="..\docs\JETPAC_Infiltrator_prg.png" alt="JETPAC Infiltrator .prg" width="1500" height="">

The modified .prg file was loaded into Infiltrator and, using the code/data dasmfw info file and some Excel formulae, I was able to create an exclude_list.exl file to load into Infiltrator, which tells the disassembler where the data sections are.

<img title="" src="..\docs\JETPAC_Infiltrator_options.png" alt="JETPAC Infiltrator Options" width="1500" height="">

After running the Infiltrator disassemble command, I was able to copy the fully disassembled code into an Excel spreadsheet and, with a simple formatting formula, create the contents of the nfo_labels.nfo file, which was loaded back into dasmfw.

A list of file in the directory, discussed in the text above:

- **jetpac_201c-3844.prg** - The modified .prg file for disassembly by Infiltrator.

- **Exclude list and labels to comments.xlsx** - Used to create the Infiltrator exclude list, to get a good Infiltrator dump of the labels to feed them back into dasmfw to include labels in the dasmfw disassembly.

- **disassembly_no_BADs_or_JAMS.asm** - The Infiltrator disassembled code  was cut and pasted into this file and then pasted into Excel to filter for the labels only. BADs and JAMS are Infiltrator terms, see the program documentation.

- **exclude_list.exl** - the list of data areas calculated from the Excel spreadsheet were cut and pasted into this file.
