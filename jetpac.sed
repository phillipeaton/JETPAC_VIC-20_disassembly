# Returns replacement ZP08 between lines containing "; 364E" and "; 3650" form xxx.txt source file
# sed '/; 3601/,/; 3734/s/ZP03                           /ZP03_Sprite_Height        /' jetpac.a65

# Local Zero Page variables for Display_Sprite routine

# Init_Laser_Objects
/ZP06                            equ     $0006/a ZP06_Laser_Old_State_Lo         equ     $0006
/ZP07                            equ     $0007/a ZP07_Laser_Old_State_Hi         equ     $0007
/ZP06                            equ     $0006/a ZP06_Laser_New_State_Lo         equ     $0006
/ZP08                            equ     $0008/a ZP08_Laser_Position_X_Start     equ     $0008
/; 20E9/,/; 210F/s/ZP06                            /ZP06_Laser_Old_State_Lo         /
/; 20E9/,/; 210F/s/(ZP06),y                        /(ZP06_Laser_Old_State_Lo),y     /
/; 20E9/,/; 210F/s/ZP07                            /ZP07_Laser_Old_State_Hi         /
/; 2110/,/; 2192/s/(ZP06),y                        /(ZP06_Laser_New_State_Lo),y     /
/; 20E9/,/; 2192/s/ZP08                            /ZP08_Laser_Position_X_Start     /

# DISPLAY_LASERS
/ZP02                            equ     $0002/a ZP02_Laser_Param_Countdown      equ     $0002
/ZP04                            equ     $0004/a ZP04_Laser_Position_X           equ     $0004
/ZP05                            equ     $0005/a ZP05_Laser_Position_Y           equ     $0005
/ZP04                            equ     $0004/a ZP04_Laser_UDG_RAM_Addr_Lo      equ     $0004
/ZP05                            equ     $0005/a ZP05_Laser_UDG_RAM_Addr_Hi      equ     $0005
/ZP06                            equ     $0006/a ZP06_Laser_Position_X           equ     $0006
/ZP07                            equ     $0007/a ZP07_Laser_Length_Columns       equ     $0007
/ZP0C                            equ     $000C/a ZP0C_Colour_RAM_Tile_Addr_Lo    equ     $000C
/ZP13                            equ     $0013/a ZP13_Laser_Position_Y           equ     $0013
/ZP14                            equ     $0014/a ZP14_Laser_Decay_Patten_Data_0  equ     $0014
/ZP15                            equ     $0015/a ZP15_Laser_Decay_Patten_Data_1  equ     $0015
/ZP16                            equ     $0016/a ZP16_Laser_Decay_Patten_Data_2  equ     $0016
/ZP17                            equ     $0017/a ZP17_Laser_Decay_Patten_Data_3  equ     $0017
/ZP1B                            equ     $001B/a ZP1B_Laser_Colour               equ     $001B
/; 2195/,/; 22B9/s/ZP02                            /ZP02_Laser_Param_Countdown      /

/; 2195/,/; 21BE/s/ZP04                            /ZP04_Laser_Position_X           /
/; 2195/,/; 21BE/s/ZP05                            /ZP05_Laser_Position_Y           /

/; 21C1/,/; 2254/s/ZP04                            /ZP04_Laser_UDG_RAM_Addr_Lo      /
/; 21C1/,/; 2254/s/(ZP04),y                        /(ZP04_Laser_UDG_RAM_Addr_Lo),y  /
/; 21C1/,/; 2254/s/ZP05                            /ZP05_Laser_UDG_RAM_Addr_Hi      /

/; 2257/,/; 226E/s/ZP04                            /ZP04_Laser_Position_X           /
/; 2257/,/; 226E/s/ZP05                            /ZP05_Laser_Position_Y           /

/; 2271/,/; 22B9/s/ZP04                            /ZP04_Laser_UDG_RAM_Addr_Lo      /
/; 2271/,/; 22B9/s/(ZP04),y                        /(ZP04_Laser_UDG_RAM_Addr_Lo),y  /
/; 2271/,/; 22B9/s/ZP05                            /ZP05_Laser_UDG_RAM_Addr_Hi      /

/; 2195/,/; 22B9/s/ZP06                            /ZP06_Laser_Position_X           /
/; 2195/,/; 22B9/s/ZP07                            /ZP07_Laser_Length_Columns       /
/; 2195/,/; 22B9/s/ZP0C                            /ZP0C_Colour_RAM_Tile_Addr_Lo    /
/; 2195/,/; 22B9/s/(ZP0C),y                        /(ZP0C_Colour_RAM_Tile_Addr_Lo),y/
/; 2195/,/; 22B9/s/ZP13                            /ZP13_Laser_Position_Y           /
/; 2195/,/; 22B9/s/ZP14                            /ZP14_Laser_Decay_Patten_Data_0  /
/; 2195/,/; 22B9/s/ZP15                            /ZP15_Laser_Decay_Patten_Data_1  /
/; 2195/,/; 22B9/s/ZP16                            /ZP16_Laser_Decay_Patten_Data_2  /
/; 2195/,/; 22B9/s/ZP17                            /ZP17_Laser_Decay_Patten_Data_3  /
/; 2195/,/; 22B9/s/ZP1B                            /ZP1B_Laser_Colour               /

# Display_Number_Of_Lives
/ZP06                            equ     $0006/a ZP06_Character_To_Copy          equ     $0006
/; 238E/,/; 23B3/s/ZP06                            /ZP06_Character_To_Copy          /

# Display_1UP_HI_2UP_Text
/ZP04                            equ     $0004/a ZP04_Position_X                 equ     $0004
/ZP05                            equ     $0005/a ZP05_Position_Y                 equ     $0005
/ZP0E                            equ     $000E/a ZP0E_String_Addr_Lo             equ     $000E
/ZP0F                            equ     $000F/a ZP0F_String_Addr_Hi             equ     $000F
/; 2429/,/; 244F/s/ZP04                            /ZP04_Position_X                 /
/; 2429/,/; 244F/s/ZP05                            /ZP05_Position_Y                 /
/; 2429/,/; 244F/s/ZP0E                            /ZP0E_String_Addr_Lo             /
/; 2429/,/; 244F/s/ZP0F                            /ZP0F_String_Addr_Hi             /

# Loop_Display_Game_Select
#/ZP04                            equ     $0004/a ZP04_Position_X                 equ     $0004
#/ZP05                            equ     $0005/a ZP05_Position_Y                 equ     $0005
/ZP08                            equ     $0008/a ZP08_Row_Offset_Table_Index     equ     $0008
#/ZP0E                            equ     $000E/a ZP0E_String_Addr_Lo             equ     $000E
#/ZP0F                            equ     $000F/a ZP0F_String_Addr_Hi             equ     $000F
/; 24EB/,/; 251E/s/ZP04                            /ZP04_Position_X                 /
/; 24EB/,/; 251E/s/ZP05                            /ZP05_Position_Y                 /
/; 24EB/,/; 251E/s/ZP08                            /ZP08_Row_Offset_Table_Index     /
/; 24EB/,/; 251E/s/ZP0E                            /ZP0E_String_Addr_Lo             /
/; 24EB/,/; 251E/s/ZP0F                            /ZP0F_String_Addr_Hi             /

# SOUND_UPDATE
/ZP08                            equ     $0008/a ZP08_Subroutine_Addr_Lo         equ     $0008
/ZP09                            equ     $0009/a ZP09_Subroutine_Addr_Hi         equ     $0009
/; 26D7/,/; 26E1/s/ZP08                            /ZP08_Subroutine_Addr_Lo         /
/; 26D7/,/; 26E1/s/(ZP08)                          /(ZP08_Subroutine_Addr_Lo)       /
/; 26D7/,/; 26E1/s/ZP09                            /ZP09_Subroutine_Addr_Hi         /

# Check_New_Hi_Score
/ZP_Obj_List_Ptr_Lo              equ     $0000/a ZP00_Hi_Score_Addr              equ     $0000
/ZP08                            equ     $0008/a ZP08_Player_Score_Addr          equ     $0008
/; 277A/,/; 27A9/s/(ZP_Obj_List_Ptr_Lo),y          /(ZP00_Hi_Score_Addr),y          /
/; 277A/,/; 27A9/s/(ZP08),y                        /(ZP08_Player_Score_Addr),y      /


# Display_Rocket_Flame
#/ZP04                            equ     $0004/a ZP04_UDG_RAM_Addr_Lo            equ     $0004
#/ZP05                            equ     $0005/a ZP05_UDG_RAM_Addr_Hi            equ     $0005
#/ZP0C                            equ     $000C/a ZP0C_Colour_RAM_Tile_Addr_Lo    equ     $000C
/ZP11                            equ     $0011/a ZP11_Object_Ship_Position_Y     equ     $0011
/ZP18                            equ     $0018/a ZP18_Object_Flame_Position_X    equ     $0018
/ZP19                            equ     $0019/a ZP19_Object_Flame_Position_Y    equ     $0019
/; 27AA/,/; 2839/s/ZP04                            /ZP04_Object_Position_X          /
/; 27AA/,/; 2839/s/ZP05                            /ZP05_Object_Position_Y          /
/; 27AA/,/; 2839/s/(ZP0C),y                        /(ZP0C_Colour_RAM_Tile_Addr_Lo),y/
/; 27AA/,/; 2839/s/ZP11                            /ZP11_Object_Ship_Position_Y     /
/; 27AA/,/; 2839/s/ZP18                            /ZP18_Object_Flame_Position_X    /
/; 27AA/,/; 2839/s/ZP19                            /ZP19_Object_Flame_Position_Y    /

# VALUABLES
/; 2874/,/; 2885/s/ZP08                            /ZP08_Subroutine_Addr_Lo         /
/; 2874/,/; 2885/s/(ZP08)                          /(ZP08_Subroutine_Addr_Lo)       /
/; 2874/,/; 2885/s/ZP09                            /ZP09_Subroutine_Addr_Hi         /

# Test_Laser_Hits
/ZP02                            equ     $0002/a ZP02_Num_Lasers_Countdown       equ     $0002
/ZP06                            equ     $0006/a ZP06_Object_Position_Y          equ     $0006
/ZP07                            equ     $0007/a ZP07_Object_Position_X          equ     $0007
/ZP08                            equ     $0008/a ZP08_Object_Laser_Addr_Lo       equ     $0008
/ZP09                            equ     $0009/a ZP09_Object_Laser_Addr_Hi       equ     $0009
/; 2BF8/,/; 2C69/s/ZP02                            /ZP02_Num_Lasers_Countdown       /
/; 2BF8/,/; 2C69/s/ZP06                            /ZP06_Object_Position_Y          /
/; 2BF8/,/; 2C69/s/ZP07                            /ZP07_Object_Position_X          /
/; 2BF8/,/; 2C69/s/ZP08                            /ZP08_Object_Laser_Addr_Lo       /
/; 2BF8/,/; 2C69/s/(ZP08),y                        /(ZP08_Object_Laser_Addr_Lo),y   /
/; 2BF8/,/; 2C69/s/ZP09                            /ZP09_Object_Laser_Addr_Hi       /
/; 2BF8/,/; 2C69/s/(ZP09),y                        /(ZP09_Object_Laser_Addr_Hi),y   /

# Alien_Hit_Update_Score
/ZP02                            equ     $0002/a ZP02_Score_Byte_Hi              equ     $0002
/ZP03                            equ     $0003/a ZP03_Score_Byte_Lo              equ     $0003
/; 2C78/,/; 2C8F/s/ZP02                            /ZP02_Score_Byte_Hi              /
/; 2C78/,/; 2C8F/s/ZP03                            /ZP03_Score_Byte_Lo              /

# Init_Alien_Object_Next
/ZP02                            equ     $0002/a ZP02_Num_Aliens_Countdown       equ     $0002
/; 2CF1/,/; 2D0E/s/ZP02                            /ZP02_Num_Aliens_Countdown       /

#Init_Alien_Object
/ZP02                            equ     $0002/a ZP02_Colour_Random_0_or_1       equ     $0002
/; 2D0F/,/; 2D49/s/ZP02                            /ZP02_Colour_Random_0_or_1       /





# Test_Platform_Collision
/ZP02                            equ     $0002/a ZP02_Collision_Status           equ     $0002
/ZP08                            equ     $0008/a ZP08_Platfm_Data_Tbl_Addr_Lo    equ     $0008
/ZP09                            equ     $0009/a ZP08_Platfm_Data_Tbl_Addr_Hi    equ     $0009
/ZP0A                            equ     $000A/a ZP0A_Platform_Quantity          equ     $000A
/ZP0B                            equ     $000B/a ZP0B_CALC_FRM_PLAT_Y_OBJ_Y_DIF  equ     $000B
/ZP0E                            equ     $000E/a ZP0E_Object_Position_X          equ     $000E
/ZP0F                            equ     $000F/a ZP0F_Object_Position_Y          equ     $000F
/; 309B/,/; 3151/s/ZP02                            /ZP02_Collision_Status           /
/; 309B/,/; 3151/s/ZP08                            /ZP08_Platfm_Data_Tbl_Addr_Lo    /
/; 309B/,/; 3151/s/(ZP08),y                        /(ZP08_Platfm_Data_Tbl_Addr_Lo),y/
/; 309B/,/; 3151/s/ZP09                            /ZP08_Platfm_Data_Tbl_Addr_Hi    /
/; 309B/,/; 3151/s/ZP0A                            /ZP0A_Platform_Quantity          /
/; 309B/,/; 3151/s/ZP0B                            /ZP0B_CALC_FRM_PLAT_Y_OBJ_Y_DIF  /
/; 309B/,/; 3151/s/ZP0E                            /ZP0E_Object_Position_X          /
/; 309B/,/; 3151/s/ZP0F                            /ZP0F_Object_Position_Y          /











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

/; 3601/,/; 3734/s/ZP02                            /ZP02_Object_Old_Height_Index    /
/; 3601/,/; 3734/s/ZP03                            /ZP03_Object_Old_Height          /
/; 3601/,/; 3734/s/ZP04                            /ZP04_Object_Old_UDG_RAM_Lo      /
/; 3601/,/; 3734/s/(ZP04),y                        /(ZP04_Object_Old_UDG_RAM_Lo),y  /
/; 3601/,/; 3734/s/ZP05                            /ZP05_Object_Old_UDG_RAM_Hi      /
/; 3601/,/; 3734/s/ZP06                            /ZP06_Object_Old_UDG_Data_Lo     /
/; 3601/,/; 3734/s/(ZP06),y                        /(ZP06_Object_Old_UDG_Data_Lo),y /
/; 3601/,/; 3734/s/ZP07                            /ZP07_Object_Old_UDG_Data_Hi     /

/; 3601/,/; 3734/s/ZP08                            /ZP08_Object_Old_Y_Index         /
/; 3601/,/; 3734/s/ZP09                            /ZP09_Object_New_Y_Index         /

/; 3601/,/; 3734/s/ZP0A                            /ZP0A_Object_New_Height_Index    /
/; 3601/,/; 3734/s/ZP0B                            /ZP0B_Object_New_Height          /
/; 3601/,/; 3734/s/ZP0C                            /ZP0C_Object_New_UDG_RAM_Lo      /
/; 3601/,/; 3734/s/(ZP0C),y                        /(ZP0C_Object_New_UDG_RAM_Lo),y  /
/; 3601/,/; 3734/s/ZP0D                            /ZP0D_Object_New_UDG_RAM_Hi      /
/; 3601/,/; 3734/s/ZP0E                            /ZP0E_Object_New_UDG_Data_Lo     /
/; 3601/,/; 3734/s/(ZP0E),y                        /(ZP0E_Object_New_UDG_Data_Lo),y /
/; 3601/,/; 3734/s/ZP0F                            /ZP0F_Object_New_UDG_Data_Hi     /

/; 3601/,/; 3734/s/ZP11                            /ZP11_Object_Old_Position_Y      /

/; 3601/,/; 3734/s/ZP13                            /ZP13_Object_Lines_To_Erase      /

/; 3601/,/; 3734/s/ZP14                            /ZP14_Object_Old_Width_Bytes     /
/; 3601/,/; 3734/s/ZP15                            /ZP15_Object_New_Width_Bytes     /

/; 3601/,/; 3734/s/ZP19                            /ZP19_Object_New_Position_Y      /


# Get_Obj_UDG_Data_Addr_JM_Alien
/ZP10                            equ     $0010/a ZP10_Object_Position_X          equ     $0010
/ZP12                            equ     $0012/a ZP12_Object_Type                equ     $0012
/ZP18                            equ     $0018/a ZP18_Object_Position_X          equ     $0018
/ZP1A                            equ     $001A/a ZP1A_Object_Type                equ     $001A
/; 37D4/,/; 381C/s/ZP10                            /ZP10_Object_Position_X          /
/; 37D4/,/; 381C/s/ZP12                            /ZP12_Object_Type                /
/; 37D4/,/; 381C/s/ZP18                            /ZP18_Object_Position_X          /
/; 37D4/,/; 381C/s/ZP1A                            /ZP1A_Object_Type                /


# Colourize_Object
/ZP0A                            equ     $000A/a ZP0A_Colour_RAM_Tiles_X         equ     $000A
/ZP0B                            equ     $000B/a ZP0B_Colour_RAM_Tiles_Y         equ     $000B
#/ZP0C                            equ     $000C/a ZP0C_Colour_RAM_Tile_Addr_Lo     equ     $000C
/ZP16                            equ     $0016/a ZP16_Object_Size_X_Columns      equ     $0016
/ZP17                            equ     $0017/a ZP17_Object_Size_Y_Pixels       equ     $0017
#/ZP18                            equ     $0018/a ZP18_Object_Position_X_         equ     $0018 ALREADY DEFINED
/ZP19                            equ     $0019/a ZP19_Object_Position_Y          equ     $0019
/; 381F/,/; 385E/s/ZP0A                            /ZP0A_Colour_RAM_Tiles_X         /
/; 381F/,/; 385E/s/ZP0B                            /ZP0B_Colour_RAM_Tiles_Y         /
/; 381F/,/; 385E/s/ZP0C                            /ZP0C_Colour_RAM_Tile_Addr_Lo    /
/; 381F/,/; 385E/s/(ZP0C),y                        /(ZP0C_Colour_RAM_Tile_Addr_Lo),y/
/; 381F/,/; 385E/s/ZP16                            /ZP16_Object_Size_X_Columns      /
/; 381F/,/; 385E/s/ZP17                            /ZP17_Object_Size_Y_Pixels       /
#/; 381F/,/; 385E/s/ZP18                            /ZP18_Object_Position_X          / ALREADY DEFINED
/; 381F/,/; 385E/s/ZP19                            /ZP19_Object_Position_Y          /


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
/; 378A/,/; 37D3/s/ZP03                            /ZP03_Object_Height_Pixels       /
# Usages changes partway through routine - Start
/; 378A/,/; 37AB/s/ZP04                            /ZP04_Object_Position_X          /
/; 378A/,/; 37AB/s/ZP05                            /ZP05_Object_Position_Y          /
/; 37AE/,/; 37D3/s/ZP04                            /ZP04_Object_UDG_RAM_Addr_Lo     /
/; 37AE/,/; 37D3/s/ZP05                            /ZP05_Object_UDG_RAM_Addr_Hi     /
# Usages changes partway through routine - End
/; 378A/,/; 37D3/s/ZP06                            /ZP06_Object_UDG_Data_Addr_Lo    /
/; 378A/,/; 37D3/s/(ZP06),y                        /(ZP06_Object_UDG_Data_Addr_Lo),y/
/; 378A/,/; 37D3/s/ZP07                            /ZP07_Object_UDG_Data_Addr_Hi    /
/; 378A/,/; 37D3/s/ZP10                            /ZP10_Object_Position_X          /
/; 378A/,/; 37D3/s/ZP11                            /ZP11_Object_Position_Y          /
/; 378A/,/; 37D3/s/ZP14                            /ZP14_Object_Width_Bytes         /


# Load_Obj_UDG_RAM_Addr_Size_V
#/ZP04                            equ     $0004/a ZP04_Object_Position_X          equ     $0004 ALREADY DEFINED
#/ZP05                            equ     $0005/a ZP05_Object_Position_Y          equ     $0005 ALREADY DEFINED
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
/; 3737/,/; 375D/s/ZP04                            /ZP04_Object_Position_X          /
/; 3737/,/; 375D/s/ZP05                            /ZP05_Object_Position_Y          /
/; 3760/,/; 3789/s/ZP04                            /ZP04_Object_UDG_RAM_Addr_Lo     /
/; 3760/,/; 3789/s/ZP05                            /ZP05_Object_UDG_RAM_Addr_Hi     /
# Usages changes partway through routine - End
/; 3737/,/; 3789/s/ZP0B                            /ZP0B_Object_Height_Pixels       /
/; 3737/,/; 3789/s/ZP0C                            /ZP0C_Object_UDG_RAM_Addr_Lo     /
/; 3737/,/; 3789/s/ZP0D                            /ZP0D_Object_UDG_RAM_Addr_Hi     /
/; 3737/,/; 3789/s/ZP0E                            /ZP0E_Object_UDG_Data_Addr_Lo    /
/; 3737/,/; 3789/s/(ZP0E),y                        /(ZP0E_Object_UDG_Data_Addr_Lo),y/
/; 3737/,/; 3789/s/ZP0F                            /ZP0F_Object_UDG_Data_Addr_Hi    /
/; 3737/,/; 3789/s/ZP15                            /ZP15_Object_Width_Bytes         /
/; 3737/,/; 3789/s/ZP16                            /ZP16_Object_Width_Bytes         /
/; 3737/,/; 3789/s/ZP17                            /ZP17_Object_Height_Pixels       /
/; 3737/,/; 3789/s/ZP18                            /ZP18_Object_Position_X          /
/; 3737/,/; 3789/s/ZP19                            /ZP19_Object_Position_Y          /


# Load_Object_Type_X_Y
#/ZP10                            equ     $0010/a ZP10_Object_Position_X          equ     $0010
#/ZP11                            equ     $0011/a ZP11_Object_Position_Y          equ     $0011
#/ZP12                            equ     $0012/a ZP12_Object_Type                equ     $0012
/; 35D7/,/; 35E8/s/ZP10                            /ZP10_Object_Position_X          /
/; 35D7/,/; 35E8/s/ZP11                            /ZP11_Object_Position_Y          /
/; 35D7/,/; 35E8/s/ZP12                            /ZP12_Object_Type                /


# Load_Object_Type_X_Y_Colour
#/ZP18                            equ     $0018/a ZP18_Object_Position_X          equ     $0018
#/ZP19                            equ     $0019/a ZP19_Object_Position_Y          equ     $0019
#/ZP1A                            equ     $001A/a ZP1A_Object_Type                equ     $001A
/ZP1B                            equ     $001B/a ZP1B_Object_Colour              equ     $001B
/; 35E9/,/; 3600/s/ZP18                            /ZP18_Object_Position_X          /
/; 35E9/,/; 3600/s/ZP19                            /ZP19_Object_Position_Y          /
/; 35E9/,/; 3600/s/ZP1A                            /ZP1A_Object_Type                /
/; 35E9/,/; 3600/s/ZP1B                            /ZP1B_Object_Colour              /

# Copy_Char_To_UDG_RAM
/ZP04                            equ     $0004/a ZP04_UDG_RAM_Addr_Lo            equ     $0004
/ZP05                            equ     $0005/a ZP05_UDG_RAM_Addr_Hi            equ     $0005
/ZP06                            equ     $0006/a ZP06_Char_ROM_Data_Addr_Lo      equ     $0006
/ZP07                            equ     $0007/a ZP07_Char_ROM_Data_Addr_Hi      equ     $0007
/; 3595/,/; 35D4/s/ZP04                            /ZP04_UDG_RAM_Addr_Lo            /
/; 3595/,/; 35D4/s/(ZP04),y                        /(ZP04_UDG_RAM_Addr_Lo),y        /
/; 3595/,/; 35D4/s/ZP05                            /ZP05_UDG_RAM_Addr_Hi            /
/; 3595/,/; 35D4/s/ZP06                            /ZP06_Char_ROM_Data_Addr_Lo      /
/; 3595/,/; 35D4/s/(ZP06),y                        /(ZP06_Char_ROM_Data_Addr_Lo),y  /
/; 3595/,/; 35D4/s/ZP07                            /ZP07_Char_ROM_Data_Addr_Hi      /

# Reset_RAM
/ZP02                            equ     $0002/a ZP02_Num_Of_Bytes_To_Fill_Lo    equ     $0002
/ZP03                            equ     $0003/a ZP03_Num_Of_Bytes_To_Fill_Hi    equ     $0003
/ZP04                            equ     $0004/a ZP04_Addr_To_Fill_Lo            equ     $0004
/ZP05                            equ     $0005/a ZP05_Addr_To_Fill_Hi            equ     $0005
/ZP06                            equ     $0006/a ZP06_Fill_Data_Byte             equ     $0006
/; 3579/,/; 3594/s/ZP02                            /ZP02_Num_Of_Bytes_To_Fill_Lo    /
/; 3579/,/; 3594/s/ZP03                            /ZP03_Num_Of_Bytes_To_Fill_Hi    /
/; 3579/,/; 3594/s/(ZP04),y                        /(ZP04_Addr_To_Fill_Lo),y        /
/; 3579/,/; 3594/s/ZP05                            /ZP05_Addr_To_Fill_Hi            /
/; 3579/,/; 3594/s/ZP06                            /ZP06_Fill_Data_Byte             /

# Convert_XY_to_UDG_RAM_Addr
/ZP04                            equ     $0004/a ZP04_X_Coordinate               equ     $0004
/ZP05                            equ     $0005/a ZP05_Y_Coordinate               equ     $0005
#/ZP04                            equ     $0004/a ZP04_UDG_RAM_Addr_Lo            equ     $0004
#/ZP05                            equ     $0005/a ZP05_UDG_RAM_Addr_Hi            equ     $0005
/; 351D/,/; 352F/s/ZP04                            /ZP04_X_Coordinate               /
/; 351D/,/; 352F/s/ZP05                            /ZP05_Y_Coordinate               /
/; 3531/,/; 3544/s/ZP04                            /ZP04_UDG_RAM_Addr_Lo            /
/; 3531/,/; 3544/s/ZP05                            /ZP05_UDG_RAM_Addr_Hi            /

# Setup_Colour_RAM_Ptr
#/ZP04                            equ     $0004/a ZP04_X_Coordinate               equ     $0004
#/ZP05                            equ     $0005/a ZP05_Y_Coordinate               equ     $0005
/ZP0C                            equ     $000C/a ZP0C_Colour_RAM_Addr_Lo         equ     $000C
/ZP0D                            equ     $000D/a ZP0D_Colour_RAM_Addr_Hi         equ     $000D
/; 34F7/,/; 3511/s/ZP04                            /ZP04_X_Coordinate               /
/; 34F7/,/; 3511/s/ZP05                            /ZP05_Y_Coordinate               /
/; 34F7/,/; 3511/s/ZP0C                            /ZP0C_Colour_RAM_Addr_Lo         /
/; 34F7/,/; 3511/s/ZP0D                            /ZP0D_Colour_RAM_Addr_Hi         /

# Display_String
/ZP06                            equ     $0006/a ZP06_Character_To_Display       equ     $0006
#/ZP0C                            equ     $000C/a ZP0C_Colour_RAM_Addr_Lo          equ     $000C
#/ZP0E                            equ     $000E/a ZP0E_String_Addr_Lo             equ     $000E
/; 34CC/,/; 34F6/s/ZP06                            /ZP06_Character_To_Display       /
/; 34CC/,/; 34F6/s/ZP0E                            /ZP0E_String_Addr_Lo             /
/; 34CC/,/; 34F6/s/(ZP0C),y                        /(ZP0C_Colour_RAM_Addr_Lo),y     /
/; 34CC/,/; 34F6/s/(ZP0E),y                        /(ZP0E_String_Addr_Lo),y         /

# Display_BCD_Bytes
/ZP02                            equ     $0002/a ZP02_Num_Bytes_To_Display       equ     $0002
#/ZP06                            equ     $0006/a ZP06_Character_To_Display       equ     $0006
/ZP07                            equ     $0007/a ZP07_Score_Data_Addr_Hi         equ     $0007
/ZP0E                            equ     $000E/a ZP0E_Score_Data_Addr_Lo         equ     $000E
/; 34A4/,/; 34CB/s/ZP02                            /ZP02_Num_Bytes_To_Display       /
/; 34A4/,/; 34CB/s/ZP06                            /ZP06_Character_To_Display       /
/; 34A4/,/; 34CB/s/ZP07                            /ZP07_Score_Data_Addr_Hi         /
/; 34A4/,/; 34CB/s/ZP0E                            /ZP0E_Score_Data_Addr_Lo         /
/; 34A4/,/; 34CB/s/(ZP0E),y                        /(ZP0E_Score_Data_Addr_Lo),y     /

# Flash Score
#/ZP04                            equ     $0004/a ZP04_UDG_RAM_Addr_Lo       equ     $0004
#/ZP05                            equ     $0005/a ZP05_UDG_RAM_Addr_Hi       equ     $0005
/; 3465/,/; 34A1/s/ZP04                            /ZP04_UDG_RAM_Addr_Lo            /
/; 3465/,/; 34A1/s/(ZP04),y                        /(ZP04_UDG_RAM_Addr_Lo),y        /
/; 3465/,/; 34A1/s/ZP05                            /ZP05_UDG_RAM_Addr_Hi            /

