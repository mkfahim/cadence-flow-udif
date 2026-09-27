# File		: sky130_cadence.tcl 
# Ataus Shafi
# https://github.com/atsh 

###################################################
# Technology Setup for SkyWater 130nm Cadence PDK #
###################################################
#
set TECH "sky130_cadence" 

puts "ATSH_VLSI: TECH=$TECH"
puts "ATSH_VLSI: Starting Setup"

if { $TECH == "sky130_cadence" } {
	set TECH_DIR "/home/eee/sky130_cadence"
	set STD_LIB_DIR "sky130_scl_9T_0.0.5"
	puts "ATSH_VLSI: $TECH has no multivt or mbff options as of this release."
	#set MULTIVT $::env(MULTIVT)
	#set MBFF $::env(MBFF)

set LEF_FILES ""

# Adding Technology LEF file
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/lef/sky130_scl_9T.tlef"

# Adding RVT Cell LEF
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/lef/sky130_scl_9T.lef"


set LIB_FILES(slow) ""
set LIB_FILES(fast) ""

append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/lib/sky130_ss_1.62_125_nldm.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/lib/sky130_ff_1.98_0_nldm.lib"
append LIB_FILES(typical) " " "$TECH_DIR/$STD_LIB_DIR/lib/sky130_tt_1.8_25_nldm.lib"

set LIB_FILES(all) "$LIB_FILES(slow) $LIB_FILES(fast) $LIB_FILES(typical)"

set QRC_TECH_FILE(typical) "$TECH_DIR/sky130_release_0.0.4/quantus/extraction/typical/qrcTechFile"

set PHYSICAL_CELL_LIST " FILL1 FILL2 FILL4 FILL8 FILL16 FILL32 FILL64 "
set CLK_BUFFERS " CLKBUFX4 CLKBUFX8 CLKBUFX2 "
set CLK_INVERTERS " CLKINVX2 CLKINVX8 CLKINVX1 CLKINVX4 "

set GDS_MAP_FILE "$TECH_DIR/$STD_LIB_DIR/gds/sky130_stream.mapFile"
set GDS_MERGE_FILE "$TECH_DIR/$STD_LIB_DIR/gds/sky130_scl_9T.gds"

} ;# END OF SkyWater 130nm Cadence PDK SETUP

