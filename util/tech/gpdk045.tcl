# File		: gpdk045.tcl 
# Ataus Shafi
# https://github.com/atsh 

##########################
# Technology Setup for Cadence GPDK045 (45nm General PDK)
##########################
#
set TECH "gpdk045" 

puts "INFO_ATSH_UDIF: TECH=$TECH"
puts "INFO_ATSH_UDIF: Starting Setup"

if { $TECH == "gpdk045" } {
	set TECH_DIR $::env(TECH_DIR) 
	set STD_LIB_DIR $::env(STD_LIB_DIR) 
	#set MULTIVT "true"
	if { [string equal -nocase $MULTIVT "false"] } {
	        puts "ATSH_VLSI: MULTIVT is set to false. Using only RVT cells for synthesis. Please fix if other or all vt cells to be used."
        	set MULTIVT "RVT"
	} else {
		puts "ATSH_VLSI: MULTIVT is set to true. All available (rvt, lvt, hvt) vt cells will be used."
	}
	#set MBFF "false"

set LEF_FILES ""

# Adding Technology LEF file
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_tech/lef/gsclib045_tech.lef"

# Adding RVT Cell LEF | Default when MULTIVT is FALSE
if { [string equal -nocase $MULTIVT "true"] || [regexp -nocase "RVT" $MULTIVT]  } {
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/lef/gsclib045_macro.lef"
}

# Adding LVT/H`VT Cell LEF
if { [string equal -nocase $MULTIVT "true"] || [regexp -nocase "LVT" $MULTIVT]  } {
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_lvt/lef/gsclib045_lvt_macro.lef"
}
if { [string equal -nocase $MULTIVT "true"] ||  [regexp -nocase "HVT" $MULTIVT]  } {
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_hvt/lef/gsclib045_hvt_macro.lef"
}

if { $MBFF == "true" } {
append LEF_FILES " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/gsclib045_multibitsDFF.lef"
}

set LIB_FILES(slow) ""
set LIB_FILES(fast) ""

if { [string equal -nocase $MULTIVT "true"] || [regexp -nocase "RVT" $MULTIVT]  } {
append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/timing/slow_vdd1v0_basicCells.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/timing/fast_vdd1v2_basicCells.lib"
}


if { [string equal -nocase $MULTIVT "true"] || [regexp -nocase "LVT" $MULTIVT]  } {
append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_lvt/timing/slow_vdd1v0_basicCells_lvt.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_lvt/timing/fast_vdd1v2_basicCells_lvt.lib"
}
if { [string equal -nocase $MULTIVT "true"] ||  [regexp -nocase "HVT" $MULTIVT]  } {
append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_hvt/timing/slow_vdd1v0_basicCells_hvt.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045_hvt/timing/fast_vdd1v2_basicCells_hvt.lib"
}

if { $MBFF == "true" } {
append LIB_FILES(slow) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/timing/slow_vdd1v0_multibitsDFF.lib"
append LIB_FILES(fast) " " "$TECH_DIR/$STD_LIB_DIR/gsclib045/timing/fast_vdd1v2_multibitsDFF.lib"
}

set LIB_FILES(all) "$LIB_FILES(slow) $LIB_FILES(fast)"

set QRC_TECH_FILE(rcworst) "$TECH_DIR/gpdk045_v_6_0/qrc/rcworst/qrcTechFile"
set QRC_TECH_FILE(rcbest) "$TECH_DIR/gpdk045_v_6_0/qrc/rcbest/qrcTechFile"
set QRC_TECH_FILE(typical) "$TECH_DIR/gpdk045_v_6_0/qrc/typical/qrcTechFile"

set PHYSICAL_CELL_LIST "[get_lib_cell */*FILL*]"
set CLK_BUFFERS "[get_lib_cell */*CLKBUF*] "
set CLK_INVERTERS " [get_lib_cell */*CLKINV*]"

} ;# END OF GPDK045 SETUP

