# Returns replacement ZP08 between lines containing "; 364E" and "; 3650" form xxx.txt source file
# sed '/; 3601/,/; 3734/s/ZP03                          /ZP03_Sprite_Height       /' jetpac.a65

# Local Zero Page variables for Display_Sprite routine

# Display_Object
/ZP02                            equ     $0002/a ZP02_Object_Old_Height_Index    equ     $0002
/ZP03                            equ     $0003/a ZP03_Object_Old_Height          equ     $0003
/ZP04                            equ     $0004/a ZP04_Object_Old_UDG_RAM_Lo      equ     $0004
/ZP05                            equ     $0005/a ZP05_Object_Old_UDG_RAM_Hi      equ     $0005
/ZP06                            equ     $0006/a ZP06_Object_Old_UDG_Data_Lo     equ     $0006
/ZP07                            equ     $0007/a ZP07_Object_Old_UDG_Data_Hi     equ     $0007

/ZP08                            equ     $0008/a ZP08_Object_Old_Y_Index         equ     $0008
/ZP09                            equ     $0009/a ZP09_Object_New_Y_Index         equ     $0009

/ZP0A                            equ     $000A/a ZP0A_Object_New_Height_Index    equ     $000A
/ZP0B                            equ     $000B/a ZP0B_Object_New_Height          equ     $000B
/ZP0C                            equ     $000C/a ZP0C_Object_New_UDG_RAM_Lo      equ     $000C
/ZP0D                            equ     $000D/a ZP0D_Object_New_UDG_RAM_Hi      equ     $000D
/ZP0E                            equ     $000E/a ZP0E_Object_New_UDG_Data_Lo     equ     $000E
/ZP0F                            equ     $000F/a ZP0F_Object_New_UDG_Data_Hi     equ     $000F

/ZP11                            equ     $0011/a ZP11_Object_Old_Position_Y      equ     $0011

/ZP13                            equ     $0013/a ZP13_Object_Lines_To_Erase      equ     $0013

/ZP14                            equ     $0014/a ZP14_Object_Old_Width_Bytes     equ     $0014
/ZP15                            equ     $0015/a ZP15_Object_New_Width_Bytes     equ     $0015

/ZP19                            equ     $0019/a ZP19_Object_New_Position_Y      equ     $0019

/; 3601/,/; 3734/s/ZP02                           /ZP02_Object_Old_Height_Index   /
/; 3601/,/; 3734/s/ZP03                           /ZP03_Object_Old_Height         /
/; 3601/,/; 3734/s/ZP04                           /ZP04_Object_Old_UDG_RAM_Lo     /
/; 3601/,/; 3734/s/(ZP04),y                       /(ZP04_Object_Old_UDG_RAM_Lo),y /
/; 3601/,/; 3734/s/ZP05                           /ZP05_Object_Old_UDG_RAM_Hi     /
/; 3601/,/; 3734/s/ZP06                           /ZP06_Object_Old_UDG_Data_Lo    /
/; 3601/,/; 3734/s/(ZP06),y                       /(ZP06_Object_Old_UDG_Data_Lo),y/
/; 3601/,/; 3734/s/ZP07                           /ZP07_Object_Old_UDG_Data_Hi    /

/; 3601/,/; 3734/s/ZP08                           /ZP08_Object_Old_Y_Index        /
/; 3601/,/; 3734/s/ZP09                           /ZP09_Object_New_Y_Index        /

/; 3601/,/; 3734/s/ZP0A                           /ZP0A_Object_New_Height_Index   /
/; 3601/,/; 3734/s/ZP0B                           /ZP0B_Object_New_Height         /
/; 3601/,/; 3734/s/ZP0C                           /ZP0C_Object_New_UDG_RAM_Lo     /
/; 3601/,/; 3734/s/(ZP0C),y                       /(ZP0C_Object_New_UDG_RAM_Lo),y /
/; 3601/,/; 3734/s/ZP0D                           /ZP0D_Object_New_UDG_RAM_Hi     /
/; 3601/,/; 3734/s/ZP0E                           /ZP0E_Object_New_UDG_Data_Lo    /
/; 3601/,/; 3734/s/(ZP0E),y                       /(ZP0E_Object_New_UDG_Data_Lo),y/
/; 3601/,/; 3734/s/ZP0F                           /ZP0F_Object_New_UDG_Data_Hi    /

/; 3601/,/; 3734/s/ZP11                           /ZP11_Object_Old_Position_Y     /

/; 3601/,/; 3734/s/ZP13                           /ZP13_Object_Lines_To_Erase     /

/; 3601/,/; 3734/s/ZP14                           /ZP14_Object_Old_Width_Bytes    /
/; 3601/,/; 3734/s/ZP15                           /ZP15_Object_New_Width_Bytes    /

/; 3601/,/; 3734/s/ZP19                           /ZP19_Object_New_Position_Y     /


# Get_Obj_UDG_Data_Addr_JM_Alien
/ZP10                            equ     $0010/a ZP10_Object_Position_X          equ     $0010
/ZP12                            equ     $0012/a ZP12_Object_Type                equ     $0012
/ZP18                            equ     $0018/a ZP18_Object_Position_X          equ     $0018
/ZP1A                            equ     $001A/a ZP1A_Object_Type                equ     $001A

/; 37D4/,/; 381C/s/ZP10                           /ZP10_Object_Position_X         /
/; 37D4/,/; 381C/s/ZP12                           /ZP12_Object_Type               /
/; 37D4/,/; 381C/s/ZP18                           /ZP18_Object_Position_X         /
/; 37D4/,/; 381C/s/ZP1A                           /ZP1A_Object_Type               /


# Colorize_Object
/ZP0A                            equ     $000A/a ZP0A_Color_RAM_Tiles_X          equ     $000A
/ZP0B                            equ     $000B/a ZP0B_Color_RAM_Tiles_Y          equ     $000B
/ZP0C                            equ     $000C/a ZP0C_Color_RAM_Tile_Addr_Lo     equ     $000C
/ZP16                            equ     $0016/a ZP16_Object_Size_X_Columns      equ     $0016
/ZP17                            equ     $0017/a ZP17_Object_Size_Y_Pixels       equ     $0017
#/ZP18                            equ     $0018/a ZP18_Object_Position_X_         equ     $0018 ALREADY DEFINED
/ZP19                            equ     $0019/a ZP19_Object_Position_Y          equ     $0019

/; 381F/,/; 385E/s/ZP0A                           /ZP0A_Color_RAM_Tiles_X         /
/; 381F/,/; 385E/s/ZP0B                           /ZP0B_Color_RAM_Tiles_Y         /
/; 381F/,/; 385E/s/ZP0C                           /ZP0C_Color_RAM_Tile_Addr_Lo    /
/; 381F/,/; 385E/s/(ZP0C),y                       /(ZP0C_Color_RAM_Tile_Addr_Lo),y/
/; 381F/,/; 385E/s/ZP16                           /ZP16_Object_Size_X_Columns     /
/; 381F/,/; 385E/s/ZP17                           /ZP17_Object_Size_Y_Pixels      /
#/; 381F/,/; 385E/s/ZP18                           /ZP18_Object_Position_X         / ALREADY DEFINED
/; 381F/,/; 385E/s/ZP19                           /ZP19_Object_Position_Y         /


# Load_Obj_UDG_RAM_Addr_Size_JM
/ZP03                            equ     $0003/a ZP03_Object_Height_Pixels       equ     $0003
/ZP04                            equ     $0004/a ZP04_Object_Position_X          equ     $0004
/ZP05                            equ     $0005/a ZP05_Object_Position_Y          equ     $0005
/ZP04                            equ     $0004/a ZP04_Object_UDG_RAM_Addr_Lo     equ     $0004
/ZP05                            equ     $0005/a ZP05_Object_UDG_RAM_Addr_Hi     equ     $0005
/ZP06                            equ     $0006/a ZP06_Object_UDG_Data_Addr_Lo    equ     $0006
/ZP07                            equ     $0007/a ZP07_Object_UDG_Data_Addr_Hi    equ     $0007
#/ZP10                            equ     $0010/a ZP10_Object_Position_X          equ     $0010 ALREADY DEFINED
/ZP11                            equ     $0011/a ZP11_Object_Position_Y          equ     $0011
/ZP14                            equ     $0014/a ZP14_Object_Width_Bytes         equ     $0014

/; 378A/,/; 37D3/s/ZP03                           /ZP03_Object_Height_Pixels      /
# Usages changes partway through routine - Start
/; 378A/,/; 37AB/s/ZP04                           /ZP04_Object_Position_X         /
/; 378A/,/; 37AB/s/ZP05                           /ZP05_Object_Position_Y         /
/; 37AE/,/; 37D3/s/ZP04                           /ZP04_Object_UDG_RAM_Addr_Lo    /
/; 37AE/,/; 37D3/s/ZP05                           /ZP05_Object_UDG_RAM_Addr_Hi    /
# Usages changes partway through routine - End
/; 378A/,/; 37D3/s/ZP06                           /ZP06_Object_UDG_Data_Addr_Lo   /
/; 378A/,/; 37D3/s/(ZP06),y                       /(ZP06_Object_UDG_Data_Addr_Lo),y/
/; 378A/,/; 37D3/s/ZP07                           /ZP07_Object_UDG_Data_Addr_Hi   /
/; 378A/,/; 37D3/s/ZP10                           /ZP10_Object_Position_X         /
/; 378A/,/; 37D3/s/ZP11                           /ZP11_Object_Position_Y         /
/; 378A/,/; 37D3/s/ZP14                           /ZP14_Object_Width_Bytes        /


# Load_Obj_UDG_RAM_Addr_Size_V
#/ZP04                            equ     $0004/a ZP04_Object_UDG_RAM_Addr_Lo     equ     $0004 ALREADY DEFINED
#/ZP05                            equ     $0005/a ZP05_Object_UDG_RAM_Addr_Hi     equ     $0005 ALREADY DEFINED
#/ZP04                            equ     $0004/a ZP04_Object_UDG_RAM_Addr_Lo     equ     $0004 ALREADY DEFINED
#/ZP05                            equ     $0005/a ZP05_Object_UDG_RAM_Addr_Hi     equ     $0005 ALREADY DEFINED
/ZP0B                            equ     $000B/a ZP0B_Object_Height_Pixels       equ     $000B
/ZP0C                            equ     $000C/a ZP0C_Object_UDG_RAM_Addr_Lo     equ     $000C
/ZP0D                            equ     $000D/a ZP0D_Object_UDG_RAM_Addr_Hi     equ     $000D
/ZP0E                            equ     $000E/a ZP0E_Object_UDG_Data_Addr_Lo    equ     $000E
/ZP0F                            equ     $000F/a ZP0F_Object_UDG_Data_Addr_Hi    equ     $000F
/ZP15                            equ     $0015/a ZP15_Object_Width_Bytes         equ     $0015
/ZP16                            equ     $0016/a ZP16_Object_Width_Bytes         equ     $0016
/ZP17                            equ     $0017/a ZP17_Object_Height_Pixels       equ     $0017
#/ZP18                            equ     $0018/a ZP18_Object_Position_X          equ     $0018
#/ZP19                            equ     $0019/a ZP19_Object_Position_Y          equ     $0019

# Usages changes partway through routine - Start
/; 3737/,/; 375D/s/ZP04                           /ZP04_Object_Position_X         /
/; 3737/,/; 375D/s/ZP05                           /ZP05_Object_Position_Y         /
/; 3760/,/; 3789/s/ZP04                           /ZP04_Object_UDG_RAM_Addr_Lo    /
/; 3760/,/; 3789/s/ZP05                           /ZP05_Object_UDG_RAM_Addr_Hi    /
# Usages changes partway through routine - End
/; 3737/,/; 3789/s/ZP0B                           /ZP0B_Object_Height_Pixels      /
/; 3737/,/; 3789/s/ZP0C                           /ZP0C_Object_UDG_RAM_Addr_Lo    /
/; 3737/,/; 3789/s/ZP0D                           /ZP0D_Object_UDG_RAM_Addr_Hi    /
/; 3737/,/; 3789/s/ZP0E                           /ZP0E_Object_UDG_Data_Addr_Lo   /
/; 3737/,/; 3789/s/(ZP0E),y                       /(ZP0E_Object_UDG_Data_Addr_Lo),y/
/; 3737/,/; 3789/s/ZP0F                           /ZP0F_Object_UDG_Data_Addr_Hi   /
/; 3737/,/; 3789/s/ZP15                           /ZP15_Object_Width_Bytes        /
/; 3737/,/; 3789/s/ZP16                           /ZP16_Object_Width_Bytes        /
/; 3737/,/; 3789/s/ZP17                           /ZP17_Object_Height_Pixels      /
/; 3737/,/; 3789/s/ZP18                           /ZP18_Object_Position_X         /
/; 3737/,/; 3789/s/ZP19                           /ZP19_Object_Position_Y         /
