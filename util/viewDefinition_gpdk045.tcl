#View Definition (MMMC) file

# RCWorst Slow 125C 1v0 
create_rc_corner -name rcworst \
   -T 125 \
   -qx_tech_file $QRC_TECH_FILE(rcworst) \
   -preRoute_res 0.95 \
   -preRoute_cap 1.09 \
   -preRoute_clkcap 1.10 \
   -postRoute_res 1.27 \
   -postRoute_cap 1.09 \
   -postRoute_clkcap 1.05 \
   -postRoute_xcap 1.03

create_library_set -name slow_libs \
	-timing $LIB_FILES(slow)

create_delay_corner -name rcworst_slow -library_set slow_libs -rc_corner rcworst

create_constraint_mode -name func_slow \
	-sdc_files $PNR_SDC 

create_analysis_view -name func_slow_125_1v0 \
	-constraint_mode func_slow \
	-delay_corner rcworst_slow

# RCBest Fast m40C 1v2
create_rc_corner -name rcbest \
   -T -40 \
   -qx_tech_file $QRC_TECH_FILE(rcworst) \
   -preRoute_res 0.95 \
   -preRoute_cap 1.09 \
   -preRoute_clkcap 1.10 \
   -postRoute_res 1.27 \
   -postRoute_cap 1.09 \
   -postRoute_clkcap 1.05 \
   -postRoute_xcap 1.03

create_library_set -name fast_libs \
	-timing $LIB_FILES(fast)

create_delay_corner -name rcbest_fast -library_set fast_libs -rc_corner rcbest

create_constraint_mode -name func_fast \
	-sdc_files $PNR_SDC 

create_analysis_view -name func_fast_m40_1v2 \
	-constraint_mode func_fast \
	-delay_corner rcbest_fast

set_analysis_view -setup [list func_slow_125_1v0 ] -hold [list func_fast_m40_1v2]

