Modified version of the 2000-3fff.bin VICE memory snapshot to load into Infiltrator as .PRG file.

Relocator code at start and graphics data at end removed.

$201C address added at the start as per .PRG file format.

"Exclude list and labels to comments.xlsx" used to create the Infiltrator exclude list, to get a good Infiltrator dump of the labels to feed them back into dasmfw to include labels in the dasmfw disassembly.




Loading of Infiltrator comments and comment at start of code come from different nfo files, so layout can be a bit funny.
