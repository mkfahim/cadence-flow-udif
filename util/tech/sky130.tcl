# File		: sky130.tcl 
# Ataus Shafi
# https://github.com/atsh 

##########################
# Technology Setup for SkyWater 130nm PDK
##########################
#
set TECH "sky130" 

if { $TECH == "sky130" } {
	set TECH_DIR "/home/shafi/work/tech/skywater-pdk/"
	set STD_LIB_DIR "/home/shafi/work/tech/skywater-pdk/libraries/sky130_fd_sc_hd/latest/"
	#set MULTIVT "true"
	#set MBFF "false"

set LEF_FILES ""

# Adding Technology LEF file
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_tech/lef/gsclib045_tech.lef"

# Adding RVT Cell LEF
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/lef/gsclib045_macro.lef"

# Adding LVT/H`VT Cell LEF
if { $MULTIVT == "true" } {
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_lvt/lef/gsclib045_lvt_macro.lef"
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_hvt/lef/gsclib045_hvt_macro.lef"
}

if { $MBFF == "true" } {
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/gsclib045_multibitsDFF.lef"
}

set LIB_FILES(slow) ""
set LIB_FILES(fast) ""

append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/timing/slow_vdd1v0_basicCells.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/timing/fast_vdd1v2_basicCells.lib"


if { $MULTIVT == "true" } {
append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_lvt/timing/slow_vdd1v0_basicCells_lvt.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_lvt/timing/fast_vdd1v2_basicCells_lvt.lib"
append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_hvt/timing/slow_vdd1v0_basicCells_hvt.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_hvt/timing/fast_vdd1v2_basicCells_hvt.lib"
}

if { $MBFF == "true" } {
append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/timing/slow_vdd1v0_multibitsDFF.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/timing/fast_vdd1v2_multibitsDFF.lib"
}

set LIB_FILES(all) "$LIB_FILES(slow) $LIB_FILES(fast)"

set QRC_TECH_FILE(rcworst) "/home/user_27/work/tech/gpdk045/gpdk045_v_6_0/qrc/rcworst/qrcTechFile"
set QRC_TECH_FILE(rcbest) "/home/user_27/work/tech/gpdk045/gpdk045_v_6_0/qrc/rcbest/qrcTechFile"
set QRC_TECH_FILE(typcial) "/home/user_27/work/tech/gpdk045/gpdk045_v_6_0/qrc/typical/qrcTechFile"

} ;# END OF GPDK045 SETUP

##########################
# Design Setup
##########################
set DESIGN_DIR "design_data"
set DESIGN_NAME "ALU32"
set CLK_PERIOD "1" ;# unit depends on pdk; for gpdk045 the unit is ns



##########################
# Synthesis Setup
##########################
set SYNTH_EFFORT_GENERIC "medium"
set SYNTH_EFFORT_OPT "high"
set SYNTH_INFO_LEVEL 7
set SYNTH_LOW_POWER "false"

set RTL_FILES "${DESIGN_DIR}/$DESIGN_NAME.sv"
set CONSTRAINTS_FILE "${DESIGN_DIR}/$DESIGN_NAME.sdc"


##########################
# PnR Setup
##########################
set PNR_INIT_NETLIST "$DESIGN_DIR/${DESIGN_NAME}_gate.v"
set PNR_SDC "$DESIGN_DIR/${DESIGN_NAME}.sdc"
set PNR_VIEW_DEF "$DESIGN_DIR/viewDefinition.tcl"
set PNR_GND_NETS "VSS"
set PNR_PWR_NETS "VDD"
set PNR_MAX_ROUTE_LAYER "6"
