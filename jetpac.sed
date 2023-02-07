# Returns replacement ZP08 between lines containing "; 364E" and "; 3650" form xxx.txt source file
# sed '/; 3601/,/; 3734/s/ZP03                          /ZP03_Sprite_Tile_Height       /' jetpac.a65

# Local Zero Page variables for Display_Sprite routine

/ZP02                            equ/a ZP02_Sprite_Tile_Height_Index   equ/
/ZP03                            equ/a ZP03_Sprite_Tile_Height         equ/

/ZP08                            equ/a ZP08_Sprite_Y_Index_Old         equ/
/ZP09                            equ/a ZP09_Sprite_Y_Index_New         equ/

/ZP0A                            equ/a ZP02_Sprite_Tile_Height_Index   equ/
/ZP0B                            equ/a ZP0B_Sprite_Tile_Height         equ/

/ZP13                            equ/a ZP13_Sprite_Lines_To_Erase      equ/


/; 3601/,/; 3734/s/ZP02                          /ZP02_Sprite_Tile_Height_Index /
/; 3601/,/; 3734/s/ZP03                          /ZP03_Sprite_Tile_Height       /

/; 3601/,/; 3734/s/ZP08                          /ZP08_Sprite_Y_Index_Old       /
/; 3601/,/; 3734/s/ZP09                          /ZP09_Sprite_Y_Index_New       /

/; 3601/,/; 3734/s/ZP0A                          /ZP0A_Sprite_Tile_Height_Index /
/; 3601/,/; 3734/s/ZP0B                          /ZP0B_Sprite_Tile_Height       /

/; 3601/,/; 3734/s/ZP13                          /ZP13_Sprite_Lines_To_Erase    /
