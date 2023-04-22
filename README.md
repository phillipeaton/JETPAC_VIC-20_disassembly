# JETPAC_VIC-20_disassembly

A reverse-engineering to 6502 assembly source code of the classic VIC-20 game, JETPAC, by ULTIMATE PLAY THE GAME.


## Why bother?

JETPAC was one of my favourite games on the VIC-20 in the early '80s, the smooth movement of the sprites and excellent game play mechanics made it a standout title. I wanted to look into the code to see how it all works.

There are a couple of disassemblies for the ZX Spectrum in Skoolkit format that look great, but I can't get on with the HTML formatting across multiple pages and inability to use hex and decimal at the same time. And besides, what better way to learn than doing it yourself for the platform you remember?

## So what's this project?

Instead, I thought I'd utilize the dasmfw disassembler to reverse engineer the VIC-20 version, after using dasmfw very successfully on a previous project for 6809.

dasmfw was originally created for 6809 code and targets the a09 assembler, but the 6502 functionality is somewhat new and untested and the a09 assembler doesn't assemble 6502, so instead I'm working initially with the as65 assembler.

## What's the end state?

I don't know how detailed I'll go into the code with this project, but you have to start somewhere, so let's see how I get on.

## Status

Tools are setup, dasmfw can disassemble the binary, as65 can reassemble it to an identical binary.

MAME is setup as the debugger, I'm using MAME over VICE mainly because I'm used to it and, crucially for me, with MAME you can alter the width of the memory dump windows, AFAIK you can't do that with VICE.

All the code has been analyzed and understood at least once, but documenting it all consistently takes a lot of time, but most of it is already pretty readable.

- Code/Data/Graphics sections are 100% identified.
- Memory map is 100% complete (see also Excel spreadsheet)
- Zero Page and other variables ~75% identified.
- Code labels and commenting ~60% complete.

#### Phillip Eaton 2022-05-09
