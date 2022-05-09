# JETPAC_VIC-20_disassembly

A reverse-engineering to 6502 assembly source code of the classic VIC-20 game, JETPAC, by ULTIMATE PLAY THE GAME.

## Why bother?

JETPAC was one of my favourite games on the VIC-20 in the early '80s, the smooth movement of the sprites and execellent gameplay mechanics made it a standout title.

I wanted to look into the code to see how it all works and there is a disassembly for the ZX Spectrum in Skoolkit format. It looks great, but I can't get on with the HTML formatting across multiple pages, lack of address labels and inabilty to use hex and decimal at the same time.

## So what's this project?

Instead, I thought I'd utilize the dasmfw disassembler to reverse engineer the VIC-20 version, after using dasmfw very successfully on a previous project for 6809. 

dasmfw was originally created for 6809 code and targets the a09 assembler, but the 6502 functionality is somewhat new and untested and the a09 assembler doesn't assemble 6502, so instead I'm working initially with the as65 assembler.

## What's the end state?

I don't know how detailed I'll go into the code with this project, but you have to start somewhere, so let's see how I get on.

### Phillip Eaton 2022-05-09
