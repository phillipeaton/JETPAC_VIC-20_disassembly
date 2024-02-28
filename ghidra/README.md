<!-- markdownlint-disable MD033 -->
# Ghidra SRE Working Area

Ghidra SRE Disassembler was used to deep-dive into the JETPAC object handlers, especially the complex routines, which were proving difficult/time-consuming to understand via regular means i.e. regular linear text file source code and manual flowcharting.

This code repository is not a tutorial for Ghidra and, as Ghidra was introduced towards the end of the JETPAC reverse engineering for specific routines, the Ghidra project I created is limited in its scope e.g. only the minimum of labels were added and not any variable names or comments.

The information below are my notes of how Ghidra was used:

- Ghidra is not perfect, code sections can get left off the disassembly function graphs, e.g. due to return stack manipulation; the Dasmfw reverse-engineered code is the main source of reference!

- To load the JETPAC project into Ghidra and keeping all the function graph layouts, the following steps are:

  - **If Ghidra runs without these steps you will lose the manually-edited graph function subroutine flowchart layouts, especially as there is a setting to automatically redraw the layouts on open/change.**

  - Install Java SDK, current Oracle version is 21, see Ghidra website for minimum Java SDK version.

  - Install Ghidra by unzipping into a directory, version 10.3.3 was used, you may be able to use a newer version, but the .ghidra configuration file may be different.

  - Restore Ghidra config by extracting the contents of `.ghidra.zip` to become `C:\users\<your user name>\.ghidra\.ghidra_10.3.3_PUBLIC\<several_files>`

  - Check the extracted files for paths. Most will not matter, but are worth checking anyway, e.g. you should update `project.prp` to include the correct Windows user name in paths, similarly for the Dark Theme file and `java_home.save`.

  - Run up Ghidra using `ghidraRun.bat`.

- Symbols from the Dasmfw reverse-engineered source code can be imported into Ghidra using the ImportSymbolsScript.py script, see the `graph_screenshots` directory.

- (Probably) Because of the way JETPAC uses a routine jump table in main loop, Ghidra can't recognise routines correctly and thus cannot manage local labels/symbols correctly. To create the function graph diagrams for routines, symbols were imported as labels/symbols for that routine only, which would overwrite some labels/symbols loaded  previously.

A list of files in the directory:

- **JETPAC.gpr\\** and **JETPAC.rep\\*** and associated sub-directories comprise the Ghidra project for JETPAC.

- **graph_screenshots** - The graph diagrams shown in the main repository README.md are stored here.

- **.ghidra.zip** - This archive contains the config/persistence files that must be copied to the users home area, see above.
