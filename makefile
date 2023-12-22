# GNU Make version 3.78.1 from unxutils doesn't work unless you supply full path to programs.
# winget install GnuWin32.Make seems to work better, or get v3.81 from somewhere.
# Ensure the line with commands start with a tab, not spaces.

jetpac.bin: jetpac.a65
	as65.exe -v -ojetpac.bin jetpac.a65
	sha1sum.exe jetpac.bin jetpac_2000-3fff.bin

jetpac.a65: jetpac.sed jetpac_dasmfw.a65
	sed -f jetpac.sed jetpac_dasmfw.a65 > jetpac.a65

jetpac_dasmfw.a65: *.nfo
	dasmfw.exe -info="nfo_include.nfo"

# .PHONY is a special word that is used to make clean run always
.PHONY: clean

# Minus in front of rm stops command failing if file to be rm'd doesn't exist
clean:
	-rm jetpac.bin         # as65 output
	-rm jetpac.lst         # as65 output
	-rm jetpac.a65         # sed output
	-rm jetpac_dasmfw.a65  # dasmfw output