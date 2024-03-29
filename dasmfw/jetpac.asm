; dasmfw: Disassembler Framework V0.34
; Loaded: binary file "bin_orig/jetpac_2000-3fff.bin"
; Loaded: Info file "dasmfw\nfo_include.nfo"

; --------------------------------------------------------------------------------------------
; JET PAC for the Commodore VIC-20 + 8K Memory Expansion
; Copyright 1982 ULTIMATE PLAY THE GAME / Ashby Computers & Graphics Ltd.
; --------------------------------------------------------------------------------------------
; Disassembly and reverse engineering by Phillip Eaton 2022-2023.
; https://github.com/phillipeaton/JETPAC_VIC-20_disassembly
; --------------------------------------------------------------------------------------------

;****************************************************
; Used Labels
;****************************************************

ZP_Obj_List_Ptr_Lo              equ     $0000
ZP00_Hi_Score_Addr              equ     $0000
ZP_Obj_List_Ptr_Hi              equ     $0001
ZP02                            equ     $0002
ZP02_Collision_Status           equ     $0002
ZP02_Colour_Random_0_or_1       equ     $0002
ZP02_Laser_Param_Countdown      equ     $0002
ZP02_Num_Aliens_Countdown       equ     $0002
ZP02_Num_Bytes_To_Display       equ     $0002
ZP02_Num_Lasers_Countdown       equ     $0002
ZP02_Num_Of_Bytes_To_Fill_Lo    equ     $0002
ZP02_Object_Old_Height_Index    equ     $0002
ZP02_Ship_Parts_Count           equ     $0002
ZP02_Score_Byte_Hi              equ     $0002
ZP03                            equ     $0003
ZP03_Num_Of_Bytes_To_Fill_Hi    equ     $0003
ZP03_Object_Height_Pixels       equ     $0003
ZP03_Object_Old_Height          equ     $0003
ZP03_Platform_Data_Table_Index  equ     $0003
ZP03_Score_Byte_Lo              equ     $0003
ZP04                            equ     $0004
ZP04_Addr_To_Fill_Lo            equ     $0004
ZP04_Colour_Tile_Position_X     equ     $0004
ZP04_Laser_Position_X           equ     $0004
ZP04_Laser_UDG_RAM_Addr_Lo      equ     $0004
ZP04_Object_Old_UDG_RAM_Lo      equ     $0004
ZP04_Object_Position_X          equ     $0004
ZP04_Object_UDG_RAM_Addr_Lo     equ     $0004
ZP04_Platform_Position_X        equ     $0004
ZP04_Position_X                 equ     $0004
ZP04_UDG_RAM_Addr_Lo            equ     $0004
ZP05                            equ     $0005
ZP05_Addr_To_Fill_Hi            equ     $0005
ZP05_Colour_Tile_Position_Y     equ     $0005
ZP05_Laser_Position_Y           equ     $0005
ZP05_Laser_UDG_RAM_Addr_Hi      equ     $0005
ZP05_Object_Old_UDG_RAM_Hi      equ     $0005
ZP05_Object_Position_Y          equ     $0005
ZP05_Object_UDG_RAM_Addr_Hi     equ     $0005
ZP05_Platform_Position_Y        equ     $0005
ZP05_Position_Y                 equ     $0005
ZP05_UDG_RAM_Addr_Hi            equ     $0005
ZP06                            equ     $0006
ZP06_Char_ROM_Data_Addr_Lo      equ     $0006
ZP06_Character_To_Copy          equ     $0006
ZP06_Character_To_Display       equ     $0006
ZP06_Fill_Data_Byte             equ     $0006
ZP06_Laser_New_State_Lo         equ     $0006
ZP06_Laser_Old_State_Lo         equ     $0006
ZP06_Laser_Position_X           equ     $0006
ZP06_Object_Old_UDG_Data_Lo     equ     $0006
ZP06_Object_Position_Y          equ     $0006
ZP06_Object_UDG_Data_Addr_Lo    equ     $0006
ZP06_Platform_UDG_Data_Addr_Lo  equ     $0006
ZP06_Player_Score_Addr          equ     $0006
ZP07                            equ     $0007
ZP07_Char_ROM_Data_Addr_Hi      equ     $0007
ZP07_Laser_Length_Columns       equ     $0007
ZP07_Laser_Old_State_Hi         equ     $0007
ZP07_Object_Old_UDG_Data_Hi     equ     $0007
ZP07_Object_Position_X          equ     $0007
ZP07_Object_UDG_Data_Addr_Hi    equ     $0007
ZP07_Platform_UDG_Data_Addr_Hi  equ     $0007
ZP07_Score_Data_Addr_Hi         equ     $0007
ZP08                            equ     $0008
ZP08_Laser_Position_X_Start     equ     $0008
ZP08_Object_Laser_Addr_Lo       equ     $0008
ZP08_Object_Old_Y_Index         equ     $0008
ZP08_Platfm_Data_Tbl_Addr_Lo    equ     $0008
ZP08_Player_Score_Addr          equ     $0008
ZP08_Row_Offset_Table_Index     equ     $0008
ZP08_Subroutine_Addr_Lo         equ     $0008
ZP09                            equ     $0009
ZP09_Object_Laser_Addr_Hi       equ     $0009
ZP09_Object_New_Y_Index         equ     $0009
ZP09_Platfm_Data_Tbl_Addr_Hi    equ     $0009
ZP09_Subroutine_Addr_Hi         equ     $0009
ZP0A                            equ     $000A
ZP0A_Colour_RAM_Tiles_X         equ     $000A
ZP0A_Object_New_Height_Index    equ     $000A
ZP0A_Platform_Quantity          equ     $000A
ZP0B                            equ     $000B
ZP0B_Colour_RAM_Tiles_Y         equ     $000B
ZP0B_Object_Height_Pixels       equ     $000B
ZP0B_Object_New_Height          equ     $000B
ZP0B_Platform_Object_Distance   equ     $000B
ZP0B_Platform_Width_Chars       equ     $000B
ZP0C                            equ     $000C
ZP0C_Colour_RAM_Addr_Lo         equ     $000C
ZP0C_Colour_RAM_Tile_Addr_Lo    equ     $000C
ZP0C_Object_New_UDG_RAM_Lo      equ     $000C
ZP0C_Object_UDG_RAM_Addr_Lo     equ     $000C
ZP0D                            equ     $000D
ZP0D_Colour_RAM_Addr_Hi         equ     $000D
ZP0D_Colour_RAM_Tile_Addr_Lo    equ     $000D
ZP0D_Object_New_UDG_RAM_Hi      equ     $000D
ZP0D_Object_UDG_RAM_Addr_Hi     equ     $000D
ZP0E                            equ     $000E
ZP0E_Object_New_UDG_Data_Lo     equ     $000E
ZP0E_Object_Position_X          equ     $000E
ZP0E_Object_UDG_Data_Addr_Lo    equ     $000E
ZP0E_Score_Data_Addr_Lo         equ     $000E
ZP0E_String_Addr_Lo             equ     $000E
ZP0F                            equ     $000F
ZP0F_Object_New_UDG_Data_Hi     equ     $000F
ZP0F_Object_Position_Y          equ     $000F
ZP0F_Object_UDG_Data_Addr_Hi    equ     $000F
ZP0F_String_Addr_Hi             equ     $000F
ZP10                            equ     $0010
ZP10_Object_Position_X          equ     $0010
ZP11                            equ     $0011
ZP11_Object_Old_Position_Y      equ     $0011
ZP11_Object_Position_Y          equ     $0011
ZP11_Object_Ship_Position_Y     equ     $0011
ZP12                            equ     $0012
ZP12_Object_Type                equ     $0012
ZP13                            equ     $0013
ZP13_Laser_Position_Y           equ     $0013
ZP13_Obj_Landed_Posn_Y_Offset   equ     $0013
ZP13_Object_Lines_To_Erase      equ     $0013
ZP13_Ship_Fuel_Level_Half       equ     $0013
ZP13_Temp                       equ     $0013
ZP13_Keyboard_Data              equ     $0013
ZP14                            equ     $0014
ZP14_Laser_Decay_Patten_Data_0  equ     $0014
ZP14_Object_Old_Width_Bytes     equ     $0014
ZP14_Object_Width_Bytes         equ     $0014
ZP15                            equ     $0015
ZP15_Laser_Decay_Patten_Data_1  equ     $0015
ZP15_Object_New_Width_Bytes     equ     $0015
ZP15_Object_Width_Bytes         equ     $0015
ZP16                            equ     $0016
ZP16_Laser_Decay_Patten_Data_2  equ     $0016
ZP16_Object_Size_X_Columns      equ     $0016
ZP16_Object_Width_Bytes         equ     $0016
ZP17                            equ     $0017
ZP17_Laser_Decay_Patten_Data_3  equ     $0017
ZP17_Object_Height_Pixels       equ     $0017
ZP17_Object_Size_Y_Pixels       equ     $0017
ZP18                            equ     $0018
ZP18_Object_Flame_Position_X    equ     $0018
ZP18_Object_Position_X          equ     $0018
ZP19                            equ     $0019
ZP19_Object_Landed_Position_Y   equ     $0019
ZP19_Object_Flame_Position_Y    equ     $0019
ZP19_Object_New_Position_Y      equ     $0019
ZP19_Object_Position_Y          equ     $0019
ZP1A                            equ     $001A
ZP1A_Object_Type                equ     $001A
ZP1B                            equ     $001B
ZP1B_Laser_Colour               equ     $001B
ZP1B_Object_Colour              equ     $001B

; FF=none, x7=shooting, Bx=left, 7x=right, Ex=fly, Ax=fly left, 6x=fly right
; 1111 1111 = No action
; 1xxx xxxx = Not moving right
; x1xx xxxx = Not moving left
; xx1x xxxx = Not down (i.e. hover)
; xxx1 xxxx = Not up
; xxxx 1xxx = Not Firing
;
; Examples:
; 1110 xxxx = Flying Hover
; 1010 xxxx = Flying Left
; 0110 xxxx = Flying Right
; 1011 xxxx = Walk Left
; 0111 xxxx = Walk right
ZP_Jetman_Action                equ     $001C

ZP_Ship_UDG_Addr_Offset         equ     $001E
ZP_Ship_Parts_Counter           equ     $001F
ZP_IRQ_Occurred                 equ     $0020

; When reaches $04, Alien spawns, incremented by Explosions and Lasers
ZP_Alien_Spawn_Counter          equ     $0021

ZP_Obj_List_Ptr_Save_IRQ_Lo     equ     $0022
ZP_Obj_List_Ptr_Save_IRQ_Hi     equ     $0023
ZP_Obj_List_Ptr_Save_Lo         equ     $0024
ZP_Obj_List_Ptr_Save_Hi         equ     $0025

; Turns off at take-off and landing
ZP_Ship_Flame_State             equ     $0026

; Counts up throughout the flight, used for flame animation
ZP_Ship_Flame_UDG_Toggle        equ     $0027

ZP_Obj_Ship_Saved               equ     $0028
ZP_Param_Addr_Lo                equ     $0040
ZP_Param_Addr_Hi                equ     $0041

; Bit 7 Inverse Video, Bit 0 Display On/Off
ZP_Game_Select_F1_Flash         equ     $0045

ZP_IRQ_Counter_Lo               equ     $004A
ZP_IRQ_Counter_Hi               equ     $004B
ZP_IRQ_Random                   equ     $004C

; 3 bytes per score
ZP_Score_Player_1               equ     $0051
ZP_Score_Player_2               equ     $0054

; Used to flash game options & 1UP+score at player start
ZP_Reverse_And_Colour_Data      equ     $0057

ZP_Flash_Countup                equ     $0058
ZP_Wave_Active_Player           equ     $0059
ZP_Num_Lives_Active_Player      equ     $005A
ZP_Wave_Inactive_Player         equ     $005B
ZP_Num_Lives_Inactive_Player    equ     $005C

; 7f for 1 player, ff for 2 player i.e. longer when 2 player game
ZP_Flash_Score_Countdown        equ     $005D

ZP_Active_Player                equ     $005E
ZP_Subroutine_Addr_Lo           equ     $005F
ZP_Subroutine_Addr_Hi           equ     $0060

Screen_RAM                      equ     $0200

IRQ_Interrupt_Vector_Lo         equ     $0314
IRQ_Interrupt_Vector_Hi         equ     $0315
NMI_Interrupt_Vector_Lo         equ     $0318
NMI_Interrupt_Vector_Hi         equ     $0319

; ======================= Objects =======================
; Each object occupies 8 bytes, some bytes don't appear to be used.
; First byte of each object is it's type, Jetman can be object type 01/02/81/82,
; Lasers can be 10 or 90, top bit signifying left/right direction.
; Object Types:
;      01/81 = Jetman Flying
;      02/82 = Jetman Standing
;      03    = Explosion
;      04    = Ship Top Module or Fuel
;      05    = Wave 0 Fuzzball
;      06    = Wave 3 Saucer
;      07    = Wave 2 Sphere
;      08    = Wave 1 Cross
;      09    = Ship Base Module
;      0A    = Ship Ascend
;      0B    = Ship Descend
;      0C    = Sound
;      0D    = (Goto Next Object)
;      0E    = Ship Middle Module or Valuable
;      0F    = (Goto Next Object)
;      10/90 = Laser beam

; -------------------- Jetman Object --------------------
; Byte 00 = 1xxx xxxx = Facing Left, not facing right
;           xxxx xx1x = Standing
;           xxxx xxx1 = Flying (Not on screen if !Flying & !Standing e.g. hit by alien)
;      01 = Position X  - Pixels Left=00 Right=B6 or B7
;      02 = Direction X - Fx=Moving Left, 0x=moving right, xN where N is velocity for fly/walk
;      03 = Position Y  - Pixels Top=28 Bottom=AF, 5E= Middle Platform, 3E=Left, 2E=Right
;      04 = Direction Y - Range between FC=Up to 04=Down at rest i.e. FC,FD,FE,FF,0,1,2,3,4
;      05 = Colour
;
Obj_Jetman_State                equ     $0380
Obj_Jetman_Position_X           equ     $0381
Obj_Jetman_Direction_X          equ     $0382
Obj_Jetman_Position_Y           equ     $0383
Obj_Jetman_Direction_Y          equ     $0384
Obj_Jetman_Colour               equ     $0385

; -------------------- Laser Objects --------------------
; Byte 00/08 = Object type: 0001_0000=Laser Shot Left / 1001_0000=Laser Shot Right, else Zero
;      01/09 = Laser Y-coord, offset from the bottom of the Jetman UDG (i.e. at the laser gun height).
;      02/0A = X-coord of start of laser beam, calculated from position of Jetman.
;      03/0B = Delayed X-coords of 02/0A, as laser decays, these decay by 8 each time.
;      04/0C = Delayed X-coords of 02/0A, as laser decays, these decay by 8 each time.
;      05/0D = Delayed X-coords of 02/0A, as laser decays, these decay by 8 each time.
;      06/0E = Laser shot beam length, randomly set using the IRQ counter.
;      07/0F = Laser Colour
;
; Laser_Colour_Table at 216B:
; fcb     WHITE,RED,CYAN,PURPLE   ; 216B: 01 02 03 04
; fcb     BLUE,YELLOW,CYAN,YELLOW ; 216F: 06 07 03 07
;
Obj_Laser_0                     equ     $0388
Obj_Laser_1                     equ     $0390
Obj_Laser_2                     equ     $0398
Obj_Laser_3                     equ     $03A0

; -------------------- Sound Object ---------------------
; Byte 01/03/05 = Which sound to play
;      02/04/06 = Period of the sound
;      07       = Unused
;
Obj_Sound                       equ     $03A8
Obj_Sound_Collision             equ     $03A9
Obj_Sound_Collision_Timer       equ     $03AA
Obj_Sound_Noise                 equ     $03AB
Obj_Sound_Noise_Timer           equ     $03AC
Obj_Sound_Laser                 equ     $03AD
Obj_Sound_Laser_Timer           equ     $03AE

; -------------- Ship Base Module Object ----------------
; Byte 00 = 09 during game play, 0A when ascending, 0B when descending
;      01 = Position X
;      02 = Number of fuel cells, 0=empty, 6=full
;      03 = Position Y
;      04 = 1=Base only, 2=Base+Mid, 3=Base+Mid+Top
;      07 = Unused, but initiated to $1C
;
Obj_Ship_Base                   equ     $03B0
Obj_Ship_Base_Position_X        equ     $03B1
Obj_Ship_Base_Fuel_Level        equ     $03B2
Obj_Ship_Base_Position_Y        equ     $03B3
Obj_Ship_Base_Parts_Counter     equ     $03B4

; ----------- Ship Top Module or Fuel Object ------------
; Byte 00 = 04 when active, else 00
;           Initially it's the ship top module, then switches to Fuel
;           Cell when top module delivered
;      01 = Position X
;      02 = ???
;      03 = Position Y
;      04 = Ship part ready for Pick-up/Picked-up/Falling
;           xxxx_xxx1 = Landed/Stationary
;           xxxx_xx1x = Picked-up by Jetman
;           xxxx_x1xx = Falling
;      05 = Object Colour
;      06 = Object User-Defined Graphics data address index
;      07 = ???
;
Obj_Ship_Top_Or_Fuel_Type       equ     $03B8
Obj_Ship_Top_Or_Fuel_X          equ     $03B9
Obj_Ship_Top_Or_Fuel_DONT_KNOW  equ     $03BA
Obj_Ship_Top_Or_Fuel_Y          equ     $03BB
Obj_Ship_Top_Or_Fuel_Status     equ     $03BC
Obj_Ship_Top_Or_Fuel_Colour     equ     $03BD
Obj_Ship_Top_Or_Fuel_UDG_Index  equ     $03BE
Obj_Ship_Top_Or_Fuel_???        equ     $03BF

; -------- Ship Middle Module or Valuable Object --------
; Byte 00 = 0E when active, else 00
;           Initially it's the ship middle module, then switches to
;           a Valuable when middle module delivered
;      01 = Position X
;      02 = DONT KNOW
;      03 = Position Y
;      04 = Ship part ready for Pick-up/Picked-up/Falling
;           xxxx_xxx1 = Landed/Stationary
;           xxxx_xx1x = Picked-up by Jetman
;           xxxx_x1xx = Falling
;      05 = Object Colour
;      06 = For Ship Module Object, User-Defined Graphics data address index
;           For Valuable, affects colours and flashing of Byte 05
;             $20=gold bar (yellow)
;             $22=plutonium (cyan)
;             $24=isotope (cyan/black flash)
;             $26=mineral (blue)
;             $28=gemstone (multicolour cycle)
;      07 = ???
;
Obj_Ship_Mid_Or_Valuable_Typ    equ     $03C0
Obj_Ship_Mid_Or_Valuable_X      equ     $03C1
Obj_Ship_Mid_Or_Valuable_?????  equ     $03C2
Obj_Ship_Mid_Or_Valuable_Y      equ     $03C3
Obj_Ship_Mid_Or_Valu_Status     equ     $03C4
Obj_Ship_Mid_Or_Valu_Colour     equ     $03C5
Obj_Ship_Mid_Or_Valu_UDG_Idx    equ     $03C6
Obj_Ship_Mid_Or_Valuable_???    equ     $03C7

; -------------------- Alien Objects --------------------
; Byte 00/08 = Alien type:
;              05 = Wave 0 Fuzzball
;              06 = Wave 3 Saucer
;              07 = Wave 2 Sphere
;              08 = Wave 1 Cross
;      01/09 = Position X
;      02/0A = Direction X
;      03/0B = Position Y
;      04/0C = Direction Y
;      05/0D = Colour
;      06/0E = For Wave 2 Sphere, countdown from $18 to 0 for Direction Y reversal
;      07/0F = ???
;
Obj_Alien_0                     equ     $03C8
Obj_Alien_1                     equ     $03D0
Obj_Alien_2                     equ     $03D8
Obj_Alien_3                     equ     $03E0
Obj_Alien_4                     equ     $03E8
Obj_Alien_5                     equ     $03F0

UDG_RAM                         equ     $1000

; Variables that are not persistent i.e. reset at game restart
Player_1_Score_UDG_RAM_Addr     equ     $1008
Player_1_Lives_UDG_RAM_Addr     equ     $1420
Hi_Score_UDG_RAM_Addr           equ     $1588
Player_2_Lives_UDG_RAM_Addr     equ     $19A0
Player_2_Score_UDG_RAM_Addr     equ     $1B08

; Variables that are somewhat persistent i.e. not reset at game restart
Score_Hi                        equ     $1FD0
Game_Settings                   equ     $1FD3

VIC_R0_H_Ctr                    equ     $9000
VIC_R4_TV_Raster                equ     $9004
VIC_RA_Frq_Osc1                 equ     $900A
VIC_RB_Frq_Osc2                 equ     $900B
VIC_RC_Frq_Osc3                 equ     $900C
VIC_RE_Vol_Colour               equ     $900E

VIA1_Port_B                     equ     $9110
VIA1_Port_A                     equ     $9111
VIA1_DDR_A                      equ     $9113
VIA1_Int_Enable                 equ     $911E

VIA2_Port_B                     equ     $9120
VIA2_Port_A                     equ     $9121
VIA2_DDR_B                      equ     $9122
VIA2_DDR_A                      equ     $9123
VIA2_T1_Cnt_Lo                  equ     $9124
VIA2_T1_Cnt_Hi                  equ     $9125
VIA2_Int_Enable                 equ     $912E

Colour_RAM                      equ     $9600

;****************************************************
; Used Definitions
;****************************************************

SCREEN_WIDTH_COLUMNS            equ     $17
COLOUR_GREEN                    equ     $05
UDG_DATA_BITMAP_OFFSET          equ     $03
UDG_DATA_WIDTH_BYTES_OFFSET     equ     $FE
UDG_DATA_HEIGHT_PIXELS_OFFSET   equ     $FF
SCREEN_WIDTH_PIXELS             equ     $B8
UDG_RAM_NUM_BYTES_HI            equ     $0F
UDG_RAM_NUM_BYTES_LO            equ     $D0
UDG_RAM_END_ADDR_MINUS_FE_HI    equ     $1E
UDG_RAM_END_ADDR_MINUS_FE_LO    equ     $D1
SCREEN_HEIGHT_PIXELS            equ     $B0
OBJECT_COLOUR_PARAM             equ     $05
OBJECT_POSITION_Y_PARAM         equ     $03
OBJECT_TYPE_PARAM               equ     $00
CHARACTER_ROM_START_HI_BYTE     equ     $80
COLOUR_RAM_START_HI_BYTE        equ     $96
PETSCII_OFFSET                  equ     $70
NUM_PIXEL_OF_LINES_TO_REVERSE   equ     $0F
NUM_OF_COLUMNS_TO_REVERSE       equ     $06
JETMAN_STATE_PARAM              equ     $00
JETMAN_POSITION_Y_PARAM         equ     $03
JETMAN_DIRECTION_Y_PARAM        equ     $04
JETMAN_DIRECTION_X_PARAM        equ     $02
_100_MINUS_SCREEN_WIDTH_PIXELS  equ     $48
SCREEN_TOP                      equ     $28
SCREEN_BOTTOM                   equ     $AF
JETMAN_POSITION_X_PARAM         equ     $01
PLATFORM_HEIGHT_PIXELS_TOTAL    equ     $0A
PLATFORM_HEIGHT_PIXELS          equ     $09
PLATFORM_UDG_DATA_ADDR_HI       equ     $3E
PLATFORM_UDG_DATA_ADDR_LO       equ     $15
PLATFORM_QUANTITY               equ     $03
PLATFORM_DATA_TABLE_ADDR_HI     equ     $31
PLATFORM_DATA_TABLE_ADDR_LO     equ     $B6
SCREEN_BOTTOM_1UP               equ     $AE
OBJECT_POSITION_X_PARAM         equ     $01
THREE_DIGITS_COUNTDOWN          equ     $02
OBJECT_PICKUP_DROPPED_STATE     equ     $04
OBJECT_OVER_SHIP_HITBOX_X       equ     $06
OBJECT_STATUS_PICKED_UP         equ     %00000010
OBJECT_STATUS_PARAM             equ     $04
OBJECT_UDG_DATA_INDEX_PARAM     equ     $06
FUEL_POSITION_Y_WHEN_LANDED     equ     $A8
OBJECT_UDG_DATA_OFFSET          equ     $06
COLUMN_INDEX                    equ     $00
OBJECT_SHIP_POSITION_Y_PARAM    equ     $03
OBJECT_SHIP_POSITION_X_PARAM    equ     $01
COLOUR_WHITE                    equ     $01
COLOUR_PURPLE                   equ     $04
OBJECT_SHIP_FUEL_LEVEL          equ     $02
OBJ_SHIP_PARTS_COUNTER_PARAM    equ     $04
SHIP_ASCENDING                  equ     $0A
FUELLED_UP                      equ     $06
OBJECT_SHIP_LANDED              equ     $09
SHIP_BASE_POSITION_Y            equ     $AF
SHIP_BASE_POSITION_Y_PARAM      equ     $03
OBJECT_SHIP_DESCEND             equ     $0B
SHIP_BASE_AT_SCREEN_TOP         equ     $30
OBJECT_TYPE_VALUABLE            equ     $0E
HITBOX_Y_ABOVE                  equ     $12
COLLISION                       equ     $80
HITBOX_Y_BELOW                  equ     $0C
COLLISION_HITBOX_X              equ     $0C
NO_COLLISION                    equ     $00
JETMAN_STANDING                 equ     $02
JETMAN_FLYING                   equ     $01
COLOUR_RED                      equ     $02
COLOUR_YELLOW                   equ     $07
COLOUR_BLUE                     equ     $06
COLOUR_CYAN                     equ     $03
WAVE_1_CROSS_                   equ     $06
WAVE_2_SPHERE_                  equ     $07
WAVE_3_SAUCER_                  equ     $08
WAVE_0_FUZZBALL_                equ     $05
OBJECT_STRUCTURE_SIZE           equ     $08
NUM_ALIENS_MAX                  equ     $06
OBJECT_ALIEN_0_HI               equ     $03
OBJECT_ALIEN_0_LO               equ     $C8
OBJECT_DIRECTION_Y_PARAM        equ     $04
OBJECT_DIRECTION_X_PARAM        equ     $02
LASER_POSITION_X_PARAM          equ     $02
MAX_LASERS                      equ     $04
OBJECT_LASER_0_HI               equ     $03
OBJECT_LASER_0_LO               equ     $88
OBJECT_VALUABLE_TYPE_PARAM      equ     $06
NUM_OBJECT_PARAMS               equ     $07
NOT_FLYING_AND_NOT_STANDING     equ     $03
SHIP_BUILT_AND_FUELLED_UP       equ     $06
OBJECT_DIRECTION_Y              equ     $04
OBJECT_DIRECTION_X              equ     $02
DIRECTION_Y_DOWN_MAX            equ     $04
DIRECTION_X_RIGHT_MAX           equ     $04
DIRECTION_Y_UP_MAX              equ     $FC
DIRECTION_X_LEFT_MAX            equ     $FC
DIRECTION_X_LEFT                equ     $F8
DIRECTION_Y_UP                  equ     $F8
DIRECTION_Y_DOWN                equ     $08
DIRECTION_X_RIGHT               equ     $08
OBJECT_DIR_Y_COUNTDOWN_PARAM    equ     $06
OBJECT_JETMAN_DIRECTION_PARAM   equ     $02
OBJECT_TYPE_PARAM_SAVED         equ     $06
EXPLOSION_ANIMATION_FRAMES      equ     $07
EXPLOSION_ANIMATION_FRAME       equ     $04
OBJECT_TYPE_EXPLOSION           equ     $03
COLOUR_BLACK                    equ     $00
FLAME_SPACE_AVAILABLE           equ     $AF
OBJECT_TYPE_SHIP_ASCEND         equ     $0A
WORD_SIZE                       equ     $02
OBJECT_SHIP_ADDRESS             equ     $B0
OPTION_TEXT_ROWS                equ     $05
TEXT_POSITION_X                 equ     $18
LIVES_INITIAL_PLAYER_2          equ     $05
LIVES_INITIAL_PLAYER_1          equ     $04
PLAYER_1                        equ     $00
CHARACTER_SPACE                 equ     $60
CHARACTER_ZERO                  equ     $70
LASER_TYPE_PARAM                equ     $00
LASER_POSITION_X                equ     $02
LASER_LENGTH_PARAM              equ     $06
LASER_POSITION_Y                equ     $01
LASER_POSITION_X_PARAMS         equ     $03
LASER_GUN_HEIGHT_OFFSET         equ     $0D
SCREEN_ROWS                     equ     $0B
SCREEN_COLUMNS                  equ     $17
IRQ_INTERRUPT_HANDLER_ADDR_HI   equ     $25
IRQ_INTERRUPT_HANDLER_ADDR_LO   equ     $E0
NMI_INTERRUPT_HANDLER_ADDR_HI   equ     $20
NMI_INTERRUPT_HANDLER_ADDR_LO   equ     $1C

;****************************************************
; Program's Code Areas
;****************************************************


    org     $2000

; Probably unused data leftover from the start-up code relocation, $201D is program start point
    fdb     $201D,$201D                     ; 2000: 1D 20 1D 20 

; Initial value table for VIC setup 16 bytes, see "Mapping the VIC 1984 COMPUTE" book

; Screen Map RAM Location
; -----------------------
; VIC_R2_Num_Cols Bit 7 (A=1) and VIC_R5_CM_Start Bits 7654 (BBBB=1000=$8) form part of a
; a 14-bit address that signifies the start of the Screen Map RAM: BB_BBA0_0000_0000
; Using the values in the Init Table: 10_0010_0000_0000 NOTE: R5 bit 7 is inverted by the VIC
; Thus Screen Map RAM starts at $0200

; Colour Map RAM Location
; -----------------------
; VIC_R2_Num_Cols Bit 7 (A=1) signifies Colour Map RAM starts at $9600

; Character Map RAM Location
; --------------------------
; VIC_R5_CM_Start Bits 4321 (CCCC = 1100 = $C) signifies Character Map RAM starts at $1000

; Screen Size Columns x Rows
; --------------------------
; VIC_R2_Num_Cols Bits 6543210 set number of columns = _001_0111 = $17 = 23 decimal
; VIC_R3_Num_Rows Bits 654321  set number of rows    = _001_011_ = $0B = 11 decimal
; VIC_R3_Num_Rows Bit 0=1 sets character matrices to 8x16 pixels, thus 23x11 tile map = 253 tiles.
; Each tile maps to a user-defined character in the $1000-$1FCF range, which effectively gives
; bitmapped graphics with X:Y 23

VIC_Init_Table
    fcb     $0B                             ; 2004: 0B        VIC_R0_H_Ctr     Left edge of TV picture and interlace switch.Left edge of TV picture and interlace switch.
    fcb     $26                             ; 2005: 26        VIC_R1_V_Ctr     Vertical TV picture origin.
    fcb     $97                             ; 2006: 97        VIC_R2_Num_Cols  Number of columns displayed, part of screen map address.
    fcb     $17                             ; 2007: 17        VIC_R3_Num_Rows  Number of character lines displayed, part of raster location.
    fcb     $00                             ; 2008: 00        VIC_R4_TV_Raster Raster beam location bits 8-1.
    fcb     $8C                             ; 2009: 8C        VIC_R5_CM_Start  Screen map and character map addresses.
    fcb     $00                             ; 200A: 00        VIC_R6_H_LightP  Light pen horizontal screen location.
    fcb     $00                             ; 200B: 00        VIC_R7_V_LightP  Light pen vertical screen location.
    fcb     $00                             ; 200C: 00        VIC_R8_Paddle_X  Potentiometer X/Paddle X value.
    fcb     $00                             ; 200D: 00        VIC_R9_Paddle_Y  Potentiometer Y/Paddle Y value.
    fcb     $00                             ; 200E: 00        VIC_RA_Frq_Osc1  Relative frequency of sound oscillator 1 (bass).
    fcb     $00                             ; 200F: 00        VIC_RB_Frq_Osc2  Relative frequency of sound oscillator 2 (alto).
    fcb     $00                             ; 2010: 00        VIC_RC_Frq_Osc3  Relative frequency of sound oscillator 3 (soprano).
    fcb     $00                             ; 2011: 00        VIC_RD_Frq_Noise Relative frequency of sound oscillator 4 (noise).
    fcb     $00                             ; 2012: 00        VIC_RE_Vol_Color Sound volume and auxiliary color.
    fcb     $08                             ; 2013: 08        VIC_RF_BckBdrCol Background color, border color, inverse color switch.

; Quick mask lookup for BIT instruction
MASK_00000001
    fcb     %00000001                       ; 2014: 01       
MASK_00000010
    fcb     %00000010                       ; 2015: 02       
MASK_00000100
    fcb     %00000100                       ; 2016: 04       
MASK_00001000
    fcb     %00001000                       ; 2017: 08       
MASK_00010000
    fcb     %00010000                       ; 2018: 10       
MASK_00100000
    fcb     %00100000                       ; 2019: 20       
MASK_01000000
    fcb     %01000000                       ; 201A: 40       
MASK_10000000
    fcb     %10000000                       ; 201B: 80       

; +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
; Empty NMI Interrupt Handler, simply returns from interrupt
NMI_Interrupt_Handler
    rti                                     ; 201C: 40       
; +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-





; 88""Yb 88""Yb  dP"Yb   dP""b8 88""Yb    db    8b    d8
; 88__dP 88__dP dP   Yb dP   `" 88__dP   dPYb   88b  d88
; 88"""  88"Yb  Yb   dP Yb  "88 88"Yb   dP__Yb  88YbdP88
; 88     88  Yb  YbodP   YboodP 88  Yb dP""""Yb 88 YY 88

; .dP"Y8 888888    db    88""Yb 888888
; `Ybo."   88     dPYb   88__dP   88
; o.`Y8b   88    dP__Yb  88"Yb    88
; 8bodP'   88   dP""""Yb 88  Yb   88

; Disable Interrupts, reset stack address pointer, clear Decimal flag
    sei                                     ; 201D: 78       
    ldx     #$FF                            ; 201E: A2 FF    
    txs                                     ; 2020: 9A       
    cld                                     ; 2021: D8       

; Setup NMI interrupt vector to service routine at $201C
    lda     #NMI_INTERRUPT_HANDLER_ADDR_LO  ; 2022: A9 1C    
    sta     NMI_Interrupt_Vector_Lo         ; 2024: 8D 18 03 
    lda     #NMI_INTERRUPT_HANDLER_ADDR_HI  ; 2027: A9 20    
    sta     NMI_Interrupt_Vector_Hi         ; 2029: 8D 19 03 

    jsr     Erase_Hi_Score_Game_Settings    ; 202C: 20 6F 27 
    jsr     Erase_ZP_RAM                    ; 202F: 20 5B 27 

; Setup I/O data direction and interrupt enables
    lda     #%00000000                      ; 2032: A9 00    
    sta     VIA1_DDR_A                      ; 2034: 8D 13 91 
    lda     #%10000000                      ; 2037: A9 80    
    sta     VIA1_Int_Enable                 ; 2039: 8D 1E 91 
    lda     #%11000000                      ; 203C: A9 C0    
    sta     VIA2_Int_Enable                 ; 203E: 8D 2E 91 

    jsr     Reset_VIA2_Timer                ; 2041: 20 5E 26 

; Set VIA outputs for keyboard scan
    lda     #%01000000                      ; 2044: A9 40    
    sta     VIA1_Port_B                     ; 2046: 8D 10 91  Data I/O register (User port & RS-232) i.e. not used
    sta     VIA2_Port_B                     ; 2049: 8D 20 91  Data I/O register (Keybd col scan, Cassette, Joystick)

; Setup IRQ interrupt vector to service routine at $25E0
    lda     #IRQ_INTERRUPT_HANDLER_ADDR_LO  ; 204C: A9 E0    
    sta     IRQ_Interrupt_Vector_Lo         ; 204E: 8D 14 03 
    lda     #IRQ_INTERRUPT_HANDLER_ADDR_HI  ; 2051: A9 25    
    sta     IRQ_Interrupt_Vector_Hi         ; 2053: 8D 15 03 

; Reset the VIC registers
    ldx     #$0F                            ; 2056: A2 0F     16 registers
; L_BRS_($2058)_($205F) OK
Reset_VIC
    lda     VIC_Init_Table,x                ; 2058: BD 04 20 
    sta     VIC_R0_H_Ctr,x                  ; 205B: 9D 00 90 
    dex                                     ; 205E: CA       
    bpl     Reset_VIC                       ; 205F: 10 F7    

; Initialise Screen RAM i.e. map screen tiles to User-Defined Graphics RAM
; Each character is a 16x8 tile i.e. double height, thus play area
; is decimal 11 Rows x 23 Columns
; 0200  00 0B 16 21 2C 37 42 4D 58 63 6E 79 84 8F 9A A5 B0 BB C6 D1 DC E7 F2
; 0217  01 0C 17 22 2D 38 43 4E 59 64 6F 7A 85 90 9B A6 B1 BC C7 D2 DD E8 F3
; 022E  02 0D 18 23 2E 39 44 4F 5A 65 70 7B 86 91 9C A7 B2 BD C8 D3 DE E9 F4
; 0245  03 0E 19 24 2F 3A 45 50 5B 66 71 7C 87 92 9D A8 B3 BE C9 D4 DF EA F5
; 025C  04 0F 1A 25 30 3B 46 51 5C 67 72 7D 88 93 9E A9 B4 BF CA D5 E0 EB F6
; 0273  05 10 1B 26 31 3C 47 52 5D 68 73 7E 89 94 9F AA B5 C0 CB D6 E1 EC F7
; 028A  06 11 1C 27 32 3D 48 53 5E 69 74 7F 8A 95 A0 AB B6 C1 CC D7 E2 ED F8
; 02A1  07 12 1D 28 33 3E 49 54 5F 6A 75 80 8B 96 A1 AC B7 C2 CD D8 E3 EE F9
; 02B8  08 13 1E 29 34 3F 4A 55 60 6B 76 81 8C 97 A2 AD B8 C3 CE D9 E4 EF FA
; 02CF  09 14 1F 2A 35 40 4B 56 61 6C 77 82 8D 98 A3 AE B9 C4 CF DA E5 F0 FB
; 02E6  0A 15 20 2B 36 41 4C 57 62 6D 78 83 8E 99 A4 AF BA C5 D0 DB E6 F1 FC

    ldx     #$00                            ; 2061: A2 00    
    txa                                     ; 2063: 8A       

; Initialise Screen RAM outer loop
; L_BRS_($2064)_($2077) OK
ISR_Columns
    ldy     #SCREEN_COLUMNS                 ; 2064: A0 17    
    pha                                     ; 2066: 48       

; Initialise Screen RAM inner loop
; L_BRS_($2067)_($206F) OK
ISR_Rows
    sta     Screen_RAM,x                    ; 2067: 9D 00 02 
    clc                                     ; 206A: 18       
    adc     #SCREEN_ROWS                    ; 206B: 69 0B    
    inx                                     ; 206D: E8       
    dey                                     ; 206E: 88       
    bne     ISR_Rows                        ; 206F: D0 F6    

    pla                                     ; 2071: 68       
    clc                                     ; 2072: 18       
    adc     #$01                            ; 2073: 69 01    
    cmp     #SCREEN_ROWS                    ; 2075: C9 0B    
    bne     ISR_Columns                     ; 2077: D0 EB    

; L_JMP_($2079)_($2994) OK
; L_JMP_($2079)_($299A) OK
Reset_Game_Select
    jsr     Reset_Screen_Display_Scores     ; 2079: 20 16 24 

; Reset game selection flashing highlights
    lda     #$01                            ; 207C: A9 01    
    ldx     #$05                            ; 207E: A2 05    
; L_BRS_($2080)_($2083) OK
Loop_Init_Option_Text
    sta     ZP_Game_Select_F1_Flash,x       ; 2080: 95 45    
    dex                                     ; 2082: CA       
    bpl     Loop_Init_Option_Text           ; 2083: 10 FB    

; Setup volume and colour
    lda     #$0F                            ; 2085: A9 0F    
    sta     VIC_RE_Vol_Colour               ; 2087: 8D 0E 90 

; Disable sound object
    lda     #$00                            ; 208A: A9 00    
    sta     Obj_Sound                       ; 208C: 8D A8 03 





;  dP""b8    db    8b    d8 888888     .dP"Y8 888888 88     888888  dP""b8 888888
; dP   `"   dPYb   88b  d88 88__       `Ybo." 88__   88     88__   dP   `"   88
; Yb  "88  dP__Yb  88YbdP88 88""       o.`Y8b 88""   88  .o 88""   Yb        88
;  YboodP dP""""Yb 88 YY 88 888888     8bodP' 888888 88ood8 888888  YboodP   88

; L_BRS_($208F)_($20E1) OK
Game_Select
    inc     ZP_Flash_Countup                ; 208F: E6 58    
    lda     #%00000000                      ; 2091: A9 00    
    sta     VIA2_DDR_B                      ; 2093: 8D 22 91  Set Port B all bits to input
    lda     #%11111111                      ; 2096: A9 FF    
    sta     VIA2_DDR_A                      ; 2098: 8D 23 91  Set Port A all bits to output

    lda     #%01111111                      ; 209B: A9 7F     Select keyboard column to read
    sta     VIA2_Port_A                     ; 209D: 8D 21 91  (F7/F5/F3/F1/CDown/CRight/Rtn/Del)
    ldx     Game_Settings                   ; 20A0: AE D3 1F  Whilst giving keyboard data time to settle?
    lda     VIA2_Port_B                     ; 20A3: AD 20 91  Read keyboard column
    sta     ZP13_Keyboard_Data              ; 20A6: 85 13     Store keyboard data

; Test F-Keys pressed or Space to start game
    lda     #%00010000                      ; 20A8: A9 10    
    bit     ZP13_Keyboard_Data              ; 20AA: 24 13     F1 pressed? (1 Player)
    bne     Test_F3                         ; 20AC: D0 04     No, skip
    txa                                     ; 20AE: 8A       
    and     #%00000010                      ; 20AF: 29 02     Reset Bit 0 = 1 Player
    tax                                     ; 20B1: AA       

; L_BRS_($20B2)_($20AC) OK
Test_F3
    lda     #%00100000                      ; 20B2: A9 20    
    bit     ZP13_Keyboard_Data              ; 20B4: 24 13     F3 pressed? (2 Player)
    bne     Test_F5                         ; 20B6: D0 04     No, skip
    txa                                     ; 20B8: 8A       
    ora     #%00000001                      ; 20B9: 09 01     Set Bit 0 = 2 Player
    tax                                     ; 20BB: AA       

; L_BRS_($20BC)_($20B6) OK
Test_F5
    lda     #%01000000                      ; 20BC: A9 40    
    bit     ZP13_Keyboard_Data              ; 20BE: 24 13     F5 pressed? (Keyboard)
    bne     Test_F7                         ; 20C0: D0 04     No, skip
    txa                                     ; 20C2: 8A       
    and     #%00000001                      ; 20C3: 29 01     Reset Bit 1 = Keyboard controls
    tax                                     ; 20C5: AA       

; L_BRS_($20C6)_($20C0) OK
Test_F7
    lda     #%10000000                      ; 20C6: A9 80    
    bit     ZP13_Keyboard_Data              ; 20C8: 24 13     F7 pressed? (Joystick)
    bne     Test_Space                      ; 20CA: D0 04     No, skip
    txa                                     ; 20CC: 8A       
    ora     #%00000010                      ; 20CD: 09 02     Set Bit 1 = Joystick controls
    tax                                     ; 20CF: AA       

; Store options, update display and test for game start
; L_BRS_($20D0)_($20CA) OK
Test_Space
    txa                                     ; 20D0: 8A        Save game settings
    sta     Game_Settings                   ; 20D1: 8D D3 1F  0=1P+Kbd, 1=2P+Kbd, 2=1P+Jsk, 3=2P+Jsk
    jsr     Display_Game_Select             ; 20D4: 20 B9 24 

    lda     #%11111110                      ; 20D7: A9 FE     Select keyboard column to read
    sta     VIA2_Port_A                     ; 20D9: 8D 21 91  (2/Q/CBM/Space/Stop/Ctrl/Left/1)
    lda     VIA2_Port_B                     ; 20DC: AD 20 91  Read keyboard column
    and     #%00010000                      ; 20DF: 29 10     Space Pressed?
    bne     Game_Select                     ; 20E1: D0 AC     No, check for settings again

; Space was pressed, now start the game
    jsr     Reset_Screen_Display_Scores     ; 20E3: 20 16 24 
    jmp     Game_Start                      ; 20E6: 4C D1 25 
; ------------------------------------------





; 88 88b 88 88 888888     88        db    .dP"Y8 888888 88""Yb
; 88 88Yb88 88   88       88       dPYb   `Ybo." 88__   88__dP
; 88 88 Y88 88   88       88  .o  dP__Yb  o.`Y8b 88""   88"Yb
; 88 88  Y8 88   88       88ood8 dP""""Yb 8bodP' 888888 88  Yb

;  dP"Yb  88""Yb  88888 888888  dP""b8 888888 .dP"Y8
; dP   Yb 88__dP     88 88__   dP   `"   88   `Ybo."
; Yb   dP 88""Yb o.  88 88""   Yb        88   o.`Y8b
;  YbodP  88oodP "bodP' 888888  YboodP   88   8bodP'

; Initialise laser objects once every four calls based on IRQ counter if fire pressed
; L_JSR_($20E9)_($3306) OK
Init_Laser_Objects
    lda     ZP_IRQ_Counter_Lo               ; 20E9: A5 4A    
    and     #$03                            ; 20EB: 29 03    
    beq     Do_Init_Laser_Objects           ; 20ED: F0 01    
    rts                                     ; 20EF: 60       
; ==========================================

; L_BRS_($20F0)_($20ED) OK
Do_Init_Laser_Objects
    jsr     Load_ZP_Parameters              ; 20F0: 20 9D 25 
    fcb     $06                             ; 20F3: 06        ZP06/07
    fdb     Obj_Laser_0                     ; 20F4: 88 03    
    fcb     $FF                             ; 20F6: FF       

; Loop through the four possible Laser shots, branch if any are zero, i.e. first shot setup
    ldx     #MAX_LASERS                     ; 20F7: A2 04    
    ldy     #LASER_TYPE_PARAM               ; 20F9: A0 00    

; L_BRS_($20FB)_($210D) OK
Loop_Update_Laser_Objects
    lda     (ZP06_Laser_Old_State_Lo),y     ; 20FB: B1 06    
    beq     Init_Laser_Object               ; 20FD: F0 11    

; Move 16-bit address pointer to next laser shot object i.e. 8 bytes ahead
    lda     ZP06_Laser_Old_State_Lo         ; 20FF: A5 06    
    clc                                     ; 2101: 18       
    adc     #$08                            ; 2102: 69 08    
    sta     ZP06_Laser_Old_State_Lo         ; 2104: 85 06    

    lda     ZP07_Laser_Old_State_Hi         ; 2106: A5 07    
    adc     #$00                            ; 2108: 69 00    
    sta     ZP07_Laser_Old_State_Hi         ; 210A: 85 07    

; Test if all Laser objects updated, if yes, return, else loop back
    dex                                     ; 210C: CA       
    bne     Loop_Update_Laser_Objects       ; 210D: D0 EC    
    rts                                     ; 210F: 60       
; ==========================================

; Get Jetman state attrib i.e. fly/no-fly and facing left/right
; L_BRS_($2110)_($20FD) OK
Init_Laser_Object
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2110: B1 00    
    tax                                     ; 2112: AA       

; Mask for Jetman facing left/right bit 7, set bit 4 and store to variable
    and     #%10000000                      ; 2113: 29 80    
    ora     #%00010000                      ; 2115: 09 10    
    sta     (ZP06_Laser_New_State_Lo),y     ; 2117: 91 06    

; Get Jetman Position X, manipulate bottom 3 bits and store to variable
    iny                                     ; 2119: C8       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 211A: B1 00    
    and     #%11111000                      ; 211C: 29 F8    
    ora     #%00000101                      ; 211E: 09 05    
    sta     ZP08_Laser_Position_X_Start     ; 2120: 85 08    

; Test again Jetman facing left/right bit 7
    txa                                     ; 2122: 8A       
    and     #%10000000                      ; 2123: 29 80    
    beq     Jetman_Facing_Right             ; 2125: F0 4C    

; Jetman facing left
    lda     ZP08_Laser_Position_X_Start     ; 2127: A5 08    
    sec                                     ; 2129: 38       
    sbc     #$08                            ; 212A: E9 08    
    jsr     Laser_Wrap                      ; 212C: 20 98 22 

; L_JMP_($212F)_($2184) OK
; L_JMP_($212F)_($218A) OK
Init_Laser_Object_Params
    sta     ZP08_Laser_Position_X_Start     ; 212F: 85 08    

; Get Jetman Position Y, subtract some pixels to get gun nozzle height and store to laser object
    iny                                     ; 2131: C8       
    iny                                     ; 2132: C8       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2133: B1 00    
    sec                                     ; 2135: 38       
    sbc     #LASER_GUN_HEIGHT_OFFSET        ; 2136: E9 0D    
    dey                                     ; 2138: 88       
    dey                                     ; 2139: 88       
    sta     (ZP06_Laser_New_State_Lo),y     ; 213A: 91 06    

; Fill Laser object parameters 2-5 with copies of X start position, but with bit 2 ANDed out
    ldx     #LASER_POSITION_X_PARAMS        ; 213C: A2 03    
    iny                                     ; 213E: C8       
    lda     ZP08_Laser_Position_X_Start     ; 213F: A5 08    
    sta     (ZP06_Laser_New_State_Lo),y     ; 2141: 91 06    

    and     #%11111011                      ; 2143: 29 FB    

; L_BRS_($2145)_($2149) OK
Loop_Init_Laser
    iny                                     ; 2145: C8       
    sta     (ZP06_Laser_New_State_Lo),y     ; 2146: 91 06    

    dex                                     ; 2148: CA       
    bne     Loop_Init_Laser                 ; 2149: D0 FA    

; Set laser shot beam length parameter 6 randomly using IRQ counter,
; range 0100_0000 to 0111_1000 i.e. $40-$78
    iny                                     ; 214B: C8       
    lda     ZP_IRQ_Random                   ; 214C: A5 4C    
    and     #%00111000                      ; 214E: 29 38    
    clc                                     ; 2150: 18       
    adc     #%01000000                      ; 2151: 69 40    
    sta     (ZP06_Laser_New_State_Lo),y     ; 2153: 91 06    

; Load a random laser colour value 0-7 using IRQ counter
    iny                                     ; 2155: C8       
    lda     ZP_IRQ_Random                   ; 2156: A5 4C    
    and     #%00000111                      ; 2158: 29 07    
    tax                                     ; 215A: AA       
    lda     Laser_Colour_Table,x            ; 215B: BD 6B 21 
    sta     (ZP06_Laser_New_State_Lo),y     ; 215E: 91 06    

; Trigger laser sound by setting parameters in sound object
    lda     #$03                            ; 2160: A9 03    
    sta     Obj_Sound_Laser                 ; 2162: 8D AD 03 
    lda     #$10                            ; 2165: A9 10    
    sta     Obj_Sound_Laser_Timer           ; 2167: 8D AE 03 
    rts                                     ; 216A: 60       
; ==========================================

; Green not used, it's used for the platforms only
Laser_Colour_Table
    fcb     COLOUR_WHITE,COLOUR_RED         ; 216B: 01 02    
    fcb     COLOUR_CYAN,COLOUR_PURPLE       ; 216D: 03 04    
    fcb     COLOUR_BLUE,COLOUR_YELLOW       ; 216F: 06 07    
    fcb     COLOUR_CYAN,COLOUR_YELLOW       ; 2171: 03 07    

; Test if Jetman Position X is facing right at the start of a tile
; L_BRS_($2173)_($2125) OK
Jetman_Facing_Right
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2173: B1 00    
    and     #%00000111                      ; 2175: 29 07    
    beq     Add_To_Laser_Start_Position_X   ; 2177: F0 14    

; Add to the laser start Position X $18 pixels to avoid drawing laser over Jetman on screen
    lda     ZP08_Laser_Position_X_Start     ; 2179: A5 08    
    clc                                     ; 217B: 18       
    adc     #$18                            ; 217C: 69 18    

; Test for X coordinate screen wraparound
; L_JMP_($217E)_($2192) OK
Laser_Jetman_Facing_Right_Wrap
    and     #%11111110                      ; 217E: 29 FE    
    cmp     #SCREEN_WIDTH_PIXELS            ; 2180: C9 B8    
    bcs     Wrap_Laser_Shot_Position_X      ; 2182: B0 03    
    jmp     Init_Laser_Object_Params        ; 2184: 4C 2F 21 
; ------------------------------------------

; Wrap the laser by subtracting the width of the screen in pixels from the X position
; L_BRS_($2187)_($2182) OK
Wrap_Laser_Shot_Position_X
    sec                                     ; 2187: 38       
    sbc     #SCREEN_WIDTH_PIXELS            ; 2188: E9 B8    
    jmp     Init_Laser_Object_Params        ; 218A: 4C 2F 21 
; ------------------------------------------

; Add to the laser start Position X $10 pixels to avoid drawing laser over Jetman on screen
; L_BRS_($218D)_($2177) OK
Add_To_Laser_Start_Position_X
    lda     ZP08_Laser_Position_X_Start     ; 218D: A5 08    
    clc                                     ; 218F: 18       
    adc     #$10                            ; 2190: 69 10    
    jmp     Laser_Jetman_Facing_Right_Wrap  ; 2192: 4C 7E 21 
; ------------------------------------------





; ############################################################################################
; 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP
;  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP
;  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P
; 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP

; 88        db    .dP"Y8 888888 88""Yb .dP"Y8
; 88       dPYb   `Ybo." 88__   88__dP `Ybo."
; 88  .o  dP__Yb  o.`Y8b 88""   88"Yb  o.`Y8b
; 88ood8 dP""""Yb 8bodP' 888888 88  Yb 8bodP'
; ############################################################################################

; L_BRS_($2195)_($21C7) OK
Add_08_Handle_Wrap_Get_Y_Coord
    adc     #$08                            ; 2195: 69 08    
    jmp     Handle_Wrap_Get_Y_Coord         ; 2197: 4C CB 21 
; ------------------------------------------

DISPLAY_LASERS
    ldy     #LASER_LENGTH_PARAM             ; 219A: A0 06    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 219C: B1 00    
    sta     ZP07_Laser_Length_Columns       ; 219E: 85 07    

; Y becomes $07 i.e. Laser Colour parameter
    iny                                     ; 21A0: C8        Y=$07, laser colour addr
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 21A1: B1 00     Fetch laser colour
    sta     ZP1B_Laser_Colour               ; 21A3: 85 1B     Store to ZP variable

; Get laser X and Y-coord and store to temp vars
    ldy     #LASER_POSITION_X               ; 21A5: A0 02    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 21A7: B1 00    
    sta     ZP06_Laser_Position_X           ; 21A9: 85 06    
    sta     ZP04_Laser_Position_X           ; 21AB: 85 04    

; Y becomes $01 i.e. Laser Position Y
    dey                                     ; 21AD: 88       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 21AE: B1 00    
    sta     ZP05_Laser_Position_Y           ; 21B0: 85 05    
    sta     ZP13_Laser_Position_Y           ; 21B2: 85 13    

; Test if full length of laser has now been reached, branch if yes
    lda     ZP06_Laser_Position_X           ; 21B4: A5 06    
    bit     MASK_00000100                   ; 21B6: 2C 16 20 
    beq     Setup_Laser_Decay_Patterns      ; 21B9: F0 47    

    jsr     Setup_Colour_RAM_Address        ; 21BB: 20 F7 34 
    jsr     Convert_XY_to_UDG_RAM_Address   ; 21BE: 20 1D 35 

; Test if firing left or right
    lda     ZP06_Laser_Position_X           ; 21C1: A5 06    
    bit     MASK_00000001                   ; 21C3: 2C 14 20 
    clc                                     ; 21C6: 18       

; Add 8 if firing left or -8 if firing right ($F8 is -8)
    beq     Add_08_Handle_Wrap_Get_Y_Coord  ; 21C7: F0 CC    
    adc     #$F8                            ; 21C9: 69 F8    

; L_JMP_($21CB)_($2197) OK
Handle_Wrap_Get_Y_Coord
    jsr     Laser_Wrap                      ; 21CB: 20 98 22 
    tax                                     ; 21CE: AA        Save A
    ldy     #LASER_POSITION_Y               ; 21CF: A0 01    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 21D1: B1 00    

; Register Y becomes $00 i.e. Laser Type/Direction Facing parameter
    dey                                     ; 21D3: 88       

; Laser Position Y in accumulator, test if laser shot positions near bottom of screen
; i.e. at or below height of fully-built ship, branch if it is near the bottom
    cmp     #%10000000                      ; 21D4: C9 80    
    bcs     Save_Laser_Position_X           ; 21D6: B0 04    

; Test if laser address in UDG RAM is empty, jump if not empty
; This stops you firing through objects when laser is above the top of the fully-built ship
    lda     (ZP04_Laser_UDG_RAM_Addr_Lo),y  ; 21D8: B1 04    
    bne     UDG_RAM_Zero_Bit_2              ; 21DA: D0 20    

; L_BRS_($21DC)_($21D6) OK
Save_Laser_Position_X
    txa                                     ; 21DC: 8A        Restore A
    sta     ZP06_Laser_Position_X           ; 21DD: 85 06    

; Reverse the displayed 8-bit byte on-screen
    lda     (ZP04_Laser_UDG_RAM_Addr_Lo),y  ; 21DF: B1 04    
    eor     #%11111111                      ; 21E1: 49 FF    
    sta     (ZP04_Laser_UDG_RAM_Addr_Lo),y  ; 21E3: 91 04    

; Load current tile colour, check it's not green, jump if it is
    lda     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 21E5: B1 0C    
    and     #%00001111                      ; 21E7: 29 0F    
    cmp     #COLOUR_GREEN                   ; 21E9: C9 05    
    beq     Reduce_Laser_Length_Countdown   ; 21EB: F0 04    

; Update laser tile colour
    lda     ZP1B_Laser_Colour               ; 21ED: A5 1B    
    sta     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 21EF: 91 0C    

; L_BRS_($21F1)_($21EB) OK
Reduce_Laser_Length_Countdown
    lda     ZP07_Laser_Length_Columns       ; 21F1: A5 07    
    sec                                     ; 21F3: 38       
    sbc     #$08                            ; 21F4: E9 08    
    sta     ZP07_Laser_Length_Columns       ; 21F6: 85 07    

; Test if laser length is > 7, if yes branch
    and     #%11111000                      ; 21F8: 29 F8    
    bne     Setup_Laser_Decay_Patterns      ; 21FA: D0 06    

; Probably turns of further display of laser beam
; L_BRS_($21FC)_($21DA) OK
UDG_RAM_Zero_Bit_2
    lda     ZP06_Laser_Position_X           ; 21FC: A5 06    
    and     #%11111011                      ; 21FE: 29 FB    
    sta     ZP06_Laser_Position_X           ; 2200: 85 06    

; Loads ZP 14/15/16/17 with laser decay pattern, initial laser graphic is a line of $FF's then $03
; subtracted leaving $FC, then $1C subtracted leaving $E0, the subtracting $E0 leaves $00
; i.e. $FF       $FC       $E0       $00
;      %11111111 %11111100 %11100000 %00000000
; L_BRS_($2202)_($21B9) OK
; L_BRS_($2202)_($21FA) OK
Setup_Laser_Decay_Patterns
    jsr     Load_ZP_Parameters              ; 2202: 20 9D 25 
    fcb     $14                             ; 2205: 14        ZP14/15
    fcb     %00000000,%00000011             ; 2206: 00 03     Laser decay pattern
    fcb     $16                             ; 2208: 16        ZP16/17
    fcb     %00011100,%11100000             ; 2209: 1C E0     Laser decay pattern
    fcb     $02                             ; 220B: 02        ZP02/03
    fdb     $0003                           ; 220C: 03 00     Countdown for laser params
    fcb     $FF                             ; 220E: FF       

; Iterate through each of the laser shots that could be active for display
    ldy     #$02                            ; 220F: A0 02    
; L_BRS_($2211)_($221F) OK
; L_BRS_($2211)_($2280) OK
Iterate_Laser_Params_2_3_4_5
    iny                                     ; 2211: C8       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2212: B1 00    
    eor     ZP06_Laser_Position_X           ; 2214: 45 06    
    and     #%11111000                      ; 2216: 29 F8    
    bne     Process_Laser_Shot              ; 2218: D0 0F    

; Test if all possible laser parameters processed
    jsr     Cascade_Laser_Pattern_Data      ; 221A: 20 8B 22 
    dec     ZP02_Laser_Param_Countdown      ; 221D: C6 02    
    bne     Iterate_Laser_Params_2_3_4_5    ; 221F: D0 F0    

; All laser shots ended, set laser shots object type to zero i.e. no laser shot
    lda     #LASER_TYPE_PARAM               ; 2221: A9 00    
    tay                                     ; 2223: A8       
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2224: 91 00    
    jmp     GOTO_NEXT_OBJECT                ; 2226: 4C 1A 26 
; ------------------------------------------

; Process laser shot, update parameters in object table
; Get one of the four laser object parameters, test if bit 2 is set, ef
; L_BRS_($2229)_($2218) OK
Process_Laser_Shot
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2229: B1 00    
    bit     MASK_00000100                   ; 222B: 2C 16 20 
    bne     Update_Laser_Position_X         ; 222E: D0 27    

; Decrements length and test for exit condition
    dec     ZP07_Laser_Length_Columns       ; 2230: C6 07    
    lda     ZP07_Laser_Length_Columns       ; 2232: A5 07    
    and     #%00000111                      ; 2234: 29 07    
    bne     Update_Obj_Params_And_Exit      ; 2236: D0 10    

; Use IRQ counter to add some randomness to laser decay length patterns
    lda     ZP_IRQ_Random                   ; 2238: A5 4C    
    and     #%00000011                      ; 223A: 29 03    
    ora     #%00000100                      ; 223C: 09 04    
    ora     ZP07_Laser_Length_Columns       ; 223E: 05 07    
    sta     ZP07_Laser_Length_Columns       ; 2240: 85 07    

; Register Y is 3 or 4 or 5 or 5 at this point, thus setting bit in laser x-coords
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2242: B1 00    
    ora     #%00000100                      ; 2244: 09 04    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2246: 91 00    

; L_BRS_($2248)_($2236) OK
; L_JMP_($2248)_($2282) OK
Update_Obj_Params_And_Exit
    ldy     #LASER_LENGTH_PARAM             ; 2248: A0 06    
    lda     ZP07_Laser_Length_Columns       ; 224A: A5 07    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 224C: 91 00    

    ldy     #LASER_POSITION_X               ; 224E: A0 02    
    lda     ZP06_Laser_Position_X           ; 2250: A5 06    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2252: 91 00    

    jmp     GOTO_NEXT_OBJECT                ; 2254: 4C 1A 26 
; ------------------------------------------

; Get X-coord from object list parameters and Y-coord, store to UDG RAM address pointers
; and increment/decrement by 8 depending on firing left or right
; L_BRS_($2257)_($222E) OK
Update_Laser_Position_X
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2257: B1 00    
    sta     ZP04_Laser_Position_X           ; 2259: 85 04    
    bit     MASK_00000001                   ; 225B: 2C 14 20 

; Add 8 if firing left or -8 if firing right ($F8 is -8)
    beq     ADC_08_Account_For_Wraparound   ; 225E: F0 25    

    clc                                     ; 2260: 18       
    adc     #$F8                            ; 2261: 69 F8    

; L_JMP_($2263)_($2288) OK
Account_For_Wraparound
    jsr     Laser_Wrap                      ; 2263: 20 98 22 
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2266: 91 00    

    lda     ZP13_Laser_Position_Y           ; 2268: A5 13    
    sta     ZP05_Laser_Position_Y           ; 226A: 85 05    

; EXOR-write data in ZP variable to UDG RAM
    tya                                     ; 226C: 98       
    pha                                     ; 226D: 48       

    jsr     Convert_XY_to_UDG_RAM_Address   ; 226E: 20 1D 35 
    jsr     Cascade_Laser_Pattern_Data      ; 2271: 20 8B 22 

; Apply laser decay pattern onto screen
    ldy     #$00                            ; 2274: A0 00    
    lda     ZP14_Laser_Decay_Patten_Data_0  ; 2276: A5 14    
    eor     (ZP04_Laser_UDG_RAM_Addr_Lo),y  ; 2278: 51 04    
    sta     (ZP04_Laser_UDG_RAM_Addr_Lo),y  ; 227A: 91 04    

    pla                                     ; 227C: 68       
    tay                                     ; 227D: A8       

    dec     ZP02_Laser_Param_Countdown      ; 227E: C6 02    
    bne     Iterate_Laser_Params_2_3_4_5    ; 2280: D0 8F    
    jmp     Update_Obj_Params_And_Exit      ; 2282: 4C 48 22 
; ------------------------------------------

; L_BRS_($2285)_($225E) OK
ADC_08_Account_For_Wraparound
    clc                                     ; 2285: 18       
    adc     #$08                            ; 2286: 69 08    
    jmp     Account_For_Wraparound          ; 2288: 4C 63 22 
; ------------------------------------------

; L_JSR_($228B)_($221A) OK
; L_JSR_($228B)_($2271) OK
Cascade_Laser_Pattern_Data
    lda     ZP15_Laser_Decay_Patten_Data_1  ; 228B: A5 15    
    sta     ZP14_Laser_Decay_Patten_Data_0  ; 228D: 85 14    
    lda     ZP16_Laser_Decay_Patten_Data_2  ; 228F: A5 16    
    sta     ZP15_Laser_Decay_Patten_Data_1  ; 2291: 85 15    
    lda     ZP17_Laser_Decay_Patten_Data_3  ; 2293: A5 17    
    sta     ZP16_Laser_Decay_Patten_Data_2  ; 2295: 85 16    
    rts                                     ; 2297: 60       
; ==========================================

; Looks like it's doing some checks on the X coord, e.g. laser wraparound
; L_JSR_($2298)_($212C) OK
; L_JSR_($2298)_($21CB) OK
; L_JSR_($2298)_($2263) OK
Laser_Wrap
    pha                                     ; 2298: 48       
    and     #%11111000                      ; 2299: 29 F8    
    cmp     #SCREEN_WIDTH_PIXELS            ; 229B: C9 B8    
    bcs     Laser_Wrap_Left_To_Right        ; 229D: B0 02    

    pla                                     ; 229F: 68       
    rts                                     ; 22A0: 60       
; ==========================================

; L_BRS_($22A1)_($229D) OK
Laser_Wrap_Left_To_Right
    tya                                     ; 22A1: 98       
    pha                                     ; 22A2: 48       

; Test top bit i.e. direction left or right
    ldy     #LASER_TYPE_PARAM               ; 22A3: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 22A5: B1 00    
    bit     MASK_10000000                   ; 22A7: 2C 1B 20 
    beq     Laser_Wrap_Right_To_Left        ; 22AA: F0 08    

    pla                                     ; 22AC: 68       
    tay                                     ; 22AD: A8       

; Change X position from e.g. $FD to $B5, where $B8 is screen width in pixels
    pla                                     ; 22AE: 68       
    and     #%00000111                      ; 22AF: 29 07    
    ora     #%10110000                      ; 22B1: 09 B0    
    rts                                     ; 22B3: 60       
; ==========================================

; L_BRS_($22B4)_($22AA) OK
Laser_Wrap_Right_To_Left
    pla                                     ; 22B4: 68       
    tay                                     ; 22B5: A8       

; Change X position to become left side of screen (between 0 and 7)
    pla                                     ; 22B6: 68       
    and     #%00000111                      ; 22B7: 29 07    
    rts                                     ; 22B9: 60       
; ==========================================





; 88""Yb 888888 .dP"Y8 888888 888888     88     888888 Yb    dP 888888 88
; 88__dP 88__   `Ybo." 88__     88       88     88__    Yb  dP  88__   88
; 88"Yb  88""   o.`Y8b 88""     88       88  .o 88""     YbdP   88""   88  .o
; 88  Yb 888888 8bodP' 888888   88       88ood8 888888    YP    888888 88ood8

;    db    8888b.  8888b.      888888 Yb  dP 888888 88""Yb    db
;   dPYb    8I  Yb  8I  Yb     88__    YbdP    88   88__dP   dPYb
;  dP__Yb   8I  dY  8I  dY     88""    dPYb    88   88"Yb   dP__Yb
; dP""""Yb 8888Y"  8888Y"      888888 dP  Yb   88   88  Yb dP""""Yb

; 88     88 888888 888888
; 88     88 88__   88__
; 88  .o 88 88""   88""
; 88ood8 88 88     888888

; L_JSR_($22BA)_($25DA) OK
; L_JSR_($22BA)_($2E44) OK
Reset_Level_Add_Extra_Life
    jsr     Reset_Screen_Display_Scores     ; 22BA: 20 16 24 

; When wave number ends in %11, add extra life e.g. 4th wave, 8th wave etc.
    lda     ZP_Wave_Active_Player           ; 22BD: A5 59    
    and     #%00000011                      ; 22BF: 29 03    
    bne     Restore_Player_Objs_Init_Sound  ; 22C1: D0 0E    

; Add extra life
    jsr     Init_Ship_Obj_Params_Init       ; 22C3: 20 0B 23 
    inc     ZP_Num_Lives_Active_Player      ; 22C6: E6 5A    
    jsr     Init_Next_Jetman_Lives_Scores   ; 22C8: 20 5B 23 

; L_JMP_($22CB)_($22D4) OK
; L_JMP_($22CB)_($22E0) OK
Draw_Platforms_Init_Sound
    jsr     Draw_Platforms                  ; 22CB: 20 52 31 
    jmp     Initialise_Sound_Object         ; 22CE: 4C AE 26 
; ------------------------------------------

; L_BRS_($22D1)_($22C1) OK
Restore_Player_Objs_Init_Sound
    jsr     Set_Load_Obj_Type_X_Y_Colour    ; 22D1: 20 CB 2D 
    jmp     Draw_Platforms_Init_Sound       ; 22D4: 4C CB 22 
; ------------------------------------------

; L_JSR_($22D7)_($29C7) OK
Reset_Level
    jsr     Reset_Screen_Display_Scores     ; 22D7: 20 16 24 
    jsr     Display_Player_1_Lives          ; 22DA: 20 73 23 
    jsr     Restore_Player_Objects          ; 22DD: 20 A1 2D 
    jmp     Draw_Platforms_Init_Sound       ; 22E0: 4C CB 22 
; ------------------------------------------





; 88 88b 88 88 888888      dP"Yb  88""Yb  88888 888888  dP""b8 888888 .dP"Y8
; 88 88Yb88 88   88       dP   Yb 88__dP     88 88__   dP   `"   88   `Ybo."
; 88 88 Y88 88   88       Yb   dP 88""Yb o.  88 88""   Yb        88   o.`Y8b
; 88 88  Y8 88   88        YbodP  88oodP "bodP' 888888  YboodP   88   8bodP'

; L_JMP_($22E3)_($2B7C) OK
; L_JSR_($22E3)_($2DA6) OK
Init_Obj_Ship_Top_Or_Fuel_Typ
    jsr     Save_Obj_List_Ptr               ; 22E3: 20 E7 28 
    jsr     Load_ZP_Parameters              ; 22E6: 20 9D 25 
    fcb     $00                             ; 22E9: 00        ZP00/01
    fdb     Obj_Ship_Top_Or_Fuel_Type       ; 22EA: B8 03    
    fcb     $FF                             ; 22EC: FF       

; L_JMP_($22ED)_($22FC) OK
Init_Objects
    ldx     #$01                            ; 22ED: A2 01    
    jmp     Loop_Init_Objects               ; 22EF: 4C 1A 23 
; ------------------------------------------

; L_JSR_($22F2)_($2DB2) OK
Init_Obj_Ship_Mid_Or_Valu_Typ
    jsr     Save_Obj_List_Ptr               ; 22F2: 20 E7 28 
    jsr     Load_ZP_Parameters              ; 22F5: 20 9D 25 
    fcb     $00                             ; 22F8: 00       
    fdb     Obj_Ship_Mid_Or_Valuable_Typ    ; 22F9: C0 03    
    fcb     $FF                             ; 22FB: FF       
    jmp     Init_Objects                    ; 22FC: 4C ED 22 
; ------------------------------------------

; Init ship top, middle and base object parameters (i.e. 3 x 8 bytes) from static data table
; L_JSR_($22FF)_($230B) OK
; L_JSR_($22FF)_($23DE) OK
Init_Ship_Obj_Params
    ldx     #$17                            ; 22FF: A2 17    

; L_BRS_($2301)_($2308) OK
Loop_Init_Ship_Obj_Params
    lda     Init_Ship_Objs_Param_Table,x    ; 2301: BD 3B 23 
    sta     Obj_Ship_Base,x                 ; 2304: 9D B0 03 
    dex                                     ; 2307: CA       
    bpl     Loop_Init_Ship_Obj_Params       ; 2308: 10 F7    
    rts                                     ; 230A: 60       
; ==========================================

; L_JSR_($230B)_($22C3) OK
Init_Ship_Obj_Params_Init
    jsr     Init_Ship_Obj_Params            ; 230B: 20 FF 22 
    jsr     Save_Obj_List_Ptr               ; 230E: 20 E7 28 
    jsr     Load_ZP_Parameters              ; 2311: 20 9D 25 
    fcb     $00                             ; 2314: 00       
    fdb     Init_Ship_Objs_Param_Table      ; 2315: 3B 23    
    fcb     $FF                             ; 2317: FF       

; Init ship top, middle and base
    ldx     #$03                            ; 2318: A2 03    

; L_JMP_($231A)_($22EF) OK
; L_BRS_($231A)_($2335) OK
Loop_Init_Objects
    txa                                     ; 231A: 8A       
    pha                                     ; 231B: 48       

    jsr     Load_Object_Type_X_Y_Colour     ; 231C: 20 E9 35 
    jsr     Load_Obj_UDG_Data_Addr_Ship_Wv  ; 231F: 20 DA 2F 
    jsr     Display_Object_Ship_Or_Fuel     ; 2322: 20 5A 30 

; Move 16-bit object address pointer to next object i.e. 8 bytes ahead
    lda     ZP_Obj_List_Ptr_Lo              ; 2325: A5 00    
    clc                                     ; 2327: 18       
    adc     #$08                            ; 2328: 69 08    
    sta     ZP_Obj_List_Ptr_Lo              ; 232A: 85 00    

    lda     ZP_Obj_List_Ptr_Hi              ; 232C: A5 01    
    adc     #$00                            ; 232E: 69 00    
    sta     ZP_Obj_List_Ptr_Hi              ; 2330: 85 01    

    pla                                     ; 2332: 68       
    tax                                     ; 2333: AA       

    dex                                     ; 2334: CA       
    bne     Loop_Init_Objects               ; 2335: D0 E3    

    jsr     Restore_Obj_List_Ptr            ; 2337: 20 F0 28 
    rts                                     ; 233A: 60       
; ==========================================

Init_Ship_Objs_Param_Table
    fcb     $09,$70,$00,$AF                 ; 233B: 09 70 00 AF  $09=Ship Base Section
    fcb     $01,$00,$00,$1C                 ; 233F: 01 00 00 1C 

    fcb     $04,$20,$00,$3F                 ; 2343: 04 20 00 3F  $04=Ship Top Section
    fcb     $00,$01,$10,$18                 ; 2347: 00 01 10 18 

    fcb     $04,$50,$00,$5F                 ; 234B: 04 50 00 5F  $04=Ship Middle Section
    fcb     $01,$01,$08,$18                 ; 234F: 01 01 08 18 





; 88 88b 88 88 888888      88888 888888 888888 8b    d8    db    88b 88
; 88 88Yb88 88   88           88 88__     88   88b  d88   dPYb   88Yb88
; 88 88 Y88 88   88       o.  88 88""     88   88YbdP88  dP__Yb  88 Y88
; 88 88  Y8 88   88       "bodP' 888888   88   88 YY 88 dP""""Yb 88  Y8

; 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP     88     88 Yb    dP 888888 .dP"Y8
;  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP      88     88  Yb  dP  88__   `Ybo."
;  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P       88  .o 88   YbdP   88""   o.`Y8b
; 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP        88ood8 88    YP    888888 8bodP'

Init_Jetman_Obj_Param_Table
    fcb     $02,$50,$00,$AF                 ; 2353: 02 50 00 AF  State, Posn_X, Dir_X, Posn_Y
    fcb     $00,$01,$00,$00                 ; 2357: 00 01 00 00  Dir_Y, ?, ?, ?

; Reset Jetman object parameters (i.e. 1 x 8 bytes) from static data table
; L_JSR_($235B)_($22C8) OK
; L_JSR_($235B)_($29CA) OK
; L_JSR_($235B)_($2E6E) OK
Init_Next_Jetman_Lives_Scores
    ldx     #$07                            ; 235B: A2 07    

; L_BRS_($235D)_($2364) OK
Loop_Init_Jetman_Obj
    lda     Init_Jetman_Obj_Param_Table,x   ; 235D: BD 53 23 
    sta     Obj_Jetman_State,x              ; 2360: 9D 80 03 
    dex                                     ; 2363: CA       
    bpl     Loop_Init_Jetman_Obj            ; 2364: 10 F7    

; Test if two player game, if yes, give $FF time between players for switchover instead of $7F
    lda     Game_Settings                   ; 2366: AD D3 1F 
    and     #%00000001                      ; 2369: 29 01    
    beq     LDA_7F_Set_Cntdn_Dec_Num_Lives  ; 236B: F0 62    
    lda     #$FF                            ; 236D: A9 FF    

; L_JMP_($236F)_($23D1) OK
Set_Countdown_Dec_Num_Lives
    sta     ZP_Flash_Score_Countdown        ; 236F: 85 5D    
    dec     ZP_Num_Lives_Active_Player      ; 2371: C6 5A    

; L_JSR_($2373)_($22DA) OK
; L_JSR_($2373)_($2EA6) OK
Display_Player_1_Lives
    jsr     Load_ZP_Parameters              ; 2373: 20 9D 25 
    fcb     $04                             ; 2376: 04        ZP04/05
    fdb     Player_1_Lives_UDG_RAM_Addr     ; 2377: 20 14    
    fcb     $FF                             ; 2379: FF       

; Display number of lives, or erase from screen if zero
    jsr     Load_Player_1_Lives             ; 237A: 20 B6 23 
    beq     Erase_Player_1_Lives            ; 237D: F0 23    
    jsr     Display_Number_Of_Lives         ; 237F: 20 8E 23 

; L_JMP_($2382)_($23A5) OK
Display_Player_2_Lives
    jsr     Load_ZP_Parameters              ; 2382: 20 9D 25 
    fcb     $04                             ; 2385: 04        ZP04/05
    fdb     Player_2_Lives_UDG_RAM_Addr     ; 2386: A0 19    
    fcb     $FF                             ; 2388: FF       

; Display number of lives, or erase from screen if zero
    jsr     Load_Player_2_Lives             ; 2389: 20 C0 23 
    beq     Erase_Player_Lives              ; 238C: F0 1A    

; L_JSR_($238E)_($237F) OK
Display_Number_Of_Lives
    clc                                     ; 238E: 18       
    adc     #CHARACTER_ZERO                 ; 238F: 69 70     $70 = "0" character
    sta     ZP06_Character_To_Copy          ; 2391: 85 06    
    jsr     Copy_Char_To_UDG_RAM_Setup      ; 2393: 20 95 35 

; Display Jetman Icon next to number of lives
    jsr     Load_ZP_Parameters              ; 2396: 20 9D 25 
    fcb     $06                             ; 2399: 06        ZP06/07
    fdb     Jetman_Icon_UDG_Char_Data       ; 239A: C7 23    
    fcb     $FF                             ; 239C: FF       

; Jetman UDG has 8 bytes of data to copy
    ldy     #$07                            ; 239D: A0 07    
    jmp     Copy_Char_To_UDG_RAM            ; 239F: 4C B6 35 
; ------------------------------------------

; L_BRS_($23A2)_($237D) OK
Erase_Player_1_Lives
    jsr     Erase_Player_Lives              ; 23A2: 20 A8 23 
    jmp     Display_Player_2_Lives          ; 23A5: 4C 82 23 
; ------------------------------------------

; L_BRS_($23A8)_($238C) OK
; L_JSR_($23A8)_($23A2) OK
Erase_Player_Lives
    lda     #CHARACTER_SPACE                ; 23A8: A9 60     $60 = Space character
    sta     ZP06_Character_To_Copy          ; 23AA: 85 06    
    jsr     Copy_Char_To_UDG_RAM_Setup      ; 23AC: 20 95 35 

    lda     #CHARACTER_SPACE                ; 23AF: A9 60     $60 = Space character
    sta     ZP06_Character_To_Copy          ; 23B1: 85 06    
    jmp     Copy_Char_To_UDG_RAM_Setup      ; 23B3: 4C 95 35 
; ------------------------------------------

; L_JSR_($23B6)_($237A) OK
Load_Player_1_Lives
    lda     ZP_Active_Player                ; 23B6: A5 5E    
    bne     Load_Player_Inactive_Lives      ; 23B8: D0 03    

; L_JMP_($23BA)_($23C4) OK
Load_Player_Active_Lives
    lda     ZP_Num_Lives_Active_Player      ; 23BA: A5 5A    
    rts                                     ; 23BC: 60       
; ==========================================

; L_BRS_($23BD)_($23B8) OK
; L_BRS_($23BD)_($23C2) OK
Load_Player_Inactive_Lives
    lda     ZP_Num_Lives_Inactive_Player    ; 23BD: A5 5C    
    rts                                     ; 23BF: 60       
; ==========================================

; L_JSR_($23C0)_($2389) OK
Load_Player_2_Lives
    lda     ZP_Active_Player                ; 23C0: A5 5E    
    beq     Load_Player_Inactive_Lives      ; 23C2: F0 F9    
    jmp     Load_Player_Active_Lives        ; 23C4: 4C BA 23 
; ------------------------------------------

Jetman_Icon_UDG_Char_Data
    fcb     %00011000                       ; 23C7: 18        ...##...
    fcb     %00100100                       ; 23C8: 24        ..#..#..
    fcb     %00111100                       ; 23C9: 3C        ..####..
    fcb     %01111110                       ; 23CA: 7E        .######.
    fcb     %01011010                       ; 23CB: 5A        .#.##.#.
    fcb     %00111100                       ; 23CC: 3C        ..####..
    fcb     %00111100                       ; 23CD: 3C        ..####..
    fcb     %01100110                       ; 23CE: 66        .##..##.

; L_BRS_($23CF)_($236B) OK
LDA_7F_Set_Cntdn_Dec_Num_Lives
    lda     #$7F                            ; 23CF: A9 7F    
    jmp     Set_Countdown_Dec_Num_Lives     ; 23D1: 4C 6F 23 
; ------------------------------------------





; .dP"Y8 888888 888888 88   88 88""Yb     88""Yb 88        db    Yb  dP 888888 88""Yb
; `Ybo." 88__     88   88   88 88__dP     88__dP 88       dPYb    YbdP  88__   88__dP
; o.`Y8b 88""     88   Y8   8P 88"""      88"""  88  .o  dP__Yb    8P   88""   88"Yb
; 8bodP' 888888   88   `YbodP' 88         88     88ood8 dP""""Yb  dP    888888 88  Yb

; 88     88 Yb    dP 888888 .dP"Y8      dP"Yb  88""Yb  88888 888888  dP""b8 888888 .dP"Y8
; 88     88  Yb  dP  88__   `Ybo."     dP   Yb 88__dP     88 88__   dP   `"   88   `Ybo."
; 88  .o 88   YbdP   88""   o.`Y8b     Yb   dP 88""Yb o.  88 88""   Yb        88   o.`Y8b
; 88ood8 88    YP    888888 8bodP'      YbodP  88oodP "bodP' 888888  YboodP   88   8bodP'

; Set Active Player, initial lives for both players and ship object parameters
; L_JSR_($23D4)_($25D7) OK
Setup_Player_Lives
    ldy     #$02                            ; 23D4: A0 02    

; L_BRS_($23D6)_($23E5) OK
Loop_Setup_Player_Lives
    lda     #PLAYER_1                       ; 23D6: A9 00    
    sta     ZP_Wave_Active_Player           ; 23D8: 85 59    

    lda     #LIVES_INITIAL_PLAYER_1         ; 23DA: A9 04    
    sta     ZP_Num_Lives_Active_Player      ; 23DC: 85 5A    

    jsr     Init_Ship_Obj_Params            ; 23DE: 20 FF 22 
    jsr     Swap_Player_And_Obj_Ship        ; 23E1: 20 F5 23 

    dey                                     ; 23E4: 88       
    bne     Loop_Setup_Player_Lives         ; 23E5: D0 EF    

    lda     #LIVES_INITIAL_PLAYER_2         ; 23E7: A9 05    
    sta     ZP_Num_Lives_Inactive_Player    ; 23E9: 85 5C    

; Test if single player game, if yes, set Player 2 lives to 0 i.e. inactive player
    lda     Game_Settings                   ; 23EB: AD D3 1F 
    and     #%00000001                      ; 23EE: 29 01    
    bne     Setup_Player_Lives_RTS          ; 23F0: D0 02    
    sta     ZP_Num_Lives_Inactive_Player    ; 23F2: 85 5C    

; L_BRS_($23F4)_($23F0) OK
Setup_Player_Lives_RTS
    rts                                     ; 23F4: 60       
; ==========================================

; When active player changes, swap current active/inactive player wave and ship object data
; L_JSR_($23F5)_($23E1) OK
; L_JSR_($23F5)_($29DB) OK
Swap_Player_And_Obj_Ship
    ldx     #$01                            ; 23F5: A2 01    
; L_BRS_($23F7)_($2402) OK
Swap_Player
    lda     ZP_Wave_Active_Player,x         ; 23F7: B5 59    

    pha                                     ; 23F9: 48       
    lda     ZP_Wave_Inactive_Player,x       ; 23FA: B5 5B    
    sta     ZP_Wave_Active_Player,x         ; 23FC: 95 59    
    pla                                     ; 23FE: 68       

    sta     ZP_Wave_Inactive_Player,x       ; 23FF: 95 5B    
    dex                                     ; 2401: CA       
    bpl     Swap_Player                     ; 2402: 10 F3    

    ldx     #$17                            ; 2404: A2 17    

; L_BRS_($2406)_($2413) OK
Loop_Swap_Ship_Object
    lda     Obj_Ship_Base,x                 ; 2406: BD B0 03 

    pha                                     ; 2409: 48       
    lda     ZP_Obj_Ship_Saved,x             ; 240A: B5 28    
    sta     Obj_Ship_Base,x                 ; 240C: 9D B0 03 
    pla                                     ; 240F: 68       

    sta     ZP_Obj_Ship_Saved,x             ; 2410: 95 28    
    dex                                     ; 2412: CA       
    bpl     Loop_Swap_Ship_Object           ; 2413: 10 F1    
    rts                                     ; 2415: 60       
; ==========================================





; 88 88b 88 88 888888     .dP"Y8  dP""b8 88""Yb 888888 888888 88b 88
; 88 88Yb88 88   88       `Ybo." dP   `" 88__dP 88__   88__   88Yb88
; 88 88 Y88 88   88       o.`Y8b Yb      88"Yb  88""   88""   88 Y88
; 88 88  Y8 88   88       8bodP'  YboodP 88  Yb 888888 888888 88  Y8

; 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP
;  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP
;  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P
; 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP

; .dP"Y8  dP""b8  dP"Yb  88""Yb 888888 .dP"Y8
; `Ybo." dP   `" dP   Yb 88__dP 88__   `Ybo."
; o.`Y8b Yb      Yb   dP 88"Yb  88""   o.`Y8b
; 8bodP'  YboodP  YbodP  88  Yb 888888 8bodP'

; L_JSR_($2416)_($2079) OK
; L_JSR_($2416)_($20E3) OK
; L_JSR_($2416)_($22BA) OK
; L_JSR_($2416)_($22D7) OK
; L_JSR_($2416)_($298A) OK
; L_JSR_($2416)_($29E7) OK
Reset_Screen_Display_Scores
    jsr     Reset_Colour_RAM                ; 2416: 20 5C 35 
    jsr     Reset_UDG_RAM                   ; 2419: 20 6C 35 
    jsr     Display_Player_1_Score          ; 241C: 20 71 24 
    jsr     Display_High_Score              ; 241F: 20 91 24 
    jsr     Display_Player_2_Score          ; 2422: 20 81 24 

; Three strings to display across top of screen, 1UP, HI and 2UP
; L_JSR_($2425)_($335E) OK
Display_1UP_HI_2UP_Text
    ldx     #$00                            ; 2425: A2 00    
    ldy     #$03                            ; 2427: A0 03    

; L_BRS_($2429)_($244D) OK
Loop_Display_1UP_HI_2UP_Text
    lda     STRING_1UP_HI_2UP,x             ; 2429: BD 65 24 
    sta     ZP04_Position_X                 ; 242C: 85 04    

    inx                                     ; 242E: E8       
    lda     STRING_1UP_HI_2UP,x             ; 242F: BD 65 24 
    sta     ZP05_Position_Y                 ; 2432: 85 05    

    inx                                     ; 2434: E8       
    lda     STRING_1UP_HI_2UP,x             ; 2435: BD 65 24 
    sta     ZP0E_String_Addr_Lo             ; 2438: 85 0E    

    inx                                     ; 243A: E8       
    lda     STRING_1UP_HI_2UP,x             ; 243B: BD 65 24 
    sta     ZP0F_String_Addr_Hi             ; 243E: 85 0F    

    inx                                     ; 2440: E8       
    txa                                     ; 2441: 8A       
    pha                                     ; 2442: 48       
    tya                                     ; 2443: 98       
    pha                                     ; 2444: 48       
    jsr     Display_String_With_Setup       ; 2445: 20 CC 34 
    pla                                     ; 2448: 68       
    tay                                     ; 2449: A8       
    pla                                     ; 244A: 68       
    tax                                     ; 244B: AA       

    dey                                     ; 244C: 88       
    bne     Loop_Display_1UP_HI_2UP_Text    ; 244D: D0 DA    
    rts                                     ; 244F: 60       
; ==========================================

STRING_1UP
    fcb     COLOUR_WHITE                    ; 2450: 01       
    fcc     "`qUP`"                         ; 2451: 60 71 55 50 60  `=Space, q=1, r=2
    fcb     $E0                             ; 2456: E0        Top bit=1 indicates end of string
STRING_HI
    fcb     COLOUR_YELLOW                   ; 2457: 07       
    fcc     "``HI`"                         ; 2458: 60 60 48 49 60 
    fcb     $E0                             ; 245D: E0       
STRING_2UP
    fcb     COLOUR_WHITE                    ; 245E: 01       
    fcc     "``rUP"                         ; 245F: 60 60 72 55 50 
    fcb     $E0                             ; 2464: E0       

STRING_1UP_HI_2UP
    fcb     $00,$00                         ; 2465: 00 00     X Y
    fdb     STRING_1UP                      ; 2467: 50 24    
    fcb     $40,$00                         ; 2469: 40 00     X Y
    fdb     STRING_HI                       ; 246B: 57 24    
    fcb     $80,$00                         ; 246D: 80 00     X Y
    fdb     STRING_2UP                      ; 246F: 5E 24    

; L_JSR_($2471)_($241C) OK
; L_JMP_($2471)_($308B) OK
; L_JSR_($2471)_($3361) OK
Display_Player_1_Score
    jsr     Load_ZP_Parameters              ; 2471: 20 9D 25 
    fcb     $04                             ; 2474: 04        ZP04/05
    fdb     Player_1_Score_UDG_RAM_Addr     ; 2475: 08 10     UDG RAM address to display score at
    fcb     $0E                             ; 2477: 0E        ZP0E/0F
    fdb     ZP_Score_Player_1               ; 2478: 51 00     Players score BCD e.g. 12 34 56
    fcb     $02                             ; 247A: 02        ZP02/03
    fdb     $0003                           ; 247B: 03 00     3 bytes of BCD data to display e.g. 12 34 56
    fcb     $FF                             ; 247D: FF       
    jmp     Display_BCD_Bytes               ; 247E: 4C A4 34 
; ------------------------------------------

; L_JSR_($2481)_($2422) OK
; L_JMP_($2481)_($308E) OK
; L_JSR_($2481)_($3364) OK
Display_Player_2_Score
    jsr     Load_ZP_Parameters              ; 2481: 20 9D 25 
    fcb     $04                             ; 2484: 04       
    fdb     Player_2_Score_UDG_RAM_Addr     ; 2485: 08 1B    
    fcb     $0E                             ; 2487: 0E       
    fdb     ZP_Score_Player_2               ; 2488: 54 00    
    fcb     $02                             ; 248A: 02       
    fdb     $0003                           ; 248B: 03 00    
    fcb     $FF                             ; 248D: FF       
    jmp     Display_BCD_Bytes               ; 248E: 4C A4 34 
; ------------------------------------------

; L_JSR_($2491)_($241F) OK
Display_High_Score
    jsr     Load_ZP_Parameters              ; 2491: 20 9D 25 
    fcb     $04                             ; 2494: 04       
    fdb     Hi_Score_UDG_RAM_Addr           ; 2495: 88 15    
    fcb     $0E                             ; 2497: 0E       
    fdb     Score_Hi                        ; 2498: D0 1F    
    fcb     $02                             ; 249A: 02       
    fdb     $0003                           ; 249B: 03 00    
    fcb     $FF                             ; 249D: FF       
    jmp     Display_BCD_Bytes               ; 249E: 4C A4 34 
; ------------------------------------------





; 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP
;  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP
;  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P
; 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP

;  dP""b8    db    8b    d8 888888     .dP"Y8 888888 88     888888  dP""b8 888888
; dP   `"   dPYb   88b  d88 88__       `Ybo." 88__   88     88__   dP   `"   88
; Yb  "88  dP__Yb  88YbdP88 88""       o.`Y8b 88""   88  .o 88""   Yb        88
;  YboodP dP""""Yb 88 YY 88 888888     8bodP' 888888 88ood8 888888  YboodP   88

; Update the selected option flashing text status i.e. option selected and display yes/no
; Register A enters with bit 0 set as Players 1 or 2, or Joystick or Keyboard
; Register X enters as 0 or 2, which is an index into the Game Select Fn Key status
; Code runs twice, first with JSR/RTS, then with normal run though, ending with RTS
; L_JSR_($24A1)_($24C0) OK
; L_JSR_($24A1)_($24C7) OK
Game_Select_Flash
    jsr     Do_Game_Select_Flash            ; 24A1: 20 A4 24 

; L_JSR_($24A4)_($24A1) OK
Do_Game_Select_Flash
    pha                                     ; 24A4: 48       

; Test setting flag, if set, this is the unselected option, skip the count-up/invert part
    and     #%00000001                      ; 24A5: 29 01    
    bne     Store_Option_Selection_State    ; 24A7: D0 09    

; This is the selected option, divide the counter by 8 and use it to set the display
; selected on/off flag i.e. periodically flash it at about 2Hz
    lda     ZP_Flash_Countup                ; 24A9: A5 58    
    lsr     a                               ; 24AB: 4A       
    lsr     a                               ; 24AC: 4A       
    lsr     a                               ; 24AD: 4A       

; Convert the counter value into a display on/off flag toggle
; Set bit 7 to make this selected option flash
    and     #%00000001                      ; 24AE: 29 01    
    ora     #%10000000                      ; 24B0: 09 80    

; L_BRS_($24B2)_($24A7) OK
Store_Option_Selection_State
    sta     ZP_Game_Select_F1_Flash,x       ; 24B2: 95 45    
    pla                                     ; 24B4: 68       

; Invert Register A bit 0, increment the Game Select Fn Key index and loop back (or RTS)
    eor     #%00000001                      ; 24B5: 49 01    
    inx                                     ; 24B7: E8       
    rts                                     ; 24B8: 60       
; ==========================================

; L_JSR_($24B9)_($20D4) OK
Display_Game_Select
    ldx     #$00                            ; 24B9: A2 00    

; Set selected game options for 1 or 2 Player (Game_Settings bit 0)
    lda     Game_Settings                   ; 24BB: AD D3 1F 
    and     #%00000001                      ; 24BE: 29 01    
    jsr     Game_Select_Flash               ; 24C0: 20 A1 24 

; Set selected game options for Joystick or Keyboard (Game_Settings bit 1)
    lda     Game_Settings                   ; 24C3: AD D3 1F 
    lsr     a                               ; 24C6: 4A       
    jsr     Game_Select_Flash               ; 24C7: 20 A1 24 

    jsr     Load_ZP_Parameters              ; 24CA: 20 9D 25 
    fcb     $04                             ; 24CD: 04        ZP04/05
    fcb     $08,$20                         ; 24CE: 08 20     X Y
    fcb     $0E                             ; 24D0: 0E        ZP0E/0F
    fdb     STRING_JETPAC_GAME_SELECT       ; 24D1: 3A 25    
    fcb     $FF                             ; 24D3: FF       
    jsr     Display_String_With_Setup       ; 24D4: 20 CC 34 

    jsr     Load_ZP_Parameters              ; 24D7: 20 9D 25 
    fcb     $04                             ; 24DA: 04        ZP04/05
    fcb     $08,$A8                         ; 24DB: 08 A8     X Y
    fcb     $0E                             ; 24DD: 0E        ZP0E/0F
    fdb     STRING_COPYRIGHT_1983_ACG       ; 24DE: 24 25    
    fcb     $FF                             ; 24E0: FF       
    jsr     Display_String_With_Setup       ; 24E1: 20 CC 34 

    jsr     Load_ZP_Parameters              ; 24E4: 20 9D 25 
    fcb     $0E                             ; 24E7: 0E        ZP0E/0F
    fdb     STRING_F1_1_PLAYER_GAME         ; 24E8: 50 25    
    fcb     $FF                             ; 24EA: FF       

; Setup and display attract screen game selection options
    lda     #$00                            ; 24EB: A9 00    
    sta     ZP08_Row_Offset_Table_Index     ; 24ED: 85 08    

; X position is hardcoded, Y position comes from a lookup table keyed on ZP08 Index
; L_BRS_($24EF)_($251C) OK
Loop_Display_Game_Select
    lda     #TEXT_POSITION_X                ; 24EF: A9 18    
    sta     ZP04_Position_X                 ; 24F1: 85 04    

    ldx     ZP08_Row_Offset_Table_Index     ; 24F3: A6 08    
    lda     Fn_And_SP_Row_Offsets,x         ; 24F5: BD 1F 25 
    sta     ZP05_Position_Y                 ; 24F8: 85 05    

    jsr     Setup_Colour_RAM_Address        ; 24FA: 20 F7 34 
    jsr     Convert_XY_to_UDG_RAM_Address   ; 24FD: 20 1D 35 

; Setup and call string display routine
    ldy     #$00                            ; 2500: A0 00    
    ldx     ZP08_Row_Offset_Table_Index     ; 2502: A6 08    
    lda     ZP_Game_Select_F1_Flash,x       ; 2504: B5 45    
    jsr     Display_String                  ; 2506: 20 D6 34 

; Display_String increments the Y register by number of characters displayed, now increment
; it again and add it to 16-bit address of the next string to display in ZP0E/0F
    iny                                     ; 2509: C8       
    tya                                     ; 250A: 98       
    clc                                     ; 250B: 18       
    adc     ZP0E_String_Addr_Lo             ; 250C: 65 0E    
    sta     ZP0E_String_Addr_Lo             ; 250E: 85 0E    

    lda     ZP0F_String_Addr_Hi             ; 2510: A5 0F    
    adc     #$00                            ; 2512: 69 00    
    sta     ZP0F_String_Addr_Hi             ; 2514: 85 0F    

; Increment table index and test if all rows displayed
    inc     ZP08_Row_Offset_Table_Index     ; 2516: E6 08    
    lda     ZP08_Row_Offset_Table_Index     ; 2518: A5 08    
    cmp     #OPTION_TEXT_ROWS               ; 251A: C9 05    
    bne     Loop_Display_Game_Select        ; 251C: D0 D1    
    rts                                     ; 251E: 60       
; ==========================================

Fn_And_SP_Row_Offsets
    fcb     $38,$48,$58,$68,$90             ; 251F: 38 48 58 68 90 

STRING_COPYRIGHT_1983_ACG
    fcb     COLOUR_WHITE                    ; 2524: 01       
    fcc     "COPYRIGHT`qyxs`AnCnG"          ; 2525: 43 4F 50 59 52 49 47 48 54 60 71 79 78 73 60 41 6E 43 6E 47 
    fcb     $EE                             ; 2539: EE        Bit 7 = 1 indicates string end, $EE = $6E + bit 7
                                            ; `= Space, qyxs = 1983, n=.
STRING_JETPAC_GAME_SELECT
    fcb     COLOUR_WHITE                    ; 253A: 01       
    fcc     "JETPAC`GAME`SELECTIO"          ; 253B: 4A 45 54 50 41 43 60 47 41 4D 45 60 53 45 4C 45 43 54 49 4F 
    fcb     $CE                             ; 254F: CE        $CE = $4E + top bit, $4E = "N"
STRING_F1_1_PLAYER_GAME
    fcb     COLOUR_BLACK                    ; 2550: 00       
    fcc     "Fq``q`PLAYER`GAM"              ; 2551: 46 71 60 60 71 60 50 4C 41 59 45 52 60 47 41 4D 
    fcb     $C5                             ; 2561: C5       
STRING_F3_2_PLAYER_GAME
    fcb     COLOUR_BLACK                    ; 2562: 00       
    fcc     "Fs``r`PLAYER`GAM"              ; 2563: 46 73 60 60 72 60 50 4C 41 59 45 52 60 47 41 4D 
    fcb     $C5                             ; 2573: C5       
STRING_F5_KEYBOARD
    fcb     COLOUR_BLACK                    ; 2574: 00       
    fcc     "Fu``KEYBOAR"                   ; 2575: 46 75 60 60 4B 45 59 42 4F 41 52 
    fcb     $C4                             ; 2580: C4       
STRING_F7_JOYSTICK
    fcb     COLOUR_BLACK                    ; 2581: 00       
    fcc     "Fw``JOYSTIC"                   ; 2582: 46 77 60 60 4A 4F 59 53 54 49 43 
    fcb     $CB                             ; 258D: CB       
STRING_SP_START_GAME
    fcb     COLOUR_BLACK                    ; 258E: 00       
    fcc     "SP``START`GAM"                 ; 258F: 53 50 60 60 53 54 41 52 54 60 47 41 4D 
    fcb     $C5                             ; 259C: C5       





; 88      dP"Yb     db    8888b.      8888P 88""Yb
; 88     dP   Yb   dPYb    8I  Yb       dP  88__dP
; 88  .o Yb   dP  dP__Yb   8I  dY      dP   88"""
; 88ood8  YbodP  dP""""Yb 8888Y"      d8888 88

; 88""Yb    db    88""Yb    db    8b    d8 888888 888888 888888 88""Yb .dP"Y8
; 88__dP   dPYb   88__dP   dPYb   88b  d88 88__     88   88__   88__dP `Ybo."
; 88"""   dP__Yb  88"Yb   dP__Yb  88YbdP88 88""     88   88""   88"Yb  o.`Y8b
; 88     dP""""Yb 88  Yb dP""""Yb 88 YY 88 888888   88   888888 88  Yb 8bodP'

; Parameters for this routine are assembled into memory directly after the
; call to this routine. When the routine is called using JSR, the return address
; will be the address of the first parameter, so they can be pulled off using PLA.
; First two stack values are the 16-bit address where next two stack values will be stored.
; L_JSR_($259D)_($20F0) OK
; L_JSR_($259D)_($2202) OK
; L_JSR_($259D)_($22E6) OK
; L_JSR_($259D)_($22F5) OK
; L_JSR_($259D)_($2311) OK
; L_JSR_($259D)_($2373) OK
; L_JSR_($259D)_($2382) OK
; L_JSR_($259D)_($2396) OK
; L_JSR_($259D)_($2471) OK
; L_JSR_($259D)_($2481) OK
; L_JSR_($259D)_($2491) OK
; L_JSR_($259D)_($24CA) OK
; L_JSR_($259D)_($24D7) OK
; L_JSR_($259D)_($24E4) OK
; L_JSR_($259D)_($2676) OK
; L_JSR_($259D)_($277A) OK
; L_JSR_($259D)_($2787) OK
; L_JSR_($259D)_($2867) OK
; L_JSR_($259D)_($29EE) OK
; L_JSR_($259D)_($29FB) OK
; L_JSR_($259D)_($2A12) OK
; L_JSR_($259D)_($2A48) OK
; L_JSR_($259D)_($2BCA) OK
; L_JSR_($259D)_($2DB8) OK
; L_JSR_($259D)_($2E8F) OK
; L_JSR_($259D)_($2FF9) OK
; L_JSR_($259D)_($3067) OK
; L_JSR_($259D)_($3091) OK
; L_JSR_($259D)_($3469) OK
; L_JSR_($259D)_($349A) OK
; L_JSR_($259D)_($355C) OK
; L_JSR_($259D)_($356C) OK
Load_ZP_Parameters
    pla                                     ; 259D: 68       
    sta     ZP_Param_Addr_Lo                ; 259E: 85 40    
    pla                                     ; 25A0: 68       
    sta     ZP_Param_Addr_Hi                ; 25A1: 85 41    

    ldy     #$01                            ; 25A3: A0 01    

; $FF signifies end of address/parameter data to load
; L_JMP_($25A5)_($25C7) OK
Loop_Test_Param_List_End
    lda     (ZP_Param_Addr_Lo),y            ; 25A5: B1 40    
    cmp     #$FF                            ; 25A7: C9 FF    
    bne     Load_ZP_Parameter               ; 25A9: D0 0A    

; All parameters now loaded, push a new return address back onto the stack and RTS
    jsr     Inc_Param_Addr                  ; 25AB: 20 CA 25 
    lda     ZP_Param_Addr_Hi                ; 25AE: A5 41    
    pha                                     ; 25B0: 48       
    lda     ZP_Param_Addr_Lo                ; 25B1: A5 40    
    pha                                     ; 25B3: 48       
    rts                                     ; 25B4: 60       
; ==========================================

; Register A contain 8-bit ZP address to store 16-bit value to, Register Y is 1
; L_BRS_($25B5)_($25A9) OK
Load_ZP_Parameter
    tax                                     ; 25B5: AA       

; Increment the param address, load the data stored there and store it to a ZP location
    jsr     Inc_Param_Addr                  ; 25B6: 20 CA 25 
    lda     (ZP_Param_Addr_Lo),y            ; 25B9: B1 40    
    sta     ZP_Obj_List_Ptr_Lo,x            ; 25BB: 95 00    

; Inc the param address again, load the data stored there and store it to a ZP location
    jsr     Inc_Param_Addr                  ; 25BD: 20 CA 25 
    lda     (ZP_Param_Addr_Lo),y            ; 25C0: B1 40    
    sta     ZP_Obj_List_Ptr_Hi,x            ; 25C2: 95 01    

; Inc the param address again and loop back to process next data value
    jsr     Inc_Param_Addr                  ; 25C4: 20 CA 25 
    jmp     Loop_Test_Param_List_End        ; 25C7: 4C A5 25 
; ------------------------------------------

; Increment the 16-bit parameter address, lo-byte then hi-byte if necessary
; L_JSR_($25CA)_($25AB) OK
; L_JSR_($25CA)_($25B6) OK
; L_JSR_($25CA)_($25BD) OK
; L_JSR_($25CA)_($25C4) OK
Inc_Param_Addr
    inc     ZP_Param_Addr_Lo                ; 25CA: E6 40    
    bne     Inc_Param_Addr_RTS              ; 25CC: D0 02    
    inc     ZP_Param_Addr_Hi                ; 25CE: E6 41    

; L_BRS_($25D0)_($25CC) OK
Inc_Param_Addr_RTS
    rts                                     ; 25D0: 60       
; ==========================================





;  dP""b8    db    8b    d8 888888     .dP"Y8 888888    db    88""Yb 888888
; dP   `"   dPYb   88b  d88 88__       `Ybo."   88     dPYb   88__dP   88
; Yb  "88  dP__Yb  88YbdP88 88""       o.`Y8b   88    dP__Yb  88"Yb    88
;  YboodP dP""""Yb 88 YY 88 888888     8bodP'   88   dP""""Yb 88  Yb   88

; L_JMP_($25D1)_($20E6) OK
Game_Start
    jsr     Erase_Object_RAM                ; 25D1: 20 64 27 
    jsr     Erase_ZP_RAM                    ; 25D4: 20 5B 27 
    jsr     Setup_Player_Lives              ; 25D7: 20 D4 23 
    jsr     Reset_Level_Add_Extra_Life      ; 25DA: 20 BA 22 
    jmp     Main_Loop_Init                  ; 25DD: 4C FA 25 
; ------------------------------------------

; +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
IRQ_Interrupt_Handler
    lda     #$01                            ; 25E0: A9 01    

; Set IRQ Occurred flag, used to prioritise Jetman object handling in main loop
    sta     ZP_IRQ_Occurred                 ; 25E2: 85 20    

; Reset VIA2 timer, which directly regulates Jetman's update speed
    jsr     Reset_VIA2_Timer                ; 25E4: 20 5E 26 

; Use TV Raster value as a pseudo-random number generator
    lda     VIC_R4_TV_Raster                ; 25E7: AD 04 90 
    adc     ZP_IRQ_Random                   ; 25EA: 65 4C    
    sta     ZP_IRQ_Random                   ; 25EC: 85 4C    

; Increment 16-bit counter
    inc     ZP_IRQ_Counter_Lo               ; 25EE: E6 4A    
    bne     Restore_Registers_And_RTI       ; 25F0: D0 02    
    inc     ZP_IRQ_Counter_Hi               ; 25F2: E6 4B    

; L_BRS_($25F4)_($25F0) OK
Restore_Registers_And_RTI
    pla                                     ; 25F4: 68       
    tay                                     ; 25F5: A8       
    pla                                     ; 25F6: 68       
    tax                                     ; 25F7: AA       
    pla                                     ; 25F8: 68       
    rti                                     ; 25F9: 40       
; +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-





; 8b    d8    db    88 88b 88     88      dP"Yb   dP"Yb  88""Yb
; 88b  d88   dPYb   88 88Yb88     88     dP   Yb dP   Yb 88__dP
; 88YbdP88  dP__Yb  88 88 Y88     88  .o Yb   dP Yb   dP 88"""
; 88 YY 88 dP""""Yb 88 88  Y8     88ood8  YbodP   YbodP  88

; L_JMP_($25FA)_($25DD) OK
; L_JMP_($25FA)_($265B) OK
Main_Loop_Init
    lda     #$00                            ; 25FA: A9 00    
    sta     ZP_Alien_Spawn_Counter          ; 25FC: 85 21    

; Reset object list index to $03B0 i.e. Ship Ascend/Descend
    lda     #$B0                            ; 25FE: A9 B0    
    sta     ZP_Obj_List_Ptr_Lo              ; 2600: 85 00    
    lda     #$03                            ; 2602: A9 03    
    sta     ZP_Obj_List_Ptr_Hi              ; 2604: 85 01    

; Enable Interrupts (Clear Interrupt Disable)
    cli                                     ; 2606: 58       

; L_BRS_($2607)_($2643) OK
; L_JMP_($2607)_($267D) OK
Main_Loop
    ldy     #$00                            ; 2607: A0 00    

; Load object Type into A from object table, multiply by two for address jump table index use
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2609: B1 00    
    asl     a                               ; 260B: 0A       

; Setup subroutine address from jump table + index and indirect jmp to it
    tay                                     ; 260C: A8       
    lda     Object_Handler_Jump_Table,y     ; 260D: B9 8C 26 
    sta     ZP_Subroutine_Addr_Lo           ; 2610: 85 5F    
    lda     Object_Handler_Jump_Table+1,y   ; 2612: B9 8D 26 
    sta     ZP_Subroutine_Addr_Hi           ; 2615: 85 60    
    jmp     (ZP_Subroutine_Addr_Lo)         ; 2617: 6C 5F 00 
; ------------------------------------------





; ############################################################################################
;  dP""b8  dP"Yb  888888  dP"Yb      88b 88 888888 Yb  dP 888888
; dP   `" dP   Yb   88   dP   Yb     88Yb88 88__    YbdP    88
; Yb  "88 Yb   dP   88   Yb   dP     88 Y88 88""    dPYb    88
;  YboodP  YbodP    88    YbodP      88  Y8 888888 dP  Yb   88

;  dP"Yb  88""Yb  88888 888888  dP""b8 888888
; dP   Yb 88__dP     88 88__   dP   `"   88
; Yb   dP 88""Yb o.  88 88""   Yb        88
;  YbodP  88oodP "bodP' 888888  YboodP   88
; ############################################################################################

; L_JMP_($261A)_($2226) OK
; L_JMP_($261A)_($2254) OK
; L_JMP_($261A)_($26EF) OK
; L_JMP_($261A)_($2964) OK
; L_JMP_($261A)_($2984) OK
; L_JMP_($261A)_($29CD) OK
; L_JMP_($261A)_($2C8F) OK
; L_JMP_($261A)_($2CC9) OK
; L_JMP_($261A)_($2E4B) OK
; L_JMP_($261A)_($2EA9) OK
; L_JMP_($261A)_($2EFA) OK
; L_JMP_($261A)_($2F04) OK
; L_JMP_($261A)_($2F74) OK
; L_JMP_($261A)_($2FD7) OK
; L_JMP_($261A)_($3309) OK
; L_JMP_($261A)_($3367) OK
GOTO_NEXT_OBJECT
    ldy     #$00                            ; 261A: A0 00    

; Test next object type, if non-zero, skip to next object
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 261C: B1 00    
    bne     Inc_Object_List_Ptr             ; 261E: D0 10    

; Test if current object address is Jetman, a laser beam, the sound object or zero, branch if yes
    lda     ZP_Obj_List_Ptr_Lo              ; 2620: A5 00    
    cmp     #OBJECT_SHIP_ADDRESS            ; 2622: C9 B0    
    bcc     Inc_Object_List_Ptr             ; 2624: 90 0A    

; Current object is a ship part or an Alien
; Delay loop, adjusting Register Y from $02 to $0F makes aliens move ~40% slower across screen
; $100 x $02 x (2+3 cycles) = $A00 = 2,560 cycles @ 1.108MHz PAL = 0.02 Seconds
    ldy     #$02                            ; 2626: A0 02    
    ldx     #$00                            ; 2628: A2 00    

; L_BRS_($262A)_($262B) OK
; L_BRS_($262A)_($262E) OK
Loop_Delay_0A00_Cycles
    dex                                     ; 262A: CA       
    bne     Loop_Delay_0A00_Cycles          ; 262B: D0 FD    
    dey                                     ; 262D: 88       
    bne     Loop_Delay_0A00_Cycles          ; 262E: D0 FA    

; Increment Object address pointer to next Obj i.e. by adding 8 bytes
; L_BRS_($2630)_($261E) OK
; L_BRS_($2630)_($2624) OK
Inc_Object_List_Ptr
    lda     ZP_Obj_List_Ptr_Lo              ; 2630: A5 00    
    clc                                     ; 2632: 18       
    adc     #$08                            ; 2633: 69 08    
    sta     ZP_Obj_List_Ptr_Lo              ; 2635: 85 00    

; If interrupt had occurred, set Jetman object next, it has higher priority
    lda     ZP_IRQ_Occurred                 ; 2637: A5 20    
    bne     SEI_Obj_Ptr_To_Jetman           ; 2639: D0 2E    

; Test if current object is Jetman, a laser beam, the sound object or zero, branch if not
; L_JMP_($263B)_($2689) OK
Main_Loop_Continue
    lda     ZP_Obj_List_Ptr_Lo              ; 263B: A5 00    
    cmp     #OBJECT_SHIP_ADDRESS            ; 263D: C9 B0    
    beq     Restore_Saved_Obj_Ptr_CLI       ; 263F: F0 3F    

; Current object is Jetman, a laser beam or the sound object
; Test if current object address lo-byte is zero, i.e. starting at beginning of list, branch if not
    and     ZP_Obj_List_Ptr_Lo              ; 2641: 25 00    
    bne     Main_Loop                       ; 2643: D0 C2    

; Test to see if Spawn counter has reached four yet, branch if not
    lda     ZP_Alien_Spawn_Counter          ; 2645: A5 21    
    cmp     #$04                            ; 2647: C9 04    
    bcc     Test_Score_Flash_Time_At_Zero   ; 2649: 90 07    

; Test TV Raster counter, spawn object ever eight attempts i.e. when data = xxxx_x111
    lda     VIC_R4_TV_Raster                ; 264B: AD 04 90 
    and     #%00000111                      ; 264E: 29 07    
    bne     Spawn_Objects                   ; 2650: D0 03    

; Test if score flash time is zero, if yes, reset next obj address pointer and spawn setup objects
; L_BRS_($2652)_($2649) OK
Test_Score_Flash_Time_At_Zero
    jsr     Init_Alien_Objects_Flash_Cntdn  ; 2652: 20 D6 2C 

; L_BRS_($2655)_($2650) OK
Spawn_Objects
    jsr     Spawn_Ship_Modules_Fuel_Cell    ; 2655: 20 4B 2B 
    jsr     Spawn_Valuables                 ; 2658: 20 8F 2B 
    jmp     Main_Loop_Init                  ; 265B: 4C FA 25 
; ------------------------------------------





; 88 88b 88 888888 888888 88""Yb 88""Yb 88   88 88""Yb 888888
; 88 88Yb88   88   88__   88__dP 88__dP 88   88 88__dP   88
; 88 88 Y88   88   88""   88"Yb  88"Yb  Y8   8P 88"""    88
; 88 88  Y8   88   888888 88  Yb 88  Yb `YbodP' 88       88

; 88  88    db    88b 88 8888b.  88     888888 88""Yb
; 88  88   dPYb   88Yb88  8I  Yb 88     88__   88__dP
; 888888  dP__Yb  88 Y88  8I  dY 88  .o 88""   88"Yb
; 88  88 dP""""Yb 88  Y8 8888Y"  88ood8 888888 88  Yb

; ----------------------------------------------------
; VIA2 timer interrupts used to update Jetman movement
; $4FD7 / 1.108Mhz = 54.2Hz interrupt. Screen is 184 pixels
; wide. At one pixel walking movement per interrupt, Jetman
; should get across the screen in about 3.5 seconds.
; ----------------------------------------------------
; L_JSR_($265E)_($2041) OK
; L_JSR_($265E)_($25E4) OK
Reset_VIA2_Timer
    lda     #$D7                            ; 265E: A9 D7    
    sta     VIA2_T1_Cnt_Lo                  ; 2660: 8D 24 91 
    lda     #$4F                            ; 2663: A9 4F    
    sta     VIA2_T1_Cnt_Hi                  ; 2665: 8D 25 91 
    rts                                     ; 2668: 60       
; ==========================================

; Disable Interrupts (Set Interrupt Disable)
; Save current object address pointer and set Jetman to be the next object
; L_BRS_($2669)_($2639) OK
SEI_Obj_Ptr_To_Jetman
    sei                                     ; 2669: 78       

    lda     #$00                            ; 266A: A9 00    
    sta     ZP_IRQ_Occurred                 ; 266C: 85 20    

; Save the current object list ptr and load up the Jetman object parameters
    lda     ZP_Obj_List_Ptr_Lo              ; 266E: A5 00    
    sta     ZP_Obj_List_Ptr_Save_IRQ_Lo     ; 2670: 85 22    
    lda     ZP_Obj_List_Ptr_Hi              ; 2672: A5 01    
    sta     ZP_Obj_List_Ptr_Save_IRQ_Hi     ; 2674: 85 23    

; Load Jetman object parameters
    jsr     Load_ZP_Parameters              ; 2676: 20 9D 25 
    fcb     $00                             ; 2679: 00        ZP00/01
    fdb     Obj_Jetman_State                ; 267A: 80 03    
    fcb     $FF                             ; 267C: FF       
    jmp     Main_Loop                       ; 267D: 4C 07 26 
; ------------------------------------------


; L_BRS_($2680)_($263F) OK
Restore_Saved_Obj_Ptr_CLI
    lda     ZP_Obj_List_Ptr_Save_IRQ_Lo     ; 2680: A5 22    
    sta     ZP_Obj_List_Ptr_Lo              ; 2682: 85 00    
    lda     ZP_Obj_List_Ptr_Save_IRQ_Hi     ; 2684: A5 23    
    sta     ZP_Obj_List_Ptr_Hi              ; 2686: 85 01    

; Enable Interrupts (Clear Disable Interrupts)
    cli                                     ; 2688: 58       
    jmp     Main_Loop_Continue              ; 2689: 4C 3B 26 
; ------------------------------------------





;  dP"Yb  88""Yb  88888 888888  dP""b8 888888
; dP   Yb 88__dP     88 88__   dP   `"   88
; Yb   dP 88""Yb o.  88 88""   Yb        88
;  YbodP  88oodP "bodP' 888888  YboodP   88

; 88  88    db    88b 88 8888b.  88     888888 88""Yb .dP"Y8
; 88  88   dPYb   88Yb88  8I  Yb 88     88__   88__dP `Ybo."
; 888888  dP__Yb  88 Y88  8I  dY 88  .o 88""   88"Yb  o.`Y8b
; 88  88 dP""""Yb 88  Y8 8888Y"  88ood8 888888 88  Yb 8bodP'

; Object handler names in CAPITALS for easier routine identification in code
Object_Handler_Jump_Table
    fdb     GOTO_NEXT_OBJECT                ; 268C: 1A 26     Obj 00
    fdb     JETMAN_FLYING_                  ; 268E: 73 32     Obj 01
    fdb     JETMAN_STANDING_                ; 2690: 4D 33     Obj 02
    fdb     ANIMATE_EXPLOSIONS              ; 2692: 34 29     Obj 03
    fdb     SHIP_PART_OR_FUEL               ; 2694: 8E 2F     Obj 04
    fdb     WAVE_0_FUZZBALL                 ; 2696: 6A 2C     Obj 05
    fdb     WAVE_3_SAUCER                   ; 2698: BC 2A     Obj 06
    fdb     WAVE_2_SPHERE                   ; 269A: 6D 2A     Obj 07
    fdb     WAVE_1_CROSS                    ; 269C: 5F 2A     Obj 08
    fdb     SHIP_BASE_MODULE                ; 269E: 74 2E     Obj 09
    fdb     SHIP_ASCEND                     ; 26A0: 17 2E     Obj 0A
    fdb     SHIP_DESCEND                    ; 26A2: 4E 2E     Obj 0B
    fdb     SOUND_UPDATE                    ; 26A4: CD 26     Obj 0C
    fdb     GOTO_NEXT_OBJECT                ; 26A6: 1A 26     Obj 0D
    fdb     VALUABLES                       ; 26A8: 3E 28     Obj 0E
    fdb     GOTO_NEXT_OBJECT                ; 26AA: 1A 26     Obj 0F
    fdb     DISPLAY_LASERS                  ; 26AC: 9A 21     Obj 10





; ############################################################################################
;  .dP"Y8  dP"Yb  88   88 88b 88 8888b.      88   88 88""Yb 8888b.     db    888888 888888
;  `Ybo." dP   Yb 88   88 88Yb88  8I  Yb     88   88 88__dP  8I  Yb   dPYb     88   88__
;  o.`Y8b Yb   dP Y8   8P 88 Y88  8I  dY     Y8   8P 88"""   8I  dY  dP__Yb    88   88""
;  8bodP'  YbodP  `YbodP' 88  Y8 8888Y"      `YbodP' 88     8888Y"  dP""""Yb   88   888888
; ############################################################################################

; Init sound object parameters (i.e. 8 bytes) from static data table
; L_JMP_($26AE)_($22CE) OK
Initialise_Sound_Object
    ldx     #$07                            ; 26AE: A2 07    

; L_BRS_($26B0)_($26B7) OK
Loop_Initialise_Sound_Object
    lda     Init_Sound_Object_Table,x       ; 26B0: BD C5 26 
    sta     Obj_Sound,x                     ; 26B3: 9D A8 03 
    dex                                     ; 26B6: CA       
    bpl     Loop_Initialise_Sound_Object    ; 26B7: 10 F7    

; Initialise sound channels
    lda     #$00                            ; 26B9: A9 00    
    sta     VIC_RA_Frq_Osc1                 ; 26BB: 8D 0A 90 
    sta     VIC_RB_Frq_Osc2                 ; 26BE: 8D 0B 90 
    sta     VIC_RC_Frq_Osc3                 ; 26C1: 8D 0C 90 
    rts                                     ; 26C4: 60       
; ==========================================

Init_Sound_Object_Table
    fcb     $0C,$00,$00,$00                 ; 26C5: 0C 00 00 00 
    fcb     $00,$00,$00,$00                 ; 26C9: 00 00 00 00 
; ==========================================

; Read and play sound channel data from the Sound object
SOUND_UPDATE
    lda     #$01                            ; 26CD: A9 01    
    sta     ZP_Subroutine_Addr_Hi           ; 26CF: 85 60    

; Sound object parameter 01/03/05 indicates which sound to play, 02/04/06 is the period
; L_BRS_($26D1)_($26ED) OK
Loop_Sound_Update
    ldy     ZP_Subroutine_Addr_Hi           ; 26D1: A4 60    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 26D3: B1 00    
    asl     a                               ; 26D5: 0A       
    tax                                     ; 26D6: AA       

; Jump to Sound player using Register X as jump table index
    lda     Sound_Object_Jump_Table,x       ; 26D7: BD 43 27 
    sta     ZP08_Subroutine_Addr_Lo         ; 26DA: 85 08    
    lda     Sound_Object_Jump_Table+1,x     ; 26DC: BD 44 27 
    sta     ZP09_Subroutine_Addr_Hi         ; 26DF: 85 09    
    jmp     (ZP08_Subroutine_Addr_Lo)       ; 26E1: 6C 08 00 
; ------------------------------------------

; Update index to next 2-byte oscillator/timer pair, stopping when
; all 3 processed i.e. at 7th parameter. Sound 0 is valid
; but 'empty' sound call, so just moves to next 2-byte oscillator/timer pair.
; L_JMP_($26E4)_($2719) OK
Goto_Next_Sound
    lda     ZP_Subroutine_Addr_Hi           ; 26E4: A5 60    
    clc                                     ; 26E6: 18       
    adc     #WORD_SIZE                      ; 26E7: 69 02    
    sta     ZP_Subroutine_Addr_Hi           ; 26E9: 85 60    
    cmp     #$07                            ; 26EB: C9 07    
    bcc     Loop_Sound_Update               ; 26ED: 90 E2    
    jmp     GOTO_NEXT_OBJECT                ; 26EF: 4C 1A 26 
; ------------------------------------------

; Decrements Oscillator channel timer stored in ZP index
; Index points to Oscillator number, so increment to address timer value
; Timer value left in A, counts down to zero
; L_JSR_($26F2)_($26FE) OK
; L_JSR_($26F2)_($271C) OK
; L_JSR_($26F2)_($2727) OK
; L_JSR_($26F2)_($2735) OK
; L_JSR_($26F2)_($274F) OK
Decrement_Oscillator_Timer
    lda     ZP_Subroutine_Addr_Hi           ; 26F2: A5 60    
    tay                                     ; 26F4: A8       
    iny                                     ; 26F5: C8       

; Read timer, decrement and write back
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 26F6: B1 00    
    sec                                     ; 26F8: 38       
    sbc     #$01                            ; 26F9: E9 01    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 26FB: 91 00    
    rts                                     ; 26FD: 60       
; ==========================================

Ship_Part_or_Fuel_Cell_Pickup
    jsr     Decrement_Oscillator_Timer      ; 26FE: 20 F2 26 
    beq     Sound_Done_Reset_Object_Param   ; 2701: F0 07    

; Reverses the timer value so $10 countdown becomes $F0, F1, F2 etc. stored
; to the oscillator on subsequent calls, making a pleasant short rising tone
    eor     #%11111111                      ; 2703: 49 FF    

; Set top bit of oscillator channel to enable
; L_JMP_($2705)_($2724) OK
; L_JMP_($2705)_($2732) OK
; L_JMP_($2705)_($2740) OK
; L_JMP_($2705)_($2758) OK
Enable_Oscillator_Channel
    ora     #%10000000                      ; 2705: 09 80    
    jmp     Output_Sound                    ; 2707: 4C 10 27 
; ------------------------------------------

; When oscillator timer expired, delete the oscillator parameter to disable
; L_BRS_($270A)_($2701) OK
; L_BRS_($270A)_($271F) OK
; L_BRS_($270A)_($272A) OK
; L_BRS_($270A)_($2738) OK
; L_BRS_($270A)_($2752) OK
Sound_Done_Reset_Object_Param
    lda     #$00                            ; 270A: A9 00    
    dey                                     ; 270C: 88       
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 270D: 91 00    
    iny                                     ; 270F: C8       

; Register A contains frequency, Y selects channel via X
; L_JMP_($2710)_($2707) OK
Output_Sound
    pha                                     ; 2710: 48       
    tya                                     ; 2711: 98       
    lsr     a                               ; 2712: 4A       
    tax                                     ; 2713: AA       
    dex                                     ; 2714: CA       
    pla                                     ; 2715: 68       

    sta     VIC_RA_Frq_Osc1,x               ; 2716: 9D 0A 90 
    jmp     Goto_Next_Sound                 ; 2719: 4C E4 26 
; ------------------------------------------

Valuable_Pkup_Ship_Part_Land
    jsr     Decrement_Oscillator_Timer      ; 271C: 20 F2 26 
    beq     Sound_Done_Reset_Object_Param   ; 271F: F0 E9    

; Manipulate timer to make a nice sound
    asl     a                               ; 2721: 0A       
    eor     #%11110011                      ; 2722: 49 F3    
    jmp     Enable_Oscillator_Channel       ; 2724: 4C 05 27 
; ------------------------------------------

Laser_Beam_Active
    jsr     Decrement_Oscillator_Timer      ; 2727: 20 F2 26 
    beq     Sound_Done_Reset_Object_Param   ; 272A: F0 DE    

; Manipulate timer to make a nice sound
    asl     a                               ; 272C: 0A       
    asl     a                               ; 272D: 0A       
    asl     a                               ; 272E: 0A       
    asl     a                               ; 272F: 0A       
    ora     #%00001111                      ; 2730: 09 0F    
    jmp     Enable_Oscillator_Channel       ; 2732: 4C 05 27 
; ------------------------------------------

Ship_Flight
    jsr     Decrement_Oscillator_Timer      ; 2735: 20 F2 26 
    beq     Sound_Done_Reset_Object_Param   ; 2738: F0 D0    

; Utilise ship object height to manipulate noise sound channel
    lda     Obj_Ship_Base_Position_Y        ; 273A: AD B3 03 
    lsr     a                               ; 273D: 4A       
    eor     #%11111110                      ; 273E: 49 FE    
    jmp     Enable_Oscillator_Channel       ; 2740: 4C 05 27 
; ------------------------------------------

Sound_Object_Jump_Table
    fdb     Goto_Next_Sound                 ; 2743: E4 26     00
    fdb     Ship_Part_or_Fuel_Cell_Pickup   ; 2745: FE 26     01
    fdb     Valuable_Pkup_Ship_Part_Land    ; 2747: 1C 27     02
    fdb     Laser_Beam_Active               ; 2749: 27 27     03
    fdb     Ship_Flight                     ; 274B: 35 27     04
    fdb     Collision_Explosion             ; 274D: 4F 27     05

Collision_Explosion
    jsr     Decrement_Oscillator_Timer      ; 274F: 20 F2 26 
    beq     Sound_Done_Reset_Object_Param   ; 2752: F0 B6    

; Manipulate timer to make an explosion sound, though doesn't use noise
    asl     a                               ; 2754: 0A       
    asl     a                               ; 2755: 0A       
    eor     #%11100011                      ; 2756: 49 E3    
    jmp     Enable_Oscillator_Channel       ; 2758: 4C 05 27 
; ------------------------------------------





; 888888 88""Yb    db    .dP"Y8 888888     88""Yb    db    8b    d8
; 88__   88__dP   dPYb   `Ybo." 88__       88__dP   dPYb   88b  d88
; 88""   88"Yb   dP__Yb  o.`Y8b 88""       88"Yb   dP__Yb  88YbdP88
; 888888 88  Yb dP""""Yb 8bodP' 888888     88  Yb dP""""Yb 88 YY 88

; Erase $100 bytes Zero Page RAM
; L_JSR_($275B)_($202F) OK
; L_JSR_($275B)_($25D4) OK
Erase_ZP_RAM
    ldx     #$00                            ; 275B: A2 00    
    txa                                     ; 275D: 8A       

; L_BRS_($275E)_($2761) OK
Loop_Erase_ZP_RAM
    sta     ZP_Obj_List_Ptr_Lo,x            ; 275E: 95 00    
    inx                                     ; 2760: E8       
    bne     Loop_Erase_ZP_RAM               ; 2761: D0 FB    
    rts                                     ; 2763: 60       
; ==========================================

; Erase $80 bytes Object RAM
; L_JSR_($2764)_($25D1) OK
Erase_Object_RAM
    ldx     #$7F                            ; 2764: A2 7F    
    lda     #$00                            ; 2766: A9 00    

; L_BRS_($2768)_($276C) OK
Loop_Erase_Object_RAM
    sta     Obj_Jetman_State,x              ; 2768: 9D 80 03 
    dex                                     ; 276B: CA       
    bpl     Loop_Erase_Object_RAM           ; 276C: 10 FA    
    rts                                     ; 276E: 60       
; ==========================================

; Erase $30 bytes High Score & Game Settings at $1FD0-$2000
; L_JSR_($276F)_($202C) OK
Erase_Hi_Score_Game_Settings
    ldx     #$2F                            ; 276F: A2 2F    
    lda     #$00                            ; 2771: A9 00    

; L_BRS_($2773)_($2777) OK
Loop_Erase_Hi_Score_Game_Sets
    sta     Score_Hi,x                      ; 2773: 9D D0 1F 
    dex                                     ; 2776: CA       
    bpl     Loop_Erase_Hi_Score_Game_Sets   ; 2777: 10 FA    
    rts                                     ; 2779: 60       
; ==========================================





;  dP""b8 88  88 888888  dP""b8 88  dP     88b 88 888888 Yb        dP
; dP   `" 88  88 88__   dP   `" 88odP      88Yb88 88__    Yb  db  dP
; Yb      888888 88""   Yb      88"Yb      88 Y88 88""     YbdPYbdP
;  YboodP 88  88 888888  YboodP 88  Yb     88  Y8 888888    YP  YP

; 88  88 88     .dP"Y8  dP""b8  dP"Yb  88""Yb 888888
; 88  88 88     `Ybo." dP   `" dP   Yb 88__dP 88__
; 888888 88     o.`Y8b Yb      Yb   dP 88"Yb  88""
; 88  88 88     8bodP'  YboodP  YbodP  88  Yb 888888

; L_JSR_($277A)_($2987) OK
Check_New_Hi_Score
    jsr     Load_ZP_Parameters              ; 277A: 20 9D 25 
    fcb     $00                             ; 277D: 00        ZP00
    fdb     Score_Hi                        ; 277E: D0 1F     Hi Score value addr
    fcb     $08                             ; 2780: 08        ZP08
    fdb     ZP_Score_Player_1               ; 2781: 51 00     Player 1 Score value addr
    fcb     $FF                             ; 2783: FF       

; Check Player 1 first
    jsr     Test_New_Hi_Score               ; 2784: 20 8E 27 

; ...then follow through for Player 2
    jsr     Load_ZP_Parameters              ; 2787: 20 9D 25 
    fcb     $08                             ; 278A: 08        ZP08
    fdb     ZP_Score_Player_2               ; 278B: 54 00     Player 2 Score value addr
    fcb     $FF                             ; 278D: FF       

; Compare Hi Score BCD bytes
; L_JSR_($278E)_($2784) OK
Test_New_Hi_Score
    ldy     #$00                            ; 278E: A0 00    

; L_BRS_($2790)_($279D) OK
Compare_BCD_Byte
    lda     (ZP00_Hi_Score_Addr),y          ; 2790: B1 00    
    cmp     (ZP08_Player_Score_Addr),y      ; 2792: D1 08    
    beq     Move_To_Next_BCD_Byte           ; 2794: F0 03    

; Branch if Player Score > Score_Hi
    bcc     Copy_Player_Score_To_Hi_Score   ; 2796: 90 08    

; Score_Hi >= Player Score, so return
    rts                                     ; 2798: 60       
; ==========================================

; Test if all 3 BCD bytes have been compared, if not loop to next BDC byte
; L_BRS_($2799)_($2794) OK
Move_To_Next_BCD_Byte
    iny                                     ; 2799: C8       
    tya                                     ; 279A: 98       
    cmp     #$03                            ; 279B: C9 03    
    bne     Compare_BCD_Byte                ; 279D: D0 F1    
    rts                                     ; 279F: 60       
; ==========================================

; Player score is 3 BCD bytes
; L_BRS_($27A0)_($2796) OK
Copy_Player_Score_To_Hi_Score
    ldy     #$02                            ; 27A0: A0 02    

; L_BRS_($27A2)_($27A7) OK
Loop_Copy_Player_To_Hi_Score
    lda     (ZP08_Player_Score_Addr),y      ; 27A2: B1 08    
    sta     (ZP00_Hi_Score_Addr),y          ; 27A4: 91 00    
    dey                                     ; 27A6: 88       
    bpl     Loop_Copy_Player_To_Hi_Score    ; 27A7: 10 F9     Return when all bytes copied
    rts                                     ; 27A9: 60       
; ==========================================





; 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP     .dP"Y8 88  88 88 88""Yb
;  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP      `Ybo." 88  88 88 88__dP
;  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P       o.`Y8b 888888 88 88"""
; 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP        8bodP' 88  88 88 88

; 888888 88        db    8b    d8 888888
; 88__   88       dPYb   88b  d88 88__
; 88""   88  .o  dP__Yb  88YbdP88 88""
; 88     88ood8 dP""""Yb 88 YY 88 888888

; L_JSR_($27AA)_($2EAF) OK
Display_Ship_Flame
    ldy     #OBJECT_TYPE_PARAM              ; 27AA: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 27AC: B1 00    
    cmp     #OBJECT_TYPE_SHIP_ASCEND        ; 27AE: C9 0A    

; Carry set if memory less than value in Register A, meaning branch on Ascend and Descend
    bcs     Display_Ship_Flame_Asc_Desc     ; 27B0: B0 01    
    rts                                     ; 27B2: 60       
; ==========================================

; L_BRS_($27B3)_($27B0) OK
Display_Ship_Flame_Asc_Desc
    inc     ZP_Ship_Flame_UDG_Toggle        ; 27B3: E6 27    

    lda     ZP11_Object_Ship_Position_Y     ; 27B5: A5 11    
    pha                                     ; 27B7: 48       
    clc                                     ; 27B8: 18       
    adc     #$15                            ; 27B9: 69 15    
    sta     ZP11_Object_Ship_Position_Y     ; 27BB: 85 11    

    lda     ZP19_Object_Flame_Position_Y    ; 27BD: A5 19    
    pha                                     ; 27BF: 48       
    clc                                     ; 27C0: 18       
    adc     #$15                            ; 27C1: 69 15    
    sta     ZP19_Object_Flame_Position_Y    ; 27C3: 85 19    

; On ascend, BCS followed each time until Flame Space Available, which triggers Display_Flame
; once, after that, both branches fail. Descend is similar.
    cmp     #FLAME_SPACE_AVAILABLE          ; 27C5: C9 AF    
    beq     Display_Flame                   ; 27C7: F0 50    
    bcs     Set_Ship_Flame_Status_Off       ; 27C9: B0 47    

; Ship flame should now be on, if yes, display it
    lda     ZP_Ship_Flame_State             ; 27CB: A5 26    
    bne     Display_Ship_Flame_On_Screen    ; 27CD: D0 12    

; If flame not yet on, i.e. first time round, turn the flame status on
    lda     #$01                            ; 27CF: A9 01    
    sta     ZP_Ship_Flame_State             ; 27D1: 85 26    

; Load the correct Flame UDG address and display the flame
    lda     ZP_Ship_Flame_UDG_Toggle        ; 27D3: A5 27    
    sec                                     ; 27D5: 38       
    sbc     #$01                            ; 27D6: E9 01    
    jsr     Get_Flame_UDG_Addr              ; 27D8: 20 2E 28 
    jsr     Load_Obj_New_UDG_RAM_Addr_Size  ; 27DB: 20 8D 37 
    jsr     Display_Object_New_Setup        ; 27DE: 20 10 36 

; L_BRS_($27E1)_($27CD) OK
Display_Ship_Flame_On_Screen
    lda     ZP_Ship_Flame_UDG_Toggle        ; 27E1: A5 27    
    pha                                     ; 27E3: 48       
    jsr     Get_Flame_UDG_Addr              ; 27E4: 20 2E 28 
    jsr     Load_Obj_Old_UDG_RAM_Addr_Size  ; 27E7: 20 3D 37 

; Load the correct Flame UDG address and display the flame
    pla                                     ; 27EA: 68       
    sec                                     ; 27EB: 38       
    sbc     #$01                            ; 27EC: E9 01    
    jsr     Get_Flame_UDG_Addr              ; 27EE: 20 2E 28 
    jsr     Load_Obj_New_UDG_RAM_Addr_Size  ; 27F1: 20 8D 37 
    jsr     Display_Object                  ; 27F4: 20 4C 36 

; Set the flame colour tile to red, uses two tiles
    lda     ZP18_Object_Flame_Position_X    ; 27F7: A5 18    
    sta     ZP04_Object_Position_X          ; 27F9: 85 04    

    lda     ZP19_Object_Flame_Position_Y    ; 27FB: A5 19    
    sta     ZP05_Object_Position_Y          ; 27FD: 85 05    

    jsr     Setup_Colour_RAM_Address        ; 27FF: 20 F7 34 
    lda     #COLOUR_RED                     ; 2802: A9 02    
    ldy     #$00                            ; 2804: A0 00    
    sta     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 2806: 91 0C    

    iny                                     ; 2808: C8       
    sta     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 2809: 91 0C    

; Restore ZP11 and ZP19 and return
; L_JMP_($280B)_($2816) OK
; L_BRS_($280B)_($281B) OK
; L_JMP_($280B)_($282B) OK
Restore_And_RTS
    pla                                     ; 280B: 68       
    sta     ZP19_Object_Flame_Position_Y    ; 280C: 85 19    
    pla                                     ; 280E: 68       
    sta     ZP11_Object_Ship_Position_Y     ; 280F: 85 11    
    rts                                     ; 2811: 60       
; ==========================================

; L_BRS_($2812)_($27C9) OK
Set_Ship_Flame_Status_Off
    lda     #$00                            ; 2812: A9 00    
    sta     ZP_Ship_Flame_State             ; 2814: 85 26    
    jmp     Restore_And_RTS                 ; 2816: 4C 0B 28 
; ------------------------------------------

; Display flame if flame state is on, else return
; L_BRS_($2819)_($27C7) OK
Display_Flame
    lda     ZP_Ship_Flame_State             ; 2819: A5 26    
    beq     Restore_And_RTS                 ; 281B: F0 EE    

    lda     ZP_Ship_Flame_UDG_Toggle        ; 281D: A5 27    
    sec                                     ; 281F: 38       
    sbc     #$01                            ; 2820: E9 01    
    jsr     Get_Flame_UDG_Addr              ; 2822: 20 2E 28 
    jsr     Load_Obj_New_UDG_RAM_Addr_Size  ; 2825: 20 8D 37 
    jsr     Display_Object_New_Setup        ; 2828: 20 10 36 
    jmp     Restore_And_RTS                 ; 282B: 4C 0B 28 
; ------------------------------------------

; Using A to toggle, Load A and Y with Ship UDG address
; LSR and AND make the toggle only happen every 4 calls so you can see it on-screen
; L_JSR_($282E)_($27D8) OK
; L_JSR_($282E)_($27E4) OK
; L_JSR_($282E)_($27EE) OK
; L_JSR_($282E)_($2822) OK
Get_Flame_UDG_Addr
    lsr     a                               ; 282E: 4A       
    and     #%00000010                      ; 282F: 29 02    
    tax                                     ; 2831: AA       
    lda     Ship_Flame_Frame_0_Addr_Lo,x    ; 2832: BD 3A 28 
    tay                                     ; 2835: A8       
    lda     Ship_Flame_Frame_0_Addr_Hi,x    ; 2836: BD 3B 28 
    rts                                     ; 2839: 60       
; ==========================================

; Flame animation is produced by toggling between two animation frames
Ship_Flame_Frame_0_Addr_Lo
    fcb     $D5                             ; 283A: D5       
Ship_Flame_Frame_0_Addr_Hi
    fcb     $3F                             ; 283B: 3F       
Ship_Flame_Frame_1_Addr_Lo
    fcb     $F8                             ; 283C: F8       
Ship_Flame_Frame_1_Addr_Hi
    fcb     $3F                             ; 283D: 3F       





; ############################################################################################
; Yb    dP    db    88     88   88    db    88""Yb 88     888888 .dP"Y8
;  Yb  dP    dPYb   88     88   88   dPYb   88__dP 88     88__   `Ybo."
;   YbdP    dP__Yb  88  .o Y8   8P  dP__Yb  88""Yb 88  .o 88""   o.`Y8b
;    YP    dP""""Yb 88ood8 `YbodP' dP""""Yb 88oodP 88ood8 888888 8bodP'
; ############################################################################################

; Replace "Test_Platform_Collision" with NOPs and gems all fall
; through platforms and floor, reentering at top
VALUABLES
    jsr     Load_Object_Type_X_Y            ; 283E: 20 D7 35 
    jsr     Test_Platform_Collision         ; 2841: 20 B3 30 
    lda     ZP02_Collision_Status           ; 2844: A5 02    
    bmi     Valuable_Landed                 ; 2846: 30 09    

; Move valuable Y position down screen by 2 pixels
    ldy     #OBJECT_POSITION_Y_PARAM        ; 2848: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 284A: B1 00    
    clc                                     ; 284C: 18       
    adc     #$02                            ; 284D: 69 02    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 284F: 91 00    

; L_BRS_($2851)_($2846) OK
Valuable_Landed
    jsr     Load_Object_Type_X_Y_Colour     ; 2851: 20 E9 35 
    jsr     Test_Jetman_Object_Collide      ; 2854: 20 58 2D 
    bpl     Animate_Valuable                ; 2857: 10 1B    

; Object has been picked-up, remove from screen. S F V = Ship Fuel Valuable
    lda     #$00                            ; 2859: A9 00    
    jsr     Load_Obj_UDG_Data_Addr_Ship     ; 285B: 20 DC 2F 
    jsr     Load_Obj_UDG_Data_Addr_S_F_V    ; 285E: 20 E5 2F 
    jsr     Load_Obj_New_UDG_RAM_Addr_Size  ; 2861: 20 8D 37 
    jsr     Display_Object_New_Setup        ; 2864: 20 10 36 

; Jetman pickup valuable = 250 points, then remove from object list
    jsr     Load_ZP_Parameters              ; 2867: 20 9D 25 
    fcb     $02                             ; 286A: 02        ZP02/03
    fdb     $0250                           ; 286B: 50 02    
    fcb     $FF                             ; 286D: FF       
    jsr     Update_Score                    ; 286E: 20 63 30 
    jmp     Disable_Object_In_List          ; 2871: 4C 65 2F 
; ------------------------------------------

; L_BRS_($2874)_($2857) OK
Animate_Valuable
    ldy     #OBJECT_VALUABLE_TYPE_PARAM     ; 2874: A0 06    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2876: B1 00    
    and     #%00001110                      ; 2878: 29 0E    

; Use valuable type to index into subroutine list and jump to subroutine
    tax                                     ; 287A: AA       
    lda     Valuable_Handler_Jump_Table,x   ; 287B: BD 88 28 
    sta     ZP08_Subroutine_Addr_Lo         ; 287E: 85 08    

    lda     Valuable_Handler_Jump_Table+1,x ; 2880: BD 89 28 
    sta     ZP09_Subroutine_Addr_Hi         ; 2883: 85 09    
    jmp     (ZP08_Subroutine_Addr_Lo)       ; 2885: 6C 08 00 

Valuable_Handler_Jump_Table
    fdb     Valuable_Gold_Bar               ; 2888: 92 28    
    fdb     Valuable_Plutonium              ; 288A: A4 28    
    fdb     Valuable_Plutonium              ; 288C: A4 28    
    fdb     Valuable_Mineral                ; 288E: 9F 28    
    fdb     Valuable_Gemstone               ; 2890: B6 28    

Valuable_Gold_Bar
    lda     #COLOUR_YELLOW                  ; 2892: A9 07    

; L_JMP_($2894)_($28A1) OK
; L_JMP_($2894)_($28AE) OK
; L_JMP_($2894)_($28B3) OK
; L_BRS_($2894)_($28C2) OK
; L_JMP_($2894)_($28C6) OK
Save_Colour_And_Display_Object
    ldy     #OBJECT_COLOUR_PARAM            ; 2894: A0 05    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2896: 91 00    

    ldy     #OBJECT_VALUABLE_TYPE_PARAM     ; 2898: A0 06    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 289A: B1 00    
    jmp     Setup_Object_Addr               ; 289C: 4C C3 2F 
; ------------------------------------------

Valuable_Mineral
    lda     #COLOUR_BLUE                    ; 289F: A9 06    
    jmp     Save_Colour_And_Display_Object  ; 28A1: 4C 94 28 
; ------------------------------------------

; Use IRQ counter to toggle object colour between black and cyan
Valuable_Plutonium
    lda     ZP_IRQ_Counter_Lo               ; 28A4: A5 4A    
    and     #%00011111                      ; 28A6: 29 1F    
    cmp     #%00011000                      ; 28A8: C9 18    
    bcs     Valuable_Plutonium_Set_Colour   ; 28AA: B0 05    

    lda     #COLOUR_BLACK                   ; 28AC: A9 00    
    jmp     Save_Colour_And_Display_Object  ; 28AE: 4C 94 28 
; ------------------------------------------

; L_BRS_($28B1)_($28AA) OK
Valuable_Plutonium_Set_Colour
    lda     #COLOUR_CYAN                    ; 28B1: A9 03    
    jmp     Save_Colour_And_Display_Object  ; 28B3: 4C 94 28 
; ------------------------------------------

; Use IRQ counter to cycle through colours, two LSRs quadruple the time between changes
Valuable_Gemstone
    lda     ZP_IRQ_Counter_Lo               ; 28B6: A5 4A    
    lsr     a                               ; 28B8: 4A       
    lsr     a                               ; 28B9: 4A       
    and     #%00000111                      ; 28BA: 29 07    
    bne     Valuable_Gemstone_Set_Colour    ; 28BC: D0 02    

; Change colour from black to white
    ora     #%00000001                      ; 28BE: 09 01    

; If new colour is green, change it to white, green is reserved for platform logic
; L_BRS_($28C0)_($28BC) OK
Valuable_Gemstone_Set_Colour
    cmp     #COLOUR_GREEN                   ; 28C0: C9 05    
    bne     Save_Colour_And_Display_Object  ; 28C2: D0 D0    
    lda     #COLOUR_WHITE                   ; 28C4: A9 01    
    jmp     Save_Colour_And_Display_Object  ; 28C6: 4C 94 28 
; ------------------------------------------





; 88""Yb 888888 .dP"Y8 888888 888888      dP"Yb  88""Yb  88888 888888  dP""b8 888888 .dP"Y8
; 88__dP 88__   `Ybo." 88__     88       dP   Yb 88__dP     88 88__   dP   `"   88   `Ybo."
; 88"Yb  88""   o.`Y8b 88""     88       Yb   dP 88""Yb o.  88 88""   Yb        88   o.`Y8b
; 88  Yb 888888 8bodP' 888888   88        YbodP  88oodP "bodP' 888888  YboodP   88   8bodP'

; Reset ship parts/fuel/valuables and alien objects, $47 is 9 objects data
; L_JSR_($28C9)_($2E36) OK
Reset_Objects_And_Aliens
    ldx     #$47                            ; 28C9: A2 47    
    lda     #$00                            ; 28CB: A9 00    

; L_BRS_($28CD)_($28D1) OK
Loop_Reset_Objects_And_Aliens
    sta     Obj_Ship_Top_Or_Fuel_Type,x     ; 28CD: 9D B8 03 
    dex                                     ; 28D0: CA       
    bpl     Loop_Reset_Objects_And_Aliens   ; 28D1: 10 FA    
    rts                                     ; 28D3: 60       
; ==========================================

; Reset Jetman, Lasers, Sounds, Ship and Aliens, $2F is 6 objects data
; L_JSR_($28D4)_($29A8) OK
Reset_Objects_Multiple
    ldx     #$2F                            ; 28D4: A2 2F    
    lda     #$00                            ; 28D6: A9 00    

; L_BRS_($28D8)_($28DC) OK
Loop_Reset_Objects_Multiple
    sta     Obj_Jetman_State,x              ; 28D8: 9D 80 03 
    dex                                     ; 28DB: CA       
    bpl     Loop_Reset_Objects_Multiple     ; 28DC: 10 FA    

; Init all Alien objects
    ldx     #$2F                            ; 28DE: A2 2F    

; L_BRS_($28E0)_($28E4) OK
Loop_Reset_Objects_Aliens
    sta     Obj_Alien_0,x                   ; 28E0: 9D C8 03 
    dex                                     ; 28E3: CA       
    bpl     Loop_Reset_Objects_Aliens       ; 28E4: 10 FA    
    rts                                     ; 28E6: 60       
; ==========================================





; .dP"Y8    db    Yb    dP 888888     88""Yb 888888 .dP"Y8 888888  dP"Yb  88""Yb 888888
; `Ybo."   dPYb    Yb  dP  88__       88__dP 88__   `Ybo."   88   dP   Yb 88__dP 88__
; o.`Y8b  dP__Yb    YbdP   88""       88"Yb  88""   o.`Y8b   88   Yb   dP 88"Yb  88""
; 8bodP' dP""""Yb    YP    888888     88  Yb 888888 8bodP'   88    YbodP  88  Yb 888888

;  dP"Yb  88""Yb  88888     88     88 .dP"Y8 888888     88""Yb 888888 88""Yb
; dP   Yb 88__dP     88     88     88 `Ybo."   88       88__dP   88   88__dP
; Yb   dP 88""Yb o.  88     88  .o 88 o.`Y8b   88       88"""    88   88"Yb
;  YbodP  88oodP "bodP'     88ood8 88 8bodP'   88       88       88   88  Yb

; General save and restore of object address pointer, not used as part of interrupt handler
; L_JSR_($28E7)_($22E3) OK
; L_JSR_($28E7)_($22F2) OK
; L_JSR_($28E7)_($230E) OK
; L_JSR_($28E7)_($2A45) OK
; L_JSR_($28E7)_($2BC7) OK
; L_JSR_($28E7)_($2DB5) OK
; L_JSR_($28E7)_($2E8C) OK
Save_Obj_List_Ptr
    lda     ZP_Obj_List_Ptr_Lo              ; 28E7: A5 00    
    sta     ZP_Obj_List_Ptr_Save_Lo         ; 28E9: 85 24    
    lda     ZP_Obj_List_Ptr_Hi              ; 28EB: A5 01    
    sta     ZP_Obj_List_Ptr_Save_Hi         ; 28ED: 85 25    
    rts                                     ; 28EF: 60       
; ==========================================

; L_JSR_($28F0)_($2337) OK
; L_JMP_($28F0)_($2A5C) OK
; L_JMP_($28F0)_($2BDB) OK
; L_JMP_($28F0)_($2DC2) OK
; L_JSR_($28F0)_($2EA1) OK
Restore_Obj_List_Ptr
    lda     ZP_Obj_List_Ptr_Save_Lo         ; 28F0: A5 24    
    sta     ZP_Obj_List_Ptr_Lo              ; 28F2: 85 00    
    lda     ZP_Obj_List_Ptr_Save_Hi         ; 28F4: A5 25    
    sta     ZP_Obj_List_Ptr_Hi              ; 28F6: 85 01    
    rts                                     ; 28F8: 60       
; ==========================================





; ############################################################################################
;    db    88b 88 88 8b    d8    db    888888 888888
;   dPYb   88Yb88 88 88b  d88   dPYb     88   88__
;  dP__Yb  88 Y88 88 88YbdP88  dP__Yb    88   88""
; dP""""Yb 88  Y8 88 88 YY 88 dP""""Yb   88   888888

; 888888 Yb  dP 88""Yb 88      dP"Yb  .dP"Y8 88  dP"Yb  88b 88 .dP"Y8
; 88__    YbdP  88__dP 88     dP   Yb `Ybo." 88 dP   Yb 88Yb88 `Ybo."
; 88""    dPYb  88"""  88  .o Yb   dP o.`Y8b 88 Yb   dP 88 Y88 o.`Y8b
; 888888 dP  Yb 88     88ood8  YbodP  8bodP' 88  YbodP  88  Y8 8bodP'
; ############################################################################################

; L_JSR_($28F9)_($2C8C) OK
Change_Object_To_Explosion
    jsr     Display_Object_New_Setup_Load   ; 28F9: 20 0D 36 

; Reset object X direction
    lda     #$00                            ; 28FC: A9 00    
    ldy     #OBJECT_DIRECTION_X_PARAM       ; 28FE: A0 02    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2900: 91 00    

; Get object type, zero middle four bits, preserve bits 6 and 7, set bits 1 & 2
; The AND and OR probably for jetman object
    ldy     #OBJECT_TYPE_PARAM              ; 2902: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2904: B1 00    
    and     #%11000000                      ; 2906: 29 C0    
    ora     #%00000011                      ; 2908: 09 03    

; L_JSR_($290A)_($2A59) OK
Set_Object_Type_To_Explosion
    ldy     #OBJECT_TYPE_PARAM_SAVED        ; 290A: A0 06    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 290C: 91 00    

; Change object type to an explosion
    ldy     #OBJECT_TYPE_PARAM              ; 290E: A0 00    
    lda     #OBJECT_TYPE_EXPLOSION          ; 2910: A9 03    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2912: 91 00    

; Use parameter as animation frame counter, now reset it
    tya                                     ; 2914: 98       
    ldy     #EXPLOSION_ANIMATION_FRAME      ; 2915: A0 04    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2917: 91 00    

; Change explosion object colour based on IRQ random generator
    lda     ZP_IRQ_Random                   ; 2919: A5 4C    
    and     #%00000111                      ; 291B: 29 07    
    bne     Test_New_Colour_Is_Green        ; 291D: D0 02    

; Colour is black, bump it to white by incrementing
    ora     #COLOUR_WHITE                   ; 291F: 09 01    

; L_BRS_($2921)_($291D) OK
Test_New_Colour_Is_Green
    cmp     #COLOUR_GREEN                   ; 2921: C9 05    
    bne     Store_Updated_Explosion_Colour  ; 2923: D0 02    

; If colour is green, bump to Blue, Green only used for platforms
    lda     #COLOUR_BLUE                    ; 2925: A9 06     Colour code

; L_BRS_($2927)_($2923) OK
Store_Updated_Explosion_Colour
    ldy     #OBJECT_COLOUR_PARAM            ; 2927: A0 05    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2929: 91 00    

; Trigger explosion sound (noise + regular oscillator)
    lda     #$05                            ; 292B: A9 05    
    sta     Obj_Sound_Noise                 ; 292D: 8D AB 03 
    sta     Obj_Sound_Noise_Timer           ; 2930: 8D AC 03 
    rts                                     ; 2933: 60       
; ==========================================

; If an alien explosion occurs, add a new alien
ANIMATE_EXPLOSIONS
    inc     ZP_Alien_Spawn_Counter          ; 2934: E6 21    
    jsr     Load_Object_Type_X_Y_Colour     ; 2936: 20 E9 35 

; Appears to add randomness to how long an animation frame is displayed using the IRQ counter
; Param 02 of alien object is always set to zero, for Jetman is always set to one
    ldy     #$02                            ; 2939: A0 02    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 293B: B1 00    
    and     ZP_IRQ_Counter_Lo               ; 293D: 25 4A    
    bne     Test_Explosion_Animation_Done   ; 293F: D0 09    

; Increment explosion animation frame count
    ldy     #EXPLOSION_ANIMATION_FRAME      ; 2941: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2943: B1 00    
    clc                                     ; 2945: 18       
    adc     #$01                            ; 2946: 69 01    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2948: 91 00    

; L_BRS_($294A)_($293F) OK
Test_Explosion_Animation_Done
    ldy     #EXPLOSION_ANIMATION_FRAME      ; 294A: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 294C: B1 00    
    cmp     #EXPLOSION_ANIMATION_FRAMES     ; 294E: C9 07    
    bcs     Disable_Explosion_Obj_In_List   ; 2950: B0 23    

; Setup Registers A and Y to point to the correct explosion UDG data
    asl     a                               ; 2952: 0A       
    tax                                     ; 2953: AA       
    lda     Explosion_UDG_RAM_Addr_Table,x  ; 2954: BD 67 29 
    tay                                     ; 2957: A8       
    lda     Explosion_UDG_RAM_Addr_Table+1,x ; 2958: BD 68 29 

; Update the explosion on screen
    jsr     Load_Obj_Old_UDG_RAM_Addr_Size  ; 295B: 20 3D 37 
    jsr     Display_Object_Old_Setup        ; 295E: 20 04 36 
    jsr     Colourize_Object                ; 2961: 20 1F 38 
    jmp     GOTO_NEXT_OBJECT                ; 2964: 4C 1A 26 
; ------------------------------------------

Explosion_UDG_RAM_Addr_Table
    fdb     Explosion_UDG_RAM_Addr_Frame_1  ; 2967: 74 3F    
    fdb     Explosion_UDG_RAM_Addr_Frame_1  ; 2969: 74 3F    
    fdb     Explosion_UDG_RAM_Addr_Frame_2  ; 296B: 9B 3F    
    fdb     Explosion_UDG_RAM_Addr_Frame_3  ; 296D: B2 3F    
    fdb     Explosion_UDG_RAM_Addr_Frame_1  ; 296F: 74 3F    
    fdb     Explosion_UDG_RAM_Addr_Frame_2  ; 2971: 9B 3F    
    fdb     Explosion_UDG_RAM_Addr_Frame_3  ; 2973: B2 3F    

; Disable explosion object by setting object type to zero
; L_BRS_($2975)_($2950) OK
Disable_Explosion_Obj_In_List
    ldy     #OBJECT_TYPE_PARAM              ; 2975: A0 00    
    tya                                     ; 2977: 98       
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2978: 91 00    

; Test if object was an Alien or Jetman, branch if Jetman
    ldy     #OBJECT_TYPE_PARAM_SAVED        ; 297A: A0 06    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 297C: B1 00    
    and     #%00111111                      ; 297E: 29 3F    
    cmp     #%00000011                      ; 2980: C9 03    
    bcc     Reset_Objects_Test_Game_Over    ; 2982: 90 19    

    jmp     GOTO_NEXT_OBJECT                ; 2984: 4C 1A 26 
; ------------------------------------------





;  dP""b8    db    8b    d8 888888      dP"Yb  Yb    dP 888888 88""Yb
; dP   `"   dPYb   88b  d88 88__       dP   Yb  Yb  dP  88__   88__dP
; Yb  "88  dP__Yb  88YbdP88 88""       Yb   dP   YbdP   88""   88"Yb
;  YboodP dP""""Yb 88 YY 88 888888      YbodP     YP    888888 88  Yb

; L_BRS_($2987)_($29C5) OK
Game_Over
    jsr     Check_New_Hi_Score              ; 2987: 20 7A 27 
    jsr     Reset_Screen_Display_Scores     ; 298A: 20 16 24 
    lda     ZP_Active_Player                ; 298D: A5 5E    
    bne     Game_Over_Player_2              ; 298F: D0 06    

; Game Over Player 1
    jsr     Display_Game_Over_Player_1      ; 2991: 20 EE 29 
    jmp     Reset_Game_Select               ; 2994: 4C 79 20 
; ------------------------------------------

; L_BRS_($2997)_($298F) OK
Game_Over_Player_2
    jsr     Display_Game_Over_Player_2      ; 2997: 20 12 2A 
    jmp     Reset_Game_Select               ; 299A: 4C 79 20 
; ------------------------------------------

; L_BRS_($299D)_($2982) OK
Reset_Objects_Test_Game_Over
    lda     #$00                            ; 299D: A9 00    
    sta     VIC_RA_Frq_Osc1                 ; 299F: 8D 0A 90 
    sta     VIC_RB_Frq_Osc2                 ; 29A2: 8D 0B 90 
    sta     VIC_RC_Frq_Osc3                 ; 29A5: 8D 0C 90 
    jsr     Reset_Objects_Multiple          ; 29A8: 20 D4 28 

; Unset "Picked-up by Jetman"
    lda     Obj_Ship_Top_Or_Fuel_Status     ; 29AB: AD BC 03 
    and     #%11111101                      ; 29AE: 29 FD    
    sta     Obj_Ship_Top_Or_Fuel_Status     ; 29B0: 8D BC 03 

; Unset "Picked-up by Jetman"
    lda     Obj_Ship_Mid_Or_Valu_Status     ; 29B3: AD C4 03 
    and     #%11111101                      ; 29B6: 29 FD    
    sta     Obj_Ship_Mid_Or_Valu_Status     ; 29B8: 8D C4 03 

; Test if 1 or 2 Player Game, branch if 2 Player
    lda     Game_Settings                   ; 29BB: AD D3 1F 
    bit     MASK_00000001                   ; 29BE: 2C 14 20 
    bne     Test_Game_Over_Inactive_Player  ; 29C1: D0 0D    

; L_BRS_($29C3)_($29D2) OK
Test_Game_Over_Active_Player
    lda     ZP_Num_Lives_Active_Player      ; 29C3: A5 5A    
    beq     Game_Over                       ; 29C5: F0 C0    

; L_JMP_($29C7)_($29E4) OK
Reset_Level_Init_Next_Jetman
    jsr     Reset_Level                     ; 29C7: 20 D7 22 
    jsr     Init_Next_Jetman_Lives_Scores   ; 29CA: 20 5B 23 
    jmp     GOTO_NEXT_OBJECT                ; 29CD: 4C 1A 26 
; ------------------------------------------

; L_BRS_($29D0)_($29C1) OK
Test_Game_Over_Inactive_Player
    lda     ZP_Num_Lives_Inactive_Player    ; 29D0: A5 5C    
    beq     Test_Game_Over_Active_Player    ; 29D2: F0 EF    

; Test Game Over Active Player, if not swap to other players data
    lda     ZP_Num_Lives_Active_Player      ; 29D4: A5 5A    
    bne     Swap_Active_Player_And_Objects  ; 29D6: D0 03    

    jsr     Display_Game_Over               ; 29D8: 20 E7 29 

; L_BRS_($29DB)_($29D6) OK
Swap_Active_Player_And_Objects
    jsr     Swap_Player_And_Obj_Ship        ; 29DB: 20 F5 23 
    lda     ZP_Active_Player                ; 29DE: A5 5E    
    eor     #%11111111                      ; 29E0: 49 FF    
    sta     ZP_Active_Player                ; 29E2: 85 5E    
    jmp     Reset_Level_Init_Next_Jetman    ; 29E4: 4C C7 29 
; ------------------------------------------

; L_JSR_($29E7)_($29D8) OK
Display_Game_Over
    jsr     Reset_Screen_Display_Scores     ; 29E7: 20 16 24 
    lda     ZP_Active_Player                ; 29EA: A5 5E    
    bne     Display_Game_Over_Player_2      ; 29EC: D0 24    

; L_JSR_($29EE)_($2991) OK
Display_Game_Over_Player_1
    jsr     Load_ZP_Parameters              ; 29EE: 20 9D 25 
    fcb     $0E                             ; 29F1: 0E        ZP0E/0F
    fdb     STRING_GAME_OVER_PLAYER_1       ; 29F2: 1F 2A    
    fcb     $04                             ; 29F4: 04        ZP04/05
    fcb     $10,$60                         ; 29F5: 10 60     X Y
    fcb     $FF                             ; 29F7: FF       

; L_JMP_($29F8)_($2A1C) OK
Display_Game_Over_Player_1_2
    jsr     Display_String_With_Setup       ; 29F8: 20 CC 34 

; Setup Game Over Delay Loop
    jsr     Load_ZP_Parameters              ; 29FB: 20 9D 25 
    fcb     $02                             ; 29FE: 02        ZP02/03
    fdb     $0000                           ; 29FF: 00 00    
    fcb     $0A                             ; 2A01: 0A        ZP0A/0B
    fdb     $00F8                           ; 2A02: F8 00    
    fcb     $FF                             ; 2A04: FF       

; Wait a few seconds when Game Over is displayed on screen
; Delay loop $100^2 x ($100-$F8=$08) x (5+3=$08) = $400,000
;                                                = 4,194,304 cycles @ 1.108MHz PAL
;                                                = 3.785 Seconds
; L_BRS_($2A05)_($2A07) OK
; L_BRS_($2A05)_($2A0B) OK
; L_BRS_($2A05)_($2A0F) OK
Delay_Loop_Game_Over
    inc     ZP02                            ; 2A05: E6 02     5 cycles
    bne     Delay_Loop_Game_Over            ; 2A07: D0 FC     3 cycles when taken, 2 when not taken
    inc     ZP03                            ; 2A09: E6 03    
    bne     Delay_Loop_Game_Over            ; 2A0B: D0 F8    
    inc     ZP0A                            ; 2A0D: E6 0A    
    bne     Delay_Loop_Game_Over            ; 2A0F: D0 F4    
    rts                                     ; 2A11: 60       
; ==========================================

; L_JSR_($2A12)_($2997) OK
; L_BRS_($2A12)_($29EC) OK
Display_Game_Over_Player_2
    jsr     Load_ZP_Parameters              ; 2A12: 20 9D 25 
    fcb     $0E                             ; 2A15: 0E        ZP0E/0F
    fdb     STRING_GAME_OVER_PLAYER_2       ; 2A16: 32 2A    
    fcb     $04                             ; 2A18: 04        ZP04/05
    fcb     $10,$60                         ; 2A19: 10 60     X Y
    fcb     $FF                             ; 2A1B: FF       
    jmp     Display_Game_Over_Player_1_2    ; 2A1C: 4C F8 29 
; ------------------------------------------

STRING_GAME_OVER_PLAYER_1
    fcb     COLOUR_WHITE                    ; 2A1F: 01       
    fcc     "GAME`OVER`PLAYER`"             ; 2A20: 47 41 4D 45 60 4F 56 45 52 60 50 4C 41 59 45 52 60 
    fcb     $F1                             ; 2A31: F1       

STRING_GAME_OVER_PLAYER_2
    fcb     COLOUR_WHITE                    ; 2A32: 01       
    fcc     "GAME`OVER`PLAYER`"             ; 2A33: 47 41 4D 45 60 4F 56 45 52 60 50 4C 41 59 45 52 60 
    fcb     $F2                             ; 2A44: F2       





; .dP"Y8 888888 888888 88   88 88""Yb      88888 888888 888888 8b    d8    db    88b 88
; `Ybo." 88__     88   88   88 88__dP         88 88__     88   88b  d88   dPYb   88Yb88
; o.`Y8b 88""     88   Y8   8P 88"""      o.  88 88""     88   88YbdP88  dP__Yb  88 Y88
; 8bodP' 888888   88   `YbodP' 88         "bodP' 888888   88   88 YY 88 dP""""Yb 88  Y8

; 888888 Yb  dP 88""Yb 88      dP"Yb  .dP"Y8 88  dP"Yb  88b 88
; 88__    YbdP  88__dP 88     dP   Yb `Ybo." 88 dP   Yb 88Yb88
; 88""    dPYb  88"""  88  .o Yb   dP o.`Y8b 88 Yb   dP 88 Y88
; 888888 dP  Yb 88     88ood8  YbodP  8bodP' 88  YbodP  88  Y8

; Jetman has collided with an alien, setup object ready to become an explosion
; L_JSR_($2A45)_($2C99) OK
Setup_Jetman_Explosion
    jsr     Save_Obj_List_Ptr               ; 2A45: 20 E7 28 
    jsr     Load_ZP_Parameters              ; 2A48: 20 9D 25 
    fcb     $00                             ; 2A4B: 00       
    fdb     Obj_Jetman_State                ; 2A4C: 80 03    
    fcb     $FF                             ; 2A4E: FF       

; Reset Jetman direction parameter, i.e. stop moving
    ldy     #OBJECT_JETMAN_DIRECTION_PARAM  ; 2A4F: A0 02    
    lda     #$01                            ; 2A51: A9 01    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2A53: 91 00    

; Save object type and then change it to an explosion
    ldy     #$00                            ; 2A55: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2A57: B1 00    
    jsr     Set_Object_Type_To_Explosion    ; 2A59: 20 0A 29 
    jmp     Restore_Obj_List_Ptr            ; 2A5C: 4C F0 28 
; ------------------------------------------





; ############################################################################################
; Yb        dP    db    Yb    dP 888888       .d
;  Yb  db  dP    dPYb    Yb  dP  88__       .d88
;   YbdPYbdP    dP__Yb    YbdP   88""         88
;    YP  YP    dP""""Yb    YP    888888       88

;  dP""b8 88""Yb  dP"Yb  .dP"Y8 .dP"Y8
; dP   `" 88__dP dP   Yb `Ybo." `Ybo."
; Yb      88"Yb  Yb   dP o.`Y8b o.`Y8b
;  YboodP 88  Yb  YbodP  8bodP' 8bodP'
; ############################################################################################

WAVE_1_CROSS
    jsr     Test_Laser_Hits                 ; 2A5F: 20 5F 2C 
    bpl     Wave_1_Cross_Direction_Update   ; 2A62: 10 03    
    jmp     Alien_Hit_Score_Update          ; 2A64: 4C 78 2C 
; ------------------------------------------

; Alien not hit by laser, check to see if hit platform, aliens bounce off after first wave, so
; update direction
; L_BRS_($2A67)_($2A62) OK
Wave_1_Cross_Direction_Update
    jsr     Test_Platform_Collision_Bounce  ; 2A67: 20 16 2B 
    jmp     Direction_X_Y_Update            ; 2A6A: 4C 83 2A 
; ------------------------------------------





; ############################################################################################
; Yb        dP    db    Yb    dP 888888     oP"Yb.
;  Yb  db  dP    dPYb    Yb  dP  88__       "' dP'
;   YbdPYbdP    dP__Yb    YbdP   88""         dP'
;    YP  YP    dP""""Yb    YP    888888     .d8888

; .dP"Y8 88""Yb 88  88 888888 88""Yb 888888
; `Ybo." 88__dP 88  88 88__   88__dP 88__
; o.`Y8b 88"""  888888 88""   88"Yb  88""
; 8bodP' 88     88  88 888888 88  Yb 888888
; ############################################################################################

WAVE_2_SPHERE
    jsr     Test_Laser_Hits                 ; 2A6D: 20 5F 2C 
    beq     Wave_2_Sphere_Direction_Update  ; 2A70: F0 03    
    jmp     Alien_Hit_Score_Update          ; 2A72: 4C 78 2C 
; ------------------------------------------

; Alien not hit by laser, check to see if hit platform, aliens bounce off after wave 0
; so update direction
; L_BRS_($2A75)_($2A70) OK
Wave_2_Sphere_Direction_Update
    jsr     Test_Platform_Collision_Bounce  ; 2A75: 20 16 2B 

; Read direction Y reversal countdown, branch if zero, else decrement countdown
    ldy     #OBJECT_DIR_Y_COUNTDOWN_PARAM   ; 2A78: A0 06    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2A7A: B1 00    
    beq     Direction_Y_Update_Rand         ; 2A7C: F0 24    
    sec                                     ; 2A7E: 38       
    sbc     #$01                            ; 2A7F: E9 01    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2A81: 91 00    




; Below routine common to waves 1 and 2
; L_JMP_($2A83)_($2A6A) OK
Direction_X_Y_Update
    ldy     #OBJECT_DIRECTION_X_PARAM       ; 2A83: A0 02    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2A85: B1 00    
    bmi     Load_Direction_X_Left           ; 2A87: 30 15    
    lda     #DIRECTION_X_RIGHT              ; 2A89: A9 08    

; L_BRS_($2A8B)_($2AA0) OK
Direction_X_Store_
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2A8B: 91 00    

; Direction_Y_Update
    ldy     #OBJECT_DIRECTION_Y_PARAM       ; 2A8D: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2A8F: B1 00    
    bmi     Load_Direction_Y_Up             ; 2A91: 30 07    
    lda     #DIRECTION_Y_DOWN               ; 2A93: A9 08    

; L_BRS_($2A95)_($2A9C) OK
Direction_Y_Store_
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2A95: 91 00    
    jmp     Display_Object_Position_Update  ; 2A97: 4C 92 2C 
; ------------------------------------------

; L_BRS_($2A9A)_($2A91) OK
Load_Direction_Y_Up
    lda     #DIRECTION_Y_UP                 ; 2A9A: A9 F8    
    bmi     Direction_Y_Store_              ; 2A9C: 30 F7    

; L_BRS_($2A9E)_($2A87) OK
Load_Direction_X_Left
    lda     #DIRECTION_X_LEFT               ; 2A9E: A9 F8    
    bmi     Direction_X_Store_              ; 2AA0: 30 E9    

; Reset random direction Y change countdown initial value using IRQ random number, range $10-$1F
; L_BRS_($2AA2)_($2A7C) OK
Direction_Y_Update_Rand
    lda     ZP_IRQ_Random                   ; 2AA2: A5 4C    
    and     #%00001111                      ; 2AA4: 29 0F    
    adc     #%00010000                      ; 2AA6: 69 10    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2AA8: 91 00    

; Reverse direction Y up/down, randomly via IRQ random number, bit 2
    ldy     #OBJECT_DIRECTION_Y_PARAM       ; 2AAA: A0 04    
    and     #%00000100                      ; 2AAC: 29 04    
    bit     ZP_IRQ_Random                   ; 2AAE: 24 4C    
    bmi     Direction_Y_Store_Rand          ; 2AB0: 30 05    

; Invert on the direction byte
    eor     #%11111111                      ; 2AB2: 49 FF    
    clc                                     ; 2AB4: 18       
    adc     #$01                            ; 2AB5: 69 01    

; L_BRS_($2AB7)_($2AB0) OK
Direction_Y_Store_Rand
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2AB7: 91 00    
    jmp     Display_Object_Position_Update  ; 2AB9: 4C 92 2C 
; ------------------------------------------





; ############################################################################################
; Yb        dP    db    Yb    dP 888888     88888
;  Yb  db  dP    dPYb    Yb  dP  88__         .dP
;   YbdPYbdP    dP__Yb    YbdP   88""       o `Yb
;    YP  YP    dP""""Yb    YP    888888     YbodP

; .dP"Y8    db    88   88  dP""b8 888888 88""Yb
; `Ybo."   dPYb   88   88 dP   `" 88__   88__dP
; o.`Y8b  dP__Yb  Y8   8P Yb      88""   88"Yb
; 8bodP' dP""""Yb `YbodP'  YboodP 888888 88  Yb
; ############################################################################################

WAVE_3_SAUCER
    jsr     Test_Laser_Hits                 ; 2ABC: 20 5F 2C 
    bpl     Wave_3_Saucer_Direction_Update  ; 2ABF: 10 03    
    jmp     Alien_Hit_Score_Update          ; 2AC1: 4C 78 2C 
; ------------------------------------------

; Alien not hit by laser, check to see if hit platform, aliens bounce off after wave 0 so
; update direction
; L_BRS_($2AC4)_($2ABF) OK
Wave_3_Saucer_Direction_Update
    jsr     Test_Platform_Collision_Bounce  ; 2AC4: 20 16 2B 

; Saucers home-in on Jetman, thus below code is in four sections:
; - Two sections update X depending on whether alien is left or right of Jetman
; - Two sections update Y depending on whether alien is above or below Jetman

; Direction X Update
    ldy     #OBJECT_POSITION_X_PARAM        ; 2AC7: A0 01    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2AC9: B1 00    

; Register Y becomes offset to Object Direction X parameter
    iny                                     ; 2ACB: C8       

; Compare alien and jetman positions, branch if alien to left of jetman
    sec                                     ; 2ACC: 38       
    sbc     Obj_Jetman_Position_X           ; 2ACD: ED 81 03 
    bmi     Direction_X_Increment           ; 2AD0: 30 28    

; Alien is to the right of Jetman
; Test if alien moving right, if yes, immediately decrement the direction i.e. so it moves left
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2AD2: B1 00    
    sec                                     ; 2AD4: 38       
    bpl     Direction_X_Decr                ; 2AD5: 10 04    

; Test Direction X, when $FC reached, movement left speed is maxed out, go straight to Y update
    cmp     #DIRECTION_X_LEFT_MAX           ; 2AD7: C9 FC    
    bcc     Position_Y_Update               ; 2AD9: 90 04    

; Decrement alien direction X i.e. so it moves left
; L_BRS_($2ADB)_($2AD5) OK
Direction_X_Decr
    sbc     #$01                            ; 2ADB: E9 01    

; Store new direction X back to alien object
; L_JMP_($2ADD)_($2B05) OK
Direction_X_Store
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2ADD: 91 00    


; Alien Direction Y Update, same logic as Direction X Update
; L_BRS_($2ADF)_($2AD9) OK
; L_BRS_($2ADF)_($2B01) OK
Position_Y_Update
    ldy     #OBJECT_POSITION_Y_PARAM        ; 2ADF: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2AE1: B1 00    

; Register Y becomes offset to Object Direction Y parameter
    iny                                     ; 2AE3: C8       

; Compare alien and jetman positions, branch if alien is above jetman
    sec                                     ; 2AE4: 38       
    sbc     Obj_Jetman_Position_Y           ; 2AE5: ED 83 03 
    bmi     Direction_Y_Increment           ; 2AE8: 30 1E    

; Alien is below Jetman
; Test if alien moving down, if yes, immediately decrement the direction i.e. so it moves up
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2AEA: B1 00    
    sec                                     ; 2AEC: 38       
    bpl     Direction_Y_Decr                ; 2AED: 10 04    

; Test Direction Y, when $FC reached, movement up speed is maxed out, exit direction update routine
    cmp     #DIRECTION_Y_UP_MAX             ; 2AEF: C9 FC    
    bcc     Wave_3_Saucer_Exit              ; 2AF1: 90 04    

; Decrement alien direction Y i.e. so it moves up
; L_BRS_($2AF3)_($2AED) OK
Direction_Y_Decr
    sbc     #$01                            ; 2AF3: E9 01    

; Store new direction Y back to alien object
; L_JMP_($2AF5)_($2B13) OK
Direction_Y_Store
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2AF5: 91 00    

; L_BRS_($2AF7)_($2AF1) OK
; L_BRS_($2AF7)_($2B0F) OK
Wave_3_Saucer_Exit
    jmp     Display_Object_Position_Update  ; 2AF7: 4C 92 2C 
; ------------------------------------------

; Alien to left of Jetman, increment alien direction X by one until max reached
; L_BRS_($2AFA)_($2AD0) OK
Direction_X_Increment
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2AFA: B1 00    
    clc                                     ; 2AFC: 18       
    bmi     Direction_X_Inc                 ; 2AFD: 30 04    
    cmp     #DIRECTION_X_RIGHT_MAX          ; 2AFF: C9 04    
    bcs     Position_Y_Update               ; 2B01: B0 DC    

; L_BRS_($2B03)_($2AFD) OK
Direction_X_Inc
    adc     #$01                            ; 2B03: 69 01    
    jmp     Direction_X_Store               ; 2B05: 4C DD 2A 
; ------------------------------------------

; Alien is below Jetman, increment alien direction Y by one until max reached
; L_BRS_($2B08)_($2AE8) OK
Direction_Y_Increment
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2B08: B1 00    
    clc                                     ; 2B0A: 18       
    bmi     Direction_Y_Inc                 ; 2B0B: 30 04    
    cmp     #DIRECTION_Y_DOWN_MAX           ; 2B0D: C9 04    
    bcs     Wave_3_Saucer_Exit              ; 2B0F: B0 E6    

; L_BRS_($2B11)_($2B0B) OK
Direction_Y_Inc
    adc     #$01                            ; 2B11: 69 01    
    jmp     Direction_Y_Store               ; 2B13: 4C F5 2A 
; ------------------------------------------





; 888888 888888 .dP"Y8 888888     88""Yb 88        db    888888 888888  dP"Yb  88""Yb 8b    d8
;   88   88__   `Ybo."   88       88__dP 88       dPYb     88   88__   dP   Yb 88__dP 88b  d88
;   88   88""   o.`Y8b   88       88"""  88  .o  dP__Yb    88   88""   Yb   dP 88"Yb  88YbdP88
;   88   888888 8bodP'   88       88     88ood8 dP""""Yb   88   88      YbodP  88  Yb 88 YY 88

;  dP""b8  dP"Yb  88     88     88 .dP"Y8 88  dP"Yb  88b 88
; dP   `" dP   Yb 88     88     88 `Ybo." 88 dP   Yb 88Yb88
; Yb      Yb   dP 88  .o 88  .o 88 o.`Y8b 88 Yb   dP 88 Y88
;  YboodP  YbodP  88ood8 88ood8 88 8bodP' 88  YbodP  88  Y8

; 88""Yb  dP"Yb  88   88 88b 88  dP""b8 888888
; 88__dP dP   Yb 88   88 88Yb88 dP   `" 88__
; 88""Yb Yb   dP Y8   8P 88 Y88 Yb      88""
; 88oodP  YbodP  `YbodP' 88  Y8  YboodP 888888

; Test if alien has hit a platform, if yes, bounce off with direction change, else return
; L_JSR_($2B16)_($2A67) OK
; L_JSR_($2B16)_($2A75) OK
; L_JSR_($2B16)_($2AC4) OK
Test_Platform_Collision_Bounce
    jsr     Test_Platform_Collision         ; 2B16: 20 B3 30 
    lda     ZP02_Collision_Status           ; 2B19: A5 02    
    bpl     Do_RTS                          ; 2B1B: 10 19     1xxx_xxx = Collision

; Collision detected, test if direction X is changing
    ldy     #OBJECT_DIRECTION_X             ; 2B1D: A0 02    
    bit     MASK_00000100                   ; 2B1F: 2C 16 20  xxxx_x1xx = Direction X change
    bne     Invert_Direction_X              ; 2B22: D0 13    

; Test if direction Y is changing, down to up i.e. hitting top surface of platform
; Note collision going up has neither X or Y flag triggered
    ldy     #OBJECT_DIRECTION_Y             ; 2B24: A0 04    
    bit     MASK_00001000                   ; 2B26: 2C 17 20  xxxx_1xxx - Direction Y change
    bne     Invert_Direction_Alternate      ; 2B29: D0 17    

; Test object direction Y i.e. moving downwards, return if positive, else invert direction Y
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2B2B: B1 00    
    bpl     Do_RTS                          ; 2B2D: 10 07    

; Invert direction and add $03, which appears to be removed later
; L_BRS_($2B2F)_($2B40) OK
Invert_Direction_X_or_Y
    eor     #%11111111                      ; 2B2F: 49 FF    
    clc                                     ; 2B31: 18       
    adc     #$03                            ; 2B32: 69 03    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2B34: 91 00    

; L_BRS_($2B36)_($2B1B) OK
; L_BRS_($2B36)_($2B2D) OK
; L_BRS_($2B36)_($2B3E) OK
; L_BRS_($2B36)_($2B44) OK
Do_RTS
    rts                                     ; 2B36: 60       
; ==========================================

; Test object direction X, sometimes clips platform, passes this code but no direction X change,
; probably the MASK_01 fails
; L_BRS_($2B37)_($2B22) OK
Invert_Direction_X
    bit     MASK_00000001                   ; 2B37: 2C 14 20 
    bne     Invert_Direction_Alternate      ; 2B3A: D0 06    

; Mask wasn't set, direction X not changed object skimmed platform
; Test object direction X, if object is going down, return, else, reverse direction X
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2B3C: B1 00    
    bpl     Do_RTS                          ; 2B3E: 10 F6    
    bmi     Invert_Direction_X_or_Y         ; 2B40: 30 ED    

; If Direction is up or left, return
; L_BRS_($2B42)_($2B29) OK
; L_BRS_($2B42)_($2B3A) OK
Invert_Direction_Alternate
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2B42: B1 00    
    bmi     Do_RTS                          ; 2B44: 30 F0    

; Object is going down or right, invert direction and store back to object
    eor     #%11111111                      ; 2B46: 49 FF    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2B48: 91 00    
    rts                                     ; 2B4A: 60       
; ==========================================





; .dP"Y8 88""Yb    db    Yb        dP 88b 88
; `Ybo." 88__dP   dPYb    Yb  db  dP  88Yb88
; o.`Y8b 88"""   dP__Yb    YbdPYbdP   88 Y88
; 8bodP' 88     dP""""Yb    YP  YP    88  Y8

;  dP"Yb  88""Yb  88888 888888  dP""b8 888888 .dP"Y8
; dP   Yb 88__dP     88 88__   dP   `"   88   `Ybo."
; Yb   dP 88""Yb o.  88 88""   Yb        88   o.`Y8b
;  YbodP  88oodP "bodP' 888888  YboodP   88   8bodP'

; Test if Jetman is onscreen
; L_JSR_($2B4B)_($2655) OK
Spawn_Ship_Modules_Fuel_Cell
    lda     Obj_Jetman_State                ; 2B4B: AD 80 03 
    and     #%00111111                      ; 2B4E: 29 3F    
    bne     Spawn_SMFC                      ; 2B50: D0 01    

; L_BRS_($2B52)_($2B55) OK
; L_BRS_($2B52)_($2B5A) OK
; L_BRS_($2B52)_($2B61) OK
; L_BRS_($2B52)_($2B69) OK
Spawn_SMFC_RTS
    rts                                     ; 2B52: 60       
; ==========================================

; Return if Jetman not only flying or standing or no ship module/fuel onscreen
; L_BRS_($2B53)_($2B50) OK
Spawn_SMFC
    cmp     #NOT_FLYING_AND_NOT_STANDING    ; 2B53: C9 03    
    bcs     Spawn_SMFC_RTS                  ; 2B55: B0 FB    
    lda     Obj_Ship_Top_Or_Fuel_Type       ; 2B57: AD B8 03 
    bne     Spawn_SMFC_RTS                  ; 2B5A: D0 F6    

; Return if ship is built and fuelled up
    lda     Obj_Ship_Base_Fuel_Level        ; 2B5C: AD B2 03 
    cmp     #SHIP_BUILT_AND_FUELLED_UP      ; 2B5F: C9 06    
    bcs     Spawn_SMFC_RTS                  ; 2B61: B0 EF    

; Use counter to randomly spawn another Fuel Cell
    lda     ZP_IRQ_Counter_Lo               ; 2B63: A5 4A    
    eor     #%11111111                      ; 2B65: 49 FF    
    and     #%00001111                      ; 2B67: 29 0F    
    bne     Spawn_SMFC_RTS                  ; 2B69: D0 E7    

; Init Ship Part or Fuel Cell object (8 attributes)
    ldx     #NUM_OBJECT_PARAMS              ; 2B6B: A2 07    

; L_BRS_($2B6D)_($2B74) OK
Loop_Init_Obj_Ship_Or_Fuel
    lda     Init_Obj_Ship_Or_Fuel_Table,x   ; 2B6D: BD 7F 2B 
    sta     Obj_Ship_Top_Or_Fuel_Type,x     ; 2B70: 9D B8 03 
    dex                                     ; 2B73: CA       
    bpl     Loop_Init_Obj_Ship_Or_Fuel      ; 2B74: 10 F7    

; Spawn object at a random X position
    jsr     Get_Random_Position_X           ; 2B76: 20 DE 2B 
    sta     Obj_Ship_Top_Or_Fuel_X          ; 2B79: 8D B9 03 
    jmp     Init_Obj_Ship_Top_Or_Fuel_Typ   ; 2B7C: 4C E3 22 
; ------------------------------------------

Init_Obj_Ship_Or_Fuel_Table
    fcb     $04,$00,$00,$20,$01,$04,$18,$18 ; 2B7F: 04 00 00 20 01 04 18 18 

Init_Obj_Valuable_Table
    fcb     $0E,$00,$00,$20,$00,$00,$00,$18 ; 2B87: 0E 00 00 20 00 00 00 18 

; L_JSR_($2B8F)_($2658) OK
Spawn_Valuables
    lda     Obj_Jetman_State                ; 2B8F: AD 80 03 
    and     #%00111111                      ; 2B92: 29 3F    
    bne     Spawn_Vals                      ; 2B94: D0 01    

; L_BRS_($2B96)_($2B99) OK
; L_BRS_($2B96)_($2B9E) OK
; L_BRS_($2B96)_($2BA4) OK
Spawn_Vals_RTS
    rts                                     ; 2B96: 60       
; ==========================================

; Return if Jetman not only flying or standing or valuable onscreen
; L_BRS_($2B97)_($2B94) OK
Spawn_Vals
    cmp     #NOT_FLYING_AND_NOT_STANDING    ; 2B97: C9 03    
    bcs     Spawn_Vals_RTS                  ; 2B99: B0 FB    
    lda     Obj_Ship_Mid_Or_Valuable_Typ    ; 2B9B: AD C0 03 
    bne     Spawn_Vals_RTS                  ; 2B9E: D0 F6    

; Use counter to randomly spawn another valuable
    lda     ZP_IRQ_Counter_Lo               ; 2BA0: A5 4A    
    and     #%01111111                      ; 2BA2: 29 7F    
    bne     Spawn_Vals_RTS                  ; 2BA4: D0 F0    

; Init Flashing Valuable object (8 attributes)
    ldx     #NUM_OBJECT_PARAMS              ; 2BA6: A2 07    

; L_BRS_($2BA8)_($2BAF) OK
Loop_Init_Obj_Valuable
    lda     Init_Obj_Valuable_Table,x       ; 2BA8: BD 87 2B 
    sta     Obj_Ship_Mid_Or_Valuable_Typ,x  ; 2BAB: 9D C0 03 
    dex                                     ; 2BAE: CA       
    bpl     Loop_Init_Obj_Valuable          ; 2BAF: 10 F7    

; Spawn object at a random X position
    jsr     Get_Random_Position_X           ; 2BB1: 20 DE 2B 
    sta     Obj_Ship_Mid_Or_Valuable_X      ; 2BB4: 8D C1 03 

; Use IRQ random value to setup next object type
    lda     ZP_IRQ_Random                   ; 2BB7: A5 4C    
    and     #%00001110                      ; 2BB9: 29 0E    
    bit     MASK_00001000                   ; 2BBB: 2C 17 20 
    beq     Store_Valuable_Type             ; 2BBE: F0 02    

; Bit 3 wasn't set, so zero all bits apart from bit 3
; Bit 3 will make the object the gemstone which cycles through all colours
    and     #%00001000                      ; 2BC0: 29 08    

; Make the valuable type $2x, used as an offset into the UDG data
; L_BRS_($2BC2)_($2BBE) OK
Store_Valuable_Type
    ora     #%00100000                      ; 2BC2: 09 20    
    sta     Obj_Ship_Mid_Or_Valu_UDG_Idx    ; 2BC4: 8D C6 03 

; $03C0 object starts as Ship Module Middle, then becomes Valuable
; L_JSR_($2BC7)_($2DC5) OK
Load_ZP_Params_Ship_Or_Val
    jsr     Save_Obj_List_Ptr               ; 2BC7: 20 E7 28 
    jsr     Load_ZP_Parameters              ; 2BCA: 20 9D 25 
    fcb     $00                             ; 2BCD: 00        ZP00/01
    fdb     Obj_Ship_Mid_Or_Valuable_Typ    ; 2BCE: C0 03     Object Address
    fcb     $FF                             ; 2BD0: FF       
    jsr     Load_Object_Type_X_Y_Colour     ; 2BD1: 20 E9 35 

; Object's valuable type used as an index into the UDG data
    ldy     #OBJECT_VALUABLE_TYPE_PARAM     ; 2BD4: A0 06    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2BD6: B1 00    
    jsr     Display_Object_Ship_Or_Fuel     ; 2BD8: 20 5A 30 
    jmp     Restore_Obj_List_Ptr            ; 2BDB: 4C F0 28 
; ------------------------------------------

; Use VIC raster value to create a random X parameter for new object
; L_JSR_($2BDE)_($2B76) OK
; L_JSR_($2BDE)_($2BB1) OK
Get_Random_Position_X
    lda     VIC_R4_TV_Raster                ; 2BDE: AD 04 90 
    and     #%00001111                      ; 2BE1: 29 0F    
    tax                                     ; 2BE3: AA       
    lda     Object_Position_X_Table,x       ; 2BE4: BD E8 2B 
    rts                                     ; 2BE7: 60       
; ==========================================

; Table of possible X positions for spawned new object
Object_Position_X_Table
    fcb     $00                             ; 2BE8: 00       
    fcb     $10                             ; 2BE9: 10       
    fcb     $18                             ; 2BEA: 18       
    fcb     $20                             ; 2BEB: 20       
    fcb     $28                             ; 2BEC: 28       
    fcb     $38                             ; 2BED: 38       
    fcb     $40                             ; 2BEE: 40       
    fcb     $50                             ; 2BEF: 50       
    fcb     $58                             ; 2BF0: 58       
    fcb     $88                             ; 2BF1: 88       
    fcb     $90                             ; 2BF2: 90       
    fcb     $98                             ; 2BF3: 98       
    fcb     $00                             ; 2BF4: 00       
    fcb     $10                             ; 2BF5: 10       
    fcb     $18                             ; 2BF6: 18       
    fcb     $20                             ; 2BF7: 20       





; 888888 888888 .dP"Y8 888888     88        db    .dP"Y8 888888 88""Yb
;   88   88__   `Ybo."   88       88       dPYb   `Ybo." 88__   88__dP
;   88   88""   o.`Y8b   88       88  .o  dP__Yb  o.`Y8b 88""   88"Yb
;   88   888888 8bodP'   88       88ood8 dP""""Yb 8bodP' 888888 88  Yb

; 88  88 88 888888 .dP"Y8
; 88  88 88   88   `Ybo."
; 888888 88   88   o.`Y8b
; 88  88 88   88   8bodP'

; Store Obj_Laser_0 address in ZP_08/09 ($0388)
; L_JSR_($2BF8)_($2C64) OK
Test_Laser_Hits_1
    lda     #OBJECT_LASER_0_LO              ; 2BF8: A9 88    
    sta     ZP08_Object_Laser_Addr_Lo       ; 2BFA: 85 08    
    lda     #OBJECT_LASER_0_HI              ; 2BFC: A9 03    
    sta     ZP09_Object_Laser_Addr_Hi       ; 2BFE: 85 09    

; Store number of lasers (4) for processing to ZP_02
    lda     #MAX_LASERS                     ; 2C00: A9 04    
    sta     ZP02_Num_Lasers_Countdown       ; 2C02: 85 02    

; Store current object X and Y for laser hit test in ZP_06/07
    ldy     #OBJECT_POSITION_Y_PARAM        ; 2C04: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2C06: B1 00    
    sta     ZP06_Object_Position_Y          ; 2C08: 85 06    

; Register Y becomes Object Position X parameter
    dey                                     ; 2C0A: 88       
    dey                                     ; 2C0B: 88       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2C0C: B1 00    
    sta     ZP07_Object_Position_X          ; 2C0E: 85 07    

; Test if laser Position X value has bit 2 set
; L_BRS_($2C10)_($2C5C) OK
Loop_Test_Laser_Hit
    ldy     #LASER_POSITION_X_PARAM         ; 2C10: A0 02    
    lda     (ZP08_Object_Laser_Addr_Lo),y   ; 2C12: B1 08    
    bit     MASK_00000100                   ; 2C14: 2C 16 20 
    bne     Test_Laser_Object_Active        ; 2C17: D0 08    

; Register Y becomes Laser next Position X parameter
; Test if laser next Position X value has bit 2 set
    iny                                     ; 2C19: C8       
    lda     (ZP08_Object_Laser_Addr_Lo),y   ; 2C1A: B1 08    
    bit     MASK_00000100                   ; 2C1C: 2C 16 20 
    beq     Goto_Next_Laser                 ; 2C1F: F0 32    

; L_BRS_($2C21)_($2C17) OK
Test_Laser_Object_Active
    ldy     #OBJECT_TYPE_PARAM              ; 2C21: A0 00    
    lda     (ZP08_Object_Laser_Addr_Lo),y   ; 2C23: B1 08    
    beq     Goto_Next_Laser                 ; 2C25: F0 2C    

; Register Y becomes Laser Position Y parameter
; Compare laser and object Position Y value, if CMP fails, return
    iny                                     ; 2C27: C8       
    lda     ZP06_Object_Position_Y          ; 2C28: A5 06    
    sec                                     ; 2C2A: 38       
    sbc     (ZP08_Object_Laser_Addr_Lo),y   ; 2C2B: F1 08    
    cmp     #$10                            ; 2C2D: C9 10    
    bcs     Goto_Next_Laser                 ; 2C2F: B0 22    

; Register Y becomes Laser Position X parameter
; Store the bottom 3 bits of Position X, making it a character-sized column reference
; Test if object is to the left or right of the Laser object
    iny                                     ; 2C31: C8       
    lda     (ZP08_Object_Laser_Addr_Lo),y   ; 2C32: B1 08    
    and     #%11111000                      ; 2C34: 29 F8    
    sbc     #$03                            ; 2C36: E9 03    
    sec                                     ; 2C38: 38       
    sbc     ZP07_Object_Position_X          ; 2C39: E5 07    
    bpl     Test_Laser_And_Obj_Position_X   ; 2C3B: 10 05    

; Invert the result of the comparison? Not sure...
    eor     #%11111111                      ; 2C3D: 49 FF    
    clc                                     ; 2C3F: 18       
    adc     #$01                            ; 2C40: 69 01    

; Compare Position X of object and later, see if they overlap and therefore there is a hit
; L_BRS_($2C42)_($2C3B) OK
Test_Laser_And_Obj_Position_X
    cmp     #$20                            ; 2C42: C9 20    
    bcs     Goto_Next_Laser                 ; 2C44: B0 0D    

; Object hit by laser, return $80 in ZP_02 (i.e. negative number)
    lda     #$80                            ; 2C46: A9 80    
    sta     ZP02_Num_Lasers_Countdown       ; 2C48: 85 02    

; Zero bit 2 of laser X parameter, probably to disable it later
    ldy     #LASER_POSITION_X_PARAM         ; 2C4A: A0 02    
    lda     (ZP08_Object_Laser_Addr_Lo),y   ; 2C4C: B1 08    
    and     #%11111011                      ; 2C4E: 29 FB    
    sta     (ZP08_Object_Laser_Addr_Lo),y   ; 2C50: 91 08    
    rts                                     ; 2C52: 60       
; ==========================================

; Increment current object address and decrement object counter
; L_BRS_($2C53)_($2C1F) OK
; L_BRS_($2C53)_($2C25) OK
; L_BRS_($2C53)_($2C2F) OK
; L_BRS_($2C53)_($2C44) OK
Goto_Next_Laser
    lda     ZP08_Object_Laser_Addr_Lo       ; 2C53: A5 08    
    clc                                     ; 2C55: 18       
    adc     #OBJECT_STRUCTURE_SIZE          ; 2C56: 69 08    
    sta     ZP08_Object_Laser_Addr_Lo       ; 2C58: 85 08    

; Decrement object counter, return when all processed
    dec     ZP02_Num_Lasers_Countdown       ; 2C5A: C6 02    
    bne     Loop_Test_Laser_Hit             ; 2C5C: D0 B2    
    rts                                     ; 2C5E: 60       
; ==========================================

; L_JSR_($2C5F)_($2A5F) OK
; L_JSR_($2C5F)_($2A6D) OK
; L_JSR_($2C5F)_($2ABC) OK
; L_JSR_($2C5F)_($2C6A) OK
Test_Laser_Hits
    inc     ZP_Alien_Spawn_Counter          ; 2C5F: E6 21    
    jsr     Load_Object_Type_X_Y            ; 2C61: 20 D7 35 
    jsr     Test_Laser_Hits_1               ; 2C64: 20 F8 2B 
    lda     ZP02_Num_Lasers_Countdown       ; 2C67: A5 02    
    rts                                     ; 2C69: 60       
; ==========================================





; ############################################################################################
; Yb        dP    db    Yb    dP 888888      dP"Yb
;  Yb  db  dP    dPYb    Yb  dP  88__       dP   Yb
;   YbdPYbdP    dP__Yb    YbdP   88""       Yb   dP
;    YP  YP    dP""""Yb    YP    888888      YbodP

; 888888 88   88 8888P 8888P 88""Yb    db    88     88
; 88__   88   88   dP    dP  88__dP   dPYb   88     88
; 88""   Y8   8P  dP    dP   88""Yb  dP__Yb  88  .o 88  .o
; 88     `YbodP' d8888 d8888 88oodP dP""""Yb 88ood8 88ood8
; ############################################################################################

WAVE_0_FUZZBALL
    jsr     Test_Laser_Hits                 ; 2C6A: 20 5F 2C 
    bmi     Alien_Hit_Score_Update          ; 2C6D: 30 09    

; Alien not hit by laser, test if alien hit platform, if yes explode,
; else test if alien hit Jetman
    jsr     Test_Platform_Collision         ; 2C6F: 20 B3 30 
    lda     ZP02_Collision_Status           ; 2C72: A5 02    
    bpl     Display_Object_Position_Update  ; 2C74: 10 1C    
    bmi     Chg_Obj_To_Explosion_Then_Next  ; 2C76: 30 14    





; Yb        dP    db    Yb    dP 888888      dP""b8  dP"Yb  8b    d8 8b    d8  dP"Yb  88b 88
;  Yb  db  dP    dPYb    Yb  dP  88__       dP   `" dP   Yb 88b  d88 88b  d88 dP   Yb 88Yb88
;   YbdPYbdP    dP__Yb    YbdP   88""       Yb      Yb   dP 88YbdP88 88YbdP88 Yb   dP 88 Y88
;    YP  YP    dP""""Yb    YP    888888      YboodP  YbodP  88 YY 88 88 YY 88  YbodP  88  Y8

; Alien has been hit by laser, use current player wave to create points table offset
; L_JMP_($2C78)_($2A64) OK
; L_JMP_($2C78)_($2A72) OK
; L_JMP_($2C78)_($2AC1) OK
; L_BRS_($2C78)_($2C6D) OK
; L_JMP_($2C78)_($2C9C) OK
Alien_Hit_Score_Update
    lda     ZP_Wave_Active_Player           ; 2C78: A5 59    
    and     #%00000011                      ; 2C7A: 29 03    
    asl     a                               ; 2C7C: 0A       
    tax                                     ; 2C7D: AA       

; Get score high byte and save
    lda     Alien_Points_Lookup_Table,x     ; 2C7E: BD DB 2C 
    sta     ZP02_Score_Byte_Hi              ; 2C81: 85 02    
    inx                                     ; 2C83: E8       

; Get score low byte and save
    lda     Alien_Points_Lookup_Table,x     ; 2C84: BD DB 2C 
    sta     ZP03_Score_Byte_Lo              ; 2C87: 85 03    
    jsr     Update_Score                    ; 2C89: 20 63 30 

; L_BRS_($2C8C)_($2C76) OK
Chg_Obj_To_Explosion_Then_Next
    jsr     Change_Object_To_Explosion      ; 2C8C: 20 F9 28 
    jmp     GOTO_NEXT_OBJECT                ; 2C8F: 4C 1A 26 
; ------------------------------------------

; Test if object has collided with Jetman, if not, update position and display object
; DEBUG Change $2C95 A5 02 to A9 02 for Jetman Invulnerability (LDA Immediate instead of ZP)
; In MAME Debugger, use "fill 2C95,1,A9"
; L_JMP_($2C92)_($2A97) OK
; L_JMP_($2C92)_($2AB9) OK
; L_JMP_($2C92)_($2AF7) OK
; L_BRS_($2C92)_($2C74) OK
Display_Object_Position_Update
    jsr     Test_Jetman_Object_Collide      ; 2C92: 20 58 2D 
    lda     ZP02_Collision_Status           ; 2C95: A5 02    
    bpl     Update_Object_Position          ; 2C97: 10 06    

; Alien has hit Jetman
    jsr     Setup_Jetman_Explosion          ; 2C99: 20 45 2A 
    jmp     Alien_Hit_Score_Update          ; 2C9C: 4C 78 2C 
; ------------------------------------------

; Get object Direction & Position Y and use to calculate new X value
; L_BRS_($2C9F)_($2C97) OK
Update_Object_Position
    ldy     #OBJECT_DIRECTION_X_PARAM       ; 2C9F: A0 02    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2CA1: B1 00    

; Register Y becomes offset to Object Position X parameter
    dey                                     ; 2CA3: 88       
    pha                                     ; 2CA4: 48       
    rol     a                               ; 2CA5: 2A       
    pla                                     ; 2CA6: 68       
    ror     a                               ; 2CA7: 6A       
    clc                                     ; 2CA8: 18       
    adc     (ZP_Obj_List_Ptr_Lo),y          ; 2CA9: 71 00    

; Take care of X screen wrapping (note $f0=-16 decimal)
    cmp     #$F0                            ; 2CAB: C9 F0    
    bcs     Wrap_Object_X_Position_Left     ; 2CAD: B0 1D    

    cmp     #SCREEN_WIDTH_PIXELS            ; 2CAF: C9 B8    
    bcs     Wrap_Object_X_Position_Right    ; 2CB1: B0 1E    

; L_JMP_($2CB3)_($2CCE) OK
; L_JMP_($2CB3)_($2CD3) OK
Update_Object_X_Position
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2CB3: 91 00    

; Get object Direction & Position and use to calculate new Y value
    ldy     #OBJECT_DIRECTION_Y_PARAM       ; 2CB5: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2CB7: B1 00    

; Register Y becomes offset to Object Position Y parameter
    dey                                     ; 2CB9: 88       
    pha                                     ; 2CBA: 48       
    rol     a                               ; 2CBB: 2A       
    pla                                     ; 2CBC: 68       
    ror     a                               ; 2CBD: 6A       
    clc                                     ; 2CBE: 18       
    adc     (ZP_Obj_List_Ptr_Lo),y          ; 2CBF: 71 00    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2CC1: 91 00    

    jsr     Display_Object_Load             ; 2CC3: 20 46 36 
    jsr     Colourize_Object                ; 2CC6: 20 1F 38 
    jmp     GOTO_NEXT_OBJECT                ; 2CC9: 4C 1A 26 
; ------------------------------------------

; L_BRS_($2CCC)_($2CAD) OK
Wrap_Object_X_Position_Left
    adc     #SCREEN_WIDTH_PIXELS            ; 2CCC: 69 B8    
    jmp     Update_Object_X_Position        ; 2CCE: 4C B3 2C 
; ------------------------------------------

; L_BRS_($2CD1)_($2CB1) OK
Wrap_Object_X_Position_Right
    adc     #_100_MINUS_SCREEN_WIDTH_PIXELS ; 2CD1: 69 48    
    jmp     Update_Object_X_Position        ; 2CD3: 4C B3 2C 
; ------------------------------------------





; 88 88b 88 88 888888 88    db    88     88 .dP"Y8 888888
; 88 88Yb88 88   88   88   dPYb   88     88 `Ybo." 88__
; 88 88 Y88 88   88   88  dP__Yb  88  .o 88 o.`Y8b 88""
; 88 88  Y8 88   88   88 dP""""Yb 88ood8 88 8bodP' 888888

;  dP"Yb  88""Yb  88888 888888  dP""b8 888888 .dP"Y8
; dP   Yb 88__dP     88 88__   dP   `"   88   `Ybo."
; Yb   dP 88""Yb o.  88 88""   Yb        88   o.`Y8b
;  YbodP  88oodP "bodP' 888888  YboodP   88   8bodP'

; Wait until start of wave flashing score countdown has reached zero
; L_JSR_($2CD6)_($2652) OK
Init_Alien_Objects_Flash_Cntdn
    lda     ZP_Flash_Score_Countdown        ; 2CD6: A5 5D    
    beq     Test_Jetman_Displayed           ; 2CD8: F0 09    
    rts                                     ; 2CDA: 60       
; ==========================================

Alien_Points_Lookup_Table
    fdb     $0025,$0035,$0045,$0055         ; 2CDB: 25 00 35 00 45 00 55 00 

; Test to see if Jetman is being displayed yet, return if not
; L_BRS_($2CE3)_($2CD8) OK
Test_Jetman_Displayed
    lda     Obj_Jetman_State                ; 2CE3: AD 80 03 
    and     #%00111111                      ; 2CE6: 29 3F    
    cmp     #JETMAN_FLYING                  ; 2CE8: C9 01    
    beq     Init_Alien_Object_Next          ; 2CEA: F0 05    
    cmp     #JETMAN_STANDING                ; 2CEC: C9 02    
    beq     Init_Alien_Object_Next          ; 2CEE: F0 01    
    rts                                     ; 2CF0: 60       
; ==========================================

; Set Object list address pointer to first alien object
; L_BRS_($2CF1)_($2CEA) OK
; L_BRS_($2CF1)_($2CEE) OK
Init_Alien_Object_Next
    lda     #OBJECT_ALIEN_0_LO              ; 2CF1: A9 C8    
    sta     ZP_Obj_List_Ptr_Lo              ; 2CF3: 85 00    
    lda     #OBJECT_ALIEN_0_HI              ; 2CF5: A9 03    
    sta     ZP_Obj_List_Ptr_Hi              ; 2CF7: 85 01    

; Setup next alien objects, to a maximum of 6
; DEBUG Set $2CFA to 1 to spawn only 1 alien
; In MAME Debugger, use "fill 2CFA,1,1"
    lda     #NUM_ALIENS_MAX                 ; 2CF9: A9 06    
    sta     ZP02_Num_Aliens_Countdown       ; 2CFB: 85 02    
    ldy     #OBJECT_TYPE_PARAM              ; 2CFD: A0 00    

; Test if alien object is currently used, if not initiate it
; L_BRS_($2CFF)_($2D0C) OK
Loop_Next_Object
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2CFF: B1 00    
    beq     Init_Alien_Object               ; 2D01: F0 0C    

; Alien object is used, so move object address pointer to next object
    lda     ZP_Obj_List_Ptr_Lo              ; 2D03: A5 00    
    clc                                     ; 2D05: 18       
    adc     #OBJECT_STRUCTURE_SIZE          ; 2D06: 69 08    
    sta     ZP_Obj_List_Ptr_Lo              ; 2D08: 85 00    

; Decrement alien countdown, return when it reaches zero
    dec     ZP02_Num_Aliens_Countdown       ; 2D0A: C6 02    
    bne     Loop_Next_Object                ; 2D0C: D0 F1    
    rts                                     ; 2D0E: 60       
; ==========================================

; Initiate new alien object
; Incoming Register Y always 0
; Set alien object type depending on current wave i.e. 0, 1, 2 or 3
; L_BRS_($2D0F)_($2D01) OK
Init_Alien_Object
    lda     ZP_Wave_Active_Player           ; 2D0F: A5 59    
    and     #%00000011                      ; 2D11: 29 03    
    tax                                     ; 2D13: AA       
    lda     Wave_Alien_Type_Lookup,x        ; 2D14: BD 4C 2D 
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2D17: 91 00    

; Set initial object Position X to 1
    tya                                     ; 2D19: 98       
    iny                                     ; 2D1A: C8       
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2D1B: 91 00    

; Register Y becomes Direction X, initiate randomly using IRQ counter
    iny                                     ; 2D1D: C8       
    lda     ZP_IRQ_Random                   ; 2D1E: A5 4C    
    tax                                     ; 2D20: AA       
    and     #%00010000                      ; 2D21: 29 10    
    sec                                     ; 2D23: 38       
    sbc     #%00001000                      ; 2D24: E9 08    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2D26: 91 00    

; Register Y becomes Position Y, initiate randomly using IRQ counter already in X
    iny                                     ; 2D28: C8       
    txa                                     ; 2D29: 8A       
    and     #%01111111                      ; 2D2A: 29 7F    
    adc     #%00101000                      ; 2D2C: 69 28    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2D2E: 91 00    

; Register Y becomes Direction Y, set diagonal movement or not randomly
    iny                                     ; 2D30: C8       
    and     #%00000010                      ; 2D31: 29 02    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2D33: 91 00    

; Register Y becomes object Colour, store 0 or 1 in ZP02
    iny                                     ; 2D35: C8       
    txa                                     ; 2D36: 8A       
    and     #%00000001                      ; 2D37: 29 01    
    sta     ZP02_Colour_Random_0_or_1       ; 2D39: 85 02    

; Set object colour randomly, lookup table has 2 colours per wave
    lda     ZP_Wave_Active_Player           ; 2D3B: A5 59    
    asl     a                               ; 2D3D: 0A       
    and     #%00000110                      ; 2D3E: 29 06    
    clc                                     ; 2D40: 18       
    adc     ZP02_Colour_Random_0_or_1       ; 2D41: 65 02    
    tax                                     ; 2D43: AA       
    lda     Wave_Alien_Colour_Lookup,x      ; 2D44: BD 50 2D 
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2D47: 91 00    

    jmp     Display_Object_Old_Setup_Load   ; 2D49: 4C 01 36 
; ------------------------------------------

Wave_Alien_Type_Lookup
    fcb     WAVE_0_FUZZBALL_                ; 2D4C: 05       
    fcb     WAVE_3_SAUCER_                  ; 2D4D: 08       
    fcb     WAVE_2_SPHERE_                  ; 2D4E: 07       
    fcb     WAVE_1_CROSS_                   ; 2D4F: 06       

Wave_Alien_Colour_Lookup
    fcb     COLOUR_RED,COLOUR_BLUE          ; 2D50: 02 06    
    fcb     COLOUR_CYAN,COLOUR_YELLOW       ; 2D52: 03 07    
    fcb     COLOUR_BLUE,COLOUR_YELLOW       ; 2D54: 06 07    
    fcb     COLOUR_RED,COLOUR_PURPLE        ; 2D56: 02 04    





; 888888 888888 .dP"Y8 888888      88888 888888 888888 8b    d8    db    88b 88
;   88   88__   `Ybo."   88           88 88__     88   88b  d88   dPYb   88Yb88
;   88   88""   o.`Y8b   88       o.  88 88""     88   88YbdP88  dP__Yb  88 Y88
;   88   888888 8bodP'   88       "bodP' 888888   88   88 YY 88 dP""""Yb 88  Y8

;  dP"Yb  88""Yb  88888 888888  dP""b8 888888
; dP   Yb 88__dP     88 88__   dP   `"   88
; Yb   dP 88""Yb o.  88 88""   Yb        88
;  YbodP  88oodP "bodP' 888888  YboodP   88

;  dP""b8  dP"Yb  88     88     88 8888b.  888888
; dP   `" dP   Yb 88     88     88  8I  Yb 88__
; Yb      Yb   dP 88  .o 88  .o 88  8I  dY 88""
;  YboodP  YbodP  88ood8 88ood8 88 8888Y"  888888

; L_JSR_($2D58)_($2854) OK
; L_JSR_($2D58)_($2C92) OK
; L_JSR_($2D58)_($2E77) OK
; L_JSR_($2D58)_($2FA4) OK
Test_Jetman_Object_Collide
    lda     ZP_Flash_Score_Countdown        ; 2D58: A5 5D    
    bne     Set_No_Collision_And_Return     ; 2D5A: D0 0D    

; Test to see if Jetman is being displayed yet, set No_Collision and return if not
    lda     Obj_Jetman_State                ; 2D5C: AD 80 03 
    and     #%00111111                      ; 2D5F: 29 3F    
    cmp     #JETMAN_FLYING                  ; 2D61: C9 01    
    beq     Compare_Obj_Jetman_Position_X   ; 2D63: F0 09    
    cmp     #JETMAN_STANDING                ; 2D65: C9 02    
    beq     Compare_Obj_Jetman_Position_X   ; 2D67: F0 05     Yes, branch

; L_BRS_($2D69)_($2D5A) OK
Set_No_Collision_And_Return
    lda     #NO_COLLISION                   ; 2D69: A9 00    
    sta     ZP02_Collision_Status           ; 2D6B: 85 02    
    rts                                     ; 2D6D: 60       
; ==========================================

; Start with default No Collision
; L_BRS_($2D6E)_($2D63) OK
; L_BRS_($2D6E)_($2D67) OK
Compare_Obj_Jetman_Position_X
    ldy     #NO_COLLISION                   ; 2D6E: A0 00    
    sty     ZP02_Collision_Status           ; 2D70: 84 02    

; Register Y becomes offset to objects Position X, compare to Jetman's Position X and
; branch if object is to the left of Jetman
    iny                                     ; 2D72: C8       
    lda     Obj_Jetman_Position_X           ; 2D73: AD 81 03 
    sec                                     ; 2D76: 38       
    sbc     (ZP_Obj_List_Ptr_Lo),y          ; 2D77: F1 00    
    bpl     Test_Collision_Position_X       ; 2D79: 10 05    

; Perform an Absolute on the result of the Position X comparison
    clc                                     ; 2D7B: 18       
    eor     #$FF                            ; 2D7C: 49 FF    
    adc     #$01                            ; 2D7E: 69 01    

; L_BRS_($2D80)_($2D79) OK
Test_Collision_Position_X
    cmp     #COLLISION_HITBOX_X             ; 2D80: C9 0C    
    bcs     No_Collision_Return             ; 2D82: B0 17    

; Compare_Obj_Jetman_Position_Y
; Register Y becomes offset to objects Position Y, compare to Jetman's Position Y and
; branch if object is above Jetman
    iny                                     ; 2D84: C8       
    iny                                     ; 2D85: C8       
    lda     Obj_Jetman_Position_Y           ; 2D86: AD 83 03 
    sec                                     ; 2D89: 38       
    sbc     (ZP_Obj_List_Ptr_Lo),y          ; 2D8A: F1 00    
    bpl     Test_Collision_Position_Y       ; 2D8C: 10 0E    

; Perform an Absolute on the result of the Position Y comparison
    clc                                     ; 2D8E: 18       
    eor     #$FF                            ; 2D8F: 49 FF    
    adc     #$01                            ; 2D91: 69 01    

; Test_Collision_Position_Y, note different collision range for above ($12) and below ($0C)
    cmp     #HITBOX_Y_BELOW                 ; 2D93: C9 0C    

; L_JMP_($2D95)_($2D9E) OK
Set_Compare_Result_And_Return
    bcs     No_Collision_Return             ; 2D95: B0 04    

    lda     #COLLISION                      ; 2D97: A9 80    
    sta     ZP02_Collision_Status           ; 2D99: 85 02    

; L_BRS_($2D9B)_($2D82) OK
; L_BRS_($2D9B)_($2D95) OK
No_Collision_Return
    rts                                     ; 2D9B: 60       
; ==========================================

; Test_Collision_Position_Y, note different collision range for above ($12) and below ($0C)
; L_BRS_($2D9C)_($2D8C) OK
Test_Collision_Position_Y
    cmp     #HITBOX_Y_ABOVE                 ; 2D9C: C9 12    
    jmp     Set_Compare_Result_And_Return   ; 2D9E: 4C 95 2D 
; ------------------------------------------





; 88""Yb 888888 .dP"Y8 888888  dP"Yb  88""Yb 888888
; 88__dP 88__   `Ybo."   88   dP   Yb 88__dP 88__
; 88"Yb  88""   o.`Y8b   88   Yb   dP 88"Yb  88""
; 88  Yb 888888 8bodP'   88    YbodP  88  Yb 888888

; 88""Yb 88        db    Yb  dP 888888 88""Yb
; 88__dP 88       dPYb    YbdP  88__   88__dP
; 88"""  88  .o  dP__Yb    8P   88""   88"Yb
; 88     88ood8 dP""""Yb  dP    888888 88  Yb

;  dP"Yb  88""Yb  88888 888888  dP""b8 888888 .dP"Y8
; dP   Yb 88__dP     88 88__   dP   `"   88   `Ybo."
; Yb   dP 88""Yb o.  88 88""   Yb        88   o.`Y8b
;  YbodP  88oodP "bodP' 888888  YboodP   88   8bodP'

; Test if Ship Top or Fuel object is inactive, if yes, skip initialization
; L_JSR_($2DA1)_($22DD) OK
Restore_Player_Objects
    lda     Obj_Ship_Top_Or_Fuel_Type       ; 2DA1: AD B8 03 
    beq     Restore_Player_Objects_1        ; 2DA4: F0 03    

    jsr     Init_Obj_Ship_Top_Or_Fuel_Typ   ; 2DA6: 20 E3 22 

; Test if Ship Middle or Valuable object is inactive, if yes, skip valuable test
; L_BRS_($2DA9)_($2DA4) OK
Restore_Player_Objects_1
    lda     Obj_Ship_Mid_Or_Valuable_Typ    ; 2DA9: AD C0 03 
    beq     Set_Obj_List_Ptr_To_Ship        ; 2DAC: F0 07    

; Object is active, test if object is a Valuable, if yes, restore it
    cmp     #OBJECT_TYPE_VALUABLE           ; 2DAE: C9 0E    
    beq     Load_Params_Ship_Or_Valuable    ; 2DB0: F0 13    

; Object is not a valuable, initialise it
    jsr     Init_Obj_Ship_Mid_Or_Valu_Typ   ; 2DB2: 20 F2 22 

; L_BRS_($2DB5)_($2DAC) OK
; L_JMP_($2DB5)_($2DC8) OK
Set_Obj_List_Ptr_To_Ship
    jsr     Save_Obj_List_Ptr               ; 2DB5: 20 E7 28 
    jsr     Load_ZP_Parameters              ; 2DB8: 20 9D 25 
    fcb     $00                             ; 2DBB: 00        ZP00/01
    fdb     Obj_Ship_Base                   ; 2DBC: B0 03     Object Address
    fcb     $FF                             ; 2DBE: FF       

    jsr     Set_Load_Obj_Type_X_Y_Colour    ; 2DBF: 20 CB 2D 
    jmp     Restore_Obj_List_Ptr            ; 2DC2: 4C F0 28 
; ------------------------------------------

; L_BRS_($2DC5)_($2DB0) OK
Load_Params_Ship_Or_Valuable
    jsr     Load_ZP_Params_Ship_Or_Val      ; 2DC5: 20 C7 2B 
    jmp     Set_Obj_List_Ptr_To_Ship        ; 2DC8: 4C B5 2D 
; ------------------------------------------

; L_JSR_($2DCB)_($22D1) OK
; L_JSR_($2DCB)_($2DBF) OK
Set_Load_Obj_Type_X_Y_Colour
    jsr     Set_Object_UDG_Colour           ; 2DCB: 20 DD 2D 
    jsr     Load_Object_Type_X_Y_Colour     ; 2DCE: 20 E9 35 

; L_BRS_($2DD1)_($2DDA) OK
Loop_Restore_Player_Objects
    jsr     Restore_Player_Ship             ; 2DD1: 20 E8 2D 
    jsr     Display_Object_Old_Setup        ; 2DD4: 20 04 36 
    jsr     Decrement_Ship_Position_Y_Etc   ; 2DD7: 20 FF 2D 
    bne     Loop_Restore_Player_Objects     ; 2DDA: D0 F5    
    rts                                     ; 2DDC: 60       
; ==========================================

; L_JSR_($2DDD)_($2DCB) OK
; L_JSR_($2DDD)_($2EB2) OK
Set_Object_UDG_Colour
    ldy     #$04                            ; 2DDD: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2DDF: B1 00    
    sta     ZP_Ship_Parts_Counter           ; 2DE1: 85 1F    

    lda     #$00                            ; 2DE3: A9 00    
    sta     ZP_Ship_UDG_Addr_Offset         ; 2DE5: 85 1E    
    rts                                     ; 2DE7: 60       
; ==========================================

; Active player's current wave modulus 4 to get ship graphics
; L_JSR_($2DE8)_($2DD1) OK
; L_JSR_($2DE8)_($2EB5) OK
Restore_Player_Ship
    lda     ZP_Wave_Active_Player           ; 2DE8: A5 59    
    lsr     a                               ; 2DEA: 4A       
    lsr     a                               ; 2DEB: 4A       
    and     #%00000011                      ; 2DEC: 29 03    
    ora     ZP_Ship_UDG_Addr_Offset         ; 2DEE: 05 1E    
    asl     a                               ; 2DF0: 0A       

    pha                                     ; 2DF1: 48       
    jsr     Load_Obj_UDG_Data_Addr_S_F_V    ; 2DF2: 20 E5 2F 
    jsr     Load_Obj_Old_UDG_RAM_Addr_Size  ; 2DF5: 20 3D 37 
    pla                                     ; 2DF8: 68       

    jsr     Load_Obj_UDG_Data_Addr_S_F_V    ; 2DF9: 20 E5 2F 
    jmp     Load_Obj_New_UDG_RAM_Addr_Size  ; 2DFC: 4C 8D 37 
; ------------------------------------------

; L_JSR_($2DFF)_($2DD7) OK
; L_JSR_($2DFF)_($2EBB) OK
Decrement_Ship_Position_Y_Etc
    lda     ZP19_Object_New_Position_Y      ; 2DFF: A5 19    
    sec                                     ; 2E01: 38       
    sbc     #$10                            ; 2E02: E9 10    
    sta     ZP19_Object_New_Position_Y      ; 2E04: 85 19    

    lda     ZP11_Object_Old_Position_Y      ; 2E06: A5 11    
    sec                                     ; 2E08: 38       
    sbc     #$10                            ; 2E09: E9 10    
    sta     ZP11_Object_Old_Position_Y      ; 2E0B: 85 11    

    lda     ZP_Ship_UDG_Addr_Offset         ; 2E0D: A5 1E    
    clc                                     ; 2E0F: 18       
    adc     #$04                            ; 2E10: 69 04    
    sta     ZP_Ship_UDG_Addr_Offset         ; 2E12: 85 1E    

    dec     ZP_Ship_Parts_Counter           ; 2E14: C6 1F    
    rts                                     ; 2E16: 60       
; ==========================================





; ############################################################################################
; .dP"Y8 88  88 88 88""Yb        db    .dP"Y8  dP""b8 888888 88b 88 8888b.
; `Ybo." 88  88 88 88__dP       dPYb   `Ybo." dP   `" 88__   88Yb88  8I  Yb
; o.`Y8b 888888 88 88"""       dP__Yb  o.`Y8b Yb      88""   88 Y88  8I  dY
; 8bodP' 88  88 88 88         dP""""Yb 8bodP'  YboodP 888888 88  Y8 8888Y"
; ############################################################################################

; Aliens keep moving also
SHIP_ASCEND
    jsr     Load_Object_Type_X_Y            ; 2E17: 20 D7 35 

; Test if Ship hit top of screen yet, if yes branch
    ldy     #SHIP_BASE_POSITION_Y_PARAM     ; 2E1A: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2E1C: B1 00    
    cmp     #SHIP_BASE_AT_SCREEN_TOP        ; 2E1E: C9 30    
    bcc     Ship_At_Top                     ; 2E20: 90 12    

; Calculate and store new height i.e one pixel up screen
    sec                                     ; 2E22: 38       
    sbc     #$01                            ; 2E23: E9 01    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2E25: 91 00    

; Trigger ship flight sound
    lda     #$04                            ; 2E27: A9 04    
    sta     Obj_Sound_Noise                 ; 2E29: 8D AB 03 
    lda     #$02                            ; 2E2C: A9 02    
    sta     Obj_Sound_Noise_Timer           ; 2E2E: 8D AC 03 

    jmp     Display_Ship                    ; 2E31: 4C AC 2E 
; ------------------------------------------

; L_BRS_($2E34)_($2E20) OK
Ship_At_Top
    inc     ZP_Wave_Active_Player           ; 2E34: E6 59    
    jsr     Reset_Objects_And_Aliens        ; 2E36: 20 C9 28 

; Transition ship object type from ascend to descend
    ldy     #OBJECT_TYPE_PARAM              ; 2E39: A0 00    
    lda     #OBJECT_SHIP_DESCEND            ; 2E3B: A9 0B    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2E3D: 91 00    

; Zero the ship's fuel level
    tya                                     ; 2E3F: 98       
    ldy     #OBJECT_SHIP_FUEL_LEVEL         ; 2E40: A0 02    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2E42: 91 00    

; Turn off the flame animation
    jsr     Reset_Level_Add_Extra_Life      ; 2E44: 20 BA 22 
    lda     #$00                            ; 2E47: A9 00    
    sta     ZP_Ship_Flame_State             ; 2E49: 85 26    

    jmp     GOTO_NEXT_OBJECT                ; 2E4B: 4C 1A 26 
; ------------------------------------------





; ############################################################################################
; .dP"Y8 88  88 88 88""Yb     8888b.  888888 .dP"Y8  dP""b8 888888 88b 88 8888b.
; `Ybo." 88  88 88 88__dP      8I  Yb 88__   `Ybo." dP   `" 88__   88Yb88  8I  Yb
; o.`Y8b 888888 88 88"""       8I  dY 88""   o.`Y8b Yb      88""   88 Y88  8I  dY
; 8bodP' 88  88 88 88         8888Y"  888888 8bodP'  YboodP 888888 88  Y8 8888Y"
; ############################################################################################

SHIP_DESCEND
    jsr     Load_Object_Type_X_Y            ; 2E4E: 20 D7 35 

; Trigger ship flight sound
    lda     #$04                            ; 2E51: A9 04    
    sta     Obj_Sound_Noise                 ; 2E53: 8D AB 03 
    lda     #$02                            ; 2E56: A9 02    
    sta     Obj_Sound_Noise_Timer           ; 2E58: 8D AC 03 

; Move object Y position down 1 pixel, stopping at bottom i.e. $AF
    ldy     #SHIP_BASE_POSITION_Y_PARAM     ; 2E5B: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2E5D: B1 00    
    clc                                     ; 2E5F: 18       
    adc     #$01                            ; 2E60: 69 01    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2E62: 91 00    

; Test if ship has landed
    cmp     #SHIP_BASE_POSITION_Y           ; 2E64: C9 AF    
    bcc     Display_Ship                    ; 2E66: 90 44    

; Set current object type to regular ship base part
    ldy     #OBJECT_TYPE_PARAM              ; 2E68: A0 00    
    lda     #OBJECT_SHIP_LANDED             ; 2E6A: A9 09    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2E6C: 91 00    
    jsr     Init_Next_Jetman_Lives_Scores   ; 2E6E: 20 5B 23 

    jmp     Display_Ship                    ; 2E71: 4C AC 2E 
; ------------------------------------------





; ############################################################################################
; .dP"Y8 88  88 88 88""Yb      88""Yb  dP"Yb  888888 888888  dP"Yb  8b    d8
; `Ybo." 88  88 88 88__dP      88__dP dP   Yb   88     88   dP   Yb 88b  d88
; o.`Y8b 888888 88 88"""       88""Yb Yb   dP   88     88   Yb   dP 88YbdP88
; 8bodP' 88  88 88 88          88oodP  YbodP    88     88    YbodP  88 YY 88

; 8b    d8  dP"Yb  8888b.  88   88 88     888888
; 88b  d88 dP   Yb  8I  Yb 88   88 88     88__
; 88YbdP88 Yb   dP  8I  dY Y8   8P 88  .o 88""
; 88 YY 88  YbodP  8888Y"  `YbodP' 88ood8 888888
; ############################################################################################

; Test if Jetman collided with ship
SHIP_BASE_MODULE
    jsr     Load_Object_Type_X_Y            ; 2E74: 20 D7 35 
    jsr     Test_Jetman_Object_Collide      ; 2E77: 20 58 2D 
    lda     ZP02_Collision_Status           ; 2E7A: A5 02    
    bpl     Display_Ship                    ; 2E7C: 10 2E    

; Jetman collided with ship, test if fully fulled up
    ldy     #OBJECT_SHIP_FUEL_LEVEL         ; 2E7E: A0 02    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2E80: B1 00    
    cmp     #FUELLED_UP                     ; 2E82: C9 06    
    bcc     Display_Ship                    ; 2E84: 90 26    

; Ship fuelled up, set Ship object type to Ascend
    lda     #SHIP_ASCENDING                 ; 2E86: A9 0A    
    ldy     #OBJECT_TYPE_PARAM              ; 2E88: A0 00    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2E8A: 91 00    
    jsr     Save_Obj_List_Ptr               ; 2E8C: 20 E7 28 

; Load current objects list painter to the Jetman object
    jsr     Load_ZP_Parameters              ; 2E8F: 20 9D 25 
    fcb     $00                             ; 2E92: 00       
    fdb     Obj_Jetman_State                ; 2E93: 80 03    
    fcb     $FF                             ; 2E95: FF       

; Load Jetman object parameters and display on screen
    jsr     Load_Object_Type_X_Y_Colour     ; 2E96: 20 E9 35 
    jsr     Display_Object_Old_Setup_Load   ; 2E99: 20 01 36 

; Set Jetman not standing and not flying i.e. not visible
    lda     #$00                            ; 2E9C: A9 00    
    sta     Obj_Jetman_State                ; 2E9E: 8D 80 03 

; Increment number of lives, gets decremented again on next level start
    jsr     Restore_Obj_List_Ptr            ; 2EA1: 20 F0 28 
    inc     ZP_Num_Lives_Active_Player      ; 2EA4: E6 5A    
    jsr     Display_Player_1_Lives          ; 2EA6: 20 73 23 

    jmp     GOTO_NEXT_OBJECT                ; 2EA9: 4C 1A 26 
; ------------------------------------------





; 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP     .dP"Y8 88  88 88 88""Yb
;  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP      `Ybo." 88  88 88 88__dP
;  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P       o.`Y8b 888888 88 88"""
; 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP        8bodP' 88  88 88 88

; L_JMP_($2EAC)_($2E31) OK
; L_BRS_($2EAC)_($2E66) OK
; L_JMP_($2EAC)_($2E71) OK
; L_BRS_($2EAC)_($2E7C) OK
; L_BRS_($2EAC)_($2E84) OK
Display_Ship
    jsr     Load_Object_Type_X_Y_Colour     ; 2EAC: 20 E9 35 
    jsr     Display_Ship_Flame              ; 2EAF: 20 AA 27 
    jsr     Set_Object_UDG_Colour           ; 2EB2: 20 DD 2D 

; L_BRS_($2EB5)_($2EBE) OK
Loop_Display_Ship_Parts
    jsr     Restore_Player_Ship             ; 2EB5: 20 E8 2D 
    jsr     Display_Object                  ; 2EB8: 20 4C 36 
    jsr     Decrement_Ship_Position_Y_Etc   ; 2EBB: 20 FF 2D 
    bne     Loop_Display_Ship_Parts         ; 2EBE: D0 F5    

; Bit 4 of counter used to flash ship between white or purple colour
; The 2xLSR changes Register A to be %0100, which is also the purple colour code
    lda     ZP_IRQ_Counter_Lo               ; 2EC0: A5 4A    
    lsr     a                               ; 2EC2: 4A       
    lsr     a                               ; 2EC3: 4A       
    and     #%00000100                      ; 2EC4: 29 04    
    bne     Store_Ship_Colour               ; 2EC6: D0 02    

; Counter not %0100, so set to white instead of purple
    lda     #COLOUR_WHITE                   ; 2EC8: A9 01    

; L_BRS_($2ECA)_($2EC6) OK
Store_Ship_Colour
    sta     ZP1B_Object_Colour              ; 2ECA: 85 1B    

; Load ship parts count, can be either 1/2/3 depending on base/Base+Mid/Base+Mid+Top built
    ldy     #OBJ_SHIP_PARTS_COUNTER_PARAM   ; 2ECC: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2ECE: B1 00    
    sta     ZP02_Ship_Parts_Count           ; 2ED0: 85 02    

; If ship not yet built, colourize what's built with white
    cmp     #$03                            ; 2ED2: C9 03    
    bcc     Colourize_Ship_White            ; 2ED4: 90 27    

; Ship is fully built i.e. Base+Mid+Top
; Fuel Level ranges from 0 to 6, divide by 2 and store
    ldy     #OBJECT_SHIP_FUEL_LEVEL         ; 2ED6: A0 02    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2ED8: B1 00    
    lsr     a                               ; 2EDA: 4A       
    sta     ZP13_Ship_Fuel_Level_Half       ; 2EDB: 85 13    

; If no fuel to display yet, colourize it all with white
    beq     Colourize_Ship_White            ; 2EDD: F0 1E    

; Fuel to display is 6/2=3, i.e. fully fuelled, flash ship in with current colour purple/white
    cmp     #$03                            ; 2EDF: C9 03    
    bcs     Colourize_Ship_NEXT             ; 2EE1: B0 1E    

; Fuel to display is less than 6/2=3, store fuel level/2
; Base or base+mid to be coloured purple
    sta     ZP02_Ship_Parts_Count           ; 2EE3: 85 02    

    lda     #COLOUR_PURPLE                  ; 2EE5: A9 04    
    sta     ZP1B_Object_Colour              ; 2EE7: 85 1B    

    jsr     Colourize_Ship_Setup_RAM_Ptr    ; 2EE9: 20 07 2F 

; Calculate number of ship parts remaining to be coloured white i.e. not base or base+mid
; by subtracting from 3 and store number of rows to colour to Ship_Parts_Count
    lda     #$03                            ; 2EEC: A9 03    
    sec                                     ; 2EEE: 38       
    sbc     ZP13_Ship_Fuel_Level_Half       ; 2EEF: E5 13    
    sta     ZP02_Ship_Parts_Count           ; 2EF1: 85 02    

    lda     #COLOUR_WHITE                   ; 2EF3: A9 01    
    sta     ZP1B_Object_Colour              ; 2EF5: 85 1B    

    jsr     Colourize_Ship                  ; 2EF7: 20 16 2F 
    jmp     GOTO_NEXT_OBJECT                ; 2EFA: 4C 1A 26 
; ------------------------------------------

; L_BRS_($2EFD)_($2ED4) OK
; L_BRS_($2EFD)_($2EDD) OK
Colourize_Ship_White
    lda     #COLOUR_WHITE                   ; 2EFD: A9 01    
    sta     ZP1B_Object_Colour              ; 2EFF: 85 1B    

; L_BRS_($2F01)_($2EE1) OK
Colourize_Ship_NEXT
    jsr     Colourize_Ship_Setup_RAM_Ptr    ; 2F01: 20 07 2F 
    jmp     GOTO_NEXT_OBJECT                ; 2F04: 4C 1A 26 
; ------------------------------------------

; Setup the Colour RAM address where the ship is and then colourize it
; L_JSR_($2F07)_($2EE9) OK
; L_JSR_($2F07)_($2F01) OK
Colourize_Ship_Setup_RAM_Ptr
    ldy     #OBJECT_SHIP_POSITION_X_PARAM   ; 2F07: A0 01    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2F09: B1 00    
    sta     ZP04_Colour_Tile_Position_X     ; 2F0B: 85 04    

    ldy     #OBJECT_SHIP_POSITION_Y_PARAM   ; 2F0D: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2F0F: B1 00    
    sta     ZP05_Colour_Tile_Position_Y     ; 2F11: 85 05    

    jsr     Setup_Colour_RAM_Address        ; 2F13: 20 F7 34 

; L_JSR_($2F16)_($2EF7) OK
; L_BRS_($2F16)_($2F2E) OK
Colourize_Ship
    ldy     #COLUMN_INDEX                   ; 2F16: A0 00    

; ZP02 contains number of rows to paint
; ZP1B contains colour to paint with, $01 = white
    lda     ZP1B_Object_Colour              ; 2F18: A5 1B    
    sta     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 2F1A: 91 0C    

; Move to next horizontal colour tile
    iny                                     ; 2F1C: C8       
    sta     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 2F1D: 91 0C    

; Move up one row of colour tiles, 16-bit address lo-byte
    lda     ZP0C_Colour_RAM_Tile_Addr_Lo    ; 2F1F: A5 0C    
    sec                                     ; 2F21: 38       
    sbc     #SCREEN_WIDTH_COLUMNS           ; 2F22: E9 17    
    sta     ZP0C_Colour_RAM_Tile_Addr_Lo    ; 2F24: 85 0C    

; 16-bit address hi-byte
    lda     ZP0D_Colour_RAM_Tile_Addr_Lo    ; 2F26: A5 0D    
    sbc     #$00                            ; 2F28: E9 00    
    sta     ZP0D_Colour_RAM_Tile_Addr_Lo    ; 2F2A: 85 0D    

    dec     ZP02_Ship_Parts_Count           ; 2F2C: C6 02    
    bne     Colourize_Ship                  ; 2F2E: D0 E6    

    rts                                     ; 2F30: 60       
; ==========================================





; ############################################################################################
; .dP"Y8 88  88 88 88""Yb      88""Yb    db    88""Yb 888888
; `Ybo." 88  88 88 88__dP      88__dP   dPYb   88__dP   88
; o.`Y8b 888888 88 88"""       88"""   dP__Yb  88"Yb    88
; 8bodP' 88  88 88 88          88     dP""""Yb 88  Yb   88

;  dP"Yb  88""Yb     888888 88   88 888888 88
; dP   Yb 88__dP     88__   88   88 88__   88
; Yb   dP 88"Yb      88""   Y8   8P 88""   88  .o
;  YbodP  88  Yb     88     `YbodP' 888888 88ood8
; ############################################################################################

; Test if ship part has landed, OFFSET $08=Middle, $10=Top, $18=Fuel
; L_BRS_($2F31)_($2F98) OK
Ship_Part_Or_Fuel_Dropped
    ldy     #OBJECT_UDG_DATA_OFFSET         ; 2F31: A0 06    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2F33: B1 00    
    cmp     #$18                            ; 2F35: C9 18    
    beq     Fuel_Dropped                    ; 2F37: F0 3E    

; Ship part dropped, add current Y position to landed Y position
; and test to see if object has hit the ground
    asl     a                               ; 2F39: 0A       
    ldy     #OBJECT_POSITION_Y_PARAM        ; 2F3A: A0 03    
    clc                                     ; 2F3C: 18       
    adc     (ZP_Obj_List_Ptr_Lo),y          ; 2F3D: 71 00    
    cmp     #SCREEN_BOTTOM                  ; 2F3F: C9 AF    
    bcc     Ship_Part_Or_Fuel_Move_Down     ; 2F41: 90 6F    

; Ship part landed, activate next object i.e. set
; status = not dropping and not picked-up by Jetman
; Note, using direct addressing, not using Y offset
    lda     Obj_Ship_Top_Or_Fuel_Status     ; 2F43: AD BC 03 
    ora     #%00000001                      ; 2F46: 09 01    
    sta     Obj_Ship_Top_Or_Fuel_Status     ; 2F48: 8D BC 03 
    jsr     Disp_Obj_Ship_Or_Fuel_Setup_2   ; 2F4B: 20 54 30 

; Calculate Position Y offset when object lands based on how many ship pieces have
; previously landed ($10 when ship middle landed, $20 for top section landed)
    lda     Obj_Ship_Base_Parts_Counter     ; 2F4E: AD B4 03 
    asl     a                               ; 2F51: 0A       
    asl     a                               ; 2F52: 0A       
    asl     a                               ; 2F53: 0A       
    asl     a                               ; 2F54: 0A       
    sta     ZP13_Obj_Landed_Posn_Y_Offset   ; 2F55: 85 13    

; Calculate object landed Position Y and store
    lda     Obj_Ship_Base_Position_Y        ; 2F57: AD B3 03 
    sec                                     ; 2F5A: 38       
    sbc     ZP13_Obj_Landed_Posn_Y_Offset   ; 2F5B: E5 13    
    sta     ZP19_Object_Landed_Position_Y   ; 2F5D: 85 19    

    jsr     Disp_Obj_Ship_Or_Fuel_Setup_1   ; 2F5F: 20 57 30 
    inc     Obj_Ship_Base_Parts_Counter     ; 2F62: EE B4 03 

; Turn Ship Middle Section object off in object list
; L_JMP_($2F65)_($2871) OK
; L_JMP_($2F65)_($2F8B) OK
Disable_Object_In_List
    lda     #$00                            ; 2F65: A9 00    
    tay                                     ; 2F67: A8       
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2F68: 91 00    

; Trigger sound for valuable pickup and ship part/fuel cell
; landing on ship base
    lda     #$02                            ; 2F6A: A9 02    
    sta     Obj_Sound_Collision             ; 2F6C: 8D A9 03 
    lda     #$10                            ; 2F6F: A9 10    
    sta     Obj_Sound_Collision_Timer       ; 2F71: 8D AA 03 

    jmp     GOTO_NEXT_OBJECT                ; 2F74: 4C 1A 26 
; ------------------------------------------

; L_BRS_($2F77)_($2F37) OK
Fuel_Dropped
    ldy     #OBJECT_POSITION_Y_PARAM        ; 2F77: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2F79: B1 00    
    cmp     #FUEL_POSITION_Y_WHEN_LANDED    ; 2F7B: C9 A8    
    bcc     Ship_Part_Or_Fuel_Move_Down     ; 2F7D: 90 33    

; Fuel cell has landed, increment the counter
    inc     Obj_Ship_Base_Fuel_Level        ; 2F7F: EE B2 03 
    jsr     Load_Object_Type_X_Y_Colour     ; 2F82: 20 E9 35 
    jsr     Load_Obj_UDG_Data_Addr_Ship_Wv  ; 2F85: 20 DA 2F 
    jsr     Display_Object_Ship_Or_Fuel     ; 2F88: 20 5A 30 
    jmp     Disable_Object_In_List          ; 2F8B: 4C 65 2F 
; ------------------------------------------

SHIP_PART_OR_FUEL
    jsr     Load_Object_Type_X_Y            ; 2F8E: 20 D7 35 

; Test status of the ship part or fuel cell object
; 001=Ready to Pickup, 011=Picked-up, 111=Dropped/Landed
    ldy     #OBJECT_PICKUP_DROPPED_STATE    ; 2F91: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2F93: B1 00    
    bit     MASK_00000100                   ; 2F95: 2C 16 20 
    bne     Ship_Part_Or_Fuel_Dropped       ; 2F98: D0 97    

    bit     MASK_00000010                   ; 2F9A: 2C 15 20 
    bne     Copy_Jetman_XY_To_Object        ; 2F9D: D0 7F    

    bit     MASK_00000001                   ; 2F9F: 2C 14 20 
    beq     Setup_Object_Addr_Ship_Fuel     ; 2FA2: F0 19    

; Test if Jetman has collided with a ship part or fuel cell, branch if yes
    jsr     Test_Jetman_Object_Collide      ; 2FA4: 20 58 2D 
    lda     ZP02_Collision_Status           ; 2FA7: A5 02    
    bmi     Jetman_Collide_Ship_Fuel        ; 2FA9: 30 43    

; No Jetman collision, test if ship part or fuel cell has landed on a platform, branch if yes
; Ship top part only falls when middle part deposited
    jsr     Test_Platform_Collision         ; 2FAB: 20 B3 30 
    lda     ZP02_Collision_Status           ; 2FAE: A5 02    
    bmi     Setup_Object_Addr_Ship_Fuel     ; 2FB0: 30 0B    

; Move object down by 2 pixels, make Position Y an odd number
; L_BRS_($2FB2)_($2F41) OK
; L_BRS_($2FB2)_($2F7D) OK
Ship_Part_Or_Fuel_Move_Down
    ldy     #OBJECT_POSITION_Y_PARAM        ; 2FB2: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2FB4: B1 00    
    clc                                     ; 2FB6: 18       
    adc     #$02                            ; 2FB7: 69 02    
    ora     #$01                            ; 2FB9: 09 01    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2FBB: 91 00    

; Load current object attributes into ZP variables and object index into Register A
; L_BRS_($2FBD)_($2FA2) OK
; L_BRS_($2FBD)_($2FB0) OK
; L_JMP_($2FBD)_($301B) OK
; L_JMP_($2FBD)_($3051) OK
Setup_Object_Addr_Ship_Fuel
    jsr     Load_Object_Type_X_Y_Colour     ; 2FBD: 20 E9 35 
    jsr     Load_Obj_UDG_Data_Addr_Ship_Wv  ; 2FC0: 20 DA 2F 

; Using index into object data, get addr of object data to A and Y and setup into ZP
; L_JMP_($2FC3)_($289C) OK
Setup_Object_Addr
    pha                                     ; 2FC3: 48       
    jsr     Load_Obj_UDG_Data_Addr_S_F_V    ; 2FC4: 20 E5 2F 
    jsr     Load_Obj_Old_UDG_RAM_Addr_Size  ; 2FC7: 20 3D 37 
    pla                                     ; 2FCA: 68       

; Do it again to setup the object dimensions
    jsr     Load_Obj_UDG_Data_Addr_S_F_V    ; 2FCB: 20 E5 2F 
    jsr     Load_Obj_New_UDG_RAM_Addr_Size  ; 2FCE: 20 8D 37 

    jsr     Display_Object                  ; 2FD1: 20 4C 36 
    jsr     Colourize_Object                ; 2FD4: 20 1F 38 
    jmp     GOTO_NEXT_OBJECT                ; 2FD7: 4C 1A 26 
; ------------------------------------------





;  dP""b8 888888 888888      dP"Yb  88""Yb  88888     88   88 8888b.   dP""b8
; dP   `" 88__     88       dP   Yb 88__dP     88     88   88  8I  Yb dP   `"
; Yb  "88 88""     88       Yb   dP 88""Yb o.  88     Y8   8P  8I  dY Yb  "88
;  YboodP 888888   88        YbodP  88oodP "bodP'     `YbodP' 8888Y"   YboodP

; 8888b.     db    888888    db           db    8888b.  8888b.  88""Yb
;  8I  Yb   dPYb     88     dPYb         dPYb    8I  Yb  8I  Yb 88__dP
;  8I  dY  dP__Yb    88    dP__Yb       dP__Yb   8I  dY  8I  dY 88"Yb
; 8888Y"  dP""""Yb   88   dP""""Yb     dP""""Yb 8888Y"  8888Y"  88  Yb

; .dP"Y8 88  88 88 88""Yb     888888 88   88 888888 88         Yb    dP    db    88
; `Ybo." 88  88 88 88__dP     88__   88   88 88__   88          Yb  dP    dPYb   88
; o.`Y8b 888888 88 88"""      88""   Y8   8P 88""   88  .o       YbdP    dP__Yb  88  .o
; 8bodP' 88  88 88 88         88     `YbodP' 888888 88ood8        YP    dP""""Yb 88ood8

; Return object's UDG data address offset for Ship Middle Section/Fuel
; depending on which of the four levels (or multiple of) the player is currently on
; L_JSR_($2FDA)_($231F) OK
; L_JSR_($2FDA)_($2F85) OK
; L_JSR_($2FDA)_($2FC0) OK
; L_JSR_($2FDA)_($3057) OK
Load_Obj_UDG_Data_Addr_Ship_Wv
    lda     ZP_Wave_Active_Player           ; 2FDA: A5 59    

; Calculate and update object's UDG data address offset in Register A based on player wave.
; First ship is for levels 0-3, second ship for levels 4-7 then repeat.
; UDG data address consists of two parts, large offset $0/8/10/18 for ship top/mid/bott/fuel
; plus small offset of $0/2/4/6 calculated below to select between models of ship.
; VIC version has only two, but there appears to be slots for two more like in the ZX Spectrum,
; but should be easy to add the ships on with 16K RAM.
; L_JSR_($2FDC)_($285B) OK
Load_Obj_UDG_Data_Addr_Ship
    lsr     a                               ; 2FDC: 4A       
    and     #%00000110                      ; 2FDD: 29 06    
    ldy     #OBJECT_UDG_DATA_INDEX_PARAM    ; 2FDF: A0 06    
    clc                                     ; 2FE1: 18       
    adc     (ZP_Obj_List_Ptr_Lo),y          ; 2FE2: 71 00    
    rts                                     ; 2FE4: 60       
; ==========================================

; Using A as offset, Load A and Y with address of Ship, Fuel or Valuable UDG data
; L_JSR_($2FE5)_($285E) OK
; L_JSR_($2FE5)_($2DF2) OK
; L_JSR_($2FE5)_($2DF9) OK
; L_JSR_($2FE5)_($2FC4) OK
; L_JSR_($2FE5)_($2FCB) OK
; L_JSR_($2FE5)_($305A) OK
Load_Obj_UDG_Data_Addr_S_F_V
    tax                                     ; 2FE5: AA       
    lda     UDG_Data_Ship_Fuel_Valuables,x  ; 2FE6: BD 87 3C 
    tay                                     ; 2FE9: A8       
    lda     UDG_Data_Ship_Fuel_Valuables+1,x ; 2FEA: BD 88 3C 
    rts                                     ; 2FED: 60       
; ==========================================





;  88888 888888 888888 8b    d8    db    88b 88
;     88 88__     88   88b  d88   dPYb   88Yb88
; o.  88 88""     88   88YbdP88  dP__Yb  88 Y88
; "bodP' 888888   88   88 YY 88 dP""""Yb 88  Y8

;  dP""b8  dP"Yb  88     88     88 8888b.  888888
; dP   `" dP   Yb 88     88     88  8I  Yb 88__
; Yb      Yb   dP 88  .o 88  .o 88  8I  dY 88""
;  YboodP  YbodP  88ood8 88ood8 88 8888Y"  888888

; .dP"Y8 88  88 88 88""Yb     888888 88   88 888888 88
; `Ybo." 88  88 88 88__dP     88__   88   88 88__   88
; o.`Y8b 888888 88 88"""      88""   Y8   8P 88""   88  .o
; 8bodP' 88  88 88 88         88     `YbodP' 888888 88ood8

; At point when Jetman picks up Ship or Fuel module
; L_BRS_($2FEE)_($2FA9) OK
Jetman_Collide_Ship_Fuel
    jsr     Load_Object_Type_X_Y            ; 2FEE: 20 D7 35 
    ldy     #OBJECT_STATUS_PARAM            ; 2FF1: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 2FF3: B1 00    
    ora     #OBJECT_STATUS_PICKED_UP        ; 2FF5: 09 02    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 2FF7: 91 00    

; Jetman pickup Ship Module / Fuel Cell = 100 points
    jsr     Load_ZP_Parameters              ; 2FF9: 20 9D 25 
    fcb     $02                             ; 2FFC: 02        ZP02/03
    fdb     $0100                           ; 2FFD: 00 01     100 Points
    fcb     $FF                             ; 2FFF: FF       
    jsr     Update_Score                    ; 3000: 20 63 30 

; Trigger collision pickup sound
    lda     #$01                            ; 3003: A9 01    
    sta     Obj_Sound_Collision             ; 3005: 8D A9 03 
    lda     #$10                            ; 3008: A9 10    
    sta     Obj_Sound_Collision_Timer       ; 300A: 8D AA 03 

; Store current Jetman Position X into current picked-up object
    ldy     #JETMAN_POSITION_X_PARAM        ; 300D: A0 01    
    lda     Obj_Jetman_Position_X           ; 300F: AD 81 03 
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 3012: 91 00    

; Store current Jetman Position Y into current picked-up object
    ldy     #JETMAN_POSITION_Y_PARAM        ; 3014: A0 03    
    lda     Obj_Jetman_Position_Y           ; 3016: AD 83 03 
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 3019: 91 00    

    jmp     Setup_Object_Addr_Ship_Fuel     ; 301B: 4C BD 2F 
; ------------------------------------------





;  dP""b8  dP"Yb  88""Yb Yb  dP      88888 888888 888888 8b    d8    db    88b 88
; dP   `" dP   Yb 88__dP  YbdP          88 88__     88   88b  d88   dPYb   88Yb88
; Yb      Yb   dP 88"""    8P       o.  88 88""     88   88YbdP88  dP__Yb  88 Y88
;  YboodP  YbodP  88      dP        "bodP' 888888   88   88 YY 88 dP""""Yb 88  Y8

; Yb  dP Yb  dP     888888  dP"Yb       dP"Yb  88""Yb  88888 888888  dP""b8 888888
;  YbdP   YbdP        88   dP   Yb     dP   Yb 88__dP     88 88__   dP   `"   88
;  dPYb    8P         88   Yb   dP     Yb   dP 88""Yb o.  88 88""   Yb        88
; dP  Yb  dP          88    YbodP       YbodP  88oodP "bodP' 888888  YboodP   88

; Copy Position X from Jetman to object, plus a 4 pixel offset
; L_BRS_($301E)_($2F9D) OK
Copy_Jetman_XY_To_Object
    ldy     #OBJECT_POSITION_X_PARAM        ; 301E: A0 01    
    lda     Obj_Jetman_Position_X           ; 3020: AD 81 03 
    clc                                     ; 3023: 18       
    adc     #$04                            ; 3024: 69 04    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 3026: 91 00    

; Register Y becomes Position Y parameter, now copy Position Y from Jetman to object
    iny                                     ; 3028: C8       
    iny                                     ; 3029: C8       
    lda     Obj_Jetman_Position_Y           ; 302A: AD 83 03 
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 302D: 91 00    

; Register Y becomes Position X parameter, test X distance between Jetman and ship and
; branch if Jetman is to the left of the ship
    dey                                     ; 302F: 88       
    dey                                     ; 3030: 88       
    lda     Obj_Ship_Base_Position_X        ; 3031: AD B1 03 
    sec                                     ; 3034: 38       
    sbc     (ZP_Obj_List_Ptr_Lo),y          ; 3035: F1 00    
    bpl     Test_Jetman_Above_Ship          ; 3037: 10 05    

; Jetman to the right of the ship, perform an Absolute on the result of the Position X comparison
    eor     #$FF                            ; 3039: 49 FF    
    clc                                     ; 303B: 18       
    adc     #$01                            ; 303C: 69 01    

; If Jetman is above ship then drop ship part/fuel cell
; L_BRS_($303E)_($3037) OK
Test_Jetman_Above_Ship
    cmp     #OBJECT_OVER_SHIP_HITBOX_X      ; 303E: C9 06    
    bcs     JMP_Setup_Obj_Addr_Ship_Fuel    ; 3040: B0 0F    

; Jetman is above ship, set picked-up object state to Dropped/Landed
    ldy     #OBJECT_PICKUP_DROPPED_STATE    ; 3042: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3044: B1 00    
    ora     #%00000100                      ; 3046: 09 04    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 3048: 91 00    

; Set the dropped object's Position X to the same as the ship base, so they line up on-screen
    lda     Obj_Ship_Base_Position_X        ; 304A: AD B1 03 
    ldy     #OBJECT_POSITION_X_PARAM        ; 304D: A0 01    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 304F: 91 00    

; L_BRS_($3051)_($3040) OK
JMP_Setup_Obj_Addr_Ship_Fuel
    jmp     Setup_Object_Addr_Ship_Fuel     ; 3051: 4C BD 2F 
; ------------------------------------------

; L_JSR_($3054)_($2F4B) OK
Disp_Obj_Ship_Or_Fuel_Setup_2
    jsr     Load_Object_Type_X_Y_Colour     ; 3054: 20 E9 35 

; L_JSR_($3057)_($2F5F) OK
Disp_Obj_Ship_Or_Fuel_Setup_1
    jsr     Load_Obj_UDG_Data_Addr_Ship_Wv  ; 3057: 20 DA 2F 

; L_JSR_($305A)_($2322) OK
; L_JSR_($305A)_($2BD8) OK
; L_JSR_($305A)_($2F88) OK
Display_Object_Ship_Or_Fuel
    jsr     Load_Obj_UDG_Data_Addr_S_F_V    ; 305A: 20 E5 2F 
    jsr     Load_Obj_Old_UDG_RAM_Addr_Size  ; 305D: 20 3D 37 
    jmp     Display_Object_Old_Setup        ; 3060: 4C 04 36 
; ------------------------------------------





; 88   88 88""Yb 8888b.     db    888888 888888
; 88   88 88__dP  8I  Yb   dPYb     88   88__
; Y8   8P 88"""   8I  dY  dP__Yb    88   88""
; `YbodP' 88     8888Y"  dP""""Yb   88   888888

; .dP"Y8  dP""b8  dP"Yb  88""Yb 888888
; `Ybo." dP   `" dP   Yb 88__dP 88__
; o.`Y8b Yb      Yb   dP 88"Yb  88""
; 8bodP'  YboodP  YbodP  88  Yb 888888

; L_JSR_($3063)_($286E) OK
; L_JSR_($3063)_($2C89) OK
; L_JSR_($3063)_($3000) OK
Update_Score
    lda     ZP_Active_Player                ; 3063: A5 5E    
    bne     Read_ZP_Params_Player_2_Score   ; 3065: D0 2A    

; Read ZP Params Player 1 Score
    jsr     Load_ZP_Parameters              ; 3067: 20 9D 25 
    fcb     $06                             ; 306A: 06        ZP06
    fdb     ZP_Score_Player_1               ; 306B: 51 00     Player 1 Score in ZP
    fcb     $FF                             ; 306D: FF       

; L_JMP_($306E)_($3098) OK
Add_BCD_Digits_To_Score
    ldy     #THREE_DIGITS_COUNTDOWN         ; 306E: A0 02    

; Add units, sed sets CPU Decimal mode
    sed                                     ; 3070: F8       
    lda     (ZP06_Player_Score_Addr),y      ; 3071: B1 06    
    clc                                     ; 3073: 18       
    adc     ZP02_Score_Byte_Hi              ; 3074: 65 02    
    sta     (ZP06_Player_Score_Addr),y      ; 3076: 91 06    

; Add tens
    dey                                     ; 3078: 88       
    lda     (ZP06_Player_Score_Addr),y      ; 3079: B1 06    
    adc     ZP03_Score_Byte_Lo              ; 307B: 65 03    
    sta     (ZP06_Player_Score_Addr),y      ; 307D: 91 06    

; Add hundreds, cld clears CPU Decimal mode
    dey                                     ; 307F: 88       
    lda     (ZP06_Player_Score_Addr),y      ; 3080: B1 06    
    adc     #$00                            ; 3082: 69 00    
    sta     (ZP06_Player_Score_Addr),y      ; 3084: 91 06    
    cld                                     ; 3086: D8       

; Display the updated score for the active player
    lda     ZP_Active_Player                ; 3087: A5 5E    
    bne     JMP_Display_Player_2_Score      ; 3089: D0 03    
    jmp     Display_Player_1_Score          ; 308B: 4C 71 24 
; ------------------------------------------

; L_BRS_($308E)_($3089) OK
JMP_Display_Player_2_Score
    jmp     Display_Player_2_Score          ; 308E: 4C 81 24 
; ------------------------------------------

; L_BRS_($3091)_($3065) OK
Read_ZP_Params_Player_2_Score
    jsr     Load_ZP_Parameters              ; 3091: 20 9D 25 
    fcb     $06                             ; 3094: 06        ZP06
    fdb     ZP_Score_Player_2               ; 3095: 54 00     Player 2 Score in ZP
    fcb     $FF                             ; 3097: FF       
    jmp     Add_BCD_Digits_To_Score         ; 3098: 4C 6E 30 
; ------------------------------------------





; 888888 888888 .dP"Y8 888888
;   88   88__   `Ybo."   88
;   88   88""   o.`Y8b   88
;   88   888888 8bodP'   88

; 88""Yb 88        db    888888 888888  dP"Yb  88""Yb 8b    d8
; 88__dP 88       dPYb     88   88__   dP   Yb 88__dP 88b  d88
; 88"""  88  .o  dP__Yb    88   88""   Yb   dP 88"Yb  88YbdP88
; 88     88ood8 dP""""Yb   88   88      YbodP  88  Yb 88 YY 88

;  dP""b8  dP"Yb  88     88     88 .dP"Y8 88  dP"Yb  88b 88
; dP   `" dP   Yb 88     88     88 `Ybo." 88 dP   Yb 88Yb88
; Yb      Yb   dP 88  .o 88  .o 88 o.`Y8b 88 Yb   dP 88 Y88
;  YboodP  YbodP  88ood8 88ood8 88 8bodP' 88  YbodP  88  Y8

; Perform Absolute on Register A containing Distance X of object from left side of first platform
; L_BRS_($309B)_($30CB) OK
Test_Platform_Size_X
    eor     #%11111111                      ; 309B: 49 FF    
    adc     #$01                            ; 309D: 69 01    

; Register Y becomes 2, used to point to the number of characters in the middle of a platform
    iny                                     ; 309F: C8       
    iny                                     ; 30A0: C8       

; Store Register A onto stack for later (Distance X of object from left side of first platform)
    tax                                     ; 30A1: AA       

; Load number of characters in the middle of a platform and multiply 8, e.g. L & R platforms
; have 3 blocks thus Reg A becomes $18 and store to ZP0B
    lda     (ZP08_Platfm_Data_Tbl_Addr_Lo),y; 30A2: B1 08    
    asl     a                               ; 30A4: 0A       
    asl     a                               ; 30A5: 0A       
    asl     a                               ; 30A6: 0A       
    sta     ZP0B_Platform_Object_Distance   ; 30A7: 85 0B    

; Register Y becomes 0
    dey                                     ; 30A9: 88       
    dey                                     ; 30AA: 88       

; Restore Register A (Distance X of object from left side of first platform) and subtract
; from Reg A distance from obj to left side of platform
    sec                                     ; 30AB: 38       
    txa                                     ; 30AC: 8A       
    sbc     ZP0B_Platform_Object_Distance   ; 30AD: E5 0B    
    bcs     Test_Obj_Pfm_Dist_Over_8        ; 30AF: B0 23     Object is much further right than the platform
    bcc     Test_Platform_Collision_Y       ; 30B1: 90 39    

; Load object Position X and Y into working variables
; L_JSR_($30B3)_($2841) OK
; L_JSR_($30B3)_($2B16) OK
; L_JSR_($30B3)_($2C6F) OK
; L_JSR_($30B3)_($2FAB) OK
; L_JSR_($30B3)_($327B) OK
; L_JSR_($30B3)_($3370) OK
Test_Platform_Collision
    ldy     #OBJECT_POSITION_X_PARAM        ; 30B3: A0 01    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 30B5: B1 00    
    sta     ZP0E_Object_Position_X          ; 30B7: 85 0E    

; Register Y becomes OBJECT_POSITION_Y_PARAM
    iny                                     ; 30B9: C8       
    iny                                     ; 30BA: C8       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 30BB: B1 00    
    sta     ZP0F_Object_Position_Y          ; 30BD: 85 0F    

    jsr     Load_Platform_Data_Table_Addr   ; 30BF: 20 43 31 

; Initialise collision status, which becomes the subroutine return code
; L_BRS_($30C2)_($311D) OK
Test_Platform_Collision_X
    lda     #$00                            ; 30C2: A9 00    
    sta     ZP02_Collision_Status           ; 30C4: 85 02    

; Load Position X of platform (leftmost edge, indexed by Register Y) and subtract object Position X
    lda     (ZP08_Platfm_Data_Tbl_Addr_Lo),y; 30C6: B1 08    
    sec                                     ; 30C8: 38       
    sbc     ZP0E_Object_Position_X          ; 30C9: E5 0E    
    bcc     Test_Platform_Size_X            ; 30CB: 90 CE    

; Object is to the left of the platform, set status bit 1
; Register A contains the distance between object X and the left side of the left platform
    tax                                     ; 30CD: AA       
    lda     #$01                            ; 30CE: A9 01    
    jsr     Set_Collision_Status            ; 30D0: 20 38 31 
    txa                                     ; 30D3: 8A       

; Register A contains the distance between object X and the left side of the left platform
; L_BRS_($30D4)_($30AF) OK
Test_Obj_Pfm_Dist_Over_8
    cmp     #$08                            ; 30D4: C9 08    
    bcc     Test_Obj_Past_Right_Of_Pfm      ; 30D6: 90 07    

; Distance X is greater than #08
    tax                                     ; 30D8: AA       
    lda     #$02                            ; 30D9: A9 02    
    jsr     Set_Collision_Status            ; 30DB: 20 38 31 
    txa                                     ; 30DE: 8A       

; Register A contains the distance between object X and the left side of the left platform
; Test if obj is $10 pixels left of platform, if yes, no Y check needed, test next platform
; L_BRS_($30DF)_($30D6) OK
Test_Obj_Past_Right_Of_Pfm
    cmp     #$10                            ; 30DF: C9 10    
    bcs     Next_Platform_Data_Inc          ; 30E1: B0 35    

; Test object is $0C or less pixels to left of platform, if yes, Y check needed
; Triggered When a wave 0 alien position X moves to either side of a platform, but no overlap
    cmp     #$0C                            ; 30E3: C9 0C    
    bcc     Test_Platform_Collision_Y       ; 30E5: 90 05    

; Object is greater than $0C pixels to left of platform, set bit 2, Y check needed
    lda     #$04                            ; 30E7: A9 04    
    jsr     Set_Collision_Status            ; 30E9: 20 38 31 

; Register Y becomes Platform Y position address in Data Table i.e. parameter 01 or 04 or 07.
; Subtract object Position Y from platform Position Y
; L_BRS_($30EC)_($30B1) OK
; L_BRS_($30EC)_($30E5) OK
Test_Platform_Collision_Y
    iny                                     ; 30EC: C8       
    lda     (ZP08_Platfm_Data_Tbl_Addr_Lo),y; 30ED: B1 08    
    sec                                     ; 30EF: 38       
    sbc     ZP0F_Object_Position_Y          ; 30F0: E5 0F    
    bcc     Test_Platform_Collision_Y_Skip  ; 30F2: 90 09    

; Object is above platform, test if > 4 pixels above platform, branch if yes
    cmp     #$04                            ; 30F4: C9 04    
    bcs     Test_All_Platforms_Tested       ; 30F6: B0 21    

; Set collision flag bit 7
    lda     #$88                            ; 30F8: A9 88    
    jmp     Set_Collision_Status            ; 30FA: 4C 38 31 
; ------------------------------------------

; Object is below platform
; L_BRS_($30FD)_($30F2) OK
Test_Platform_Collision_Y_Skip
    eor     #%11111111                      ; 30FD: 49 FF    
    sty     ZP0B_Platform_Object_Distance   ; 30FF: 84 0B    

; Test if object is Jetman flying
    pha                                     ; 3101: 48       
    ldy     #OBJECT_TYPE_PARAM              ; 3102: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3104: B1 00    
    and     #%00111111                      ; 3106: 29 3F    
    cmp     #%00000001                      ; 3108: C9 01    
    bne     Test_Jetman_Standing            ; 310A: D0 31    

; Jetman is flying
    pla                                     ; 310C: 68       
    cmp     #%00100010                      ; 310D: C9 22    

; L_JMP_($310F)_($3140) OK
Move_Toward_RTS
    ldy     ZP0B_Platform_Object_Distance   ; 310F: A4 0B    
    bcs     Test_All_Platforms_Tested       ; 3111: B0 06    

; Set collision flag bit 7
    lda     #$80                            ; 3113: A9 80    
    jmp     Set_Collision_Status            ; 3115: 4C 38 31 
; ------------------------------------------
; Register Y is address pointer into lookup table, 3 groups of 3

; L_BRS_($3118)_($30E1) OK
Next_Platform_Data_Inc
    iny                                     ; 3118: C8       

; L_BRS_($3119)_($30F6) OK
; L_BRS_($3119)_($3111) OK
Test_All_Platforms_Tested
    iny                                     ; 3119: C8       
    iny                                     ; 311A: C8       
    dec     ZP0A_Platform_Quantity          ; 311B: C6 0A    
    bne     Test_Platform_Collision_X       ; 311D: D0 A3    

; Test if object is one pixel from the bottom of screen
    ldy     #OBJECT_POSITION_Y_PARAM        ; 311F: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3121: B1 00    
    cmp     #SCREEN_BOTTOM_1UP              ; 3123: C9 AE    
    bcc     Test_Object_20_Lines_Bott       ; 3125: 90 09    

    lda     #SCREEN_BOTTOM                  ; 3127: A9 AF    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 3129: 91 00    

    lda     #$88                            ; 312B: A9 88    

; L_BRS_($312D)_($3136) OK
STA_Collision_Status_RTS
    sta     ZP02_Collision_Status           ; 312D: 85 02    
    rts                                     ; 312F: 60       
; ==========================================

; L_BRS_($3130)_($3125) OK
Test_Object_20_Lines_Bott
    cmp     #%00100000                      ; 3130: C9 20    
    bcs     Test_Platform_Collision_RTS     ; 3132: B0 08    

    lda     #$80                            ; 3134: A9 80    
    bmi     STA_Collision_Status_RTS        ; 3136: 30 F5    

; L_JSR_($3138)_($30D0) OK
; L_JSR_($3138)_($30DB) OK
; L_JSR_($3138)_($30E9) OK
; L_JMP_($3138)_($30FA) OK
; L_JMP_($3138)_($3115) OK
Set_Collision_Status
    ora     $0002                           ; 3138: 05 02    
    sta     ZP02_Collision_Status           ; 313A: 85 02    

; L_BRS_($313C)_($3132) OK
Test_Platform_Collision_RTS
    rts                                     ; 313C: 60       
; ==========================================

; Jetman is standing (i.e. not flying)
; L_BRS_($313D)_($310A) OK
Test_Jetman_Standing
    pla                                     ; 313D: 68       
    cmp     #%00011010                      ; 313E: C9 1A    
    jmp     Move_Toward_RTS                 ; 3140: 4C 0F 31 
; ------------------------------------------





; 8888b.  88""Yb    db    Yb        dP
;  8I  Yb 88__dP   dPYb    Yb  db  dP
;  8I  dY 88"Yb   dP__Yb    YbdPYbdP
; 8888Y"  88  Yb dP""""Yb    YP  YP

; 88""Yb 88        db    888888 888888  dP"Yb  88""Yb 8b    d8 .dP"Y8
; 88__dP 88       dPYb     88   88__   dP   Yb 88__dP 88b  d88 `Ybo."
; 88"""  88  .o  dP__Yb    88   88""   Yb   dP 88"Yb  88YbdP88 o.`Y8b
; 88     88ood8 dP""""Yb   88   88      YbodP  88  Yb 88 YY 88 8bodP'

; Load platform data table address ($31B6) and number of platforms (3) to Zero Page variables
; L_JSR_($3143)_($30BF) OK
; L_JSR_($3143)_($3152) OK
Load_Platform_Data_Table_Addr
    lda     #PLATFORM_DATA_TABLE_ADDR_LO    ; 3143: A9 B6    
    sta     ZP08_Platfm_Data_Tbl_Addr_Lo    ; 3145: 85 08    

    lda     #PLATFORM_DATA_TABLE_ADDR_HI    ; 3147: A9 31    
    sta     ZP09_Platfm_Data_Tbl_Addr_Hi    ; 3149: 85 09    

    lda     #PLATFORM_QUANTITY              ; 314B: A9 03    
    sta     ZP0A_Platform_Quantity          ; 314D: 85 0A    

; Initial index into the Platform Data Table
    ldy     #$00                            ; 314F: A0 00    
    rts                                     ; 3151: 60       
; ==========================================

; L_JSR_($3152)_($22CB) OK
Draw_Platforms
    jsr     Load_Platform_Data_Table_Addr   ; 3152: 20 43 31 

; Load X, Y and Platform Width in columns into Zero Page variables
; Register Y index starts as 0, 3 or 6
; L_BRS_($3155)_($319F) OK
Loop_Draw_Platform
    lda     (ZP08_Platfm_Data_Tbl_Addr_Lo),y; 3155: B1 08    
    sta     ZP04_Platform_Position_X        ; 3157: 85 04    

    iny                                     ; 3159: C8       
    lda     (ZP08_Platfm_Data_Tbl_Addr_Lo),y; 315A: B1 08    
    sta     ZP05_Platform_Position_Y        ; 315C: 85 05    

    iny                                     ; 315E: C8       
    lda     (ZP08_Platfm_Data_Tbl_Addr_Lo),y; 315F: B1 08    
    sta     ZP0B_Platform_Width_Chars       ; 3161: 85 0B    

; Store platform data table index into variable for next platform
    sty     ZP03_Platform_Data_Table_Index  ; 3163: 84 03    
    jsr     Setup_Colour_RAM_Address        ; 3165: 20 F7 34 
    jsr     Convert_XY_to_UDG_RAM_Address   ; 3168: 20 1D 35 

; Load zero page variables with addr of leftmost platform UDG object data
    lda     #PLATFORM_UDG_DATA_ADDR_LO      ; 316B: A9 15    
    sta     ZP06_Platform_UDG_Data_Addr_Lo  ; 316D: 85 06    

    lda     #PLATFORM_UDG_DATA_ADDR_HI      ; 316F: A9 3E    
    sta     ZP07_Platform_UDG_Data_Addr_Hi  ; 3171: 85 07    

; Copy platform leftmost UDG object data to RAM, bytes 9 per column i.e. UDG is 9 pixels high
    ldy     #PLATFORM_HEIGHT_PIXELS         ; 3173: A0 09    
    jsr     Copy_Char_To_UDG_RAM            ; 3175: 20 B6 35 

    jsr     Next_UDG_Char                   ; 3178: 20 A8 31 

; Copy platform middle and rightmost UDG chars to RAM, 9 bytes per column i.e. UDG is 9 pixels high
; L_BRS_($317B)_($3184) OK
; L_JMP_($317B)_($31A5) OK
Loop_Next_Char
    ldy     #PLATFORM_HEIGHT_PIXELS         ; 317B: A0 09    
    jsr     Copy_Char_To_UDG_RAM            ; 317D: 20 B6 35 

; Test width of platform counter, when zero, move UDG Data address pointer to the rightmost
; platform object, otherwise just display the current middle platform UDG object data again
    dec     ZP0B_Platform_Width_Chars       ; 3180: C6 0B    
    beq     Next_UDG_Char_Loop_Next_Char    ; 3182: F0 1E    
    bpl     Loop_Next_Char                  ; 3184: 10 F5    

; Increment the index into the platform data table and store platform width columns+1 into ZP08
    ldy     ZP03_Platform_Data_Table_Index  ; 3186: A4 03    
    lda     (ZP08_Platfm_Data_Tbl_Addr_Lo),y; 3188: B1 08    
    clc                                     ; 318A: 18       
    adc     #$01                            ; 318B: 69 01    
    sta     ZP0B_Platform_Width_Chars       ; 318D: 85 0B    

; Initialise colourization data
    ldy     #$00                            ; 318F: A0 00    
    lda     #COLOUR_GREEN                   ; 3191: A9 05    

; Colourize the first platform object data column, then loop round the other data object columns
; plus a further column for the rightmost platform object data column
; L_BRS_($3193)_($3198) OK
Loop_Colorize_Platform_Green
    sta     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 3193: 91 0C    

    iny                                     ; 3195: C8       
    dec     ZP0B_Platform_Width_Chars       ; 3196: C6 0B    
    bpl     Loop_Colorize_Platform_Green    ; 3198: 10 F9    

; Get index into the platform data table and increment whilst in Register A
    ldy     ZP03_Platform_Data_Table_Index  ; 319A: A4 03    
    iny                                     ; 319C: C8       

; Test if all platform have been drawn yet, loop if not
    dec     ZP0A_Platform_Quantity          ; 319D: C6 0A    
    bne     Loop_Draw_Platform              ; 319F: D0 B4    
    rts                                     ; 31A1: 60       
; ==========================================

; L_BRS_($31A2)_($3182) OK
Next_UDG_Char_Loop_Next_Char
    jsr     Next_UDG_Char                   ; 31A2: 20 A8 31 
    jmp     Loop_Next_Char                  ; 31A5: 4C 7B 31 
; ------------------------------------------

; 16-bit increment of Platform UDG data address
; L_JSR_($31A8)_($3178) OK
; L_JSR_($31A8)_($31A2) OK
Next_UDG_Char
    lda     ZP06_Platform_UDG_Data_Addr_Lo  ; 31A8: A5 06    
    clc                                     ; 31AA: 18       
    adc     #PLATFORM_HEIGHT_PIXELS_TOTAL   ; 31AB: 69 0A    
    sta     ZP06_Platform_UDG_Data_Addr_Lo  ; 31AD: 85 06    

    lda     ZP07_Platform_UDG_Data_Addr_Hi  ; 31AF: A5 07    
    adc     #$00                            ; 31B1: 69 00    
    sta     ZP07_Platform_UDG_Data_Addr_Hi  ; 31B3: 85 07    
    rts                                     ; 31B5: 60       
; ==========================================

; Platform data table, 3 platforms, X coord, Y coord, #Number of platform middle columns
    fcb     $10,$40,$03                     ; 31B6: 10 40 03  X Y #Num_middle_chars
    fcb     $50,$60,$01                     ; 31B9: 50 60 01  X Y #Num_middle_chars
    fcb     $88,$30,$03                     ; 31BC: 88 30 03  X Y #Num_middle_chars





; ############################################################################################
;  88888 888888 888888 8b    d8    db    88b 88
;     88 88__     88   88b  d88   dPYb   88Yb88
; o.  88 88""     88   88YbdP88  dP__Yb  88 Y88
; "bodP' 888888   88   88 YY 88 dP""""Yb 88  Y8

; 888888 88     Yb  dP 88 88b 88  dP""b8
; 88__   88      YbdP  88 88Yb88 dP   `"
; 88""   88  .o   8P   88 88 Y88 Yb  "88
; 88     88ood8  dP    88 88  Y8  YboodP
; ############################################################################################

; L_BRS_($31BF)_($3203) OK
Left_Right_Impact
    ldy     #JETMAN_DIRECTION_X_PARAM       ; 31BF: A0 02    
    clc                                     ; 31C1: 18       
    bit     MASK_00000001                   ; 31C2: 2C 14 20 
    beq     Fly_Left_Impact                 ; 31C5: F0 18    

; Load and test Jetman X Direction/Velocity
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 31C7: B1 00    
    bpl     Fly_Right_Impact                ; 31C9: 10 03    

; L_BRS_($31CB)_($31E3) OK
; L_BRS_($31CB)_($31FB) OK
JMP_Update_Jetman_Position_X
    jmp     Update_Jetman_Position_X        ; 31CB: 4C 85 32 
; ------------------------------------------

; L_BRS_($31CE)_($31C9) OK
Fly_Right_Impact
    beq     Flying_Left_or_Store_Dir_X      ; 31CE: F0 07    
    eor     #$FF                            ; 31D0: 49 FF    
    adc     #$03                            ; 31D2: 69 03    
; L_BRS_($31D4)_($31DD) OK
JMP_Store_Jetman_Direction_X_
    jmp     Store_Jetman_Direction_X        ; 31D4: 4C A2 32 
; ------------------------------------------

; L_BRS_($31D7)_($31CE) OK
Flying_Left_or_Store_Dir_X
    ldy     #$00                            ; 31D7: A0 00    
    bit     ZP_Jetman_Action                ; 31D9: 24 1C    
    bvc     Flying_Left                     ; 31DB: 50 4B    
    bvs     JMP_Store_Jetman_Direction_X_   ; 31DD: 70 F5    

; BVS/BVC above means below code can only be jumped/branched to
; L_BRS_($31DF)_($31C5) OK
Fly_Left_Impact
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 31DF: B1 00    
    beq     Flying_Right_or_Store_Dir_X     ; 31E1: F0 07    
    bpl     JMP_Update_Jetman_Position_X    ; 31E3: 10 E6    
    eor     #$FF                            ; 31E5: 49 FF    

; L_BRS_($31E7)_($31F0) OK
JMP_Store_Jetman_Direction_X
    jmp     Store_Jetman_Direction_X        ; 31E7: 4C A2 32 
; ------------------------------------------

; L_BRS_($31EA)_($31E1) OK
Flying_Right_or_Store_Dir_X
    ldy     #$00                            ; 31EA: A0 00    
    bit     ZP_Jetman_Action                ; 31EC: 24 1C    
    bpl     Flying_Right                    ; 31EE: 10 4E    
    bmi     JMP_Store_Jetman_Direction_X    ; 31F0: 30 F5    


; BVS/BVC above means below code can only be jumped/branched to
; 1xxx0001 = Upward impact
; 1xxx1000 = Downward impact
; 1xxxx1xx = Left or Right impact
; 1xxx1110 = Top Right Corner impact
; 1xxx0110 = Right impact
; 1xxx0111 = Top Left impact
; 1xxx0111 = Left impact
; L_JMP_($31F2)_($3282) OK
Jetman_Hits_Surface
    bit     MASK_00001000                   ; 31F2: 2C 17 20 
    beq     Left_Right_Up_Impact            ; 31F5: F0 09    

; Test Obj_Jetman_At_Rest???
    ldy     #JETMAN_DIRECTION_Y_PARAM       ; 31F7: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 31F9: B1 00    
    bmi     JMP_Update_Jetman_Position_X    ; 31FB: 30 CE    
    jmp     Set_Jetman_Standing             ; 31FD: 4C 21 33 
; ------------------------------------------

; L_BRS_($3200)_($31F5) OK
Left_Right_Up_Impact
    bit     MASK_00000100                   ; 3200: 2C 16 20 
    bne     Left_Right_Impact               ; 3203: D0 BA    
    jmp     Update_Jetman_Position_X        ; 3205: 4C 85 32 
; ------------------------------------------

; Test Obj_Jetman_At_Rest???
; L_JMP_($3208)_($32C4) OK
Flying_Up_Impact
    ldy     #JETMAN_DIRECTION_Y_PARAM       ; 3208: A0 04    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 320A: B1 00    
    beq     Flying_Up_Impact_Bounce         ; 320C: F0 0A    
    bpl     JMP_Update_Jetman_Position_Y    ; 320E: 10 05    
    eor     #%11111111                      ; 3210: 49 FF    

; L_BRS_($3212)_($3222) OK
JMP_Store_Jetman_Direction_Y
    jmp     Store_Jetman_Direction_Y        ; 3212: 4C DE 32 
; ------------------------------------------

; L_BRS_($3215)_($320E) OK
JMP_Update_Jetman_Position_Y
    jmp     Update_Jetman_Position_Y        ; 3215: 4C C7 32 
; ------------------------------------------

; L_BRS_($3218)_($320C) OK
Flying_Up_Impact_Bounce
    tax                                     ; 3218: AA       
    lda     ZP_Jetman_Action                ; 3219: A5 1C    
    bit     MASK_00010000                   ; 321B: 2C 18 20 
    bne     JMP_Update_Jetman_Position_Y_   ; 321E: D0 04    
    lda     #$00                            ; 3220: A9 00    
    beq     JMP_Store_Jetman_Direction_Y    ; 3222: F0 EE    
; L_BRS_($3224)_($321E) OK
JMP_Update_Jetman_Position_Y_
    txa                                     ; 3224: 8A       
    jmp     Update_Jetman_Position_Y        ; 3225: 4C C7 32 
; ------------------------------------------

; L_BRS_($3228)_($31DB) OK
; L_BRS_($3228)_($328F) OK
Flying_Left
    pha                                     ; 3228: 48       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3229: B1 00    
    ora     #$80                            ; 322B: 09 80    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 322D: 91 00    
    pla                                     ; 322F: 68       

    cmp     #$F8                            ; 3230: C9 F8    
    beq     Update_Jetman_Position_X_       ; 3232: F0 72    
    cmp     #$F7                            ; 3234: C9 F7    
    beq     Store_Jetman_Direction_X        ; 3236: F0 6A    
    sec                                     ; 3238: 38       
    sbc     #$01                            ; 3239: E9 01    
    jmp     Store_Jetman_Direction_X        ; 323B: 4C A2 32 
; ------------------------------------------

; L_BRS_($323E)_($31EE) OK
; L_BRS_($323E)_($328D) OK
Flying_Right
    pha                                     ; 323E: 48       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 323F: B1 00    
    and     #$7F                            ; 3241: 29 7F    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 3243: 91 00    
    pla                                     ; 3245: 68       

    cmp     #$08                            ; 3246: C9 08    
    beq     Update_Jetman_Position_X_       ; 3248: F0 5C    
    cmp     #$09                            ; 324A: C9 09    
    beq     JMP_Store_Jetman_Dir_X          ; 324C: F0 06    
    clc                                     ; 324E: 18       
    adc     #$01                            ; 324F: 69 01    
    jmp     Store_Jetman_Direction_X        ; 3251: 4C A2 32 
; ------------------------------------------
; L_BRS_($3254)_($324C) OK
JMP_Store_Jetman_Dir_X
    lda     #$08                            ; 3254: A9 08    
    jmp     Store_Jetman_Direction_X        ; 3256: 4C A2 32 
; ------------------------------------------
; HOW DO YOU EVER GET HERE?
    lda     #$F8                            ; 3259: A9 F8    
    jmp     Store_Jetman_Direction_X        ; 325B: 4C A2 32 
; ------------------------------------------
; L_BRS_($325E)_($329D) OK
CLC_ADC_JMP_Store_JM_Dir_X
    clc                                     ; 325E: 18       
    adc     #$01                            ; 325F: 69 01    
    jmp     Store_Jetman_Direction_X        ; 3261: 4C A2 32 
; ------------------------------------------
; L_BRS_($3264)_($32B4) OK
Wrap_Left_To_Right
    clc                                     ; 3264: 18       
    adc     #SCREEN_WIDTH_PIXELS            ; 3265: 69 B8    
    jmp     Store_Jetman_Position_X         ; 3267: 4C BA 32 
; ------------------------------------------
; L_BRS_($326A)_($32B8) OK
Wrap_Right_To_Left
    adc     #$48                            ; 326A: 69 48    
    jmp     Store_Jetman_Position_X         ; 326C: 4C BA 32 
; ------------------------------------------
; L_BRS_($326F)_($3296) OK
TXA_JMP_Update_JM_Pos_X
    txa                                     ; 326F: 8A       
    jmp     Update_Jetman_Position_X_       ; 3270: 4C A6 32 
; ------------------------------------------
JETMAN_FLYING_
    jsr     Load_Object_Type_X_Y            ; 3273: 20 D7 35 
    jsr     Read_Keyboard_Joystick          ; 3276: 20 F7 33  Returns A=%RLDU_F111
    sta     ZP_Jetman_Action                ; 3279: 85 1C    
    jsr     Test_Platform_Collision         ; 327B: 20 B3 30  Remove=Jetman+fuel/ship part pick-up fly through platforms
    lda     ZP02_Collision_Status           ; 327E: A5 02    
    bpl     Update_Jetman_Position_X        ; 3280: 10 03    
    jmp     Jetman_Hits_Surface             ; 3282: 4C F2 31 
; ------------------------------------------
; L_JMP_($3285)_($31CB) OK
; L_JMP_($3285)_($3205) OK
; L_BRS_($3285)_($3280) OK
Update_Jetman_Position_X
    ldy     #JETMAN_DIRECTION_X_PARAM       ; 3285: A0 02    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3287: B1 00    
    ldy     #$00                            ; 3289: A0 00    
    bit     ZP_Jetman_Action                ; 328B: 24 1C    
    bpl     Flying_Right                    ; 328D: 10 AF    
    bvc     Flying_Left                     ; 328F: 50 97    

    tax                                     ; 3291: AA       
    lda     ZP_IRQ_Counter_Lo               ; 3292: A5 4A    
    and     #%00000001                      ; 3294: 29 01    
    beq     TXA_JMP_Update_JM_Pos_X         ; 3296: F0 D7    
    txa                                     ; 3298: 8A       
    cmp     #$00                            ; 3299: C9 00    
    beq     Update_Jetman_Position_X_       ; 329B: F0 09    
    bmi     CLC_ADC_JMP_Store_JM_Dir_X      ; 329D: 30 BF    
    sec                                     ; 329F: 38       
    sbc     #$01                            ; 32A0: E9 01    
; L_JMP_($32A2)_($31D4) OK
; L_JMP_($32A2)_($31E7) OK
; L_BRS_($32A2)_($3236) OK
; L_JMP_($32A2)_($323B) OK
; L_JMP_($32A2)_($3251) OK
; L_JMP_($32A2)_($3256) OK
; L_JMP_($32A2)_($325B) OK
; L_JMP_($32A2)_($3261) OK
Store_Jetman_Direction_X
    ldy     #JETMAN_DIRECTION_X_PARAM       ; 32A2: A0 02    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 32A4: 91 00    
; L_BRS_($32A6)_($3232) OK
; L_BRS_($32A6)_($3248) OK
; L_JMP_($32A6)_($3270) OK
; L_BRS_($32A6)_($329B) OK
Update_Jetman_Position_X_
    ldy     #JETMAN_POSITION_X_PARAM        ; 32A6: A0 01    

    pha                                     ; 32A8: 48       
    rol     a                               ; 32A9: 2A       
    pla                                     ; 32AA: 68       

    php                                     ; 32AB: 08       
    ror     a                               ; 32AC: 6A       
    plp                                     ; 32AD: 28       

    ror     a                               ; 32AE: 6A       
    clc                                     ; 32AF: 18       
    adc     (ZP_Obj_List_Ptr_Lo),y          ; 32B0: 71 00    
    cmp     #$F0                            ; 32B2: C9 F0    
    bcs     Wrap_Left_To_Right              ; 32B4: B0 AE    
    cmp     #SCREEN_WIDTH_PIXELS            ; 32B6: C9 B8    
    bcs     Wrap_Right_To_Left              ; 32B8: B0 B0    
; L_JMP_($32BA)_($3267) OK
; L_JMP_($32BA)_($326C) OK
Store_Jetman_Position_X
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 32BA: 91 00    

    lda     ZP02                            ; 32BC: A5 02    
    bpl     Update_Jetman_Position_Y        ; 32BE: 10 07    
    and     #$0C                            ; 32C0: 29 0C    
    bne     Update_Jetman_Position_Y        ; 32C2: D0 03    
    jmp     Flying_Up_Impact                ; 32C4: 4C 08 32 
; ------------------------------------------
; L_JMP_($32C7)_($3215) OK
; L_JMP_($32C7)_($3225) OK
; L_BRS_($32C7)_($32BE) OK
; L_BRS_($32C7)_($32C2) OK
Update_Jetman_Position_Y
    ldy     #JETMAN_DIRECTION_Y_PARAM       ; 32C7: A0 04    

    lda     ZP_Jetman_Action                ; 32C9: A5 1C    
    bit     MASK_00100000                   ; 32CB: 2C 19 20  Test for direction Down
    beq     Set_Jetman_Direction_Y_Zero     ; 32CE: F0 48     Yes, branch
    bit     MASK_00010000                   ; 32D0: 2C 18 20  Test for direction Up
    beq     Update_Jetman_Direction_Y       ; 32D3: F0 37     Yes, branch

    lda     (ZP_Obj_List_Ptr_Lo),y          ; 32D5: B1 00    
    cmp     #$04                            ; 32D7: C9 04    
    beq     Update_Jetman_Position_Y_       ; 32D9: F0 05    
    clc                                     ; 32DB: 18       
    adc     #$01                            ; 32DC: 69 01    

; L_JMP_($32DE)_($3212) OK
; L_JMP_($32DE)_($3315) OK
; L_JMP_($32DE)_($331A) OK
Store_Jetman_Direction_Y
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 32DE: 91 00    

; L_BRS_($32E0)_($32D9) OK
; L_BRS_($32E0)_($3310) OK
Update_Jetman_Position_Y_
    dey                                     ; 32E0: 88       

    pha                                     ; 32E1: 48       
    rol     a                               ; 32E2: 2A       
    pla                                     ; 32E3: 68       

    ror     a                               ; 32E4: 6A       
    clc                                     ; 32E5: 18       
    adc     (ZP_Obj_List_Ptr_Lo),y          ; 32E6: 71 00    
    cmp     #SCREEN_BOTTOM                  ; 32E8: C9 AF    
    bcs     Set_Jetman_Position_Y_Bottom    ; 32EA: B0 31    
    cmp     #SCREEN_TOP                     ; 32EC: C9 28    
    bcs     Store_Jetman_Parameter          ; 32EE: B0 07    

; Y becomes index to Direction Y
    iny                                     ; 32F0: C8       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 32F1: B1 00    
    beq     Store_Jetman_Parameter          ; 32F3: F0 02    

; Reverse the direction parameter
    eor     #$FF                            ; 32F5: 49 FF    

; Gets called with either Jetman Type (index 0) or Jetman_Position_Y (index 3)
; L_BRS_($32F7)_($32EE) OK
; L_BRS_($32F7)_($32F3) OK
; L_JMP_($32F7)_($3329) OK
; L_JMP_($32F7)_($33D1) OK
Store_Jetman_Parameter
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 32F7: 91 00    

; L_JMP_($32F9)_($33B7) OK
Jetman_Screen_Update
    jsr     Display_Object_Load             ; 32F9: 20 46 36 
    jsr     Colourize_Object                ; 32FC: 20 1F 38 

; Test for fire pressed
    lda     ZP_Jetman_Action                ; 32FF: A5 1C    
    bit     MASK_00001000                   ; 3301: 2C 17 20 
    bne     No_Fire_Pressed                 ; 3304: D0 03    
    jsr     Init_Laser_Objects              ; 3306: 20 E9 20 
; L_BRS_($3309)_($3304) OK
No_Fire_Pressed
    jmp     GOTO_NEXT_OBJECT                ; 3309: 4C 1A 26 
; ------------------------------------------

; Load and test Jetman Y Direction
; L_BRS_($330C)_($32D3) OK
Update_Jetman_Direction_Y
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 330C: B1 00    
    cmp     #$FC                            ; 330E: C9 FC    
    beq     Update_Jetman_Position_Y_       ; 3310: F0 CE    
    sec                                     ; 3312: 38       
    sbc     #$01                            ; 3313: E9 01    
    jmp     Store_Jetman_Direction_Y        ; 3315: 4C DE 32 
; ------------------------------------------

; L_BRS_($3318)_($32CE) OK
Set_Jetman_Direction_Y_Zero
    lda     #$00                            ; 3318: A9 00    
    jmp     Store_Jetman_Direction_Y        ; 331A: 4C DE 32 
; ------------------------------------------

; L_BRS_($331D)_($32EA) OK
Set_Jetman_Position_Y_Bottom
    lda     #$AF                            ; 331D: A9 AF    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 331F: 91 00    

; L_JMP_($3321)_($31FD) OK
Set_Jetman_Standing
    ldy     #JETMAN_STATE_PARAM             ; 3321: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3323: B1 00    

; ROL saves bit 7 (facing direction), LDA #$04 sets bit 2, ROR restores bit 7 and moves
; bit 2 to bit 1 i.e. Jetman action is now Standing
    rol     a                               ; 3325: 2A       
    lda     #$04                            ; 3326: A9 04    
    ror     a                               ; 3328: 6A       
    jmp     Store_Jetman_Parameter          ; 3329: 4C F7 32 
; ------------------------------------------





; ############################################################################################
;  88888 888888 888888 8b    d8    db    88b 88
;     88 88__     88   88b  d88   dPYb   88Yb88
; o.  88 88""     88   88YbdP88  dP__Yb  88 Y88
; "bodP' 888888   88   88 YY 88 dP""""Yb 88  Y8

; .dP"Y8 888888    db    88b 88 8888b.  88 88b 88  dP""b8
; `Ybo."   88     dPYb   88Yb88  8I  Yb 88 88Yb88 dP   `"
; o.`Y8b   88    dP__Yb  88 Y88  8I  dY 88 88 Y88 Yb  "88
; 8bodP'   88   dP""""Yb 88  Y8 8888Y"  88 88  Y8  YboodP
; ############################################################################################

; L_BRS_($332C)_($3381) OK
Set_Jetman_Facing_Right
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 332C: B1 00    
    and     #%01111111                      ; 332E: 29 7F    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 3330: 91 00    
    lda     #$01                            ; 3332: A9 01    
    jmp     Update_JM_Direction_Position_X  ; 3334: 4C 9F 33 
; ------------------------------------------

; L_BRS_($3337)_($3383) OK
Set_Jetman_Facing_Left
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3337: B1 00    
    ora     #%10000000                      ; 3339: 09 80    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 333B: 91 00    
    lda     #$FF                            ; 333D: A9 FF    
    jmp     Update_JM_Direction_Position_X  ; 333F: 4C 9F 33 
; ------------------------------------------

; When Jetman goes off left edge of screen, move to rightmost screen pixel co-ord i.e. $B8
; L_BRS_($3342)_($33A9) OK
Jetman_Wrap_Left_To_Right
    clc                                     ; 3342: 18       
    adc     #SCREEN_WIDTH_PIXELS            ; 3343: 69 B8    
    jmp     Store_Jetman_New_Position_X     ; 3345: 4C AF 33 
; ------------------------------------------

; When Jetman goes off right edge of screen i.e. past $B8, add $48 to screen pixel co-ord making $0
; L_BRS_($3348)_($33AD) OK
Jetman_Wrap_Right_To_Left
    adc     #_100_MINUS_SCREEN_WIDTH_PIXELS ; 3348: 69 48    
    jmp     Store_Jetman_New_Position_X     ; 334A: 4C AF 33 
; ------------------------------------------

JETMAN_STANDING_
    lda     ZP_Flash_Score_Countdown        ; 334D: A5 5D    
    beq     Do_Jetman_Standing              ; 334F: F0 19    

; At start of each life, flash active player score before wave begins, until counter reaches zero
    jsr     Flash_Score                     ; 3351: 20 65 34 
    dec     ZP_Flash_Score_Countdown        ; 3354: C6 5D    
    bne     JMP_Goto_Next_Object            ; 3356: D0 0F    

; Score flashing finished, display Jetman, colourize Jetman and display scores
    jsr     Display_Object_Old_Setup_Load   ; 3358: 20 01 36 
    jsr     Colourize_Object                ; 335B: 20 1F 38 
    jsr     Display_1UP_HI_2UP_Text         ; 335E: 20 25 24 
    jsr     Display_Player_1_Score          ; 3361: 20 71 24 
    jsr     Display_Player_2_Score          ; 3364: 20 81 24 

; L_BRS_($3367)_($3356) OK
JMP_Goto_Next_Object
    jmp     GOTO_NEXT_OBJECT                ; 3367: 4C 1A 26 
; ------------------------------------------

; L_BRS_($336A)_($334F) OK
Do_Jetman_Standing
    jsr     Load_Object_Type_X_Y            ; 336A: 20 D7 35 
    jsr     Read_Keyboard_Joystick          ; 336D: 20 F7 33 
    jsr     Test_Platform_Collision         ; 3370: 20 B3 30 
    lda     ZP02_Collision_Status           ; 3373: A5 02    
    bmi     Set_Jetman_Facing_Direction     ; 3375: 30 06    

; Jetman has walked off edge of platform, test if Position Y is negative, which
; only appears to be the case when Jetman is below all the platforms
    ldy     #JETMAN_POSITION_Y_PARAM        ; 3377: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3379: B1 00    
    bpl     Jetman_From_Standing_To_Flying  ; 337B: 10 43    

; L_BRS_($337D)_($3375) OK
Set_Jetman_Facing_Direction
    ldy     #JETMAN_STATE_PARAM             ; 337D: A0 00    
    bit     ZP_Jetman_Action                ; 337F: 24 1C    
    bpl     Set_Jetman_Facing_Right         ; 3381: 10 A9    
    bvc     Set_Jetman_Facing_Left          ; 3383: 50 B2    

; Test Jetman direction
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 3385: B1 00    
    bmi     Jetman_Walking_Left             ; 3387: 30 04    

; Jetman walking right, prepare new Direction X value
    ldx     #$01                            ; 3389: A2 01    
    bpl     Test_Collision_Status           ; 338B: 10 02    

; Jetman walking left, prepare new Direction X value
; L_BRS_($338D)_($3387) OK
Jetman_Walking_Left
    ldx     #$FF                            ; 338D: A2 FF    

; L_BRS_($338F)_($338B) OK
Test_Collision_Status
    ldy     #JETMAN_DIRECTION_X_PARAM       ; 338F: A0 02    
    lda     ZP02_Collision_Status           ; 3391: A5 02    
    bpl     Jetman_Not_Moving_X_Axis        ; 3393: 10 08    

; Set Zero flag as AND between between content of addr 2015 (i.e. 0000_0010) and A (i.e. ZP02)
; DON'T KNOW WHY, guess need to decode ZP02 collision status
    bit     MASK_00000010                   ; 3395: 2C 15 20 

; Move X into A without affecting the CPU status flags
    php                                     ; 3398: 08       
    txa                                     ; 3399: 8A       
    plp                                     ; 339A: 28       

    bne     Update_JM_Direction_Position_X  ; 339B: D0 02    

; L_BRS_($339D)_($3393) OK
Jetman_Not_Moving_X_Axis
    lda     #$00                            ; 339D: A9 00    

; L_JMP_($339F)_($3334) OK
; L_JMP_($339F)_($333F) OK
; L_BRS_($339F)_($339B) OK
Update_JM_Direction_Position_X
    ldy     #JETMAN_DIRECTION_X_PARAM       ; 339F: A0 02    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 33A1: 91 00    

; Y becomes JETMAN_POSITION_X_PARAM
    dey                                     ; 33A3: 88       
    clc                                     ; 33A4: 18       
    adc     (ZP_Obj_List_Ptr_Lo),y          ; 33A5: 71 00    
    cmp     #$F0                            ; 33A7: C9 F0    
    bcs     Jetman_Wrap_Left_To_Right       ; 33A9: B0 97    

    cmp     #SCREEN_WIDTH_PIXELS            ; 33AB: C9 B8    
    bcs     Jetman_Wrap_Right_To_Left       ; 33AD: B0 99    

; L_JMP_($33AF)_($3345) OK
; L_JMP_($33AF)_($334A) OK
Store_Jetman_New_Position_X
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 33AF: 91 00    

    lda     ZP_Jetman_Action                ; 33B1: A5 1C    
    and     #%00010000                      ; 33B3: 29 10     Test for direction Up
    beq     Update_JM_Direction_Position_Y  ; 33B5: F0 03     Yes, branch
    jmp     Jetman_Screen_Update            ; 33B7: 4C F9 32 
; ------------------------------------------

; L_BRS_($33BA)_($33B5) OK
Update_JM_Direction_Position_Y
    ldy     #JETMAN_DIRECTION_Y_PARAM       ; 33BA: A0 04    
    lda     #$FE                            ; 33BC: A9 FE    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 33BE: 91 00    

; Move Jetman upwards by three pixels
; L_BRS_($33C0)_($337B) OK
Jetman_From_Standing_To_Flying
    ldy     #JETMAN_POSITION_Y_PARAM        ; 33C0: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 33C2: B1 00    
    sec                                     ; 33C4: 38       
    sbc     #$03                            ; 33C5: E9 03    
    sta     (ZP_Obj_List_Ptr_Lo),y          ; 33C7: 91 00    

; Change Jetman state from Standing to Flying
    ldy     #JETMAN_STATE_PARAM             ; 33C9: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 33CB: B1 00    
    rol     a                               ; 33CD: 2A       
    lda     #$02                            ; 33CE: A9 02    
    ror     a                               ; 33D0: 6A       
    jmp     Store_Jetman_Parameter          ; 33D1: 4C F7 32 
; ------------------------------------------





; 88""Yb 888888    db    8888b.
; 88__dP 88__     dPYb    8I  Yb
; 88"Yb  88""    dP__Yb   8I  dY
; 88  Yb 888888 dP""""Yb 8888Y"

; 88  dP 888888 Yb  dP 88""Yb  dP"Yb     db    88""Yb 8888b.
; 88odP  88__    YbdP  88__dP dP   Yb   dPYb   88__dP  8I  Yb
; 88"Yb  88""     8P   88""Yb Yb   dP  dP__Yb  88"Yb   8I  dY
; 88  Yb 888888  dP    88oodP  YbodP  dP""""Yb 88  Yb 8888Y"

;  88888  dP"Yb  Yb  dP .dP"Y8 888888 88  dP""b8 88  dP
;     88 dP   Yb  YbdP  `Ybo."   88   88 dP   `" 88odP
; o.  88 Yb   dP   8P   o.`Y8b   88   88 Yb      88"Yb
; "bodP'  YbodP   dP    8bodP'   88   88  YboodP 88  Yb

; VIA Port A Bit 2=Up, 3=Down, 4=Left, 5=Fire
; Port A read twice, 1st for Up/Down/Left, 2nd for Fire
; Port A reads $7C=%0111_1100 when nothing pressed i.e. joystick inputs are active low
; VIA Port B Bit 7=Left
; Port B read once for Right
; Port B reads $FF=%1111_1111 when nothing pressed i.e. joystick inputs are active low
; L_BRS_($33D4)_($33FD) OK
Read_Joystick
    lda     VIA1_Port_A                     ; 33D4: AD 11 91  %xxxL_DUxx
    rol     a                               ; 33D7: 2A       
    rol     a                               ; 33D8: 2A       
    ora     #%10001111                      ; 33D9: 09 8F     %1LDU_1111
    sta     ZP_Jetman_Action                ; 33DB: 85 1C     $FF when nothing pressed

; Read Fire button
    lda     VIA1_Port_A                     ; 33DD: AD 11 91  %xxFx_xxxx
    ror     a                               ; 33E0: 6A       
    ror     a                               ; 33E1: 6A       
    ora     #%11110111                      ; 33E2: 09 F7     %1111_F111
    and     ZP_Jetman_Action                ; 33E4: 25 1C     %1LDU_F111
    sta     ZP_Jetman_Action                ; 33E6: 85 1C     $FF when nothing pressed

; Read direction Right
    lda     #$00                            ; 33E8: A9 00    
    sta     VIA2_DDR_B                      ; 33EA: 8D 22 91  Set Port B direction all lines read
    lda     VIA2_Port_B                     ; 33ED: AD 20 91  %Rxxx_xxxx
    ora     #%01111111                      ; 33F0: 09 7F     %R111_1111
    and     ZP_Jetman_Action                ; 33F2: 25 1C     %RLDU_F111
    sta     ZP_Jetman_Action                ; 33F4: 85 1C     $FF when nothing pressed
    rts                                     ; 33F6: 60       
; ==========================================

; If joystick selected, branch and return without reading keyboard
; L_JSR_($33F7)_($3276) OK
; L_JSR_($33F7)_($336D) OK
Read_Keyboard_Joystick
    lda     Game_Settings                   ; 33F7: AD D3 1F 
    bit     MASK_00000010                   ; 33FA: 2C 15 20 
    bne     Read_Joystick                   ; 33FD: D0 D5    

; Read Keyboard, only executed when joystick not selected
; Setup outputs to enable reading of Keyboard matrix
    lda     #%11111111                      ; 33FF: A9 FF     Set Port A to all output
    sta     VIA2_DDR_A                      ; 3401: 8D 23 91 
    lda     #%10000001                      ; 3404: A9 81     Set Port A outputs
    sta     VIA2_Port_A                     ; 3406: 8D 21 91 
    lda     #%00000000                      ; 3409: A9 00     Set Port B to all inputs
    sta     VIA2_DDR_B                      ; 340B: 8D 22 91 

; Read keyboard matrix, multiple keys can be pressed for each direction and fire, see
; hardware documentation for more detail
; Read right & left input keys at the same time (L: Z C B M . RSHFT) (R: LSHFT X V N , /)
    lda     VIA2_Port_B                     ; 340E: AD 20 91  %xxxR_Lxxx
    rol     a                               ; 3411: 2A       
    rol     a                               ; 3412: 2A       
    rol     a                               ; 3413: 2A       
    ora     #%00111111                      ; 3414: 09 3F     %RL11_1111
    sta     ZP_Jetman_Action                ; 3416: 85 1C     %RL11_1111

; Read Fire input keys, set 1 (S F H K : =)
    lda     VIA2_Port_B                     ; 3418: AD 20 91  %xxFx_xxxx
    tay                                     ; 341B: A8       
    ror     a                               ; 341C: 6A       
    ror     a                               ; 341D: 6A       
    ora     #%11110111                      ; 341E: 09 F7     %1111_F111
    and     ZP_Jetman_Action                ; 3420: 25 1C    
    sta     ZP_Jetman_Action                ; 3422: 85 1C     %RL11_F111

; Read Fire input keys, set 2 (A D G J L ;)
    tya                                     ; 3424: 98        %xxxx_xFxx
    rol     a                               ; 3425: 2A       
    ora     #%11110111                      ; 3426: 09 F7     %1111_F111
    and     ZP_Jetman_Action                ; 3428: 25 1C    
    sta     ZP_Jetman_Action                ; 342A: 85 1C     %RL11_F111

; Read Up input keys, set 1 (Q E T U O @ UA)
    lda     #%10000000                      ; 342C: A9 80    
    sta     VIA2_Port_A                     ; 342E: 8D 21 91 
    lda     VIA2_Port_B                     ; 3431: AD 20 91  %xUxx_xxxx
    ror     a                               ; 3434: 6A       
    ror     a                               ; 3435: 6A       
    ora     #%11101111                      ; 3436: 09 EF     %111U_1111
    and     ZP_Jetman_Action                ; 3438: 25 1C    
    sta     ZP_Jetman_Action                ; 343A: 85 1C     %RL1U_F111

; Read Up input keys, set 2 (W R Y I P *)
    lda     #%10000001                      ; 343C: A9 81    
    sta     VIA2_Port_A                     ; 343E: 8D 21 91 
    lda     VIA2_Port_B                     ; 3441: AD 20 91  %xxxx_xxUx
    rol     a                               ; 3444: 2A       
    rol     a                               ; 3445: 2A       
    rol     a                               ; 3446: 2A       
    ora     #%11101111                      ; 3447: 09 EF     %111U_1111
    and     ZP_Jetman_Action                ; 3449: 25 1C    
    sta     ZP_Jetman_Action                ; 344B: 85 1C     %RL1U_F111

; Read Down input keys, set 1 and 2 (2 4 6 8 0 - HOM) & (1 3 5 7 9 + BP)
    lda     #%10000000                      ; 344D: A9 80    
    sta     VIA2_Port_A                     ; 344F: 8D 21 91 
    lda     VIA2_Port_B                     ; 3452: AD 20 91  %Dxxx_xxxD
    tay                                     ; 3455: A8       
    jsr     Read_Keyboard_Down              ; 3456: 20 5C 34 
    tya                                     ; 3459: 98       
    ror     a                               ; 345A: 6A       
    ror     a                               ; 345B: 6A       

; L_JSR_($345C)_($3456) OK
Read_Keyboard_Down
    ror     a                               ; 345C: 6A       
    ror     a                               ; 345D: 6A       
    ora     #%11011111                      ; 345E: 09 DF     %11D1_1111
    and     ZP_Jetman_Action                ; 3460: 25 1C    
    sta     ZP_Jetman_Action                ; 3462: 85 1C     %RLDU_F111
    rts                                     ; 3464: 60       
; ==========================================





; 888888 88        db    .dP"Y8 88  88     .dP"Y8  dP""b8  dP"Yb  88""Yb 888888
; 88__   88       dPYb   `Ybo." 88  88     `Ybo." dP   `" dP   Yb 88__dP 88__
; 88""   88  .o  dP__Yb  o.`Y8b 888888     o.`Y8b Yb      Yb   dP 88"Yb  88""
; 88     88ood8 dP""""Yb 8bodP' 88  88     8bodP'  YboodP  YbodP  88  Yb 888888

; Reverse video the displayed score area for the active player
; L_JSR_($3465)_($3351) OK
Flash_Score
    lda     ZP_Active_Player                ; 3465: A5 5E    
    bne     Load_UDG_RAM_Addr_Player_2      ; 3467: D0 31    
    jsr     Load_ZP_Parameters              ; 3469: 20 9D 25 
    fcb     $04                             ; 346C: 04        ZP04
    fcb     $00,$00                         ; 346D: 00 00     X Y position in pixels
    fcb     $FF                             ; 346F: FF       

; L_JMP_($3470)_($34A1) OK
Flash_Score_Start
    jsr     Convert_XY_to_UDG_RAM_Address   ; 3470: 20 1D 35 

; Test IRQ counter, only continue once in 8 calls
    lda     ZP_IRQ_Counter_Lo               ; 3473: A5 4A    
    and     #%00000111                      ; 3475: 29 07    
    bne     RTS_Flash_Score                 ; 3477: D0 20    

    ldx     #NUM_OF_COLUMNS_TO_REVERSE      ; 3479: A2 06    

; L_JMP_($347B)_($3496) OK
Loop_Reverse_UDG_Column
    ldy     #NUM_PIXEL_OF_LINES_TO_REVERSE  ; 347B: A0 0F    

; Get current byte of character, reverse it and write it back
; L_BRS_($347D)_($3484) OK
Loop_Reverse_UDG_Pixel_Line
    lda     (ZP04_UDG_RAM_Addr_Lo),y        ; 347D: B1 04    
    eor     #%11111111                      ; 347F: 49 FF    
    sta     (ZP04_UDG_RAM_Addr_Lo),y        ; 3481: 91 04    

; All lines reversed? If no, loop back
    dey                                     ; 3483: 88       
    bpl     Loop_Reverse_UDG_Pixel_Line     ; 3484: 10 F7    

; All columns reversed? If yes, return
    dex                                     ; 3486: CA       
    beq     RTS_Flash_Score                 ; 3487: F0 10    

; Move to next column by adding a columns-worth ($B0 #176) of pixel lines to 16-bit UDG RAM Address
    lda     ZP04_UDG_RAM_Addr_Lo            ; 3489: A5 04    
    clc                                     ; 348B: 18       
    adc     #SCREEN_HEIGHT_PIXELS           ; 348C: 69 B0    
    sta     ZP04_UDG_RAM_Addr_Lo            ; 348E: 85 04    

    lda     ZP05_UDG_RAM_Addr_Hi            ; 3490: A5 05    
    adc     #$00                            ; 3492: 69 00    
    sta     ZP05_UDG_RAM_Addr_Hi            ; 3494: 85 05    

    jmp     Loop_Reverse_UDG_Column         ; 3496: 4C 7B 34 
; ------------------------------------------

; L_BRS_($3499)_($3477) OK
; L_BRS_($3499)_($3487) OK
RTS_Flash_Score
    rts                                     ; 3499: 60       
; ==========================================

; L_BRS_($349A)_($3467) OK
Load_UDG_RAM_Addr_Player_2
    jsr     Load_ZP_Parameters              ; 349A: 20 9D 25 
    fcb     $04                             ; 349D: 04        ZP04
    fcb     $80,$00                         ; 349E: 80 00     X Y position in pixels
    fcb     $FF                             ; 34A0: FF       
    jmp     Flash_Score_Start               ; 34A1: 4C 70 34 
; ------------------------------------------





; 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP     88""Yb  dP""b8 8888b.
;  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP      88__dP dP   `"  8I  Yb
;  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P       88""Yb Yb       8I  dY
; 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP        88oodP  YboodP 8888Y"

; 88""Yb Yb  dP 888888 888888 .dP"Y8
; 88__dP  YbdP    88   88__   `Ybo."
; 88""Yb   8P     88   88""   o.`Y8b
; 88oodP  dP      88   888888 8bodP'

; Example for score of 12 34 56 at ZP51-53
; L_JMP_($34A4)_($247E) OK
; L_JMP_($34A4)_($248E) OK
; L_JMP_($34A4)_($249E) OK
; L_BRS_($34A4)_($34C9) OK
Display_BCD_Bytes
    ldy     #$00                            ; 34A4: A0 00    

; Load the first score byte e.g. A = 12 BCD i.e. First score byte of 12 34 56
    lda     (ZP0E_Score_Data_Addr_Lo),y     ; 34A6: B1 0E    

; Divide by $10 to isolate first digit e.g. 12 becomes 01
    lsr     a                               ; 34A8: 4A       
    lsr     a                               ; 34A9: 4A       
    lsr     a                               ; 34AA: 4A       
    lsr     a                               ; 34AB: 4A       

; Add $70, $40 gets subtracted in display routine, thus making 01 into a PETSCII "1"
    clc                                     ; 34AC: 18       
    adc     #PETSCII_OFFSET                 ; 34AD: 69 70    
    sta     ZP06_Character_To_Display       ; 34AF: 85 06    
    jsr     Copy_Char_To_UDG_RAM_Setup      ; 34B1: 20 95 35 

; Load first score byte again to display second score character
    ldy     #$00                            ; 34B4: A0 00    
    lda     (ZP0E_Score_Data_Addr_Lo),y     ; 34B6: B1 0E    

; Zero top 4 bits to isolate second digit e.g. 12 becomes 02
    and     #%00001111                      ; 34B8: 29 0F    

; Add $70, $40 gets subtracted in display routine, thus making 02 into a PETSCII "2"
    adc     #PETSCII_OFFSET                 ; 34BA: 69 70    
    sta     ZP06_Character_To_Display       ; 34BC: 85 06    
    jsr     Copy_Char_To_UDG_RAM_Setup      ; 34BE: 20 95 35 

; Increment address pointer to next score byte
    inc     ZP0E_Score_Data_Addr_Lo         ; 34C1: E6 0E    
    bne     Test_All_Bytes_Displayed        ; 34C3: D0 02    

; Looks like a BUG, should inc ZP0F, but in JETPAC it'll never happen
    inc     ZP07_Score_Data_Addr_Hi         ; 34C5: E6 07    

; Test all score bytes displayed, if not, loop back
; L_BRS_($34C7)_($34C3) OK
Test_All_Bytes_Displayed
    dec     ZP02_Num_Bytes_To_Display       ; 34C7: C6 02    
    bne     Display_BCD_Bytes               ; 34C9: D0 D9    
    rts                                     ; 34CB: 60       
; ==========================================

; L_JSR_($34CC)_($2445) OK
; L_JSR_($34CC)_($24D4) OK
; L_JSR_($34CC)_($24E1) OK
; L_JSR_($34CC)_($29F8) OK
Display_String_With_Setup
    jsr     Setup_Colour_RAM_Address        ; 34CC: 20 F7 34 
    jsr     Convert_XY_to_UDG_RAM_Address   ; 34CF: 20 1D 35 

; Get string first byte header data, contains colour data and reverse flag
    ldy     #$00                            ; 34D2: A0 00    
    lda     (ZP0E_String_Addr_Lo),y         ; 34D4: B1 0E    

; Write a string of data to the screen, header byte includes reverse flag and colour attribute
; Save colour data and reverse flag to Register X
; L_JSR_($34D6)_($2506) OK
; L_JMP_($34D6)_($34E0) OK
Display_String
    tax                                     ; 34D6: AA       

; Get character to display and test if bit 7 is set, which signifies end of string
    iny                                     ; 34D7: C8       
    lda     (ZP0E_String_Addr_Lo),y         ; 34D8: B1 0E    
    asl     a                               ; 34DA: 0A       

; If end of string then branch/display/RTS else JSR/display/next_char
    bcs     Display_Character               ; 34DB: B0 06    
    jsr     Display_Character               ; 34DD: 20 E3 34 
    jmp     Display_String                  ; 34E0: 4C D6 34 
; ------------------------------------------

; Restore character value after testing for end of string, excluding end of string marker bit
; L_BRS_($34E3)_($34DB) OK
; L_JSR_($34E3)_($34DD) OK
Display_Character
    lsr     a                               ; 34E3: 4A       
    sta     ZP06_Character_To_Display       ; 34E4: 85 06    

; Setup character display colour and reverse bit
    txa                                     ; 34E6: 8A       
    sta     ZP_Reverse_And_Colour_Data      ; 34E7: 85 57    

; Display character on screen, saving Register Y and restoring afterwards
    tya                                     ; 34E9: 98       
    pha                                     ; 34EA: 48       
    jsr     Copy_Char_To_UDG_RAM_Setup      ; 34EB: 20 95 35 
    pla                                     ; 34EE: 68       
    tay                                     ; 34EF: A8       

; Colourize the character just displayed
    lda     ZP_Reverse_And_Colour_Data      ; 34F0: A5 57    
    dey                                     ; 34F2: 88       
    sta     (ZP0C_Colour_RAM_Addr_Lo),y     ; 34F3: 91 0C    
    iny                                     ; 34F5: C8       
    rts                                     ; 34F6: 60       
; ==========================================





; .dP"Y8 888888 888888 88   88 88""Yb      dP""b8  dP"Yb  88      dP"Yb  88   88 88""Yb
; `Ybo." 88__     88   88   88 88__dP     dP   `" dP   Yb 88     dP   Yb 88   88 88__dP
; o.`Y8b 88""     88   Y8   8P 88"""      Yb      Yb   dP 88  .o Yb   dP Y8   8P 88"Yb
; 8bodP' 888888   88   `YbodP' 88          YboodP  YbodP  88ood8  YbodP  `YbodP' 88  Yb

; 88""Yb    db    8b    d8        db    8888b.  8888b.  88""Yb 888888 .dP"Y8 .dP"Y8
; 88__dP   dPYb   88b  d88       dPYb    8I  Yb  8I  Yb 88__dP 88__   `Ybo." `Ybo."
; 88"Yb   dP__Yb  88YbdP88      dP__Yb   8I  dY  8I  dY 88"Yb  88""   o.`Y8b o.`Y8b
; 88  Yb dP""""Yb 88 YY 88     dP""""Yb 8888Y"  8888Y"  88  Yb 888888 8bodP' 8bodP'

; Example for "F7 JOYSTICK" start position
; Convert X=$18 pixels from left, Y=$68 pixels from top, to Colour RAM Address $968D
; L_JSR_($34F7)_($21BB) OK
; L_JSR_($34F7)_($24FA) OK
; L_JSR_($34F7)_($27FF) OK
; L_JSR_($34F7)_($2F13) OK
; L_JSR_($34F7)_($3165) OK
; L_JSR_($34F7)_($34CC) OK
; L_JSR_($34F7)_($3827) OK
Setup_Colour_RAM_Address
    lda     ZP04_Position_X                 ; 34F7: A5 04     ZP04 = %0001_1000 = $18

; Divide X by 8 to get initial address Lo-byte
    lsr     a                               ; 34F9: 4A       
    lsr     a                               ; 34FA: 4A       
    lsr     a                               ; 34FB: 4A       
    sta     ZP0C_Colour_RAM_Addr_Lo         ; 34FC: 85 0C     ZP0C = %0000_0011 = $03

; Divide Y by $10 and use as index into Colour RAM Row Offsets i.e. 9600, 9617, 962e etc.
; to get address Hi-byte. Divided by $10 because there are 16 Y-pixels per Colour RAM tile.
    lda     ZP05_Position_Y                 ; 34FE: A5 05     ZP05 = %0110_1000 = $68
    lsr     a                               ; 3500: 4A       
    lsr     a                               ; 3501: 4A       
    lsr     a                               ; 3502: 4A       
    lsr     a                               ; 3503: 4A        ZP05 = %0000_0110 = $06
    tax                                     ; 3504: AA       

; Load from column offset table and add in the initial address Lo-byte
    lda     Colour_RAM_Row_Offset_Table,x   ; 3505: BD 12 35  A = $8A
    clc                                     ; 3508: 18       
    adc     ZP0C_Colour_RAM_Addr_Lo         ; 3509: 65 0C    
    sta     ZP0C_Colour_RAM_Addr_Lo         ; 350B: 85 0C     ZP0C = $8D

; Add $9600 to address in ZP0D/0C to become $968D i.e. "F7 JOYSTICK" start position
    lda     #COLOUR_RAM_START_HI_BYTE       ; 350D: A9 96    
    sta     ZP0D_Colour_RAM_Addr_Hi         ; 350F: 85 0D     ZP0D/0C = $968D
    rts                                     ; 3511: 60       
; ==========================================

Colour_RAM_Row_Offset_Table
    fcb     $00,$17,$2E,$45,$5C,$73,$8A,$A1 ; 3512: 00 17 2E 45 5C 73 8A A1 
    fcb     $B8,$CF,$E6                     ; 351A: B8 CF E6 





;  dP""b8  dP"Yb  88b 88 Yb    dP 888888 88""Yb 888888     Yb  dP Yb  dP
; dP   `" dP   Yb 88Yb88  Yb  dP  88__   88__dP   88        YbdP   YbdP
; Yb      Yb   dP 88 Y88   YbdP   88""   88"Yb    88        dPYb    8P
;  YboodP  YbodP  88  Y8    YP    888888 88  Yb   88       dP  Yb  dP

; 888888  dP"Yb      88   88 8888b.   dP""b8     88""Yb    db    8b    d8
;   88   dP   Yb     88   88  8I  Yb dP   `"     88__dP   dPYb   88b  d88
;   88   Yb   dP     Y8   8P  8I  dY Yb  "88     88"Yb   dP__Yb  88YbdP88
;   88    YbodP      `YbodP' 8888Y"   YboodP     88  Yb dP""""Yb 88 YY 88

;    db    8888b.  8888b.  88""Yb 888888 .dP"Y8 .dP"Y8
;   dPYb    8I  Yb  8I  Yb 88__dP 88__   `Ybo." `Ybo."
;  dP__Yb   8I  dY  8I  dY 88"Yb  88""   o.`Y8b o.`Y8b
; dP""""Yb 8888Y"  8888Y"  88  Yb 888888 8bodP' 8bodP'

; Example for "F7 JOYSTICK" start position
; Convert X=$18 pixels from left, Y=$68 pixels from top, to UDG RAM Address $1278
; Position X Y at 0,0 = bottom left corner of object to display
; L_JSR_($351D)_($21BE) OK
; L_JSR_($351D)_($226E) OK
; L_JSR_($351D)_($24FD) OK
; L_JSR_($351D)_($3168) OK
; L_JSR_($351D)_($3470) OK
; L_JSR_($351D)_($34CF) OK
; L_JSR_($351D)_($375D) OK
; L_JSR_($351D)_($37AB) OK
Convert_XY_to_UDG_RAM_Address
    lda     ZP05_Position_Y                 ; 351D: A5 05     ZP05 = %0110_1000 = $68
    tay                                     ; 351F: A8       

; Divide X by 8 to get address Lo-byte
    lda     ZP04_Position_X                 ; 3520: A5 04     ZP04 = %0001_1000 = $18
    lsr     a                               ; 3522: 4A       
    lsr     a                               ; 3523: 4A       
    lsr     a                               ; 3524: 4A        ZP04 = %0000_0011 = $03
    tax                                     ; 3525: AA       

; Load from column offset table
    lda     UDG_RAM_Column_Offset_Table,x   ; 3526: BD 45 35  A = $21
    sta     ZP04_Position_X                 ; 3529: 85 04    
    lda     #$00                            ; 352B: A9 00    
    sta     ZP05_Position_Y                 ; 352D: 85 05     ZP05/04 = $0021

; Rotate 16-bit address left by 4 bits
    ldx     #$04                            ; 352F: A2 04    
; L_BRS_($3531)_($3536) OK
Loop_Rotate
    asl     ZP04_UDG_RAM_Addr_Lo            ; 3531: 06 04    
    rol     ZP05_UDG_RAM_Addr_Hi            ; 3533: 26 05    
    dex                                     ; 3535: CA       
    bne     Loop_Rotate                     ; 3536: D0 F9     ZP05/04 $0021 > $0210

; Add Register Y saved earlier to address in ZP05/04
    tya                                     ; 3538: 98        Register A becomes $68
    clc                                     ; 3539: 18       
    adc     ZP04_UDG_RAM_Addr_Lo            ; 353A: 65 04    
    sta     ZP04_UDG_RAM_Addr_Lo            ; 353C: 85 04     ZP05/04 = $0278

; Add $1000 to address in ZP05/04 to become $1278 i.e. "F7 JOYSTICK" start position
    lda     #$10                            ; 353E: A9 10    
    adc     ZP05_UDG_RAM_Addr_Hi            ; 3540: 65 05    
    sta     ZP05_UDG_RAM_Addr_Hi            ; 3542: 85 05     ZP05/04 = $1278
    rts                                     ; 3544: 60       
; ==========================================

; Bytes are middle two numbers in UDG RAM addr starting at $1000 e.g. $10B0, $1160 etc.
UDG_RAM_Column_Offset_Table
    fcb     $00,$0B,$16,$21,$2C,$37,$42,$4D ; 3545: 00 0B 16 21 2C 37 42 4D 
    fcb     $58,$63,$6E,$79,$84,$8F,$9A,$A5 ; 354D: 58 63 6E 79 84 8F 9A A5 
    fcb     $B0,$BB,$C6,$D1,$DC,$E7,$F2     ; 3555: B0 BB C6 D1 DC E7 F2 





; 88""Yb 888888 .dP"Y8 888888 888888     88""Yb    db    8b    d8
; 88__dP 88__   `Ybo." 88__     88       88__dP   dPYb   88b  d88
; 88"Yb  88""   o.`Y8b 88""     88       88"Yb   dP__Yb  88YbdP88
; 88  Yb 888888 8bodP' 888888   88       88  Yb dP""""Yb 88 YY 88

; Fill 11 rows x 23 columns = 253 bytes = $FD bytes i.e. Colour_RAM $9600 to $96FC
; L_JSR_($355C)_($2416) OK
Reset_Colour_RAM
    jsr     Load_ZP_Parameters              ; 355C: 20 9D 25 
    fcb     $02                             ; 355F: 02       
    fdb     $00FC                           ; 3560: FC 00     Number of bytes to fill
    fcb     $04                             ; 3562: 04       
    fdb     Colour_RAM                      ; 3563: 00 96     Start address of bytes to fill
    fcb     $06                             ; 3565: 06       
    fdb     $0001                           ; 3566: 01 00     Data byte to fill with (i.e. $01)
    fcb     $FF                             ; 3568: FF       
    jmp     Fill_RAM                        ; 3569: 4C 79 35 
; ------------------------------------------

; Fill 22 rows x 8 lines x 23 columns = 4,048 bytes = $FD0 bytes i.e. UDG_RAM $1000 to $1FCF
; L_JSR_($356C)_($2419) OK
Reset_UDG_RAM
    jsr     Load_ZP_Parameters              ; 356C: 20 9D 25 
    fcb     $02                             ; 356F: 02       
    fdb     $0FCF                           ; 3570: CF 0F     Number of bytes to fill
    fcb     $04                             ; 3572: 04       
    fdb     UDG_RAM                         ; 3573: 00 10     Start address of bytes to fill
    fcb     $06                             ; 3575: 06       
    fdb     $0000                           ; 3576: 00 00     Data byte to fill with (i.e. $00)
    fcb     $FF                             ; 3578: FF       

; Fill ZP02/03 number of bytes of RAM starting at address ZP02/03 with data in ZP06
; L_JMP_($3579)_($3569) OK
Fill_RAM
    ldy     #$00                            ; 3579: A0 00    

; L_BRS_($357B)_($358A) OK
; L_BRS_($357B)_($3592) OK
Loop_Fill_RAM
    lda     ZP06_Fill_Data_Byte             ; 357B: A5 06    
    sta     (ZP04_Addr_To_Fill_Lo),y        ; 357D: 91 04    

    iny                                     ; 357F: C8       
    bne     No_Inc_Addr_Hi                  ; 3580: D0 02    
    inc     ZP05_Addr_To_Fill_Hi            ; 3582: E6 05    

; L_BRS_($3584)_($3580) OK
No_Inc_Addr_Hi
    dec     ZP02_Num_Of_Bytes_To_Fill_Lo    ; 3584: C6 02    
    lda     ZP02_Num_Of_Bytes_To_Fill_Lo    ; 3586: A5 02    
    cmp     #$FF                            ; 3588: C9 FF    
    bne     Loop_Fill_RAM                   ; 358A: D0 EF    

    dec     ZP03_Num_Of_Bytes_To_Fill_Hi    ; 358C: C6 03    
    lda     ZP03_Num_Of_Bytes_To_Fill_Hi    ; 358E: A5 03    
    cmp     #$FF                            ; 3590: C9 FF    
    bne     Loop_Fill_RAM                   ; 3592: D0 E7    
    rts                                     ; 3594: 60       





;  dP""b8  dP"Yb  88""Yb Yb  dP     dP""b8 88  88    db    88""Yb
; dP   `" dP   Yb 88__dP  YbdP     dP   `" 88  88   dPYb   88__dP
; Yb      Yb   dP 88"""    8P      Yb      888888  dP__Yb  88"Yb
;  YboodP  YbodP  88      dP        YboodP 88  88 dP""""Yb 88  Yb

; 888888  dP"Yb      88   88 8888b.   dP""b8     88""Yb    db    8b    d8
;   88   dP   Yb     88   88  8I  Yb dP   `"     88__dP   dPYb   88b  d88
;   88   Yb   dP     Y8   8P  8I  dY Yb  "88     88"Yb   dP__Yb  88YbdP88
;   88    YbodP      `YbodP' 8888Y"   YboodP     88  Yb dP""""Yb 88 YY 88

; Copy Character ROM Character to User-Defined Graphics Memory

; Character to copy stored in ZP06, create Character ROM address in ZP07/06 for this
; value and copy 8 data bytes from that address to UDG RAM address stored in ZP05/04
; Example: Display "1" using $71 in ZP06
; L_JSR_($3595)_($2393) OK
; L_JSR_($3595)_($23AC) OK
; L_JMP_($3595)_($23B3) OK
; L_JSR_($3595)_($34B1) OK
; L_JSR_($3595)_($34BE) OK
; L_JSR_($3595)_($34EB) OK
Copy_Char_To_UDG_RAM_Setup
    lda     #$00                            ; 3595: A9 00     Clear address hi-byte
    sta     ZP07_Char_ROM_Data_Addr_Hi      ; 3597: 85 07     ZP07/06 = $0071

; Example character to display in ZP06, "1" = $71
; $31st Character ROM character is "1" so subtract $40
    lda     ZP06_Char_ROM_Data_Addr_Lo      ; 3599: A5 06    
    sec                                     ; 359B: 38       
    sbc     #$40                            ; 359C: E9 40    
    sta     ZP06_Char_ROM_Data_Addr_Lo      ; 359E: 85 06     ZP07/06 = $0031

; 8 bytes per UDG RAM character definition, so multiply by 8 using four 16 bit ROLs
    ldx     #$03                            ; 35A0: A2 03    

; L_BRS_($35A2)_($35A8) OK
Loop_Multiply_by_8
    clc                                     ; 35A2: 18       
    rol     ZP06_Char_ROM_Data_Addr_Lo      ; 35A3: 26 06    
    rol     ZP07_Char_ROM_Data_Addr_Hi      ; 35A5: 26 07     ZP07/06 progression:
    dex                                     ; 35A7: CA        $0031 > $0062 > $00C4 > $0188
    bne     Loop_Multiply_by_8              ; 35A8: D0 F8    

; Add $8000 Character ROM offset to address, $8188 is Character ROM address for character "1"
    lda     ZP07_Char_ROM_Data_Addr_Hi      ; 35AA: A5 07    
    adc     #CHARACTER_ROM_START_HI_BYTE    ; 35AC: 69 80    
    sta     ZP07_Char_ROM_Data_Addr_Hi      ; 35AE: 85 07     ZP07/06 = $8188

; Copy 8 bytes to display a complete character
; Displayed character can be normal or reversed, e.g. for score or selected game options
    ldy     #$07                            ; 35B0: A0 07    
    lda     ZP_Reverse_And_Colour_Data      ; 35B2: A5 57    
    bmi     Copy_Char_To_UDG_RAM_Reversed   ; 35B4: 30 15    

; L_JMP_($35B6)_($239F) OK
; L_JSR_($35B6)_($3175) OK
; L_JSR_($35B6)_($317D) OK
; L_BRS_($35B6)_($35BB) OK
Copy_Char_To_UDG_RAM
    lda     (ZP06_Char_ROM_Data_Addr_Lo),y  ; 35B6: B1 06    
    sta     (ZP04_UDG_RAM_Addr_Lo),y        ; 35B8: 91 04    

    dey                                     ; 35BA: 88       
    bpl     Copy_Char_To_UDG_RAM            ; 35BB: 10 F9    

; Move 16-bit UDG RAM address to the next-right column, $B0=176=number of vertical pixels
; L_JMP_($35BD)_($35D4) OK
Next_Column
    lda     ZP04_UDG_RAM_Addr_Lo            ; 35BD: A5 04    
    clc                                     ; 35BF: 18       
    adc     #SCREEN_HEIGHT_PIXELS           ; 35C0: 69 B0    
    sta     ZP04_UDG_RAM_Addr_Lo            ; 35C2: 85 04    

    lda     ZP05_UDG_RAM_Addr_Hi            ; 35C4: A5 05    
    adc     #$00                            ; 35C6: 69 00    
    sta     ZP05_UDG_RAM_Addr_Hi            ; 35C8: 85 05    
    rts                                     ; 35CA: 60       
; ==========================================

; Copy 8 bytes to display a complete character, EOR reverses the byte displayed
; L_BRS_($35CB)_($35B4) OK
; L_BRS_($35CB)_($35D2) OK
Copy_Char_To_UDG_RAM_Reversed
    lda     (ZP06_Char_ROM_Data_Addr_Lo),y  ; 35CB: B1 06    
    eor     #$FF                            ; 35CD: 49 FF    
    sta     (ZP04_UDG_RAM_Addr_Lo),y        ; 35CF: 91 04    

    dey                                     ; 35D1: 88       
    bpl     Copy_Char_To_UDG_RAM_Reversed   ; 35D2: 10 F7    
    jmp     Next_Column                     ; 35D4: 4C BD 35 
; ------------------------------------------





; 88      dP"Yb     db    8888b.       dP"Yb  88""Yb  88888 888888  dP""b8 888888
; 88     dP   Yb   dPYb    8I  Yb     dP   Yb 88__dP     88 88__   dP   `"   88
; 88  .o Yb   dP  dP__Yb   8I  dY     Yb   dP 88""Yb o.  88 88""   Yb        88
; 88ood8  YbodP  dP""""Yb 8888Y"       YbodP  88oodP "bodP' 888888  YboodP   88

; 888888 Yb  dP 88""Yb 888888     Yb  dP     Yb  dP
;   88    YbdP  88__dP 88__        YbdP       YbdP
;   88     8P   88"""  88""        dPYb        8P
;   88    dP    88     888888     dP  Yb      dP

;  dP""b8  dP"Yb  88      dP"Yb  88   88 88""Yb
; dP   `" dP   Yb 88     dP   Yb 88   88 88__dP
; Yb      Yb   dP 88  .o Yb   dP Y8   8P 88"Yb
;  YboodP  YbodP  88ood8  YbodP  `YbodP' 88  Yb

; L_JSR_($35D7)_($283E) OK
; L_JSR_($35D7)_($2C61) OK
; L_JSR_($35D7)_($2E17) OK
; L_JSR_($35D7)_($2E4E) OK
; L_JSR_($35D7)_($2E74) OK
; L_JSR_($35D7)_($2F8E) OK
; L_JSR_($35D7)_($2FEE) OK
; L_JSR_($35D7)_($3273) OK
; L_JSR_($35D7)_($336A) OK
Load_Object_Type_X_Y
    ldy     #OBJECT_TYPE_PARAM              ; 35D7: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 35D9: B1 00    
    sta     ZP12_Object_Type                ; 35DB: 85 12    

    iny                                     ; 35DD: C8       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 35DE: B1 00    
    sta     ZP10_Object_Position_X          ; 35E0: 85 10    

    ldy     #OBJECT_POSITION_Y_PARAM        ; 35E2: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 35E4: B1 00    
    sta     ZP11_Object_Position_Y          ; 35E6: 85 11    
    rts                                     ; 35E8: 60       
; ==========================================
; L_JSR_($35E9)_($231C) OK
; L_JSR_($35E9)_($2851) OK
; L_JSR_($35E9)_($2936) OK
; L_JSR_($35E9)_($2BD1) OK
; L_JSR_($35E9)_($2DCE) OK
; L_JSR_($35E9)_($2E96) OK
; L_JSR_($35E9)_($2EAC) OK
; L_JSR_($35E9)_($2F82) OK
; L_JSR_($35E9)_($2FBD) OK
; L_JSR_($35E9)_($3054) OK
; L_JSR_($35E9)_($3737) OK
Load_Object_Type_X_Y_Colour
    ldy     #OBJECT_TYPE_PARAM              ; 35E9: A0 00    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 35EB: B1 00    
    sta     ZP1A_Object_Type                ; 35ED: 85 1A    

    iny                                     ; 35EF: C8       
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 35F0: B1 00    
    sta     ZP18_Object_Position_X          ; 35F2: 85 18    

    ldy     #OBJECT_POSITION_Y_PARAM        ; 35F4: A0 03    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 35F6: B1 00    
    sta     ZP19_Object_Position_Y          ; 35F8: 85 19    

    ldy     #OBJECT_COLOUR_PARAM            ; 35FA: A0 05    
    lda     (ZP_Obj_List_Ptr_Lo),y          ; 35FC: B1 00    
    sta     ZP1B_Object_Colour              ; 35FE: 85 1B    
    rts                                     ; 3600: 60       
; ==========================================





; 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP
;  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP
;  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P
; 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP

;  dP"Yb  88""Yb  88888 888888  dP""b8 888888
; dP   Yb 88__dP     88 88__   dP   `"   88
; Yb   dP 88""Yb o.  88 88""   Yb        88
;  YbodP  88oodP "bodP' 888888  YboodP   88

; L_JMP_($3601)_($2D49) OK
; L_JSR_($3601)_($2E99) OK
; L_JSR_($3601)_($3358) OK
Display_Object_Old_Setup_Load
    jsr     Load_Obj_Old_UDG_RAM_Addr_Siz_  ; 3601: 20 37 37 

; L_JSR_($3604)_($295E) OK
; L_JSR_($3604)_($2DD4) OK
; L_JMP_($3604)_($3060) OK
Display_Object_Old_Setup
    lda     #$00                            ; 3604: A9 00    
    sta     ZP14_Object_Old_Width_Bytes     ; 3606: 85 14    
    sta     ZP03_Object_Old_Height          ; 3608: 85 03    
    jmp     Display_Object                  ; 360A: 4C 4C 36 
; ------------------------------------------

; L_JSR_($360D)_($28F9) OK
Display_Object_New_Setup_Load
    jsr     Load_Obj_New_UDG_RAM_Addr_Siz_  ; 360D: 20 8A 37 

; L_JSR_($3610)_($27DE) OK
; L_JSR_($3610)_($2828) OK
; L_JSR_($3610)_($2864) OK
Display_Object_New_Setup
    lda     #$00                            ; 3610: A9 00    
    sta     ZP15_Object_New_Width_Bytes     ; 3612: 85 15    
    sta     ZP0B_Object_New_Height          ; 3614: 85 0B    
    jmp     Display_Object                  ; 3616: 4C 4C 36 
; ------------------------------------------

; When object is moving down the screen, the number of pixels it has moved down by will result
; in a number of pixel lines at the top of the object that need to be EXOR'd to erase them
; Initial EOR/CLC/ADC performs an ABS on old/new object Y position delta for use as loop index
; L_BRS_($3619)_($3661) OK
Erase_Object_Moving_Downward
    eor     #$FF                            ; 3619: 49 FF    
    clc                                     ; 361B: 18       
    adc     #$01                            ; 361C: 69 01    
; Note code from $361E & $3663 is basically the same until Erase_Draw, but
; using old and new object parameters
    cmp     ZP0B_Object_New_Height          ; 361E: C5 0B    
    bcs     Erase_Old_Object                ; 3620: B0 66    

; Set X to number of Y pixel-lines to erase only i.e. don't draw over the erase for this object
    tax                                     ; 3622: AA       

; Subtract number of Y erase-only pixels from total object tile height and store to loop
; index for later
    pha                                     ; 3623: 48       
    sta     ZP0A_Object_New_Height_Index    ; 3624: 85 0A    

    lda     ZP0B_Object_New_Height          ; 3626: A5 0B    
    sec                                     ; 3628: 38       
    sbc     ZP0A_Object_New_Height_Index    ; 3629: E5 0A    
    sta     ZP0A_Object_New_Height_Index    ; 362B: 85 0A    

; Erase old object data bytes from UDG data to screen RAM by EXORing
; ZP09 index decrements from $FF, ZP0E holds address of old UDG object data,
; ZP0C holds address of object data on screen to be written to
    ldy     ZP09_Object_New_Y_Index         ; 362D: A4 09    

; L_BRS_($362F)_($3637) OK
Loop_Erase_Down
    lda     (ZP0E_Object_New_UDG_Data_Lo),y ; 362F: B1 0E    
    eor     (ZP0C_Object_New_UDG_RAM_Lo),y  ; 3631: 51 0C    
    sta     (ZP0C_Object_New_UDG_RAM_Lo),y  ; 3633: 91 0C    

; Decrement address pointer into UDG data and the loop index
    dey                                     ; 3635: 88       
    dex                                     ; 3636: CA       
    bne     Loop_Erase_Down                 ; 3637: D0 F6    

; Restore the number of pixel lines to erased and store to ZP13, then subtract it from
; ZP09, the updated address offset for erase/draw the first/next part of the new object
    pla                                     ; 3639: 68       
    sta     ZP13_Object_Lines_To_Erase      ; 363A: 85 13    

    lda     ZP09_Object_New_Y_Index         ; 363C: A5 09    
    sec                                     ; 363E: 38       
    sbc     ZP13_Object_Lines_To_Erase      ; 363F: E5 13    
    sta     ZP09_Object_New_Y_Index         ; 3641: 85 09    

    jmp     Erase_Old_Object                ; 3643: 4C 88 36 
; ------------------------------------------

; L_JSR_($3646)_($2CC3) OK
; L_JSR_($3646)_($32F9) OK
Display_Object_Load
    jsr     Load_Obj_Old_UDG_RAM_Addr_Siz_  ; 3646: 20 37 37 
    jsr     Load_Obj_New_UDG_RAM_Addr_Siz_  ; 3649: 20 8A 37 

; L_JSR_($364C)_($27F4) OK
; L_JSR_($364C)_($2EB8) OK
; L_JSR_($364C)_($2FD1) OK
; L_JMP_($364C)_($360A) OK
; L_JMP_($364C)_($3616) OK
; L_JMP_($364C)_($371F) OK
; L_JMP_($364C)_($3726) OK
Display_Object
    lda     #$FF                            ; 364C: A9 FF    
; ZP08 and ZP09 used as index into UDG RAM for old object and new object data
    sta     ZP08_Object_Old_Y_Index         ; 364E: 85 08    
    sta     ZP09_Object_New_Y_Index         ; 3650: 85 09    

; ZP03 & ZP0B contain heights of the old and new object bitmaps from the UDG graphics data
; e.g. Alien Cross object height is $0A pixels/lines
; Ship is made of 3x2 tiles, fuel cell 1x2, Jetman 1x2 or 1x3
    lda     ZP03_Object_Old_Height          ; 3652: A5 03    
    sta     ZP02_Object_Old_Height_Index    ; 3654: 85 02    

    lda     ZP0B_Object_New_Height          ; 3656: A5 0B    
    sta     ZP0A_Object_New_Height_Index    ; 3658: 85 0A    

; Test if updated object Y position has changed, if yes, horizontal pixels can be erased
; from top or bottom of old object that are outside new object position, else jump
; directly to erase/draw routine
    lda     ZP11_Object_Old_Position_Y      ; 365A: A5 11    
    sec                                     ; 365C: 38       
    sbc     ZP19_Object_New_Position_Y      ; 365D: E5 19    
    beq     Erase_Old_Object                ; 365F: F0 27    
    bmi     Erase_Object_Moving_Downward    ; 3661: 30 B6    

; Erase_Object_Moving_Upward, see also comments for Erase_Object_Moving_Downward
; as it's basically the same code with a few tweaks
    cmp     ZP03_Object_Old_Height          ; 3663: C5 03    
    bcs     Erase_Old_Object                ; 3665: B0 21    

; Set X to number of Y pixel-lines to be erased only i.e. no following draw for this object
    tax                                     ; 3667: AA       

; Subtract number of Y erase-only pixels from total object tile height and store to loop
; index for later
    pha                                     ; 3668: 48       
    sta     ZP02_Object_Old_Height_Index    ; 3669: 85 02    

    lda     ZP03_Object_Old_Height          ; 366B: A5 03    
    sec                                     ; 366D: 38       
    sbc     ZP02_Object_Old_Height_Index    ; 366E: E5 02    
    sta     ZP02_Object_Old_Height_Index    ; 3670: 85 02    

; Erase old object data bytes from UDG data to screen RAM by EXORing
; ZP08 index decrements from $FF, ZP06 holds address of old UDG object data,
; ZP04 holds address of object data on screen to be written to
    ldy     ZP08_Object_Old_Y_Index         ; 3672: A4 08    

; L_BRS_($3674)_($367C) OK
Loop_Erase_Up
    lda     (ZP06_Object_Old_UDG_Data_Lo),y ; 3674: B1 06    
    eor     (ZP04_Object_Old_UDG_RAM_Lo),y  ; 3676: 51 04    
    sta     (ZP04_Object_Old_UDG_RAM_Lo),y  ; 3678: 91 04    

; Decrement address pointer into UDG data and the loop index
    dey                                     ; 367A: 88       
    dex                                     ; 367B: CA       
    bne     Loop_Erase_Up                   ; 367C: D0 F6    

; Restore the number of pixel lines to erased and store to ZP13, then subtract it from
; ZP08, the updated address offset for erase/draw the first/next part of the new object
    pla                                     ; 367E: 68       

    sta     ZP13_Object_Lines_To_Erase      ; 367F: 85 13    

    lda     ZP08_Object_Old_Y_Index         ; 3681: A5 08    
    sec                                     ; 3683: 38       
    sbc     ZP13_Object_Lines_To_Erase      ; 3684: E5 13    
    sta     ZP08_Object_Old_Y_Index         ; 3686: 85 08    

; Erasure of old object and drawing of new object is done in the same code loop,
; first you erase the old line from screen memory using EXOR, then you write back
; to the same line with the new object data
; First test to see if old object fully erased, if yes jump to draw updated params
; L_BRS_($3688)_($3620) OK
; L_JMP_($3688)_($3643) OK
; L_BRS_($3688)_($365F) OK
; L_BRS_($3688)_($3665) OK
; L_BRS_($3688)_($369A) OK
; L_JMP_($3688)_($36A8) OK
Erase_Old_Object
    lda     ZP02_Object_Old_Height_Index    ; 3688: A5 02    
    beq     Next_Object_Old_Update_Params   ; 368A: F0 1F    
    dec     ZP02_Object_Old_Height_Index    ; 368C: C6 02    

; EXOR object data bytes from UDG data to screen RAM to erase
    ldy     ZP08_Object_Old_Y_Index         ; 368E: A4 08    
    lda     (ZP06_Object_Old_UDG_Data_Lo),y ; 3690: B1 06    
    eor     (ZP04_Object_Old_UDG_RAM_Lo),y  ; 3692: 51 04    
    sta     (ZP04_Object_Old_UDG_RAM_Lo),y  ; 3694: 91 04    

    dec     ZP08_Object_Old_Y_Index         ; 3696: C6 08    

; If new object fully drawn, don't try drawing more, erase next old object line
    lda     ZP0A_Object_New_Height_Index    ; 3698: A5 0A    
    beq     Erase_Old_Object                ; 369A: F0 EC    

; L_BRS_($369C)_($36AD) OK
Draw_New_Object
    dec     ZP0A_Object_New_Height_Index    ; 369C: C6 0A    

; EXOR object data bytes from UDG data to screen RAM to draw
    ldy     ZP09_Object_New_Y_Index         ; 369E: A4 09    
    lda     (ZP0E_Object_New_UDG_Data_Lo),y ; 36A0: B1 0E    
    eor     (ZP0C_Object_New_UDG_RAM_Lo),y  ; 36A2: 51 0C    
    sta     (ZP0C_Object_New_UDG_RAM_Lo),y  ; 36A4: 91 0C    

    dec     ZP09_Object_New_Y_Index         ; 36A6: C6 09    
    jmp     Erase_Old_Object                ; 36A8: 4C 88 36 
; ------------------------------------------

; Test if more lines to be drawn for new object, if yes, branch
; L_BRS_($36AB)_($368A) OK
Next_Object_Old_Update_Params
    lda     ZP0A_Object_New_Height_Index    ; 36AB: A5 0A    
    bne     Draw_New_Object                 ; 36AD: D0 ED    

; Test if old object fully erased, if not, move to the next vertical column to erase
    lda     ZP14_Object_Old_Width_Bytes     ; 36AF: A5 14    
    beq     Object_Width_Complete           ; 36B1: F0 76    

    dec     ZP14_Object_Old_Width_Bytes     ; 36B3: C6 14    

; Move UDG data 16-bit address pointer to the object data for the next column
    lda     ZP06_Object_Old_UDG_Data_Lo     ; 36B5: A5 06    
    sec                                     ; 36B7: 38       
    sbc     ZP03_Object_Old_Height          ; 36B8: E5 03    
    sta     ZP06_Object_Old_UDG_Data_Lo     ; 36BA: 85 06    

    lda     ZP07_Object_Old_UDG_Data_Hi     ; 36BC: A5 07    
    sbc     #$00                            ; 36BE: E9 00    
    sta     ZP07_Object_Old_UDG_Data_Hi     ; 36C0: 85 07    

; Move UDG RAM address pointer to next vertical column
    lda     ZP04_Object_Old_UDG_RAM_Lo      ; 36C2: A5 04    
    clc                                     ; 36C4: 18       
    adc     #SCREEN_HEIGHT_PIXELS           ; 36C5: 69 B0    
    sta     ZP04_Object_Old_UDG_RAM_Lo      ; 36C7: 85 04    

    lda     ZP05_Object_Old_UDG_RAM_Hi      ; 36C9: A5 05    
    adc     #$00                            ; 36CB: 69 00    
    sta     ZP05_Object_Old_UDG_RAM_Hi      ; 36CD: 85 05    

; Test for full-screen wrap, $1ED1 is $FF less than the first byte past
; UDG RAM (last byte = $1FCF)
    lda     ZP04_Object_Old_UDG_RAM_Lo      ; 36CF: A5 04    
    sec                                     ; 36D1: 38       
    sbc     #UDG_RAM_END_ADDR_MINUS_FE_LO   ; 36D2: E9 D1    
    lda     ZP05_Object_Old_UDG_RAM_Hi      ; 36D4: A5 05    
    sbc     #UDG_RAM_END_ADDR_MINUS_FE_HI   ; 36D6: E9 1E    
    bcc     Next_Object_New_Update_Params   ; 36D8: 90 0D    

; Handle full-screen wrap, $0FD0 is number of bytes used to define the full
; UDG RAM. i.e. $16 x $17 x 8=$FD0
    lda     ZP04_Object_Old_UDG_RAM_Lo      ; 36DA: A5 04    
    sec                                     ; 36DC: 38       
    sbc     #UDG_RAM_NUM_BYTES_LO           ; 36DD: E9 D0    
    sta     ZP04_Object_Old_UDG_RAM_Lo      ; 36DF: 85 04    

    lda     ZP05_Object_Old_UDG_RAM_Hi      ; 36E1: A5 05    
    sbc     #UDG_RAM_NUM_BYTES_HI           ; 36E3: E9 0F    
    sta     ZP05_Object_Old_UDG_RAM_Hi      ; 36E5: 85 05    

; Test if new object fully drawn, if not, move to the next vertical column to draw
; L_BRS_($36E7)_($36D8) OK
; L_JMP_($36E7)_($3734) OK
Next_Object_New_Update_Params
    lda     ZP15_Object_New_Width_Bytes     ; 36E7: A5 15    
    beq     Zero_ZP0B_JMP_Display_Object    ; 36E9: F0 37    

    dec     ZP15_Object_New_Width_Bytes     ; 36EB: C6 15    

; Move UDG data 16-bit address pointer to the object data for the next column
    lda     ZP0E_Object_New_UDG_Data_Lo     ; 36ED: A5 0E    
    sec                                     ; 36EF: 38       
    sbc     ZP0B_Object_New_Height          ; 36F0: E5 0B    
    sta     ZP0E_Object_New_UDG_Data_Lo     ; 36F2: 85 0E    

    lda     ZP0F_Object_New_UDG_Data_Hi     ; 36F4: A5 0F    
    sbc     #$00                            ; 36F6: E9 00    
    sta     ZP0F_Object_New_UDG_Data_Hi     ; 36F8: 85 0F    

; Move UDG RAM address pointer to next vertical column
    lda     ZP0C_Object_New_UDG_RAM_Lo      ; 36FA: A5 0C    
    clc                                     ; 36FC: 18       
    adc     #SCREEN_HEIGHT_PIXELS           ; 36FD: 69 B0    
    sta     ZP0C_Object_New_UDG_RAM_Lo      ; 36FF: 85 0C    

    lda     ZP0D_Object_New_UDG_RAM_Hi      ; 3701: A5 0D    
    adc     #$00                            ; 3703: 69 00    
    sta     ZP0D_Object_New_UDG_RAM_Hi      ; 3705: 85 0D    

; Test for full-screen wrap, $1ED1 is $FF less than the first byte past UDG RAM (last byte = $1FCF)
    lda     ZP0C_Object_New_UDG_RAM_Lo      ; 3707: A5 0C    
    sec                                     ; 3709: 38       
    sbc     #UDG_RAM_END_ADDR_MINUS_FE_LO   ; 370A: E9 D1    
    lda     ZP0D_Object_New_UDG_RAM_Hi      ; 370C: A5 0D    
    sbc     #UDG_RAM_END_ADDR_MINUS_FE_HI   ; 370E: E9 1E    
    bcc     JMP_Display_Object              ; 3710: 90 0D    

; Handle full-screen wrap, $0FD0 is number of bytes used to define the full UDG RAM,
; i.e. $16 x $17 x 8=$FD0
    lda     ZP0C_Object_New_UDG_RAM_Lo      ; 3712: A5 0C    
    sec                                     ; 3714: 38       
    sbc     #UDG_RAM_NUM_BYTES_LO           ; 3715: E9 D0    
    sta     ZP0C_Object_New_UDG_RAM_Lo      ; 3717: 85 0C    

    lda     ZP0D_Object_New_UDG_RAM_Hi      ; 3719: A5 0D    
    sbc     #UDG_RAM_NUM_BYTES_HI           ; 371B: E9 0F    
    sta     ZP0D_Object_New_UDG_RAM_Hi      ; 371D: 85 0D    

; L_BRS_($371F)_($3710) OK
JMP_Display_Object
    jmp     Display_Object                  ; 371F: 4C 4C 36 
; ------------------------------------------

; L_BRS_($3722)_($36E9) OK
Zero_ZP0B_JMP_Display_Object
    lda     #$00                            ; 3722: A9 00    
    sta     ZP0B_Object_New_Height          ; 3724: 85 0B    
    jmp     Display_Object                  ; 3726: 4C 4C 36 
; ------------------------------------------

; L_BRS_($3729)_($36B1) OK
Object_Width_Complete
    lda     #$00                            ; 3729: A9 00    
    sta     ZP03_Object_Old_Height          ; 372B: 85 03    

; Test if both old and new object heights are the same, if yes, return
    lda     ZP14_Object_Old_Width_Bytes     ; 372D: A5 14    
    ora     ZP15_Object_New_Width_Bytes     ; 372F: 05 15    
    bne     JMP_Next_Obj_New_Update_Params  ; 3731: D0 01    
    rts                                     ; 3733: 60       
; ==========================================

; L_BRS_($3734)_($3731) OK
JMP_Next_Obj_New_Update_Params
    jmp     Next_Object_New_Update_Params   ; 3734: 4C E7 36 
; ------------------------------------------





; 88      dP"Yb     db    8888b.       dP"Yb  88""Yb  88888      dP"Yb  88     8888b.
; 88     dP   Yb   dPYb    8I  Yb     dP   Yb 88__dP     88     dP   Yb 88      8I  Yb
; 88  .o Yb   dP  dP__Yb   8I  dY     Yb   dP 88""Yb o.  88     Yb   dP 88  .o  8I  dY
; 88ood8  YbodP  dP""""Yb 8888Y"       YbodP  88oodP "bodP'      YbodP  88ood8 8888Y"

; 88   88 8888b.   dP""b8     88""Yb    db    8b    d8        db    8888b.  8888b.  88""Yb
; 88   88  8I  Yb dP   `"     88__dP   dPYb   88b  d88       dPYb    8I  Yb  8I  Yb 88__dP
; Y8   8P  8I  dY Yb  "88     88"Yb   dP__Yb  88YbdP88      dP__Yb   8I  dY  8I  dY 88"Yb
; `YbodP' 8888Y"   YboodP     88  Yb dP""""Yb 88 YY 88     dP""""Yb 8888Y"  8888Y"  88  Yb

; .dP"Y8 88 8888P 888888
; `Ybo." 88   dP  88__
; o.`Y8b 88  dP   88""
; 8bodP' 88 d8888 888888

; Code used for Jetman, Ship Top/Mid/Base, Fuel, Valuables
; L_JSR_($3737)_($3601) OK
; L_JSR_($3737)_($3646) OK
Load_Obj_Old_UDG_RAM_Addr_Siz_
    jsr     Load_Object_Type_X_Y_Colour     ; 3737: 20 E9 35 
    jsr     Get_Obj_New_UDG_Data_Addr       ; 373A: 20 15 38 

; Store object UDG Data Addr in Registers Y and A into ZP0E & 0F, minus $100
; L_JSR_($373D)_($27E7) OK
; L_JSR_($373D)_($295B) OK
; L_JSR_($373D)_($2DF5) OK
; L_JSR_($373D)_($2FC7) OK
; L_JSR_($373D)_($305D) OK
Load_Obj_Old_UDG_RAM_Addr_Size
    sty     ZP0E_Object_UDG_Data_Addr_Lo    ; 373D: 84 0E    
    tay                                     ; 373F: A8       
    dey                                     ; 3740: 88       
    sty     ZP0F_Object_UDG_Data_Addr_Hi    ; 3741: 84 0F    

; Store object position in ZP04 & 05
    lda     ZP18_Object_Position_X          ; 3743: A5 18    
    sta     ZP04_Object_Position_X          ; 3745: 85 04    
    lda     ZP19_Object_Position_Y          ; 3747: A5 19    
    sta     ZP05_Object_Position_Y          ; 3749: 85 05    

; Convert object position XY pixel coordinates to UDG RAM address, managing X axis wrap.
; Loads screen-wrap byte from current UDG Data animation frame, it's set to 8 if next frame
; will move object into next UDG RAM column.
    ldy     #$FF                            ; 374B: A0 FF    
    lda     (ZP0E_Object_UDG_Data_Addr_Lo),y; 374D: B1 0E    
    clc                                     ; 374F: 18       
    adc     ZP04_Object_Position_X          ; 3750: 65 04    
    cmp     #SCREEN_WIDTH_PIXELS            ; 3752: C9 B8    
    bcc     No_X_Wrap_                      ; 3754: 90 03    

    sec                                     ; 3756: 38       
    sbc     #SCREEN_WIDTH_PIXELS            ; 3757: E9 B8    

; L_BRS_($3759)_($3754) OK
No_X_Wrap_
    sta     ZP04_Object_Position_X          ; 3759: 85 04    
    sta     ZP18_Object_Position_X          ; 375B: 85 18    
    jsr     Convert_XY_to_UDG_RAM_Address   ; 375D: 20 1D 35 

; ZP04/05 are now an address instead of X and Y coordinates.
; Subtract $FF from 16-bit UDG_RAM Address for indexing with Y after.
    lda     ZP04_Object_UDG_RAM_Addr_Lo     ; 3760: A5 04    
    sec                                     ; 3762: 38       
    sbc     #UDG_DATA_HEIGHT_PIXELS_OFFSET  ; 3763: E9 FF    
    sta     ZP0C_Object_UDG_RAM_Addr_Lo     ; 3765: 85 0C    

    lda     ZP05_Object_UDG_RAM_Addr_Hi     ; 3767: A5 05    
    sbc     #$00                            ; 3769: E9 00    
    sta     ZP0D_Object_UDG_RAM_Addr_Hi     ; 376B: 85 0D    

; Get/store object width in characters (zero-based i.e. 0 is 1 byte wide)
    ldy     #UDG_DATA_WIDTH_BYTES_OFFSET    ; 376D: A0 FE    
    lda     (ZP0E_Object_UDG_Data_Addr_Lo),y; 376F: B1 0E    
    sta     ZP15_Object_Width_Bytes         ; 3771: 85 15    
    sta     ZP16_Object_Width_Bytes         ; 3773: 85 16    

; Get/store object height in pixels (one-based i.e. 9 is 9 pixels high)
    dey                                     ; 3775: 88       
    lda     (ZP0E_Object_UDG_Data_Addr_Lo),y; 3776: B1 0E    
    sta     ZP0B_Object_Height_Pixels       ; 3778: 85 0B    
    sta     ZP17_Object_Height_Pixels       ; 377A: 85 17    

; Subtract $03 from 16-bit object UDG Data address, i.e. so address
; avoids the object dimension bytes
    lda     ZP0E_Object_UDG_Data_Addr_Lo    ; 377C: A5 0E    
    sec                                     ; 377E: 38       
    sbc     #UDG_DATA_BITMAP_OFFSET         ; 377F: E9 03    
    sta     ZP0E_Object_UDG_Data_Addr_Lo    ; 3781: 85 0E    

    lda     ZP0F_Object_UDG_Data_Addr_Hi    ; 3783: A5 0F    
    sbc     #$00                            ; 3785: E9 00    
    sta     ZP0F_Object_UDG_Data_Addr_Hi    ; 3787: 85 0F    
    rts                                     ; 3789: 60       
; ==========================================





; 88      dP"Yb     db    8888b.       dP"Yb  88""Yb  88888     88b 88 888888 Yb        dP
; 88     dP   Yb   dPYb    8I  Yb     dP   Yb 88__dP     88     88Yb88 88__    Yb  db  dP
; 88  .o Yb   dP  dP__Yb   8I  dY     Yb   dP 88""Yb o.  88     88 Y88 88""     YbdPYbdP
; 88ood8  YbodP  dP""""Yb 8888Y"       YbodP  88oodP "bodP'     88  Y8 888888    YP  YP

; 88   88 8888b.   dP""b8     88""Yb    db    8b    d8        db    8888b.  8888b.  88""Yb
; 88   88  8I  Yb dP   `"     88__dP   dPYb   88b  d88       dPYb    8I  Yb  8I  Yb 88__dP
; Y8   8P  8I  dY Yb  "88     88"Yb   dP__Yb  88YbdP88      dP__Yb   8I  dY  8I  dY 88"Yb
; `YbodP' 8888Y"   YboodP     88  Yb dP""""Yb 88 YY 88     dP""""Yb 8888Y"  8888Y"  88  Yb

; .dP"Y8 88 8888P 888888
; `Ybo." 88   dP  88__
; o.`Y8b 88  dP   88""
; 8bodP' 88 d8888 888888

; Code used for Jetman, Ship Top/Mid/Base, Fuel, Valuables
; L_JSR_($378A)_($360D) OK
; L_JSR_($378A)_($3649) OK
Load_Obj_New_UDG_RAM_Addr_Siz_
    jsr     Get_Obj_Old_UDG_Data_Addr       ; 378A: 20 E6 37 

; Example Ship Middle Section Object UDG RAM Position A=3C, Y=F7, thus $3CF7
; Store object UDG Data Addr in Registers Y and A into ZP06 & 07, minus $100
; L_JSR_($378D)_($27DB) OK
; L_JSR_($378D)_($27F1) OK
; L_JSR_($378D)_($2825) OK
; L_JSR_($378D)_($2861) OK
; L_JMP_($378D)_($2DFC) OK
; L_JSR_($378D)_($2FCE) OK
Load_Obj_New_UDG_RAM_Addr_Size
    sty     ZP06_Object_UDG_Data_Addr_Lo    ; 378D: 84 06    
    tay                                     ; 378F: A8       
    dey                                     ; 3790: 88       
    sty     ZP07_Object_UDG_Data_Addr_Hi    ; 3791: 84 07     ZP07/06=$3BF7

; Store object position in ZP04 & 05
    lda     ZP10_Object_Position_X          ; 3793: A5 10    
    sta     ZP04_Object_Position_X          ; 3795: 85 04     ZP04=X=$50
    lda     ZP11_Object_Position_Y          ; 3797: A5 11    
    sta     ZP05_Object_Position_Y          ; 3799: 85 05     ZP05=Y=$5F

; Convert object position XY pixel coordinates to UDG RAM address, managing X axis wrap.
; Loads screen-wrap byte from current UDG Data animation frame, it's set to 8 if next frame
; will move object into next UDG RAM column.
    ldy     #$FF                            ; 379B: A0 FF    
    lda     (ZP06_Object_UDG_Data_Addr_Lo),y; 379D: B1 06    
    clc                                     ; 379F: 18       
    adc     ZP04_Object_Position_X          ; 37A0: 65 04    
    cmp     #SCREEN_WIDTH_PIXELS            ; 37A2: C9 B8    
    bcc     No_X_Wrap                       ; 37A4: 90 03    

    sec                                     ; 37A6: 38       
    sbc     #SCREEN_WIDTH_PIXELS            ; 37A7: E9 B8    

; L_BRS_($37A9)_($37A4) OK
No_X_Wrap
    sta     ZP04_Object_Position_X          ; 37A9: 85 04     ZP04=X=$50 ZP05=Y=$5F
    jsr     Convert_XY_to_UDG_RAM_Address   ; 37AB: 20 1D 35  ZP05/04=$173F i.e. ship middle
                                            ; section start position on middle platform

; ZP04/05 are now an address instead of X and Y coordinates.
; Subtract $FF from 16-bit UDG_RAM Address for indexing with Y after.
    lda     ZP04_Object_UDG_RAM_Addr_Lo     ; 37AE: A5 04    
    sec                                     ; 37B0: 38       
    sbc     #UDG_DATA_HEIGHT_PIXELS_OFFSET  ; 37B1: E9 FF    
    sta     ZP04_Object_UDG_RAM_Addr_Lo     ; 37B3: 85 04    

    lda     ZP05_Object_UDG_RAM_Addr_Hi     ; 37B5: A5 05    
    sbc     #$00                            ; 37B7: E9 00    
    sta     ZP05_Object_UDG_RAM_Addr_Hi     ; 37B9: 85 05    

; Get/store object width in characters (zero-based i.e. 0 is 1 byte wide)
    ldy     #UDG_DATA_WIDTH_BYTES_OFFSET    ; 37BB: A0 FE    
    lda     (ZP06_Object_UDG_Data_Addr_Lo),y; 37BD: B1 06    
    sta     ZP14_Object_Width_Bytes         ; 37BF: 85 14    

; Get/store object height in pixels (one-based i.e. 9 is 9 pixels high)
    dey                                     ; 37C1: 88       
    lda     (ZP06_Object_UDG_Data_Addr_Lo),y; 37C2: B1 06    
    sta     ZP03_Object_Height_Pixels       ; 37C4: 85 03    

; Subtract $03 from 16-bit object UDG Data address, i.e. so address
; avoids the object dimension bytes
    lda     ZP06_Object_UDG_Data_Addr_Lo    ; 37C6: A5 06    
    sec                                     ; 37C8: 38       
    sbc     #UDG_DATA_BITMAP_OFFSET         ; 37C9: E9 03    
    sta     ZP06_Object_UDG_Data_Addr_Lo    ; 37CB: 85 06    

    lda     ZP07_Object_UDG_Data_Addr_Hi    ; 37CD: A5 07    
    sbc     #$00                            ; 37CF: E9 00    
    sta     ZP07_Object_UDG_Data_Addr_Hi    ; 37D1: 85 07    
    rts                                     ; 37D3: 60       
; ==========================================





;  dP""b8 888888 888888      dP"Yb  88""Yb  88888     88   88 8888b.   dP""b8
; dP   `" 88__     88       dP   Yb 88__dP     88     88   88  8I  Yb dP   `"
; Yb  "88 88""     88       Yb   dP 88""Yb o.  88     Y8   8P  8I  dY Yb  "88
;  YboodP 888888   88        YbodP  88oodP "bodP'     `YbodP' 8888Y"   YboodP

; 8888b.     db    888888    db           db    8888b.  8888b.  88""Yb
;  8I  Yb   dPYb     88     dPYb         dPYb    8I  Yb  8I  Yb 88__dP
;  8I  dY  dP__Yb    88    dP__Yb       dP__Yb   8I  dY  8I  dY 88"Yb
; 8888Y"  dP""""Yb   88   dP""""Yb     dP""""Yb 8888Y"  8888Y"  88  Yb

; Two different entry points, for different animation frames, only used for Jetman and Aliens.
; Aliens Types: 05=Fuzzball, 06=Saucer, 07=Ball, 08=Cross
; All Aliens have only 2 animation states
; InReg: A=Object Type (Alien), X=Animation Frame
; OutReg: A=UDG Addr Hi, Y=UDG Addr Lo
; L_BRS_($37D4)_($37F2) OK
Get_Obj_UDG_Data_Addr_Alien
    pha                                     ; 37D4: 48       
    txa                                     ; 37D5: 8A       

; Convert object's screen X position to 0 or 2 byte animation frame data offset & put back into X
    lsr     a                               ; 37D6: 4A       
    and     #%00000010                      ; 37D7: 29 02    
    tax                                     ; 37D9: AA       
    pla                                     ; 37DA: 68       

; Transform Object Types 5/6/7/8 to 2/3/4/5, then multiply by 4 to get the frame data offset offset
; Note, starting with offset 2 instead of 0 means 4 wasted bytes in the data address table
    sec                                     ; 37DB: 38       
    sbc     #$03                            ; 37DC: E9 03    
    asl     a                               ; 37DE: 0A       
    asl     a                               ; 37DF: 0A       

; Add $20 offset, which takes us to the start of the Alien UDG data, past Jetman UDG data
    clc                                     ; 37E0: 18       
    adc     #$20                            ; 37E1: 69 20    
    jmp     Calc_UDG_Data_Table_Index       ; 37E3: 4C 07 38 
; ------------------------------------------

; Alternate entry point to routine using different ZP vars for object Position and Type
; L_JSR_($37E6)_($378A) OK
Get_Obj_Old_UDG_Data_Addr
    lda     ZP10_Object_Position_X          ; 37E6: A5 10    
    and     #%00000110                      ; 37E8: 29 06    
    tax                                     ; 37EA: AA       
    lda     ZP12_Object_Type                ; 37EB: A5 12    

; When object is Jetman, Object Type represents State i.e. Flying/Standing, Facing Left/Right, Frame.
; There are 16 Jetman animation frames, 4 Fly Right, 4 Fly Left, 4 Stand Left, 4 Stand Right,
; in that order, in a list of 16-bit address to the UDG data.
; This routine uses bit 7 of the Jetman Object Type to select Right or Left and bit 0 to
; select Flying or Standing, when creating an offset in register X.
; InReg: A=Object Type (Jetman), X=Animation Frame
; OutReg: A=UDG Addr Hi, Y=UDG Addr Lo
; L_JMP_($37ED)_($381C) OK
Get_Obj_UDG_Data_Addr
    tay                                     ; 37ED: A8       

; Jetman uses only bit 7 (direction he's facing) and bits 0 & 1 (standing/flying).
; If other bits are used, object must be an Alien.
    and     #%00111111                      ; 37EE: 29 3F    
    cmp     #%00000011                      ; 37F0: C9 03    
    bcs     Get_Obj_UDG_Data_Addr_Alien     ; 37F2: B0 E0     Carry Set if A >= compared value
    tya                                     ; 37F4: 98       

; Object is Jetman, test state, is he looking Left or Right?
    bit     MASK_10000000                   ; 37F5: 2C 1B 20 
    beq     Adjust_For_Jetman_Standing      ; 37F8: F0 06    

; Jetman is looking left, set bit 3 in X, which adds $08 to the UDG data address, meaning
; that it will point to the Jetman facing Left UDG data addresses instead of facing Right.
    pha                                     ; 37FA: 48       
    txa                                     ; 37FB: 8A       
    ora     #%00001000                      ; 37FC: 09 08    
    tax                                     ; 37FE: AA       
    pla                                     ; 37FF: 68       

; Register A contains Jetman State, bit 7 is Direction-faced.
; SEC & SBC prepare ASLs to move bit 7 to bit 3 using wraparound.
; This effectively adds $10 to the calculated UDG data address when Jetman is Standing,
; meaning it points to the Jetman Standing data addresses instead of Jetman Flying.
; L_BRS_($3800)_($37F8) OK
Adjust_For_Jetman_Standing
    sec                                     ; 3800: 38       
    sbc     #$01                            ; 3801: E9 01    
    asl     a                               ; 3803: 0A       
    asl     a                               ; 3804: 0A       
    asl     a                               ; 3805: 0A       
    asl     a                               ; 3806: 0A       

; OR A and X together to produce full UDG data table offset
; L_JMP_($3807)_($37E3) OK
Calc_UDG_Data_Table_Index
    sta     ZP13_Temp                       ; 3807: 85 13    
    txa                                     ; 3809: 8A       
    ora     ZP13_Temp                       ; 380A: 05 13    
    tax                                     ; 380C: AA       

; Using X just set, get index into the Object UDG table, address lo-byte into Y, hi-byte into A
    lda     UDG_Data_Jetman_Aliens,x        ; 380D: BD 5F 38 
    tay                                     ; 3810: A8       
    lda     UDG_Data_Jetman_Aliens+1,x      ; 3811: BD 60 38 
    rts                                     ; 3814: 60       
; ==========================================

; Get address of UDG Data for Jetman or Alien objects and return in A and Y registers
; Bits 1 & 2 of object's X position used to select UDG animation frame.
; Animations have 2 or 4 frames and are minimum 2 pixels apart so bit 0 not used.
; L_JSR_($3815)_($373A) OK
Get_Obj_New_UDG_Data_Addr
    lda     ZP18_Object_Position_X          ; 3815: A5 18    
    and     #%00000110                      ; 3817: 29 06    
    tax                                     ; 3819: AA       
    lda     ZP1A_Object_Type                ; 381A: A5 1A    
    jmp     Get_Obj_UDG_Data_Addr           ; 381C: 4C ED 37 





;  dP""b8  dP"Yb  88      dP"Yb  88""Yb 88 8888P 888888
; dP   `" dP   Yb 88     dP   Yb 88__dP 88   dP  88__
; Yb      Yb   dP 88  .o Yb   dP 88"Yb  88  dP   88""
;  YboodP  YbodP  88ood8  YbodP  88  Yb 88 d8888 888888

;  dP"Yb  88""Yb  88888 888888  dP""b8 888888
; dP   Yb 88__dP     88 88__   dP   `"   88
; Yb   dP 88""Yb o.  88 88""   Yb        88
;  YbodP  88oodP "bodP' 888888  YboodP   88

; Colourize all object sprites i.e. Jetman, Aliens, Ship Top/Middle/Base, Fuel, Valuables
; L_JSR_($381F)_($2961) OK
; L_JSR_($381F)_($2CC6) OK
; L_JSR_($381F)_($2FD4) OK
; L_JSR_($381F)_($32FC) OK
; L_JSR_($381F)_($335B) OK
Colourize_Object
    lda     ZP18_Object_Position_X          ; 381F: A5 18    
    sta     ZP04                            ; 3821: 85 04    
    lda     ZP19_Object_Position_Y          ; 3823: A5 19    
    sta     ZP05                            ; 3825: 85 05    

; Setup Colour RAM params based on object position X & Y via ZP04/ZP05 e.g. Ship Top X=20, Y=3F
    jsr     Setup_Colour_RAM_Address        ; 3827: 20 F7 34 

; Divide object height by $10 then add $02, so always update colour on at least two vertical tiles
; e.g. Jetman=$18->$03, Ship_Top=$10->$03, Fuzz_Alien=$0A->$02
    lda     ZP17_Object_Size_Y_Pixels       ; 382A: A5 17    
    lsr     a                               ; 382C: 4A       
    lsr     a                               ; 382D: 4A       
    lsr     a                               ; 382E: 4A       
    lsr     a                               ; 382F: 4A       
    clc                                     ; 3830: 18       
    adc     #$02                            ; 3831: 69 02    

; Use ZP0B as outer loop for vertical tile rows
    sta     ZP0B_Colour_RAM_Tiles_Y         ; 3833: 85 0B    

; Use ZP0A as inner loop for horizontal tile columns
    lda     ZP16_Object_Size_X_Columns      ; 3835: A5 16    
    sta     ZP0A_Colour_RAM_Tiles_X         ; 3837: 85 0A    
    inc     ZP0A_Colour_RAM_Tiles_X         ; 3839: E6 0A    

; L_BRS_($383B)_($385C) OK
Loop_Y
    ldx     ZP0A_Colour_RAM_Tiles_X         ; 383B: A6 0A    
    ldy     #$00                            ; 383D: A0 00    

; Read colour from RAM and if it's green i.e. colour of the platforms, skip the colour change
; else write the updated colour to the colour RAM
; L_BRS_($383F)_($384D) OK
Loop_X
    lda     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 383F: B1 0C    
    and     #%00000111                      ; 3841: 29 07    
    cmp     #COLOUR_GREEN                   ; 3843: C9 05    
    beq     Green_Ignored                   ; 3845: F0 04    

    lda     ZP1B                            ; 3847: A5 1B    
    sta     (ZP0C_Colour_RAM_Tile_Addr_Lo),y; 3849: 91 0C    

; L_BRS_($384B)_($3845) OK
Green_Ignored
    iny                                     ; 384B: C8       
    dex                                     ; 384C: CA       
    bne     Loop_X                          ; 384D: D0 F0    

; Move to next row to colour (i.e. move up) and test for going out of
; screen boundary at top of screen, early exit if so
    lda     ZP0C_Colour_RAM_Tile_Addr_Lo    ; 384F: A5 0C    
    sec                                     ; 3851: 38       
    sbc     #SCREEN_WIDTH_COLUMNS           ; 3852: E9 17    
    cmp     #SCREEN_WIDTH_COLUMNS           ; 3854: C9 17    
    bcc     Colourize_Object_RTS            ; 3856: 90 06    

; Update the Colour RAM for the appropriate tile, move up one row
    sta     ZP0C_Colour_RAM_Tile_Addr_Lo    ; 3858: 85 0C    
    dec     ZP0B_Colour_RAM_Tiles_Y         ; 385A: C6 0B    
    bne     Loop_Y                          ; 385C: D0 DD    

; L_BRS_($385E)_($3856) OK
Colourize_Object_RTS
    rts                                     ; 385E: 60       
; ==========================================





; 88   88 .dP"Y8 888888 88""Yb     8888b.  888888 888888 88 88b 88 888888 8888b.
; 88   88 `Ybo." 88__   88__dP      8I  Yb 88__   88__   88 88Yb88 88__    8I  Yb
; Y8   8P o.`Y8b 88""   88"Yb       8I  dY 88""   88""   88 88 Y88 88""    8I  dY
; `YbodP' 8bodP' 888888 88  Yb     8888Y"  888888 88     88 88  Y8 888888 8888Y"

;  dP""b8 88""Yb    db    88""Yb 88  88 88  dP""b8 .dP"Y8     8888b.     db    888888    db
; dP   `" 88__dP   dPYb   88__dP 88  88 88 dP   `" `Ybo."      8I  Yb   dPYb     88     dPYb
; Yb  "88 88"Yb   dP__Yb  88"""  888888 88 Yb      o.`Y8b      8I  dY  dP__Yb    88    dP__Yb
;  YboodP 88  Yb dP""""Yb 88     88  88 88  YboodP 8bodP'     8888Y"  dP""""Yb   88   dP""""Yb

UDG_Data_Jetman_Aliens
    fdb     Jetman_Fly_Right_0              ; 385F: BE 3B    
    fdb     Jetman_Fly_Right_1              ; 3861: F1 3B    
    fdb     Jetman_Fly_Right_2              ; 3863: 3C 3C    
    fdb     UDG_Data_Ship_Fuel_Valuables    ; 3865: 87 3C     $3C87 = Jetman_Fly_Right_3
    fdb     Jetman_Fly_Left_0               ; 3867: 8B 3B    
    fdb     Jetman_Fly_Left_1               ; 3869: 40 3B    
    fdb     Jetman_Fly_Left_2               ; 386B: F5 3A    
    fdb     Jetman_Fly_Left_3               ; 386D: CA 38    
    fdb     Jetman_Walk_Right_0             ; 386F: F9 39    
    fdb     Jetman_Walk_Right_1             ; 3871: 2C 3A    
    fdb     Jetman_Walk_Right_2             ; 3873: 77 3A    
    fdb     Jetman_Walk_Right_3             ; 3875: C2 3A    
    fdb     Jetman_Walk_Left_0              ; 3877: C6 39    
    fdb     Jetman_Walk_Left_1              ; 3879: 7B 39    
    fdb     Jetman_Walk_Left_2              ; 387B: 30 39    
    fdb     Jetman_Walk_Left_3              ; 387D: FD 38    
    fdb     Alien_Fuzz_1                    ; 387F: 78 3E    
    fdb     Alien_Fuzz_2                    ; 3881: 99 3E    
    fdb     Alien_Fuzz_1                    ; 3883: 78 3E    
    fdb     Alien_Fuzz_2                    ; 3885: 99 3E    
    fdb     Alien_Fuzz_1                    ; 3887: 78 3E    
    fdb     Alien_Fuzz_2                    ; 3889: 99 3E    
    fdb     Alien_Ship_1                    ; 388B: 46 3E    
    fdb     Alien_Ship_2                    ; 388D: 61 3E    
    fdb     Alien_Bubble_1                  ; 388F: B8 3E    
    fdb     Alien_Bubble_2                  ; 3891: EB 3E    
    fdb     Alien_Cross_1                   ; 3893: 0E 3F    
    fdb     Alien_Cross_2                   ; 3895: 41 3F    

    fcb     %11100000                       ; 3897: E0       
    fcb     %01110000                       ; 3898: 70       
    fcb     %10110100                       ; 3899: B4       
    fcb     %01110100                       ; 389A: 74       
    fcb     %01110100                       ; 389B: 74       
    fcb     %11100110                       ; 389C: E6       
    fcb     %00000110                       ; 389D: 06       
    fcb     %11101010                       ; 389E: EA       
    fcb     %00101110                       ; 389F: 2E       
    fcb     %00101010                       ; 38A0: 2A       
    fcb     %00101110                       ; 38A1: 2E       
    fcb     %11011010                       ; 38A2: DA       
    fcb     %11011110                       ; 38A3: DE       
    fcb     %10111100                       ; 38A4: BC       
    fcb     %10010100                       ; 38A5: 94       
    fcb     %00101010                       ; 38A6: 2A       
    fcb     %00111110                       ; 38A7: 3E       
    fcb     %00000000                       ; 38A8: 00       
    fcb     %00101010                       ; 38A9: 2A       
    fcb     %00010100                       ; 38AA: 14       
    fcb     %00100000                       ; 38AB: 20       
    fcb     %00001011                       ; 38AC: 0B       
    fcb     %00010100                       ; 38AD: 14       
    fcb     %00001010                       ; 38AE: 0A       
    fcb     %00000001                       ; 38AF: 01       
    fcb     %00000000                       ; 38B0: 00       
    fcb     %00000111                       ; 38B1: 07       
    fcb     %00000111                       ; 38B2: 07       
    fcb     %00000111                       ; 38B3: 07       
    fcb     %00000011                       ; 38B4: 03       
    fcb     %00000000                       ; 38B5: 00       
    fcb     %00000001                       ; 38B6: 01       
    fcb     %00001011                       ; 38B7: 0B       
    fcb     %00001011                       ; 38B8: 0B       
    fcb     %01111100                       ; 38B9: 7C       
    fcb     %00000011                       ; 38BA: 03       
    fcb     %00000001                       ; 38BB: 01       
    fcb     %00011111                       ; 38BC: 1F       
    fcb     %00011111                       ; 38BD: 1F       
    fcb     %00011000                       ; 38BE: 18       
    fcb     %00000000                       ; 38BF: 00       
    fcb     %00111000                       ; 38C0: 38       
    fcb     %01111000                       ; 38C1: 78       
    fcb     %00000000                       ; 38C2: 00       
    fcb     %00000000                       ; 38C3: 00       
    fcb     %00000000                       ; 38C4: 00       
    fcb     %00000000                       ; 38C5: 00       
    fcb     %00000000                       ; 38C6: 00       
    fcb     %00011000                       ; 38C7: 18       
    fcb     %00000001                       ; 38C8: 01       
    fcb     %00001000                       ; 38C9: 08       
Jetman_Fly_Left_3
    fcb     %11100000                       ; 38CA: E0       
    fcb     %01110000                       ; 38CB: 70       
    fcb     %10110100                       ; 38CC: B4       
    fcb     %01110100                       ; 38CD: 74       
    fcb     %01110100                       ; 38CE: 74       
    fcb     %11100110                       ; 38CF: E6       
    fcb     %00000110                       ; 38D0: 06       
    fcb     %11101010                       ; 38D1: EA       
    fcb     %00101110                       ; 38D2: 2E       
    fcb     %00101010                       ; 38D3: 2A       
    fcb     %00101110                       ; 38D4: 2E       
    fcb     %11011010                       ; 38D5: DA       
    fcb     %11011110                       ; 38D6: DE       
    fcb     %11111100                       ; 38D7: FC       
    fcb     %11010100                       ; 38D8: D4       
    fcb     %10101010                       ; 38D9: AA       
    fcb     %10111110                       ; 38DA: BE       
    fcb     %10000000                       ; 38DB: 80       
    fcb     %00000000                       ; 38DC: 00       
    fcb     %10000000                       ; 38DD: 80       
    fcb     %10000000                       ; 38DE: 80       
    fcb     %10000000                       ; 38DF: 80       
    fcb     %00000000                       ; 38E0: 00       
    fcb     %00000000                       ; 38E1: 00       
    fcb     %00000001                       ; 38E2: 01       
    fcb     %00000000                       ; 38E3: 00       
    fcb     %00000111                       ; 38E4: 07       
    fcb     %00000111                       ; 38E5: 07       
    fcb     %00000111                       ; 38E6: 07       
    fcb     %00000011                       ; 38E7: 03       
    fcb     %00000000                       ; 38E8: 00       
    fcb     %00000001                       ; 38E9: 01       
    fcb     %00001011                       ; 38EA: 0B       
    fcb     %00001011                       ; 38EB: 0B       
    fcb     %01111100                       ; 38EC: 7C       
    fcb     %00000011                       ; 38ED: 03       
    fcb     %00000011                       ; 38EE: 03       
    fcb     %00000011                       ; 38EF: 03       
    fcb     %00000011                       ; 38F0: 03       
    fcb     %00000011                       ; 38F1: 03       
    fcb     %00000011                       ; 38F2: 03       
    fcb     %00000001                       ; 38F3: 01       
    fcb     %00000000                       ; 38F4: 00       
    fcb     %00000001                       ; 38F5: 01       
    fcb     %00000011                       ; 38F6: 03       
    fcb     %00000111                       ; 38F7: 07       
    fcb     %00000000                       ; 38F8: 00       
    fcb     %00000000                       ; 38F9: 00       
    fcb     %00011000                       ; 38FA: 18       
    fcb     %00000001                       ; 38FB: 01       
    fcb     %00001000                       ; 38FC: 08       
Jetman_Walk_Left_3
    fcb     %10000000                       ; 38FD: 80       
    fcb     %11000000                       ; 38FE: C0       
    fcb     %11001000                       ; 38FF: C8       
    fcb     %11001000                       ; 3900: C8       
    fcb     %11010000                       ; 3901: D0       
    fcb     %10011000                       ; 3902: 98       
    fcb     %00011000                       ; 3903: 18       
    fcb     %10101000                       ; 3904: A8       
    fcb     %10111000                       ; 3905: B8       
    fcb     %10101000                       ; 3906: A8       
    fcb     %10111000                       ; 3907: B8       
    fcb     %01101000                       ; 3908: 68       
    fcb     %01111000                       ; 3909: 78       
    fcb     %11110000                       ; 390A: F0       
    fcb     %01010000                       ; 390B: 50       
    fcb     %10101000                       ; 390C: A8       
    fcb     %11111000                       ; 390D: F8       
    fcb     %00000000                       ; 390E: 00       
    fcb     %00000000                       ; 390F: 00       
    fcb     %10000000                       ; 3910: 80       
    fcb     %10000000                       ; 3911: 80       
    fcb     %10000000                       ; 3912: 80       
    fcb     %00000000                       ; 3913: 00       
    fcb     %00000000                       ; 3914: 00       
    fcb     %00000111                       ; 3915: 07       
    fcb     %00000001                       ; 3916: 01       
    fcb     %00011110                       ; 3917: 1E       
    fcb     %00011101                       ; 3918: 1D       
    fcb     %00011101                       ; 3919: 1D       
    fcb     %00001111                       ; 391A: 0F       
    fcb     %00000000                       ; 391B: 00       
    fcb     %00000111                       ; 391C: 07       
    fcb     %00101100                       ; 391D: 2C       
    fcb     %00101100                       ; 391E: 2C       
    fcb     %11110000                       ; 391F: F0       
    fcb     %00001111                       ; 3920: 0F       
    fcb     %00001111                       ; 3921: 0F       
    fcb     %00001111                       ; 3922: 0F       
    fcb     %00001111                       ; 3923: 0F       
    fcb     %00001110                       ; 3924: 0E       
    fcb     %00001110                       ; 3925: 0E       
    fcb     %00010111                       ; 3926: 17       
    fcb     %00001011                       ; 3927: 0B       
    fcb     %00011001                       ; 3928: 19       
    fcb     %00111011                       ; 3929: 3B       
    fcb     %01111111                       ; 392A: 7F       
    fcb     %00000000                       ; 392B: 00       
    fcb     %00000000                       ; 392C: 00       
    fcb     %00011000                       ; 392D: 18       
    fcb     %00000001                       ; 392E: 01       
    fcb     %00001000                       ; 392F: 08       
Jetman_Walk_Left_2
    fcb     %00000000                       ; 3930: 00       
    fcb     %00000000                       ; 3931: 00       
    fcb     %01000000                       ; 3932: 40       
    fcb     %01000000                       ; 3933: 40       
    fcb     %01000000                       ; 3934: 40       
    fcb     %01100000                       ; 3935: 60       
    fcb     %01100000                       ; 3936: 60       
    fcb     %10100000                       ; 3937: A0       
    fcb     %11100000                       ; 3938: E0       
    fcb     %10100000                       ; 3939: A0       
    fcb     %11100000                       ; 393A: E0       
    fcb     %10100000                       ; 393B: A0       
    fcb     %11100000                       ; 393C: E0       
    fcb     %11000000                       ; 393D: C0       
    fcb     %01000000                       ; 393E: 40       
    fcb     %10100000                       ; 393F: A0       
    fcb     %11100000                       ; 3940: E0       
    fcb     %00000000                       ; 3941: 00       
    fcb     %00000000                       ; 3942: 00       
    fcb     %10000000                       ; 3943: 80       
    fcb     %10000000                       ; 3944: 80       
    fcb     %00000000                       ; 3945: 00       
    fcb     %00000000                       ; 3946: 00       
    fcb     %00000000                       ; 3947: 00       
    fcb     %00011110                       ; 3948: 1E       
    fcb     %00000111                       ; 3949: 07       
    fcb     %01111011                       ; 394A: 7B       
    fcb     %01110111                       ; 394B: 77       
    fcb     %01110111                       ; 394C: 77       
    fcb     %00111110                       ; 394D: 3E       
    fcb     %00000000                       ; 394E: 00       
    fcb     %00011110                       ; 394F: 1E       
    fcb     %10110010                       ; 3950: B2       
    fcb     %10110010                       ; 3951: B2       
    fcb     %11000010                       ; 3952: C2       
    fcb     %00111101                       ; 3953: 3D       
    fcb     %00111101                       ; 3954: 3D       
    fcb     %00111111                       ; 3955: 3F       
    fcb     %00111101                       ; 3956: 3D       
    fcb     %01111110                       ; 3957: 7E       
    fcb     %01111111                       ; 3958: 7F       
    fcb     %11011100                       ; 3959: DC       
    fcb     %11001110                       ; 395A: CE       
    fcb     %10000101                       ; 395B: 85       
    fcb     %10000011                       ; 395C: 83       
    fcb     %10000111                       ; 395D: 87       
    fcb     %00000000                       ; 395E: 00       
    fcb     %00000000                       ; 395F: 00       
    fcb     %00000000                       ; 3960: 00       
    fcb     %00000000                       ; 3961: 00       
    fcb     %00000000                       ; 3962: 00       
    fcb     %00000000                       ; 3963: 00       
    fcb     %00000000                       ; 3964: 00       
    fcb     %00000000                       ; 3965: 00       
    fcb     %00000000                       ; 3966: 00       
    fcb     %00000000                       ; 3967: 00       
    fcb     %00000000                       ; 3968: 00       
    fcb     %00000000                       ; 3969: 00       
    fcb     %00000111                       ; 396A: 07       
    fcb     %00000000                       ; 396B: 00       
    fcb     %00000000                       ; 396C: 00       
    fcb     %00000000                       ; 396D: 00       
    fcb     %00000000                       ; 396E: 00       
    fcb     %00000000                       ; 396F: 00       
    fcb     %00000000                       ; 3970: 00       
    fcb     %00000000                       ; 3971: 00       
    fcb     %00000000                       ; 3972: 00       
    fcb     %00000001                       ; 3973: 01       
    fcb     %00000011                       ; 3974: 03       
    fcb     %00000111                       ; 3975: 07       
    fcb     %00000000                       ; 3976: 00       
    fcb     %00000000                       ; 3977: 00       
    fcb     %00011000                       ; 3978: 18       
    fcb     %00000010                       ; 3979: 02       
    fcb     %00000000                       ; 397A: 00       
Jetman_Walk_Left_1
    fcb     %00000000                       ; 397B: 00       
    fcb     %00000000                       ; 397C: 00       
    fcb     %10000000                       ; 397D: 80       
    fcb     %10000000                       ; 397E: 80       
    fcb     %10000000                       ; 397F: 80       
    fcb     %10000000                       ; 3980: 80       
    fcb     %10000000                       ; 3981: 80       
    fcb     %10000000                       ; 3982: 80       
    fcb     %10000000                       ; 3983: 80       
    fcb     %10000000                       ; 3984: 80       
    fcb     %10000000                       ; 3985: 80       
    fcb     %10000000                       ; 3986: 80       
    fcb     %10000000                       ; 3987: 80       
    fcb     %00000000                       ; 3988: 00       
    fcb     %00000000                       ; 3989: 00       
    fcb     %10000000                       ; 398A: 80       
    fcb     %10000000                       ; 398B: 80       
    fcb     %00000000                       ; 398C: 00       
    fcb     %00000000                       ; 398D: 00       
    fcb     %00000000                       ; 398E: 00       
    fcb     %00000000                       ; 398F: 00       
    fcb     %00000000                       ; 3990: 00       
    fcb     %00000000                       ; 3991: 00       
    fcb     %00000000                       ; 3992: 00       
    fcb     %01111000                       ; 3993: 78       
    fcb     %00011100                       ; 3994: 1C       
    fcb     %11101100                       ; 3995: EC       
    fcb     %11011100                       ; 3996: DC       
    fcb     %11011100                       ; 3997: DC       
    fcb     %11111000                       ; 3998: F8       
    fcb     %00000001                       ; 3999: 01       
    fcb     %01110101                       ; 399A: 75       
    fcb     %11001011                       ; 399B: CB       
    fcb     %11001010                       ; 399C: CA       
    fcb     %00001011                       ; 399D: 0B       
    fcb     %11111000                       ; 399E: F8       
    fcb     %11110111                       ; 399F: F7       
    fcb     %11111111                       ; 39A0: FF       
    fcb     %11110101                       ; 39A1: F5       
    fcb     %11101010                       ; 39A2: EA       
    fcb     %11101111                       ; 39A3: EF       
    fcb     %01110000                       ; 39A4: 70       
    fcb     %10110000                       ; 39A5: B0       
    fcb     %10011000                       ; 39A6: 98       
    fcb     %10111000                       ; 39A7: B8       
    fcb     %11111000                       ; 39A8: F8       
    fcb     %00000000                       ; 39A9: 00       
    fcb     %00000000                       ; 39AA: 00       
    fcb     %00000000                       ; 39AB: 00       
    fcb     %00000000                       ; 39AC: 00       
    fcb     %00000001                       ; 39AD: 01       
    fcb     %00000001                       ; 39AE: 01       
    fcb     %00000001                       ; 39AF: 01       
    fcb     %00000000                       ; 39B0: 00       
    fcb     %00000000                       ; 39B1: 00       
    fcb     %00000000                       ; 39B2: 00       
    fcb     %00000010                       ; 39B3: 02       
    fcb     %00000010                       ; 39B4: 02       
    fcb     %00011111                       ; 39B5: 1F       
    fcb     %00000000                       ; 39B6: 00       
    fcb     %00000000                       ; 39B7: 00       
    fcb     %00000000                       ; 39B8: 00       
    fcb     %00000000                       ; 39B9: 00       
    fcb     %00000000                       ; 39BA: 00       
    fcb     %00000000                       ; 39BB: 00       
    fcb     %00000001                       ; 39BC: 01       
    fcb     %00000000                       ; 39BD: 00       
    fcb     %00000001                       ; 39BE: 01       
    fcb     %00000011                       ; 39BF: 03       
    fcb     %00000111                       ; 39C0: 07       
    fcb     %00000000                       ; 39C1: 00       
    fcb     %00000000                       ; 39C2: 00       
    fcb     %00011000                       ; 39C3: 18       
    fcb     %00000010                       ; 39C4: 02       
    fcb     %00000000                       ; 39C5: 00       
Jetman_Walk_Left_0
    fcb     %10000000                       ; 39C6: 80       
    fcb     %00000000                       ; 39C7: 00       
    fcb     %11100000                       ; 39C8: E0       
    fcb     %11100000                       ; 39C9: E0       
    fcb     %11100000                       ; 39CA: E0       
    fcb     %11000000                       ; 39CB: C0       
    fcb     %00000000                       ; 39CC: 00       
    fcb     %10000000                       ; 39CD: 80       
    fcb     %11010000                       ; 39CE: D0       
    fcb     %11010000                       ; 39CF: D0       
    fcb     %00111110                       ; 39D0: 3E       
    fcb     %11000000                       ; 39D1: C0       
    fcb     %11000000                       ; 39D2: C0       
    fcb     %11000000                       ; 39D3: C0       
    fcb     %11000000                       ; 39D4: C0       
    fcb     %11000000                       ; 39D5: C0       
    fcb     %11000000                       ; 39D6: C0       
    fcb     %10000000                       ; 39D7: 80       
    fcb     %00000000                       ; 39D8: 00       
    fcb     %10000000                       ; 39D9: 80       
    fcb     %11000000                       ; 39DA: C0       
    fcb     %11100000                       ; 39DB: E0       
    fcb     %00000000                       ; 39DC: 00       
    fcb     %00000000                       ; 39DD: 00       
    fcb     %00000111                       ; 39DE: 07       
    fcb     %00001110                       ; 39DF: 0E       
    fcb     %00101101                       ; 39E0: 2D       
    fcb     %00101110                       ; 39E1: 2E       
    fcb     %00101110                       ; 39E2: 2E       
    fcb     %01100111                       ; 39E3: 67       
    fcb     %01100000                       ; 39E4: 60       
    fcb     %01010111                       ; 39E5: 57       
    fcb     %01110100                       ; 39E6: 74       
    fcb     %01010100                       ; 39E7: 54       
    fcb     %01110100                       ; 39E8: 74       
    fcb     %01011011                       ; 39E9: 5B       
    fcb     %01111011                       ; 39EA: 7B       
    fcb     %00111111                       ; 39EB: 3F       
    fcb     %00101011                       ; 39EC: 2B       
    fcb     %01010101                       ; 39ED: 55       
    fcb     %01111101                       ; 39EE: 7D       
    fcb     %00000001                       ; 39EF: 01       
    fcb     %00000000                       ; 39F0: 00       
    fcb     %00000001                       ; 39F1: 01       
    fcb     %00000001                       ; 39F2: 01       
    fcb     %00000001                       ; 39F3: 01       
    fcb     %00000000                       ; 39F4: 00       
    fcb     %00000000                       ; 39F5: 00       
    fcb     %00011000                       ; 39F6: 18       
    fcb     %00000001                       ; 39F7: 01       
    fcb     %00000000                       ; 39F8: 00       
Jetman_Walk_Right_0
    fcb     %11100000                       ; 39F9: E0       
    fcb     %10000000                       ; 39FA: 80       
    fcb     %01111000                       ; 39FB: 78       
    fcb     %10111000                       ; 39FC: B8       
    fcb     %10111000                       ; 39FD: B8       
    fcb     %11110000                       ; 39FE: F0       
    fcb     %00000000                       ; 39FF: 00       
    fcb     %11100000                       ; 3A00: E0       
    fcb     %00110100                       ; 3A01: 34       
    fcb     %00110100                       ; 3A02: 34       
    fcb     %00001111                       ; 3A03: 0F       
    fcb     %11110000                       ; 3A04: F0       
    fcb     %11110000                       ; 3A05: F0       
    fcb     %11110000                       ; 3A06: F0       
    fcb     %11110000                       ; 3A07: F0       
    fcb     %01110000                       ; 3A08: 70       
    fcb     %01110000                       ; 3A09: 70       
    fcb     %11101000                       ; 3A0A: E8       
    fcb     %11010000                       ; 3A0B: D0       
    fcb     %10011000                       ; 3A0C: 98       
    fcb     %11011100                       ; 3A0D: DC       
    fcb     %11111110                       ; 3A0E: FE       
    fcb     %00000000                       ; 3A0F: 00       
    fcb     %00000000                       ; 3A10: 00       
    fcb     %00000001                       ; 3A11: 01       
    fcb     %00000011                       ; 3A12: 03       
    fcb     %00010011                       ; 3A13: 13       
    fcb     %00010011                       ; 3A14: 13       
    fcb     %00001011                       ; 3A15: 0B       
    fcb     %00011001                       ; 3A16: 19       
    fcb     %00011000                       ; 3A17: 18       
    fcb     %00010101                       ; 3A18: 15       
    fcb     %00011011                       ; 3A19: 1B       
    fcb     %00010101                       ; 3A1A: 15       
    fcb     %00011101                       ; 3A1B: 1D       
    fcb     %00010110                       ; 3A1C: 16       
    fcb     %00011110                       ; 3A1D: 1E       
    fcb     %00001111                       ; 3A1E: 0F       
    fcb     %00001010                       ; 3A1F: 0A       
    fcb     %00010101                       ; 3A20: 15       
    fcb     %00011111                       ; 3A21: 1F       
    fcb     %00000000                       ; 3A22: 00       
    fcb     %00000000                       ; 3A23: 00       
    fcb     %00000001                       ; 3A24: 01       
    fcb     %00000001                       ; 3A25: 01       
    fcb     %00000001                       ; 3A26: 01       
    fcb     %00000000                       ; 3A27: 00       
    fcb     %00000000                       ; 3A28: 00       
    fcb     %00011000                       ; 3A29: 18       
    fcb     %00000001                       ; 3A2A: 01       
    fcb     %00000000                       ; 3A2B: 00       
Jetman_Walk_Right_1
    fcb     %00000000                       ; 3A2C: 00       
    fcb     %00000000                       ; 3A2D: 00       
    fcb     %00000000                       ; 3A2E: 00       
    fcb     %00000000                       ; 3A2F: 00       
    fcb     %00000000                       ; 3A30: 00       
    fcb     %00000000                       ; 3A31: 00       
    fcb     %00000000                       ; 3A32: 00       
    fcb     %00000000                       ; 3A33: 00       
    fcb     %00000000                       ; 3A34: 00       
    fcb     %00000000                       ; 3A35: 00       
    fcb     %11100000                       ; 3A36: E0       
    fcb     %00000000                       ; 3A37: 00       
    fcb     %00000000                       ; 3A38: 00       
    fcb     %00000000                       ; 3A39: 00       
    fcb     %00000000                       ; 3A3A: 00       
    fcb     %00000000                       ; 3A3B: 00       
    fcb     %00000000                       ; 3A3C: 00       
    fcb     %00000000                       ; 3A3D: 00       
    fcb     %00000000                       ; 3A3E: 00       
    fcb     %10000000                       ; 3A3F: 80       
    fcb     %11000000                       ; 3A40: C0       
    fcb     %11100000                       ; 3A41: E0       
    fcb     %00000000                       ; 3A42: 00       
    fcb     %00000000                       ; 3A43: 00       
    fcb     %01111000                       ; 3A44: 78       
    fcb     %11100000                       ; 3A45: E0       
    fcb     %11011110                       ; 3A46: DE       
    fcb     %11101110                       ; 3A47: EE       
    fcb     %11101110                       ; 3A48: EE       
    fcb     %01111100                       ; 3A49: 7C       
    fcb     %00000000                       ; 3A4A: 00       
    fcb     %01111000                       ; 3A4B: 78       
    fcb     %01001101                       ; 3A4C: 4D       
    fcb     %01001101                       ; 3A4D: 4D       
    fcb     %01000011                       ; 3A4E: 43       
    fcb     %10111100                       ; 3A4F: BC       
    fcb     %10111100                       ; 3A50: BC       
    fcb     %11111100                       ; 3A51: FC       
    fcb     %10111100                       ; 3A52: BC       
    fcb     %01111110                       ; 3A53: 7E       
    fcb     %11111110                       ; 3A54: FE       
    fcb     %00111011                       ; 3A55: 3B       
    fcb     %01110011                       ; 3A56: 73       
    fcb     %10100001                       ; 3A57: A1       
    fcb     %11000001                       ; 3A58: C1       
    fcb     %11100001                       ; 3A59: E1       
    fcb     %00000000                       ; 3A5A: 00       
    fcb     %00000000                       ; 3A5B: 00       
    fcb     %00000000                       ; 3A5C: 00       
    fcb     %00000000                       ; 3A5D: 00       
    fcb     %00000010                       ; 3A5E: 02       
    fcb     %00000010                       ; 3A5F: 02       
    fcb     %00000010                       ; 3A60: 02       
    fcb     %00000110                       ; 3A61: 06       
    fcb     %00000110                       ; 3A62: 06       
    fcb     %00000101                       ; 3A63: 05       
    fcb     %00000111                       ; 3A64: 07       
    fcb     %00000101                       ; 3A65: 05       
    fcb     %00000111                       ; 3A66: 07       
    fcb     %00000101                       ; 3A67: 05       
    fcb     %00000111                       ; 3A68: 07       
    fcb     %00000011                       ; 3A69: 03       
    fcb     %00000010                       ; 3A6A: 02       
    fcb     %00000101                       ; 3A6B: 05       
    fcb     %00000111                       ; 3A6C: 07       
    fcb     %00000000                       ; 3A6D: 00       
    fcb     %00000000                       ; 3A6E: 00       
    fcb     %00000001                       ; 3A6F: 01       
    fcb     %00000001                       ; 3A70: 01       
    fcb     %00000000                       ; 3A71: 00       
    fcb     %00000000                       ; 3A72: 00       
    fcb     %00000000                       ; 3A73: 00       
    fcb     %00011000                       ; 3A74: 18       
    fcb     %00000010                       ; 3A75: 02       
    fcb     %00000000                       ; 3A76: 00       
Jetman_Walk_Right_2
    fcb     %00000000                       ; 3A77: 00       
    fcb     %00000000                       ; 3A78: 00       
    fcb     %10000000                       ; 3A79: 80       
    fcb     %10000000                       ; 3A7A: 80       
    fcb     %10000000                       ; 3A7B: 80       
    fcb     %00000000                       ; 3A7C: 00       
    fcb     %00000000                       ; 3A7D: 00       
    fcb     %00000000                       ; 3A7E: 00       
    fcb     %01000000                       ; 3A7F: 40       
    fcb     %01000000                       ; 3A80: 40       
    fcb     %11111000                       ; 3A81: F8       
    fcb     %00000000                       ; 3A82: 00       
    fcb     %00000000                       ; 3A83: 00       
    fcb     %00000000                       ; 3A84: 00       
    fcb     %00000000                       ; 3A85: 00       
    fcb     %00000000                       ; 3A86: 00       
    fcb     %00000000                       ; 3A87: 00       
    fcb     %10000000                       ; 3A88: 80       
    fcb     %00000000                       ; 3A89: 00       
    fcb     %10000000                       ; 3A8A: 80       
    fcb     %11000000                       ; 3A8B: C0       
    fcb     %11100000                       ; 3A8C: E0       
    fcb     %00000000                       ; 3A8D: 00       
    fcb     %00000000                       ; 3A8E: 00       
    fcb     %00011110                       ; 3A8F: 1E       
    fcb     %00111000                       ; 3A90: 38       
    fcb     %00110111                       ; 3A91: 37       
    fcb     %00111011                       ; 3A92: 3B       
    fcb     %00111011                       ; 3A93: 3B       
    fcb     %10011111                       ; 3A94: 9F       
    fcb     %10001111                       ; 3A95: 8F       
    fcb     %01011110                       ; 3A96: 5E       
    fcb     %11010011                       ; 3A97: D3       
    fcb     %01010011                       ; 3A98: 53       
    fcb     %11010000                       ; 3A99: D0       
    fcb     %01101111                       ; 3A9A: 6F       
    fcb     %11101111                       ; 3A9B: EF       
    fcb     %11111111                       ; 3A9C: FF       
    fcb     %10101111                       ; 3A9D: AF       
    fcb     %01010111                       ; 3A9E: 57       
    fcb     %11110111                       ; 3A9F: F7       
    fcb     %00001110                       ; 3AA0: 0E       
    fcb     %00001101                       ; 3AA1: 0D       
    fcb     %00011001                       ; 3AA2: 19       
    fcb     %00011101                       ; 3AA3: 1D       
    fcb     %00011111                       ; 3AA4: 1F       
    fcb     %00000000                       ; 3AA5: 00       
    fcb     %00000000                       ; 3AA6: 00       
    fcb     %00000000                       ; 3AA7: 00       
    fcb     %00000000                       ; 3AA8: 00       
    fcb     %00000001                       ; 3AA9: 01       
    fcb     %00000001                       ; 3AAA: 01       
    fcb     %00000001                       ; 3AAB: 01       
    fcb     %00000001                       ; 3AAC: 01       
    fcb     %00000001                       ; 3AAD: 01       
    fcb     %00000001                       ; 3AAE: 01       
    fcb     %00000001                       ; 3AAF: 01       
    fcb     %00000001                       ; 3AB0: 01       
    fcb     %00000001                       ; 3AB1: 01       
    fcb     %00000001                       ; 3AB2: 01       
    fcb     %00000001                       ; 3AB3: 01       
    fcb     %00000000                       ; 3AB4: 00       
    fcb     %00000000                       ; 3AB5: 00       
    fcb     %00000001                       ; 3AB6: 01       
    fcb     %00000001                       ; 3AB7: 01       
    fcb     %00000000                       ; 3AB8: 00       
    fcb     %00000000                       ; 3AB9: 00       
    fcb     %00000000                       ; 3ABA: 00       
    fcb     %00000000                       ; 3ABB: 00       
    fcb     %00000000                       ; 3ABC: 00       
    fcb     %00000000                       ; 3ABD: 00       
    fcb     %00000000                       ; 3ABE: 00       
    fcb     %00011000                       ; 3ABF: 18       
    fcb     %00000010                       ; 3AC0: 02       
    fcb     %00000000                       ; 3AC1: 00       
Jetman_Walk_Right_3
    fcb     %10000000                       ; 3AC2: 80       
    fcb     %11000000                       ; 3AC3: C0       
    fcb     %11010000                       ; 3AC4: D0       
    fcb     %11010000                       ; 3AC5: D0       
    fcb     %11010000                       ; 3AC6: D0       
    fcb     %10011000                       ; 3AC7: 98       
    fcb     %00011000                       ; 3AC8: 18       
    fcb     %10101000                       ; 3AC9: A8       
    fcb     %10111000                       ; 3ACA: B8       
    fcb     %10101000                       ; 3ACB: A8       
    fcb     %10111000                       ; 3ACC: B8       
    fcb     %01101000                       ; 3ACD: 68       
    fcb     %01111000                       ; 3ACE: 78       
    fcb     %11110000                       ; 3ACF: F0       
    fcb     %01010000                       ; 3AD0: 50       
    fcb     %10101000                       ; 3AD1: A8       
    fcb     %11111000                       ; 3AD2: F8       
    fcb     %00000000                       ; 3AD3: 00       
    fcb     %10101000                       ; 3AD4: A8       
    fcb     %00010000                       ; 3AD5: 10       
    fcb     %01010100                       ; 3AD6: 54       
    fcb     %10100000                       ; 3AD7: A0       
    fcb     %00001010                       ; 3AD8: 0A       
    fcb     %01010000                       ; 3AD9: 50       
    fcb     %00000111                       ; 3ADA: 07       
    fcb     %00000001                       ; 3ADB: 01       
    fcb     %00011110                       ; 3ADC: 1E       
    fcb     %00011101                       ; 3ADD: 1D       
    fcb     %00011101                       ; 3ADE: 1D       
    fcb     %00001111                       ; 3ADF: 0F       
    fcb     %00000000                       ; 3AE0: 00       
    fcb     %00000111                       ; 3AE1: 07       
    fcb     %00101100                       ; 3AE2: 2C       
    fcb     %00101100                       ; 3AE3: 2C       
    fcb     %11110000                       ; 3AE4: F0       
    fcb     %00001111                       ; 3AE5: 0F       
    fcb     %00000111                       ; 3AE6: 07       
    fcb     %01111110                       ; 3AE7: 7E       
    fcb     %01111110                       ; 3AE8: 7E       
    fcb     %01100000                       ; 3AE9: 60       
    fcb     %00000000                       ; 3AEA: 00       
    fcb     %11100000                       ; 3AEB: E0       
    fcb     %11100000                       ; 3AEC: E0       
    fcb     %00000001                       ; 3AED: 01       
    fcb     %00000000                       ; 3AEE: 00       
    fcb     %00000000                       ; 3AEF: 00       
    fcb     %00000000                       ; 3AF0: 00       
    fcb     %00000000                       ; 3AF1: 00       
    fcb     %00011000                       ; 3AF2: 18       
    fcb     %00000001                       ; 3AF3: 01       
    fcb     %00001000                       ; 3AF4: 08       
Jetman_Fly_Left_2
    fcb     %00000000                       ; 3AF5: 00       
    fcb     %00000000                       ; 3AF6: 00       
    fcb     %01000000                       ; 3AF7: 40       
    fcb     %01000000                       ; 3AF8: 40       
    fcb     %01000000                       ; 3AF9: 40       
    fcb     %01100000                       ; 3AFA: 60       
    fcb     %01100000                       ; 3AFB: 60       
    fcb     %10100000                       ; 3AFC: A0       
    fcb     %11100000                       ; 3AFD: E0       
    fcb     %10100000                       ; 3AFE: A0       
    fcb     %11100000                       ; 3AFF: E0       
    fcb     %10100000                       ; 3B00: A0       
    fcb     %11100000                       ; 3B01: E0       
    fcb     %11000000                       ; 3B02: C0       
    fcb     %01000000                       ; 3B03: 40       
    fcb     %10100000                       ; 3B04: A0       
    fcb     %11100000                       ; 3B05: E0       
    fcb     %00000000                       ; 3B06: 00       
    fcb     %01100000                       ; 3B07: 60       
    fcb     %00000000                       ; 3B08: 00       
    fcb     %01100000                       ; 3B09: 60       
    fcb     %00001000                       ; 3B0A: 08       
    fcb     %00100000                       ; 3B0B: 20       
    fcb     %10000000                       ; 3B0C: 80       
    fcb     %00011110                       ; 3B0D: 1E       
    fcb     %00000111                       ; 3B0E: 07       
    fcb     %01111011                       ; 3B0F: 7B       
    fcb     %01110111                       ; 3B10: 77       
    fcb     %01110111                       ; 3B11: 77       
    fcb     %00111110                       ; 3B12: 3E       
    fcb     %00000000                       ; 3B13: 00       
    fcb     %00011110                       ; 3B14: 1E       
    fcb     %10110010                       ; 3B15: B2       
    fcb     %10110010                       ; 3B16: B2       
    fcb     %11000010                       ; 3B17: C2       
    fcb     %00111101                       ; 3B18: 3D       
    fcb     %00011101                       ; 3B19: 1D       
    fcb     %11111011                       ; 3B1A: FB       
    fcb     %11111001                       ; 3B1B: F9       
    fcb     %10000010                       ; 3B1C: 82       
    fcb     %00000011                       ; 3B1D: 03       
    fcb     %10000000                       ; 3B1E: 80       
    fcb     %10000011                       ; 3B1F: 83       
    fcb     %00000001                       ; 3B20: 01       
    fcb     %00000000                       ; 3B21: 00       
    fcb     %00000001                       ; 3B22: 01       
    fcb     %00000000                       ; 3B23: 00       
    fcb     %00000000                       ; 3B24: 00       
    fcb     %00000000                       ; 3B25: 00       
    fcb     %00000000                       ; 3B26: 00       
    fcb     %00000000                       ; 3B27: 00       
    fcb     %00000000                       ; 3B28: 00       
    fcb     %00000000                       ; 3B29: 00       
    fcb     %00000000                       ; 3B2A: 00       
    fcb     %00000000                       ; 3B2B: 00       
    fcb     %00000000                       ; 3B2C: 00       
    fcb     %00000000                       ; 3B2D: 00       
    fcb     %00000000                       ; 3B2E: 00       
    fcb     %00000111                       ; 3B2F: 07       
    fcb     %00000000                       ; 3B30: 00       
    fcb     %00000000                       ; 3B31: 00       
    fcb     %00000001                       ; 3B32: 01       
    fcb     %00000001                       ; 3B33: 01       
    fcb     %00000001                       ; 3B34: 01       
    fcb     %00000000                       ; 3B35: 00       
    fcb     %00000011                       ; 3B36: 03       
    fcb     %00000111                       ; 3B37: 07       
    fcb     %00000000                       ; 3B38: 00       
    fcb     %00000000                       ; 3B39: 00       
    fcb     %00000000                       ; 3B3A: 00       
    fcb     %00000000                       ; 3B3B: 00       
    fcb     %00000000                       ; 3B3C: 00       
    fcb     %00011000                       ; 3B3D: 18       
    fcb     %00000010                       ; 3B3E: 02       
    fcb     %00000000                       ; 3B3F: 00       
Jetman_Fly_Left_1
    fcb     %00000000                       ; 3B40: 00       
    fcb     %00000000                       ; 3B41: 00       
    fcb     %00000000                       ; 3B42: 00       
    fcb     %00000000                       ; 3B43: 00       
    fcb     %00000000                       ; 3B44: 00       
    fcb     %10000000                       ; 3B45: 80       
    fcb     %10000000                       ; 3B46: 80       
    fcb     %10000000                       ; 3B47: 80       
    fcb     %10000000                       ; 3B48: 80       
    fcb     %10000000                       ; 3B49: 80       
    fcb     %10000000                       ; 3B4A: 80       
    fcb     %10000000                       ; 3B4B: 80       
    fcb     %10000000                       ; 3B4C: 80       
    fcb     %00000000                       ; 3B4D: 00       
    fcb     %00000000                       ; 3B4E: 00       
    fcb     %10000000                       ; 3B4F: 80       
    fcb     %10000000                       ; 3B50: 80       
    fcb     %00000000                       ; 3B51: 00       
    fcb     %01000000                       ; 3B52: 40       
    fcb     %00000000                       ; 3B53: 00       
    fcb     %01000000                       ; 3B54: 40       
    fcb     %10010000                       ; 3B55: 90       
    fcb     %00000000                       ; 3B56: 00       
    fcb     %00100000                       ; 3B57: 20       
    fcb     %01111000                       ; 3B58: 78       
    fcb     %00011100                       ; 3B59: 1C       
    fcb     %11101101                       ; 3B5A: ED       
    fcb     %11011101                       ; 3B5B: DD       
    fcb     %11011101                       ; 3B5C: DD       
    fcb     %11111001                       ; 3B5D: F9       
    fcb     %00000001                       ; 3B5E: 01       
    fcb     %01111010                       ; 3B5F: 7A       
    fcb     %11001011                       ; 3B60: CB       
    fcb     %11001010                       ; 3B61: CA       
    fcb     %00001011                       ; 3B62: 0B       
    fcb     %11110110                       ; 3B63: F6       
    fcb     %01110111                       ; 3B64: 77       
    fcb     %11101111                       ; 3B65: EF       
    fcb     %11100101                       ; 3B66: E5       
    fcb     %00001010                       ; 3B67: 0A       
    fcb     %00001111                       ; 3B68: 0F       
    fcb     %00000000                       ; 3B69: 00       
    fcb     %00001011                       ; 3B6A: 0B       
    fcb     %00001001                       ; 3B6B: 09       
    fcb     %00000010                       ; 3B6C: 02       
    fcb     %00000100                       ; 3B6D: 04       
    fcb     %00000001                       ; 3B6E: 01       
    fcb     %00000000                       ; 3B6F: 00       
    fcb     %00000000                       ; 3B70: 00       
    fcb     %00000000                       ; 3B71: 00       
    fcb     %00000001                       ; 3B72: 01       
    fcb     %00000001                       ; 3B73: 01       
    fcb     %00000001                       ; 3B74: 01       
    fcb     %00000000                       ; 3B75: 00       
    fcb     %00000000                       ; 3B76: 00       
    fcb     %00000000                       ; 3B77: 00       
    fcb     %00000010                       ; 3B78: 02       
    fcb     %00000010                       ; 3B79: 02       
    fcb     %00011111                       ; 3B7A: 1F       
    fcb     %00000000                       ; 3B7B: 00       
    fcb     %00000000                       ; 3B7C: 00       
    fcb     %00000111                       ; 3B7D: 07       
    fcb     %00000111                       ; 3B7E: 07       
    fcb     %00000110                       ; 3B7F: 06       
    fcb     %00000000                       ; 3B80: 00       
    fcb     %00001110                       ; 3B81: 0E       
    fcb     %00011110                       ; 3B82: 1E       
    fcb     %00000000                       ; 3B83: 00       
    fcb     %00000000                       ; 3B84: 00       
    fcb     %00000000                       ; 3B85: 00       
    fcb     %00000000                       ; 3B86: 00       
    fcb     %00000000                       ; 3B87: 00       
    fcb     %00011000                       ; 3B88: 18       
    fcb     %00000010                       ; 3B89: 02       
    fcb     %00000000                       ; 3B8A: 00       
Jetman_Fly_Left_0
    fcb     %10000000                       ; 3B8B: 80       
    fcb     %00000000                       ; 3B8C: 00       
    fcb     %11100000                       ; 3B8D: E0       
    fcb     %11100000                       ; 3B8E: E0       
    fcb     %11100000                       ; 3B8F: E0       
    fcb     %11000000                       ; 3B90: C0       
    fcb     %00000000                       ; 3B91: 00       
    fcb     %10000000                       ; 3B92: 80       
    fcb     %11010000                       ; 3B93: D0       
    fcb     %11010000                       ; 3B94: D0       
    fcb     %00111110                       ; 3B95: 3E       
    fcb     %11000000                       ; 3B96: C0       
    fcb     %10000000                       ; 3B97: 80       
    fcb     %11111000                       ; 3B98: F8       
    fcb     %11111000                       ; 3B99: F8       
    fcb     %00011000                       ; 3B9A: 18       
    fcb     %00000000                       ; 3B9B: 00       
    fcb     %00011100                       ; 3B9C: 1C       
    fcb     %00011110                       ; 3B9D: 1E       
    fcb     %00000000                       ; 3B9E: 00       
    fcb     %00000000                       ; 3B9F: 00       
    fcb     %00000000                       ; 3BA0: 00       
    fcb     %00000000                       ; 3BA1: 00       
    fcb     %00000000                       ; 3BA2: 00       
    fcb     %00000111                       ; 3BA3: 07       
    fcb     %00001110                       ; 3BA4: 0E       
    fcb     %00101101                       ; 3BA5: 2D       
    fcb     %00101110                       ; 3BA6: 2E       
    fcb     %00101110                       ; 3BA7: 2E       
    fcb     %01100111                       ; 3BA8: 67       
    fcb     %01100000                       ; 3BA9: 60       
    fcb     %01010111                       ; 3BAA: 57       
    fcb     %01110100                       ; 3BAB: 74       
    fcb     %01010100                       ; 3BAC: 54       
    fcb     %01110100                       ; 3BAD: 74       
    fcb     %01011011                       ; 3BAE: 5B       
    fcb     %01111011                       ; 3BAF: 7B       
    fcb     %00111101                       ; 3BB0: 3D       
    fcb     %00101001                       ; 3BB1: 29       
    fcb     %01010100                       ; 3BB2: 54       
    fcb     %01111100                       ; 3BB3: 7C       
    fcb     %00000000                       ; 3BB4: 00       
    fcb     %01010100                       ; 3BB5: 54       
    fcb     %00101000                       ; 3BB6: 28       
    fcb     %00000100                       ; 3BB7: 04       
    fcb     %11010000                       ; 3BB8: D0       
    fcb     %00101000                       ; 3BB9: 28       
    fcb     %01010000                       ; 3BBA: 50       
    fcb     %00011000                       ; 3BBB: 18       
    fcb     %00000001                       ; 3BBC: 01       
    fcb     %00000000                       ; 3BBD: 00       
Jetman_Fly_Right_0
    fcb     %11100000                       ; 3BBE: E0       
    fcb     %10000000                       ; 3BBF: 80       
    fcb     %01111000                       ; 3BC0: 78       
    fcb     %10111000                       ; 3BC1: B8       
    fcb     %10111000                       ; 3BC2: B8       
    fcb     %11110000                       ; 3BC3: F0       
    fcb     %00000000                       ; 3BC4: 00       
    fcb     %11100000                       ; 3BC5: E0       
    fcb     %00110100                       ; 3BC6: 34       
    fcb     %00110100                       ; 3BC7: 34       
    fcb     %00001111                       ; 3BC8: 0F       
    fcb     %11110000                       ; 3BC9: F0       
    fcb     %11100000                       ; 3BCA: E0       
    fcb     %01111110                       ; 3BCB: 7E       
    fcb     %01111110                       ; 3BCC: 7E       
    fcb     %00000110                       ; 3BCD: 06       
    fcb     %00000000                       ; 3BCE: 00       
    fcb     %00000111                       ; 3BCF: 07       
    fcb     %00000111                       ; 3BD0: 07       
    fcb     %10000000                       ; 3BD1: 80       
    fcb     %00000000                       ; 3BD2: 00       
    fcb     %00000000                       ; 3BD3: 00       
    fcb     %00000000                       ; 3BD4: 00       
    fcb     %00000000                       ; 3BD5: 00       
    fcb     %00000001                       ; 3BD6: 01       
    fcb     %00000011                       ; 3BD7: 03       
    fcb     %00001011                       ; 3BD8: 0B       
    fcb     %00001011                       ; 3BD9: 0B       
    fcb     %00001011                       ; 3BDA: 0B       
    fcb     %00011001                       ; 3BDB: 19       
    fcb     %00011000                       ; 3BDC: 18       
    fcb     %00010101                       ; 3BDD: 15       
    fcb     %00011101                       ; 3BDE: 1D       
    fcb     %00010101                       ; 3BDF: 15       
    fcb     %00011101                       ; 3BE0: 1D       
    fcb     %00010110                       ; 3BE1: 16       
    fcb     %00011110                       ; 3BE2: 1E       
    fcb     %00001111                       ; 3BE3: 0F       
    fcb     %00001010                       ; 3BE4: 0A       
    fcb     %00010101                       ; 3BE5: 15       
    fcb     %00011111                       ; 3BE6: 1F       
    fcb     %00000000                       ; 3BE7: 00       
    fcb     %00010101                       ; 3BE8: 15       
    fcb     %00001000                       ; 3BE9: 08       
    fcb     %00011010                       ; 3BEA: 1A       
    fcb     %00000101                       ; 3BEB: 05       
    fcb     %01010000                       ; 3BEC: 50       
    fcb     %00001010                       ; 3BED: 0A       
    fcb     %00011000                       ; 3BEE: 18       
    fcb     %00000001                       ; 3BEF: 01       
    fcb     %00000000                       ; 3BF0: 00       
Jetman_Fly_Right_1
    fcb     %00000000                       ; 3BF1: 00       
    fcb     %00000000                       ; 3BF2: 00       
    fcb     %00000000                       ; 3BF3: 00       
    fcb     %00000000                       ; 3BF4: 00       
    fcb     %00000000                       ; 3BF5: 00       
    fcb     %00000000                       ; 3BF6: 00       
    fcb     %00000000                       ; 3BF7: 00       
    fcb     %00000000                       ; 3BF8: 00       
    fcb     %00000000                       ; 3BF9: 00       
    fcb     %00000000                       ; 3BFA: 00       
    fcb     %11100000                       ; 3BFB: E0       
    fcb     %00000000                       ; 3BFC: 00       
    fcb     %00000000                       ; 3BFD: 00       
    fcb     %10000000                       ; 3BFE: 80       
    fcb     %10000000                       ; 3BFF: 80       
    fcb     %10000000                       ; 3C00: 80       
    fcb     %00000000                       ; 3C01: 00       
    fcb     %11000000                       ; 3C02: C0       
    fcb     %11100000                       ; 3C03: E0       
    fcb     %00000000                       ; 3C04: 00       
    fcb     %00000000                       ; 3C05: 00       
    fcb     %00000000                       ; 3C06: 00       
    fcb     %00000000                       ; 3C07: 00       
    fcb     %00000000                       ; 3C08: 00       
    fcb     %01111000                       ; 3C09: 78       
    fcb     %11100000                       ; 3C0A: E0       
    fcb     %11011110                       ; 3C0B: DE       
    fcb     %11101110                       ; 3C0C: EE       
    fcb     %11101110                       ; 3C0D: EE       
    fcb     %01111100                       ; 3C0E: 7C       
    fcb     %00000000                       ; 3C0F: 00       
    fcb     %01111000                       ; 3C10: 78       
    fcb     %01001101                       ; 3C11: 4D       
    fcb     %01001101                       ; 3C12: 4D       
    fcb     %01000011                       ; 3C13: 43       
    fcb     %10111100                       ; 3C14: BC       
    fcb     %10111000                       ; 3C15: B8       
    fcb     %11011111                       ; 3C16: DF       
    fcb     %10011111                       ; 3C17: 9F       
    fcb     %01000001                       ; 3C18: 41       
    fcb     %11000000                       ; 3C19: C0       
    fcb     %00000001                       ; 3C1A: 01       
    fcb     %11000001                       ; 3C1B: C1       
    fcb     %10000000                       ; 3C1C: 80       
    fcb     %00000000                       ; 3C1D: 00       
    fcb     %10000000                       ; 3C1E: 80       
    fcb     %00000000                       ; 3C1F: 00       
    fcb     %00000000                       ; 3C20: 00       
    fcb     %00000000                       ; 3C21: 00       
    fcb     %00000000                       ; 3C22: 00       
    fcb     %00000010                       ; 3C23: 02       
    fcb     %00000010                       ; 3C24: 02       
    fcb     %00000010                       ; 3C25: 02       
    fcb     %00000110                       ; 3C26: 06       
    fcb     %00000110                       ; 3C27: 06       
    fcb     %00000101                       ; 3C28: 05       
    fcb     %00000111                       ; 3C29: 07       
    fcb     %00000101                       ; 3C2A: 05       
    fcb     %00000111                       ; 3C2B: 07       
    fcb     %00000101                       ; 3C2C: 05       
    fcb     %00000111                       ; 3C2D: 07       
    fcb     %00000011                       ; 3C2E: 03       
    fcb     %00000010                       ; 3C2F: 02       
    fcb     %00000101                       ; 3C30: 05       
    fcb     %00000111                       ; 3C31: 07       
    fcb     %00000000                       ; 3C32: 00       
    fcb     %00000110                       ; 3C33: 06       
    fcb     %00000000                       ; 3C34: 00       
    fcb     %00000110                       ; 3C35: 06       
    fcb     %00010000                       ; 3C36: 10       
    fcb     %00000100                       ; 3C37: 04       
    fcb     %00000001                       ; 3C38: 01       
    fcb     %00011000                       ; 3C39: 18       
    fcb     %00000010                       ; 3C3A: 02       
    fcb     %00000000                       ; 3C3B: 00       
Jetman_Fly_Right_2
    fcb     %00000000                       ; 3C3C: 00       
    fcb     %00000000                       ; 3C3D: 00       
    fcb     %10000000                       ; 3C3E: 80       
    fcb     %10000000                       ; 3C3F: 80       
    fcb     %10000000                       ; 3C40: 80       
    fcb     %00000000                       ; 3C41: 00       
    fcb     %00000000                       ; 3C42: 00       
    fcb     %00000000                       ; 3C43: 00       
    fcb     %01000000                       ; 3C44: 40       
    fcb     %01000000                       ; 3C45: 40       
    fcb     %11111000                       ; 3C46: F8       
    fcb     %00000000                       ; 3C47: 00       
    fcb     %00000000                       ; 3C48: 00       
    fcb     %11100000                       ; 3C49: E0       
    fcb     %11100000                       ; 3C4A: E0       
    fcb     %01100000                       ; 3C4B: 60       
    fcb     %00000000                       ; 3C4C: 00       
    fcb     %01110000                       ; 3C4D: 70       
    fcb     %01111000                       ; 3C4E: 78       
    fcb     %00000000                       ; 3C4F: 00       
    fcb     %00000000                       ; 3C50: 00       
    fcb     %00000000                       ; 3C51: 00       
    fcb     %00000000                       ; 3C52: 00       
    fcb     %00000000                       ; 3C53: 00       
    fcb     %00011110                       ; 3C54: 1E       
    fcb     %00111000                       ; 3C55: 38       
    fcb     %10110111                       ; 3C56: B7       
    fcb     %10111011                       ; 3C57: BB       
    fcb     %10111011                       ; 3C58: BB       
    fcb     %10011111                       ; 3C59: 9F       
    fcb     %10000000                       ; 3C5A: 80       
    fcb     %01011110                       ; 3C5B: 5E       
    fcb     %11010011                       ; 3C5C: D3       
    fcb     %01010011                       ; 3C5D: 53       
    fcb     %11010000                       ; 3C5E: D0       
    fcb     %01101111                       ; 3C5F: 6F       
    fcb     %11101110                       ; 3C60: EE       
    fcb     %11110111                       ; 3C61: F7       
    fcb     %10100111                       ; 3C62: A7       
    fcb     %01010000                       ; 3C63: 50       
    fcb     %11110000                       ; 3C64: F0       
    fcb     %00000000                       ; 3C65: 00       
    fcb     %11010000                       ; 3C66: D0       
    fcb     %10010000                       ; 3C67: 90       
    fcb     %01000000                       ; 3C68: 40       
    fcb     %00100000                       ; 3C69: 20       
    fcb     %10000000                       ; 3C6A: 80       
    fcb     %00000000                       ; 3C6B: 00       
    fcb     %00000000                       ; 3C6C: 00       
    fcb     %00000000                       ; 3C6D: 00       
    fcb     %00000000                       ; 3C6E: 00       
    fcb     %00000000                       ; 3C6F: 00       
    fcb     %00000000                       ; 3C70: 00       
    fcb     %00000001                       ; 3C71: 01       
    fcb     %00000001                       ; 3C72: 01       
    fcb     %00000001                       ; 3C73: 01       
    fcb     %00000001                       ; 3C74: 01       
    fcb     %00000001                       ; 3C75: 01       
    fcb     %00000001                       ; 3C76: 01       
    fcb     %00000001                       ; 3C77: 01       
    fcb     %00000001                       ; 3C78: 01       
    fcb     %00000000                       ; 3C79: 00       
    fcb     %00000000                       ; 3C7A: 00       
    fcb     %00000001                       ; 3C7B: 01       
    fcb     %00000001                       ; 3C7C: 01       
    fcb     %00000000                       ; 3C7D: 00       
    fcb     %00000010                       ; 3C7E: 02       
    fcb     %00000000                       ; 3C7F: 00       
    fcb     %00000010                       ; 3C80: 02       
    fcb     %00001001                       ; 3C81: 09       
    fcb     %00000000                       ; 3C82: 00       
    fcb     %00000100                       ; 3C83: 04       
    fcb     %00011000                       ; 3C84: 18       
    fcb     %00000010                       ; 3C85: 02       
    fcb     %00000000                       ; 3C86: 00       
; $3C87 = Jetman_Fly_Right_3, it's referenced after the end of the object's data

UDG_Data_Ship_Fuel_Valuables
    fdb     $3CD4                           ; 3C87: D4 3C    
    fdb     Ship_2_Base                     ; 3C89: 3D 3D    
    fdb     Ship_1_Base                     ; 3C8B: D4 3C    
    fdb     Ship_2_Base                     ; 3C8D: 3D 3D    
    fdb     Ship_1_Mid                      ; 3C8F: F7 3C    
    fdb     Ship_2_Mid                      ; 3C91: 60 3D    
    fdb     Ship_1_Mid                      ; 3C93: F7 3C    
    fdb     Ship_2_Mid                      ; 3C95: 60 3D    
    fdb     Ship_1_Top                      ; 3C97: 1A 3D    
    fdb     Ship_2_Top                      ; 3C99: 83 3D    
    fdb     Ship_1_Top                      ; 3C9B: 1A 3D    
    fdb     Ship_2_Top                      ; 3C9D: 83 3D    
    fdb     Fuel_Cell                       ; 3C9F: 9C 3D     Multiple entries for UDG objects
    fdb     Fuel_Cell                       ; 3CA1: 9C 3D     indexing based on player wave
    fdb     Fuel_Cell                       ; 3CA3: 9C 3D    
    fdb     Fuel_Cell                       ; 3CA5: 9C 3D    
    fdb     Gold_Bar                        ; 3CA7: AF 3D    
    fdb     Plutonium                       ; 3CA9: E3 3D    
    fdb     Isotope                         ; 3CAB: 00 3E    
    fdb     Mineral                         ; 3CAD: 15 3E    
    fdb     Gemstone                        ; 3CAF: CA 3D    
    fcb     %11110111                       ; 3CB1: F7       
    fcb     %11110111                       ; 3CB2: F7       
    fcb     %11110111                       ; 3CB3: F7       
    fcb     %11110111                       ; 3CB4: F7       
    fcb     %11111111                       ; 3CB5: FF       
    fcb     %11110101                       ; 3CB6: F5       
    fcb     %11110101                       ; 3CB7: F5       
    fcb     %11110101                       ; 3CB8: F5       
    fcb     %00101111                       ; 3CB9: 2F       
    fcb     %11101111                       ; 3CBA: EF       
    fcb     %11101010                       ; 3CBB: EA       
    fcb     %11001010                       ; 3CBC: CA       
    fcb     %10010001                       ; 3CBD: 91       
    fcb     %10010111                       ; 3CBE: 97       
    fcb     %00010111                       ; 3CBF: 17       
    fcb     %00010111                       ; 3CC0: 17       
    fcb     %10111001                       ; 3CC1: B9       
    fcb     %10111001                       ; 3CC2: B9       
    fcb     %10111001                       ; 3CC3: B9       
    fcb     %10111001                       ; 3CC4: B9       
    fcb     %11111001                       ; 3CC5: F9       
    fcb     %10101001                       ; 3CC6: A9       
    fcb     %10101001                       ; 3CC7: A9       
    fcb     %10101111                       ; 3CC8: AF       
    fcb     %11110100                       ; 3CC9: F4       
    fcb     %11110101                       ; 3CCA: F5       
    fcb     %01010101                       ; 3CCB: 55       
    fcb     %01010010                       ; 3CCC: 52       
    fcb     %10001001                       ; 3CCD: 89       
    fcb     %10111001                       ; 3CCE: B9       
    fcb     %10111000                       ; 3CCF: B8       
    fcb     %10111000                       ; 3CD0: B8       
    fcb     %00010000                       ; 3CD1: 10       
    fcb     %00000001                       ; 3CD2: 01       
    fcb     %00000000                       ; 3CD3: 00       
Ship_1_Base
    fcb     %00010000                       ; 3CD4: 10       
    fcb     %11110000                       ; 3CD5: F0       
    fcb     %10110000                       ; 3CD6: B0       
    fcb     %00110000                       ; 3CD7: 30       
    fcb     %10110000                       ; 3CD8: B0       
    fcb     %00011000                       ; 3CD9: 18       
    fcb     %11111000                       ; 3CDA: F8       
    fcb     %11111100                       ; 3CDB: FC       
    fcb     %11110100                       ; 3CDC: F4       
    fcb     %11110110                       ; 3CDD: F6       
    fcb     %11110110                       ; 3CDE: F6       
    fcb     %11110001                       ; 3CDF: F1       
    fcb     %11110111                       ; 3CE0: F7       
    fcb     %11110111                       ; 3CE1: F7       
    fcb     %11110111                       ; 3CE2: F7       
    fcb     %11110111                       ; 3CE3: F7       
    fcb     %00001001                       ; 3CE4: 09       
    fcb     %00001001                       ; 3CE5: 09       
    fcb     %00001001                       ; 3CE6: 09       
    fcb     %00001001                       ; 3CE7: 09       
    fcb     %00001001                       ; 3CE8: 09       
    fcb     %00011001                       ; 3CE9: 19       
    fcb     %00011001                       ; 3CEA: 19       
    fcb     %00101001                       ; 3CEB: 29       
    fcb     %00101001                       ; 3CEC: 29       
    fcb     %01011001                       ; 3CED: 59       
    fcb     %01011001                       ; 3CEE: 59       
    fcb     %10001001                       ; 3CEF: 89       
    fcb     %10111001                       ; 3CF0: B9       
    fcb     %10111001                       ; 3CF1: B9       
    fcb     %10111001                       ; 3CF2: B9       
    fcb     %10111001                       ; 3CF3: B9       
    fcb     %00010000                       ; 3CF4: 10       
    fcb     %00000001                       ; 3CF5: 01       
    fcb     %00000000                       ; 3CF6: 00       
Ship_1_Mid
    fcb     %10000000                       ; 3CF7: 80       
    fcb     %10000000                       ; 3CF8: 80       
    fcb     %11000000                       ; 3CF9: C0       
    fcb     %11000000                       ; 3CFA: C0       
    fcb     %11100000                       ; 3CFB: E0       
    fcb     %11100000                       ; 3CFC: E0       
    fcb     %11110000                       ; 3CFD: F0       
    fcb     %00010000                       ; 3CFE: 10       
    fcb     %11110000                       ; 3CFF: F0       
    fcb     %11110000                       ; 3D00: F0       
    fcb     %11110000                       ; 3D01: F0       
    fcb     %11110000                       ; 3D02: F0       
    fcb     %11110000                       ; 3D03: F0       
    fcb     %01010000                       ; 3D04: 50       
    fcb     %01010000                       ; 3D05: 50       
    fcb     %01010000                       ; 3D06: 50       
    fcb     %00000001                       ; 3D07: 01       
    fcb     %00000001                       ; 3D08: 01       
    fcb     %00000010                       ; 3D09: 02       
    fcb     %00000010                       ; 3D0A: 02       
    fcb     %00000101                       ; 3D0B: 05       
    fcb     %00000101                       ; 3D0C: 05       
    fcb     %00001001                       ; 3D0D: 09       
    fcb     %00001000                       ; 3D0E: 08       
    fcb     %00001001                       ; 3D0F: 09       
    fcb     %00001001                       ; 3D10: 09       
    fcb     %00001001                       ; 3D11: 09       
    fcb     %00001001                       ; 3D12: 09       
    fcb     %00001001                       ; 3D13: 09       
    fcb     %00001001                       ; 3D14: 09       
    fcb     %00001001                       ; 3D15: 09       
    fcb     %00001001                       ; 3D16: 09       
    fcb     %00010000                       ; 3D17: 10       
    fcb     %00000001                       ; 3D18: 01       
    fcb     %00000000                       ; 3D19: 00       
Ship_1_Top
    fcb     %01110110                       ; 3D1A: 76       
    fcb     %01110110                       ; 3D1B: 76       
    fcb     %01110110                       ; 3D1C: 76       
    fcb     %01110110                       ; 3D1D: 76       
    fcb     %01111110                       ; 3D1E: 7E       
    fcb     %11111110                       ; 3D1F: FE       
    fcb     %10011100                       ; 3D20: 9C       
    fcb     %10100010                       ; 3D21: A2       
    fcb     %00101110                       ; 3D22: 2E       
    fcb     %00100001                       ; 3D23: 21       
    fcb     %01001111                       ; 3D24: 4F       
    fcb     %01001111                       ; 3D25: 4F       
    fcb     %01001111                       ; 3D26: 4F       
    fcb     %01001111                       ; 3D27: 4F       
    fcb     %01001111                       ; 3D28: 4F       
    fcb     %01001111                       ; 3D29: 4F       
    fcb     %00001101                       ; 3D2A: 0D       
    fcb     %00001011                       ; 3D2B: 0B       
    fcb     %00011011                       ; 3D2C: 1B       
    fcb     %00110111                       ; 3D2D: 37       
    fcb     %00110111                       ; 3D2E: 37       
    fcb     %01010111                       ; 3D2F: 57       
    fcb     %01010111                       ; 3D30: 57       
    fcb     %11010111                       ; 3D31: D7       
    fcb     %11010111                       ; 3D32: D7       
    fcb     %11010111                       ; 3D33: D7       
    fcb     %11010111                       ; 3D34: D7       
    fcb     %11010111                       ; 3D35: D7       
    fcb     %11011111                       ; 3D36: DF       
    fcb     %11000000                       ; 3D37: C0       
    fcb     %10000000                       ; 3D38: 80       
    fcb     %10000000                       ; 3D39: 80       
    fcb     %00010000                       ; 3D3A: 10       
    fcb     %00000001                       ; 3D3B: 01       
    fcb     %00000000                       ; 3D3C: 00       
Ship_2_Base
    fcb     %01011010                       ; 3D3D: 5A       
    fcb     %01011010                       ; 3D3E: 5A       
    fcb     %01010010                       ; 3D3F: 52       
    fcb     %01010110                       ; 3D40: 56       
    fcb     %00010110                       ; 3D41: 16       
    fcb     %11110110                       ; 3D42: F6       
    fcb     %11110110                       ; 3D43: F6       
    fcb     %00010110                       ; 3D44: 16       
    fcb     %11010110                       ; 3D45: D6       
    fcb     %00010110                       ; 3D46: 16       
    fcb     %01110110                       ; 3D47: 76       
    fcb     %00010110                       ; 3D48: 16       
    fcb     %11110110                       ; 3D49: F6       
    fcb     %11110110                       ; 3D4A: F6       
    fcb     %01110110                       ; 3D4B: 76       
    fcb     %01110110                       ; 3D4C: 76       
    fcb     %00001011                       ; 3D4D: 0B       
    fcb     %00001011                       ; 3D4E: 0B       
    fcb     %00001101                       ; 3D4F: 0D       
    fcb     %00001011                       ; 3D50: 0B       
    fcb     %00001011                       ; 3D51: 0B       
    fcb     %00001011                       ; 3D52: 0B       
    fcb     %00001011                       ; 3D53: 0B       
    fcb     %00001101                       ; 3D54: 0D       
    fcb     %00001011                       ; 3D55: 0B       
    fcb     %00001011                       ; 3D56: 0B       
    fcb     %00001011                       ; 3D57: 0B       
    fcb     %00001011                       ; 3D58: 0B       
    fcb     %00001111                       ; 3D59: 0F       
    fcb     %00001111                       ; 3D5A: 0F       
    fcb     %00001100                       ; 3D5B: 0C       
    fcb     %00001011                       ; 3D5C: 0B       
    fcb     %00010000                       ; 3D5D: 10       
    fcb     %00000001                       ; 3D5E: 01       
    fcb     %00000000                       ; 3D5F: 00       
Ship_2_Mid
    fcb     %00111000                       ; 3D60: 38       
    fcb     %01111100                       ; 3D61: 7C       
    fcb     %11110010                       ; 3D62: F2       
    fcb     %11110010                       ; 3D63: F2       
    fcb     %11110010                       ; 3D64: F2       
    fcb     %11110010                       ; 3D65: F2       
    fcb     %11110010                       ; 3D66: F2       
    fcb     %11110010                       ; 3D67: F2       
    fcb     %11110010                       ; 3D68: F2       
    fcb     %11110010                       ; 3D69: F2       
    fcb     %11111010                       ; 3D6A: FA       
    fcb     %11111010                       ; 3D6B: FA       
    fcb     %11111010                       ; 3D6C: FA       
    fcb     %11111010                       ; 3D6D: FA       
    fcb     %11111010                       ; 3D6E: FA       
    fcb     %11111010                       ; 3D6F: FA       
    fcb     %00000000                       ; 3D70: 00       
    fcb     %00000000                       ; 3D71: 00       
    fcb     %00000000                       ; 3D72: 00       
    fcb     %00000000                       ; 3D73: 00       
    fcb     %00000001                       ; 3D74: 01       
    fcb     %00000001                       ; 3D75: 01       
    fcb     %00000011                       ; 3D76: 03       
    fcb     %00000100                       ; 3D77: 04       
    fcb     %00000100                       ; 3D78: 04       
    fcb     %00000111                       ; 3D79: 07       
    fcb     %00001100                       ; 3D7A: 0C       
    fcb     %00001100                       ; 3D7B: 0C       
    fcb     %00001111                       ; 3D7C: 0F       
    fcb     %00001111                       ; 3D7D: 0F       
    fcb     %00001011                       ; 3D7E: 0B       
    fcb     %00001011                       ; 3D7F: 0B       
    fcb     %00010000                       ; 3D80: 10       
    fcb     %00000001                       ; 3D81: 01       
    fcb     %00000000                       ; 3D82: 00       
Ship_2_Top
    fcb     %00011000                       ; 3D83: 18       
    fcb     %11111111                       ; 3D84: FF       
    fcb     %11111111                       ; 3D85: FF       
    fcb     %10001011                       ; 3D86: 8B       
    fcb     %10111011                       ; 3D87: BB       
    fcb     %10011011                       ; 3D88: 9B       
    fcb     %10111011                       ; 3D89: BB       
    fcb     %10001001                       ; 3D8A: 89       
    fcb     %11111111                       ; 3D8B: FF       
    fcb     %11111111                       ; 3D8C: FF       
    fcb     %00011000                       ; 3D8D: 18       
    fcb     %00011000                       ; 3D8E: 18       
    fcb     %11111111                       ; 3D8F: FF       
    fcb     %11111111                       ; 3D90: FF       
    fcb     %10001010                       ; 3D91: 8A       
    fcb     %10111010                       ; 3D92: BA       
    fcb     %10001010                       ; 3D93: 8A       
    fcb     %10111010                       ; 3D94: BA       
    fcb     %10111000                       ; 3D95: B8       
    fcb     %11111111                       ; 3D96: FF       
    fcb     %11111111                       ; 3D97: FF       
    fcb     %00011000                       ; 3D98: 18       
    fcb     %00001011                       ; 3D99: 0B       
    fcb     %00000001                       ; 3D9A: 01       
    fcb     %00000000                       ; 3D9B: 00       
Fuel_Cell
    fcb     %11111000                       ; 3D9C: F8       
    fcb     %11101100                       ; 3D9D: EC       
    fcb     %11011110                       ; 3D9E: DE       
    fcb     %00111111                       ; 3D9F: 3F       
    fcb     %00011111                       ; 3DA0: 1F       
    fcb     %00011110                       ; 3DA1: 1E       
    fcb     %00001110                       ; 3DA2: 0E       
    fcb     %11111100                       ; 3DA3: FC       
    fcb     %00001111                       ; 3DA4: 0F       
    fcb     %00011111                       ; 3DA5: 1F       
    fcb     %00111111                       ; 3DA6: 3F       
    fcb     %00100000                       ; 3DA7: 20       
    fcb     %01000000                       ; 3DA8: 40       
    fcb     %01000000                       ; 3DA9: 40       
    fcb     %10000000                       ; 3DAA: 80       
    fcb     %11111111                       ; 3DAB: FF       
    fcb     %00001000                       ; 3DAC: 08       
    fcb     %00000001                       ; 3DAD: 01       
    fcb     %00000000                       ; 3DAE: 00       
Gold_Bar
    fcb     %11000000                       ; 3DAF: C0       
    fcb     %11110000                       ; 3DB0: F0       
    fcb     %11111000                       ; 3DB1: F8       
    fcb     %11110100                       ; 3DB2: F4       
    fcb     %11100010                       ; 3DB3: E2       
    fcb     %00010110                       ; 3DB4: 16       
    fcb     %00011100                       ; 3DB5: 1C       
    fcb     %11111000                       ; 3DB6: F8       
    fcb     %11110000                       ; 3DB7: F0       
    fcb     %11100000                       ; 3DB8: E0       
    fcb     %11000000                       ; 3DB9: C0       
    fcb     %10000000                       ; 3DBA: 80       
    fcb     %00000011                       ; 3DBB: 03       
    fcb     %00001111                       ; 3DBC: 0F       
    fcb     %00011111                       ; 3DBD: 1F       
    fcb     %00101111                       ; 3DBE: 2F       
    fcb     %01000111                       ; 3DBF: 47       
    fcb     %01101000                       ; 3DC0: 68       
    fcb     %00111000                       ; 3DC1: 38       
    fcb     %00011111                       ; 3DC2: 1F       
    fcb     %00001111                       ; 3DC3: 0F       
    fcb     %00000111                       ; 3DC4: 07       
    fcb     %00000011                       ; 3DC5: 03       
    fcb     %00000001                       ; 3DC6: 01       
    fcb     %00001100                       ; 3DC7: 0C       
    fcb     %00000001                       ; 3DC8: 01       
    fcb     %00000000                       ; 3DC9: 00       
Gemstone
    fcb     %11111000                       ; 3DCA: F8       
    fcb     %00000100                       ; 3DCB: 04       
    fcb     %00010010                       ; 3DCC: 12       
    fcb     %00111001                       ; 3DCD: 39       
    fcb     %01111011                       ; 3DCE: 7B       
    fcb     %10000010                       ; 3DCF: 82       
    fcb     %10000011                       ; 3DD0: 83       
    fcb     %11000001                       ; 3DD1: C1       
    fcb     %11100010                       ; 3DD2: E2       
    fcb     %00000100                       ; 3DD3: 04       
    fcb     %11111000                       ; 3DD4: F8       
    fcb     %00001111                       ; 3DD5: 0F       
    fcb     %00010000                       ; 3DD6: 10       
    fcb     %00100100                       ; 3DD7: 24       
    fcb     %01001110                       ; 3DD8: 4E       
    fcb     %01101111                       ; 3DD9: 6F       
    fcb     %00100000                       ; 3DDA: 20       
    fcb     %01100000                       ; 3DDB: 60       
    fcb     %01000001                       ; 3DDC: 41       
    fcb     %00100011                       ; 3DDD: 23       
    fcb     %00010000                       ; 3DDE: 10       
    fcb     %00001111                       ; 3DDF: 0F       
    fcb     %00001011                       ; 3DE0: 0B       
    fcb     %00000001                       ; 3DE1: 01       
    fcb     %00000000                       ; 3DE2: 00       
Plutonium
    fcb     %10000000                       ; 3DE3: 80       
    fcb     %11000000                       ; 3DE4: C0       
    fcb     %11000000                       ; 3DE5: C0       
    fcb     %11100000                       ; 3DE6: E0       
    fcb     %10100000                       ; 3DE7: A0       
    fcb     %00010000                       ; 3DE8: 10       
    fcb     %00010000                       ; 3DE9: 10       
    fcb     %00001000                       ; 3DEA: 08       
    fcb     %00011100                       ; 3DEB: 1C       
    fcb     %00100110                       ; 3DEC: 26       
    fcb     %11101110                       ; 3DED: EE       
    fcb     %00111110                       ; 3DEE: 3E       
    fcb     %00011100                       ; 3DEF: 1C       
    fcb     %00000011                       ; 3DF0: 03       
    fcb     %00000100                       ; 3DF1: 04       
    fcb     %00000101                       ; 3DF2: 05       
    fcb     %00001111                       ; 3DF3: 0F       
    fcb     %00001011                       ; 3DF4: 0B       
    fcb     %00010000                       ; 3DF5: 10       
    fcb     %00010000                       ; 3DF6: 10       
    fcb     %00100000                       ; 3DF7: 20       
    fcb     %01110000                       ; 3DF8: 70       
    fcb     %10011000                       ; 3DF9: 98       
    fcb     %10111111                       ; 3DFA: BF       
    fcb     %11111000                       ; 3DFB: F8       
    fcb     %01110000                       ; 3DFC: 70       
    fcb     %00001101                       ; 3DFD: 0D       
    fcb     %00000001                       ; 3DFE: 01       
    fcb     %00000000                       ; 3DFF: 00       
Isotope
    fcb     %11110000                       ; 3E00: F0       
    fcb     %00111100                       ; 3E01: 3C       
    fcb     %01111110                       ; 3E02: 7E       
    fcb     %11111111                       ; 3E03: FF       
    fcb     %11111111                       ; 3E04: FF       
    fcb     %11111111                       ; 3E05: FF       
    fcb     %11111111                       ; 3E06: FF       
    fcb     %11111111                       ; 3E07: FF       
    fcb     %11111100                       ; 3E08: FC       
    fcb     %00001111                       ; 3E09: 0F       
    fcb     %00111000                       ; 3E0A: 38       
    fcb     %01100000                       ; 3E0B: 60       
    fcb     %11000011                       ; 3E0C: C3       
    fcb     %11000111                       ; 3E0D: C7       
    fcb     %11001111                       ; 3E0E: CF       
    fcb     %11111111                       ; 3E0F: FF       
    fcb     %01111111                       ; 3E10: 7F       
    fcb     %00111111                       ; 3E11: 3F       
    fcb     %00001001                       ; 3E12: 09       
    fcb     %00000001                       ; 3E13: 01       
    fcb     %00000000                       ; 3E14: 00       
Mineral
    fcb     %00110111                       ; 3E15: 37        Also, Platform_Left
    fcb     %01111111                       ; 3E16: 7F       
    fcb     %11111111                       ; 3E17: FF       
    fcb     %11111111                       ; 3E18: FF       
    fcb     %11111111                       ; 3E19: FF       
    fcb     %11111111                       ; 3E1A: FF       
    fcb     %01111111                       ; 3E1B: 7F       
    fcb     %11111101                       ; 3E1C: FD       
    fcb     %01111010                       ; 3E1D: 7A       
    fcb     %00010000                       ; 3E1E: 10       
Platform_Middle
    fcb     %10111011                       ; 3E1F: BB       
    fcb     %11111111                       ; 3E20: FF       
    fcb     %11111111                       ; 3E21: FF       
    fcb     %11111111                       ; 3E22: FF       
    fcb     %11111111                       ; 3E23: FF       
    fcb     %11111111                       ; 3E24: FF       
    fcb     %11111111                       ; 3E25: FF       
    fcb     %11101110                       ; 3E26: EE       
    fcb     %01101100                       ; 3E27: 6C       
    fcb     %00100000                       ; 3E28: 20       
Platform_Right
    fcb     %11001100                       ; 3E29: CC       
    fcb     %11111110                       ; 3E2A: FE       
    fcb     %11111111                       ; 3E2B: FF       
    fcb     %11111100                       ; 3E2C: FC       
    fcb     %11111110                       ; 3E2D: FE       
    fcb     %11111110                       ; 3E2E: FE       
    fcb     %11111111                       ; 3E2F: FF       
    fcb     %11111110                       ; 3E30: FE       
    fcb     %01111100                       ; 3E31: 7C       
    fcb     %00110100                       ; 3E32: 34       
    fcb     %10000000                       ; 3E33: 80        Platform_Right_End
    fcb     %11100000                       ; 3E34: E0       
    fcb     %10110000                       ; 3E35: B0       
    fcb     %11111100                       ; 3E36: FC       
    fcb     %11111110                       ; 3E37: FE       
    fcb     %10011011                       ; 3E38: 9B       
    fcb     %11111110                       ; 3E39: FE       
    fcb     %11111100                       ; 3E3A: FC       
    fcb     %00000001                       ; 3E3B: 01       
    fcb     %00000111                       ; 3E3C: 07       
    fcb     %00001101                       ; 3E3D: 0D       
    fcb     %00111111                       ; 3E3E: 3F       
    fcb     %01111111                       ; 3E3F: 7F       
    fcb     %11011001                       ; 3E40: D9       
    fcb     %01111111                       ; 3E41: 7F       
    fcb     %00111111                       ; 3E42: 3F       
    fcb     %00001000                       ; 3E43: 08       
    fcb     %00000001                       ; 3E44: 01       
    fcb     %00000000                       ; 3E45: 00       
Alien_Ship_1
    fcb     %00000000                       ; 3E46: 00       
    fcb     %00000000                       ; 3E47: 00       
    fcb     %00000000                       ; 3E48: 00       
    fcb     %11000000                       ; 3E49: C0       
    fcb     %11100000                       ; 3E4A: E0       
    fcb     %01010000                       ; 3E4B: 50       
    fcb     %11100000                       ; 3E4C: E0       
    fcb     %11000000                       ; 3E4D: C0       
    fcb     %00011000                       ; 3E4E: 18       
    fcb     %01111110                       ; 3E4F: 7E       
    fcb     %10100101                       ; 3E50: A5       
    fcb     %11111111                       ; 3E51: FF       
    fcb     %11111111                       ; 3E52: FF       
    fcb     %01100110                       ; 3E53: 66       
    fcb     %11111111                       ; 3E54: FF       
    fcb     %11111111                       ; 3E55: FF       
    fcb     %00000000                       ; 3E56: 00       
    fcb     %00000000                       ; 3E57: 00       
    fcb     %00000000                       ; 3E58: 00       
    fcb     %00000011                       ; 3E59: 03       
    fcb     %00000111                       ; 3E5A: 07       
    fcb     %00001010                       ; 3E5B: 0A       
    fcb     %00000111                       ; 3E5C: 07       
    fcb     %00000011                       ; 3E5D: 03       
    fcb     %00001000                       ; 3E5E: 08       
    fcb     %00000010                       ; 3E5F: 02       
    fcb     %00000000                       ; 3E60: 00       
Alien_Ship_2
    fcb     %00001000                       ; 3E61: 08       
    fcb     %01000000                       ; 3E62: 40       
    fcb     %11010100                       ; 3E63: D4       
    fcb     %11100000                       ; 3E64: E0       
    fcb     %01110000                       ; 3E65: 70       
    fcb     %10101010                       ; 3E66: AA       
    fcb     %10110000                       ; 3E67: B0       
    fcb     %11000000                       ; 3E68: C0       
    fcb     %10010101                       ; 3E69: 95       
    fcb     %01000000                       ; 3E6A: 40       
    fcb     %00000001                       ; 3E6B: 01       
    fcb     %01001010                       ; 3E6C: 4A       
    fcb     %00000011                       ; 3E6D: 03       
    fcb     %00101111                       ; 3E6E: 2F       
    fcb     %00000101                       ; 3E6F: 05       
    fcb     %00010111                       ; 3E70: 17       
    fcb     %01001100                       ; 3E71: 4C       
    fcb     %00010011                       ; 3E72: 13       
    fcb     %00000010                       ; 3E73: 02       
    fcb     %00001000                       ; 3E74: 08       
    fcb     %00001010                       ; 3E75: 0A       
    fcb     %00000001                       ; 3E76: 01       
    fcb     %00000000                       ; 3E77: 00       
Alien_Fuzz_1
    fcb     %00000000                       ; 3E78: 00       
    fcb     %01000000                       ; 3E79: 40       
    fcb     %00000000                       ; 3E7A: 00       
    fcb     %01010000                       ; 3E7B: 50       
    fcb     %10000000                       ; 3E7C: 80       
    fcb     %00010000                       ; 3E7D: 10       
    fcb     %01000000                       ; 3E7E: 40       
    fcb     %00000000                       ; 3E7F: 00       
    fcb     %00010000                       ; 3E80: 10       
    fcb     %01000000                       ; 3E81: 40       
    fcb     %01001000                       ; 3E82: 48       
    fcb     %00000001                       ; 3E83: 01       
    fcb     %10111100                       ; 3E84: BC       
    fcb     %01110111                       ; 3E85: 77       
    fcb     %01111010                       ; 3E86: 7A       
    fcb     %11111110                       ; 3E87: FE       
    fcb     %01011011                       ; 3E88: 5B       
    fcb     %10111100                       ; 3E89: BC       
    fcb     %00000001                       ; 3E8A: 01       
    fcb     %00100100                       ; 3E8B: 24       
    fcb     %00000000                       ; 3E8C: 00       
    fcb     %00000000                       ; 3E8D: 00       
    fcb     %00000000                       ; 3E8E: 00       
    fcb     %00000010                       ; 3E8F: 02       
    fcb     %00001001                       ; 3E90: 09       
    fcb     %00000000                       ; 3E91: 00       
    fcb     %00000010                       ; 3E92: 02       
    fcb     %00000000                       ; 3E93: 00       
    fcb     %00000101                       ; 3E94: 05       
    fcb     %00000000                       ; 3E95: 00       
    fcb     %00001010                       ; 3E96: 0A       
    fcb     %00000010                       ; 3E97: 02       
    fcb     %00000000                       ; 3E98: 00       
Alien_Fuzz_2
    fcb     %11100000                       ; 3E99: E0       
    fcb     %11111000                       ; 3E9A: F8       
    fcb     %11111100                       ; 3E9B: FC       
    fcb     %11111110                       ; 3E9C: FE       
    fcb     %11111110                       ; 3E9D: FE       
    fcb     %11111111                       ; 3E9E: FF       
    fcb     %11111111                       ; 3E9F: FF       
    fcb     %11111111                       ; 3EA0: FF       
    fcb     %11111111                       ; 3EA1: FF       
    fcb     %11111110                       ; 3EA2: FE       
    fcb     %11111110                       ; 3EA3: FE       
    fcb     %11111100                       ; 3EA4: FC       
    fcb     %11111000                       ; 3EA5: F8       
    fcb     %11100000                       ; 3EA6: E0       
    fcb     %00000111                       ; 3EA7: 07       
    fcb     %00011111                       ; 3EA8: 1F       
    fcb     %00111001                       ; 3EA9: 39       
    fcb     %01110001                       ; 3EAA: 71       
    fcb     %01100011                       ; 3EAB: 63       
    fcb     %11100111                       ; 3EAC: E7       
    fcb     %11100111                       ; 3EAD: E7       
    fcb     %11111111                       ; 3EAE: FF       
    fcb     %11111111                       ; 3EAF: FF       
    fcb     %01111111                       ; 3EB0: 7F       
    fcb     %01111111                       ; 3EB1: 7F       
    fcb     %00111111                       ; 3EB2: 3F       
    fcb     %00011111                       ; 3EB3: 1F       
    fcb     %00000111                       ; 3EB4: 07       
    fcb     %00001110                       ; 3EB5: 0E       
    fcb     %00000001                       ; 3EB6: 01       
    fcb     %00000000                       ; 3EB7: 00       
Alien_Bubble_1
    fcb     %00000000                       ; 3EB8: 00       
    fcb     %10000000                       ; 3EB9: 80       
    fcb     %11000000                       ; 3EBA: C0       
    fcb     %11100000                       ; 3EBB: E0       
    fcb     %11100000                       ; 3EBC: E0       
    fcb     %11110000                       ; 3EBD: F0       
    fcb     %11110000                       ; 3EBE: F0       
    fcb     %11110000                       ; 3EBF: F0       
    fcb     %11110000                       ; 3EC0: F0       
    fcb     %11110000                       ; 3EC1: F0       
    fcb     %11110000                       ; 3EC2: F0       
    fcb     %11100000                       ; 3EC3: E0       
    fcb     %11100000                       ; 3EC4: E0       
    fcb     %11000000                       ; 3EC5: C0       
    fcb     %10000000                       ; 3EC6: 80       
    fcb     %00000000                       ; 3EC7: 00       
    fcb     %01111110                       ; 3EC8: 7E       
    fcb     %11111111                       ; 3EC9: FF       
    fcb     %11111111                       ; 3ECA: FF       
    fcb     %10011111                       ; 3ECB: 9F       
    fcb     %00011111                       ; 3ECC: 1F       
    fcb     %00111111                       ; 3ECD: 3F       
    fcb     %01111111                       ; 3ECE: 7F       
    fcb     %01111111                       ; 3ECF: 7F       
    fcb     %11111111                       ; 3ED0: FF       
    fcb     %11111111                       ; 3ED1: FF       
    fcb     %11111111                       ; 3ED2: FF       
    fcb     %11111111                       ; 3ED3: FF       
    fcb     %11111111                       ; 3ED4: FF       
    fcb     %11111111                       ; 3ED5: FF       
    fcb     %11111111                       ; 3ED6: FF       
    fcb     %01111110                       ; 3ED7: 7E       
    fcb     %00000000                       ; 3ED8: 00       
    fcb     %00000001                       ; 3ED9: 01       
    fcb     %00000011                       ; 3EDA: 03       
    fcb     %00000111                       ; 3EDB: 07       
    fcb     %00000111                       ; 3EDC: 07       
    fcb     %00001110                       ; 3EDD: 0E       
    fcb     %00001110                       ; 3EDE: 0E       
    fcb     %00001110                       ; 3EDF: 0E       
    fcb     %00001111                       ; 3EE0: 0F       
    fcb     %00001111                       ; 3EE1: 0F       
    fcb     %00001111                       ; 3EE2: 0F       
    fcb     %00000111                       ; 3EE3: 07       
    fcb     %00000111                       ; 3EE4: 07       
    fcb     %00000011                       ; 3EE5: 03       
    fcb     %00000001                       ; 3EE6: 01       
    fcb     %00000000                       ; 3EE7: 00       
    fcb     %00010000                       ; 3EE8: 10       
    fcb     %00000010                       ; 3EE9: 02       
    fcb     %00000000                       ; 3EEA: 00       
Alien_Bubble_2
    fcb     %10000000                       ; 3EEB: 80       
    fcb     %11000000                       ; 3EEC: C0       
    fcb     %11000000                       ; 3EED: C0       
    fcb     %11000000                       ; 3EEE: C0       
    fcb     %01000000                       ; 3EEF: 40       
    fcb     %10111100                       ; 3EF0: BC       
    fcb     %01010010                       ; 3EF1: 52       
    fcb     %01010110                       ; 3EF2: 56       
    fcb     %01011110                       ; 3EF3: 5E       
    fcb     %10111100                       ; 3EF4: BC       
    fcb     %01000000                       ; 3EF5: 40       
    fcb     %11000000                       ; 3EF6: C0       
    fcb     %11000000                       ; 3EF7: C0       
    fcb     %11000000                       ; 3EF8: C0       
    fcb     %10000000                       ; 3EF9: 80       
    fcb     %00000000                       ; 3EFA: 00       
    fcb     %00000011                       ; 3EFB: 03       
    fcb     %00000100                       ; 3EFC: 04       
    fcb     %00000101                       ; 3EFD: 05       
    fcb     %00000111                       ; 3EFE: 07       
    fcb     %00000100                       ; 3EFF: 04       
    fcb     %01111011                       ; 3F00: 7B       
    fcb     %10010100                       ; 3F01: 94       
    fcb     %10110101                       ; 3F02: B5       
    fcb     %11110100                       ; 3F03: F4       
    fcb     %01111011                       ; 3F04: 7B       
    fcb     %00000100                       ; 3F05: 04       
    fcb     %00000111                       ; 3F06: 07       
    fcb     %00000100                       ; 3F07: 04       
    fcb     %00000101                       ; 3F08: 05       
    fcb     %00000011                       ; 3F09: 03       
    fcb     %00000000                       ; 3F0A: 00       
    fcb     %00010000                       ; 3F0B: 10       
    fcb     %00000001                       ; 3F0C: 01       
    fcb     %00000000                       ; 3F0D: 00       
Alien_Cross_1
    fcb     %00000000                       ; 3F0E: 00       
    fcb     %00000000                       ; 3F0F: 00       
    fcb     %00000000                       ; 3F10: 00       
    fcb     %00000000                       ; 3F11: 00       
    fcb     %00000000                       ; 3F12: 00       
    fcb     %11000000                       ; 3F13: C0       
    fcb     %00100000                       ; 3F14: 20       
    fcb     %01100000                       ; 3F15: 60       
    fcb     %11100000                       ; 3F16: E0       
    fcb     %11000000                       ; 3F17: C0       
    fcb     %00000000                       ; 3F18: 00       
    fcb     %00000000                       ; 3F19: 00       
    fcb     %00000000                       ; 3F1A: 00       
    fcb     %00000000                       ; 3F1B: 00       
    fcb     %00000000                       ; 3F1C: 00       
    fcb     %00000000                       ; 3F1D: 00       
    fcb     %00111000                       ; 3F1E: 38       
    fcb     %01001100                       ; 3F1F: 4C       
    fcb     %01011100                       ; 3F20: 5C       
    fcb     %01111100                       ; 3F21: 7C       
    fcb     %01000100                       ; 3F22: 44       
    fcb     %10111011                       ; 3F23: BB       
    fcb     %01000101                       ; 3F24: 45       
    fcb     %01010101                       ; 3F25: 55       
    fcb     %01000101                       ; 3F26: 45       
    fcb     %10111011                       ; 3F27: BB       
    fcb     %01000100                       ; 3F28: 44       
    fcb     %01111100                       ; 3F29: 7C       
    fcb     %01001100                       ; 3F2A: 4C       
    fcb     %01011100                       ; 3F2B: 5C       
    fcb     %00111000                       ; 3F2C: 38       
    fcb     %00000000                       ; 3F2D: 00       
    fcb     %00000000                       ; 3F2E: 00       
    fcb     %00000000                       ; 3F2F: 00       
    fcb     %00000000                       ; 3F30: 00       
    fcb     %00000000                       ; 3F31: 00       
    fcb     %00000000                       ; 3F32: 00       
    fcb     %00000111                       ; 3F33: 07       
    fcb     %00001001                       ; 3F34: 09       
    fcb     %00001011                       ; 3F35: 0B       
    fcb     %00001111                       ; 3F36: 0F       
    fcb     %00000111                       ; 3F37: 07       
    fcb     %00000000                       ; 3F38: 00       
    fcb     %00000000                       ; 3F39: 00       
    fcb     %00000000                       ; 3F3A: 00       
    fcb     %00000000                       ; 3F3B: 00       
    fcb     %00000000                       ; 3F3C: 00       
    fcb     %00000000                       ; 3F3D: 00       
    fcb     %00010000                       ; 3F3E: 10       
    fcb     %00000010                       ; 3F3F: 02       
    fcb     %00000000                       ; 3F40: 00       
Alien_Cross_2
    fcb     %11000000                       ; 3F41: C0       
    fcb     %01110000                       ; 3F42: 70       
    fcb     %11111000                       ; 3F43: F8       
    fcb     %11000100                       ; 3F44: C4       
    fcb     %10111110                       ; 3F45: BE       
    fcb     %11111111                       ; 3F46: FF       
    fcb     %11011111                       ; 3F47: DF       
    fcb     %10111111                       ; 3F48: BF       
    fcb     %01011110                       ; 3F49: 5E       
    fcb     %11100100                       ; 3F4A: E4       
    fcb     %01111000                       ; 3F4B: 78       
    fcb     %11111100                       ; 3F4C: FC       
    fcb     %11111000                       ; 3F4D: F8       
    fcb     %11110000                       ; 3F4E: F0       
    fcb     %01100000                       ; 3F4F: 60       
    fcb     %00000000                       ; 3F50: 00       
    fcb     %00000111                       ; 3F51: 07       
    fcb     %10011100                       ; 3F52: 9C       
    fcb     %11010011                       ; 3F53: D3       
    fcb     %11101111                       ; 3F54: EF       
    fcb     %11101111                       ; 3F55: EF       
    fcb     %11110111                       ; 3F56: F7       
    fcb     %11111111                       ; 3F57: FF       
    fcb     %11111001                       ; 3F58: F9       
    fcb     %01111110                       ; 3F59: 7E       
    fcb     %10111110                       ; 3F5A: BE       
    fcb     %01111111                       ; 3F5B: 7F       
    fcb     %11111111                       ; 3F5C: FF       
    fcb     %11111110                       ; 3F5D: FE       
    fcb     %11111110                       ; 3F5E: FE       
    fcb     %11111000                       ; 3F5F: F8       
    fcb     %11110000                       ; 3F60: F0       
    fcb     %00001111                       ; 3F61: 0F       
    fcb     %00111011                       ; 3F62: 3B       
    fcb     %01100111                       ; 3F63: 67       
    fcb     %11001111                       ; 3F64: CF       
    fcb     %11001111                       ; 3F65: CF       
    fcb     %11011101                       ; 3F66: DD       
    fcb     %01111101                       ; 3F67: 7D       
    fcb     %01111110                       ; 3F68: 7E       
    fcb     %11111111                       ; 3F69: FF       
    fcb     %11111111                       ; 3F6A: FF       
    fcb     %11111111                       ; 3F6B: FF       
    fcb     %11111100                       ; 3F6C: FC       
    fcb     %01101011                       ; 3F6D: 6B       
    fcb     %00001111                       ; 3F6E: 0F       
    fcb     %01111111                       ; 3F6F: 7F       
    fcb     %00011111                       ; 3F70: 1F       
    fcb     %00010000                       ; 3F71: 10       
    fcb     %00000010                       ; 3F72: 02       
    fcb     %00000000                       ; 3F73: 00       
Explosion_UDG_RAM_Addr_Frame_1
    fcb     %10000000                       ; 3F74: 80       
    fcb     %11000000                       ; 3F75: C0       
    fcb     %11011000                       ; 3F76: D8       
    fcb     %10111100                       ; 3F77: BC       
    fcb     %01111100                       ; 3F78: 7C       
    fcb     %10111111                       ; 3F79: BF       
    fcb     %11111111                       ; 3F7A: FF       
    fcb     %11011111                       ; 3F7B: DF       
    fcb     %11100000                       ; 3F7C: E0       
    fcb     %11000000                       ; 3F7D: C0       
    fcb     %00000000                       ; 3F7E: 00       
    fcb     %00000000                       ; 3F7F: 00       
    fcb     %00011111                       ; 3F80: 1F       
    fcb     %10111111                       ; 3F81: BF       
    fcb     %11111111                       ; 3F82: FF       
    fcb     %11011111                       ; 3F83: DF       
    fcb     %11101111                       ; 3F84: EF       
    fcb     %11101111                       ; 3F85: EF       
    fcb     %11010111                       ; 3F86: D7       
    fcb     %10111111                       ; 3F87: BF       
    fcb     %01111111                       ; 3F88: 7F       
    fcb     %11111110                       ; 3F89: FE       
    fcb     %11100110                       ; 3F8A: E6       
    fcb     %01111100                       ; 3F8B: 7C       
    fcb     %01110001                       ; 3F8C: 71       
    fcb     %10011011                       ; 3F8D: 9B       
    fcb     %01111111                       ; 3F8E: 7F       
    fcb     %01111101                       ; 3F8F: 7D       
    fcb     %11111110                       ; 3F90: FE       
    fcb     %11111110                       ; 3F91: FE       
    fcb     %11111101                       ; 3F92: FD       
    fcb     %11111011                       ; 3F93: FB       
    fcb     %11110111                       ; 3F94: F7       
    fcb     %11101111                       ; 3F95: EF       
    fcb     %00001110                       ; 3F96: 0E       
    fcb     %00000111                       ; 3F97: 07       
    fcb     %00001100                       ; 3F98: 0C       
    fcb     %00000010                       ; 3F99: 02       
    fcb     %00000000                       ; 3F9A: 00       
Explosion_UDG_RAM_Addr_Frame_2
    fcb     %11000000                       ; 3F9B: C0       
    fcb     %01100000                       ; 3F9C: 60       
    fcb     %11110110                       ; 3F9D: F6       
    fcb     %11111111                       ; 3F9E: FF       
    fcb     %11111111                       ; 3F9F: FF       
    fcb     %10001110                       ; 3FA0: 8E       
    fcb     %11111000                       ; 3FA1: F8       
    fcb     %11111000                       ; 3FA2: F8       
    fcb     %11011000                       ; 3FA3: D8       
    fcb     %10000000                       ; 3FA4: 80       
    fcb     %00000001                       ; 3FA5: 01       
    fcb     %00000110                       ; 3FA6: 06       
    fcb     %00000101                       ; 3FA7: 05       
    fcb     %00111111                       ; 3FA8: 3F       
    fcb     %01111011                       ; 3FA9: 7B       
    fcb     %01110101                       ; 3FAA: 75       
    fcb     %01111101                       ; 3FAB: 7D       
    fcb     %01111011                       ; 3FAC: 7B       
    fcb     %00111011                       ; 3FAD: 3B       
    fcb     %00000001                       ; 3FAE: 01       
    fcb     %00001010                       ; 3FAF: 0A       
    fcb     %00000001                       ; 3FB0: 01       
    fcb     %00000000                       ; 3FB1: 00       
Explosion_UDG_RAM_Addr_Frame_3
    fcb     %11111100                       ; 3FB2: FC       
    fcb     %01111010                       ; 3FB3: 7A       
    fcb     %11110100                       ; 3FB4: F4       
    fcb     %11011110                       ; 3FB5: DE       
    fcb     %11011000                       ; 3FB6: D8       
    fcb     %10101101                       ; 3FB7: AD       
    fcb     %11010010                       ; 3FB8: D2       
    fcb     %00011000                       ; 3FB9: 18       
    fcb     %11000100                       ; 3FBA: C4       
    fcb     %10100100                       ; 3FBB: A4       
    fcb     %00000000                       ; 3FBC: 00       
    fcb     %01000000                       ; 3FBD: 40       
    fcb     %00100000                       ; 3FBE: 20       
    fcb     %00000000                       ; 3FBF: 00       
    fcb     %00000000                       ; 3FC0: 00       
    fcb     %10000000                       ; 3FC1: 80       
    fcb     %00011111                       ; 3FC2: 1F       
    fcb     %10111111                       ; 3FC3: BF       
    fcb     %00010010                       ; 3FC4: 12       
    fcb     %00101101                       ; 3FC5: 2D       
    fcb     %01011011                       ; 3FC6: 5B       
    fcb     %00101010                       ; 3FC7: 2A       
    fcb     %00010101                       ; 3FC8: 15       
    fcb     %01001110                       ; 3FC9: 4E       
    fcb     %00010010                       ; 3FCA: 12       
    fcb     %00001001                       ; 3FCB: 09       
    fcb     %00010010                       ; 3FCC: 12       
    fcb     %00000000                       ; 3FCD: 00       
    fcb     %00000000                       ; 3FCE: 00       
    fcb     %00000000                       ; 3FCF: 00       
    fcb     %00000010                       ; 3FD0: 02       
    fcb     %00000000                       ; 3FD1: 00       
    fcb     %00010000                       ; 3FD2: 10       
    fcb     %00000001                       ; 3FD3: 01       
    fcb     %00000000                       ; 3FD4: 00       
    fcb     %00000000                       ; 3FD5: 00       
    fcb     %11111100                       ; 3FD6: FC       
    fcb     %11110010                       ; 3FD7: F2       
    fcb     %11101100                       ; 3FD8: EC       
    fcb     %11111101                       ; 3FD9: FD       
    fcb     %11110100                       ; 3FDA: F4       
    fcb     %11101101                       ; 3FDB: ED       
    fcb     %01011010                       ; 3FDC: 5A       
    fcb     %01101010                       ; 3FDD: 6A       
    fcb     %11010100                       ; 3FDE: D4       
    fcb     %01100010                       ; 3FDF: 62       
    fcb     %01011000                       ; 3FE0: 58       
    fcb     %10010000                       ; 3FE1: 90       
    fcb     %01000000                       ; 3FE2: 40       
    fcb     %10001000                       ; 3FE3: 88       
    fcb     %01000000                       ; 3FE4: 40       
    fcb     %00000000                       ; 3FE5: 00       
    fcb     %00101111                       ; 3FE6: 2F       
    fcb     %01111111                       ; 3FE7: 7F       
    fcb     %01011110                       ; 3FE8: 5E       
    fcb     %10110111                       ; 3FE9: B7       
    fcb     %00101110                       ; 3FEA: 2E       
    fcb     %01010111                       ; 3FEB: 57       
    fcb     %10001010                       ; 3FEC: 8A       
    fcb     %00110111                       ; 3FED: 37       
    fcb     %01010011                       ; 3FEE: 53       
    fcb     %00100100                       ; 3FEF: 24       
    fcb     %00001011                       ; 3FF0: 0B       
    fcb     %00010000                       ; 3FF1: 10       
    fcb     %00000010                       ; 3FF2: 02       
    fcb     %00000100                       ; 3FF3: 04       
    fcb     %00000000                       ; 3FF4: 00       
    fcb     %00010000                       ; 3FF5: 10       
    fcb     %00000001                       ; 3FF6: 01       
    fcb     %00000000                       ; 3FF7: 00       
    fcb     %00110111                       ; 3FF8: 37       
    fcb     %00110111                       ; 3FF9: 37       
    fcb     %01110101                       ; 3FFA: 75       
    fcb     %00110011                       ; 3FFB: 33       
    fcb     %00000011                       ; 3FFC: 03       
    fcb     %00110001                       ; 3FFD: 31       
    fcb     %01011011                       ; 3FFE: 5B       
    fcb     %00000000                       ; 3FFF: 00       


    end
