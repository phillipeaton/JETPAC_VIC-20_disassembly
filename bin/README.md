# Final Reassembled Binary File

- **jetpac.bin** - This file is created by the assembler using the reverse-engineered source code. Note, you can't easily load and run this file, it's not a .prg file. When assembled, it should be the same as **jetpac_2000-3fff.bin** in the bin_orig directory. You could convert this file to a .prg file by assembling the small relocation code below to a binary and concatenating jetpac.bin using `copy /b relocator_code.bin + jetpac.bin` at a Windows command prompt.

The relocation code is:

```Assembly
1210 sei
1211 ldy #$20
1213 ldx #S00
1215 lda $312a, x
1218 sta $3f00, x
121B dex
121C bne $1215
121E dec $1217
1221 dec $121a
1224 dey
1225 bne $1213
1227 jmp $201d
```
