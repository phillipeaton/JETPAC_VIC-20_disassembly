# GNU Make version 3.78.1 from unxutils doesn't work unless you supply full path to programs.
# winget install GnuWin32.Make seems to work better, or get v3.81 from somewhere.
# Ensure the lines with commands start with a tab, not spaces.

# Executables
AS65          = utils/as65.exe
DASMFW        = utils/dasmfw.exe
SED           = utils/sed.exe
MD5SUM        = utils/md5sum.exe
RM            = utils/rm.exe

# Binary creation
BIN_ORIG      = bin_orig/jetpac_2000-3fff.bin
BIN           = bin/jetpac.bin
BIN_LIST      = bin/jetpac.lst

# Intemediate and final source code
SOURCE        = dasmfw/jetpac.a65
SOURCE_DASMFW = dasmfw/jetpac_dasmfw.a65

# sed script for post-disassembly local label processing
SED_SCRIPT    = dasmfw/jetpac.sed

# Info files that control the disassembler, backslash needed, else dasmfw fails
INFO_FILES    = dasmfw/*.nfo
INFO_INCLUDE  = dasmfw\nfo_include.nfo


# Reassemble the source code if it has been updated
$(BIN): $(SOURCE)
	@echo ""; echo "***** Reassemble source code *****"
	$(AS65) -v -o$(BIN) -l$(BIN_LIST) $(SOURCE)

	@echo ""; echo "***** Compare reassembled vs original binary *****"
	$(MD5SUM) $(BIN) $(BIN_ORIG)

# Process the disassembled source if either the sed script or the source has has been updated
$(SOURCE): $(SED_SCRIPT) $(SOURCE_DASMFW)
	@echo ""; echo "***** Apply local labels *****"
	$(SED) -f $(SED_SCRIPT) $(SOURCE_DASMFW) > $(SOURCE)

# Disassemble the original binary to source code if any of the info files have been updated
# NOTE parameters/paths also specified in the info files
$(SOURCE_DASMFW): $(INFO_FILES)
	@echo ""; echo "***** Disassemble binary *****"
	$(DASMFW) -info=$(INFO_INCLUDE)

# .PHONY is a make reserved word that forces "make clean" to always run
.PHONY: clean

# Minus in front of rm means ignore errors i.e. if file to be rm'd doesn't exist
clean:
	-$(RM) $(BIN) $(BIN_LIST) $(SOURCE) $(SOURCE_DASMFW)