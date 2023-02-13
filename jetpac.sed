# Returns replacement ZP08 between lines containing "; 364E" and "; 3650" form xxx.txt source file
# sed '/; 3601/,/; 3734/s/ZP03                          /ZP03_Sprite_Height       /' jetpac.a65

# Local Zero Page variables for Display_Sprite routine

/ZP02                            equ     $0002/a ZP02_Object_Old_Height_Index    equ     $0002
/ZP03                            equ     $0003/a ZP03_Object_Old_Height          equ     $0003
# ZP04
# ZP05
/ZP06                            equ     $0006/a ZP06_Object_Old_UDG_Stat_Lo     equ     $0006
/ZP07                            equ     $0007/a ZP07_Object_Old_UDG_Stat_Hi     equ     $0007


/ZP08                            equ     $0008/a ZP08_Object_Y_Index_Old         equ     $0008
/ZP09                            equ     $0009/a ZP09_Object_Y_Index_New         equ     $0009


/ZP0A                            equ     $000A/a ZP0A_Object_New_Height_Index    equ     $000A
/ZP0B                            equ     $000B/a ZP0B_Object_New_Height          equ     $000B
# ZP0C
# ZP0D
/ZP0E                            equ     $000E/a ZP0E_Object_New_UDG_Stat_Lo     equ     $000E
/ZP0F                            equ     $000F/a ZP0F_Object_New_UDG_Stat_Hi     equ     $000F


/ZP13                            equ     $0013/a ZP13_Object_Lines_To_Erase      equ     $0013


/ZP14                            equ     $0014/a ZP14_Object_Old_Width_Bytes     equ     $0014
/ZP15                            equ     $0015/a ZP15_Object_New_Width_Bytes     equ     $0015



/; 3601/,/; 3734/s/ZP02                           /ZP02_Object_Old_Height_Index   /
/; 3601/,/; 3734/s/ZP03                           /ZP03_Object_Old_Height         /
/; 3601/,/; 3734/s/ZP06                           /ZP06_Object_Old_UDG_Stat_Lo    /
/; 3601/,/; 3734/s/(ZP06),y                       /(ZP06_Object_Old_UDG_Stat_Lo),y/
/; 3601/,/; 3734/s/ZP07                           /ZP07_Object_Old_UDG_Stat_Hi    /


/; 3601/,/; 3734/s/ZP08                           /ZP08_Object_Y_Index_Old        /
/; 3601/,/; 3734/s/ZP09                           /ZP09_Object_Y_Index_New        /


/; 3601/,/; 3734/s/ZP0A                           /ZP0A_Object_New_Height_Index   /
/; 3601/,/; 3734/s/ZP0B                           /ZP0B_Object_New_Height         /
/; 3601/,/; 3734/s/ZP0E                           /ZP0E_Object_New_UDG_Stat_Lo    /
/; 3601/,/; 3734/s/(ZP0E),y                       /(ZP0E_Object_New_UDG_Stat_Lo),y/
/; 3601/,/; 3734/s/ZP0F                           /ZP0F_Object_New_UDG_Stat_Hi    /


/; 3601/,/; 3734/s/ZP13                           /ZP13_Object_Lines_To_Erase     /


/; 3601/,/; 3734/s/ZP14                           /ZP14_Object_Old_Width_Bytes    /
/; 3601/,/; 3734/s/ZP15                           /ZP15_Object_New_Width_Bytes    /