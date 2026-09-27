#!/bin/csh

# User must update this to the directory name or their project
# e.g. alu32 or fifo or PROJECT_2A
# NOTE: It must be same as the diretory name in projects/
setenv PROJECT $1

# KEEP_BUILDS "true" will create new synth and pnr directories
# with the following naming convention synth/pnr_<BLOCK>_<YYYYMMDD_HHMM> by default
# or the value of BUILD provided by the user (e.g. make pnr BUILD=mybuild)
# Setting this variable "false" will overwrite the synth and pnr directory for every run
# NOTE: case sensitive | use lowercase "true" only
setenv KEEP_BUILDS "false" 

# DO NOT CHANGE
setenv REPO_ROOT "`git rev-parse --show-toplevel`"
#setenv TOP "`python3 ${REPO_ROOT}/util/compile.py manifest.json syn_top`"

setenv TECH_DIR "/pdk/gpdk045/"
setenv STD_LIB_DIR "gsclib045_all_v4.8"

#setenv MBFF "false"
#setenv MULTIVT "false"

setenv CDS_Netlisting_Mode "Analog"
setenv LM_LICENSE_FILE 5260@ulkains

setenv CDS_LIC_FILE $LM_LICENSE_FILE
setenv CDS_LIC_QA_TesT ./qaLog.txt
setenv LANG en_US
#-------------
setenv QRC_EXTRACTION_ENABLE 1
#-------------
setenv CDS_LIC_ONLY 1
setenv CDS_AUTO_64BIT ALL

#setenv CDSHOME /home/cadence/lnx/ic_231
setenv CDSHOME /tools/cadence/IC231

setenv INNOVUSHOME /tools/cadence/INNOVUS211

#setenv XRUN_HOME  /home/cadence/lnx/xce_24
setenv XRUN_HOME  /tools/cadence/XCELIUM2409

#setenv QRC_HOME /
setenv SPECTRE_HOME /tools/cadence/SPECTRE231

#setenv SSV_HOME /home/cadence/lnx/ssv_221
setenv SSV_HOME /tools/cadence/SSV231

#setenv CONFORMAL /home/cadence/lnx/con_231/
setenv CONFORMAL /tools/cadence/CONFRML241

#setenv GENUS_HOME /home/cadence/lnx/genus_211
setenv GENUS_HOME /tools/cadence/GENUS211

#setenv MODUS_HOME /home/cadence/lnx/modus_221
setenv MODUS_HOME /tools/cadence/MODUS221

#setenv PVS_HOME /
#setenv PEGASUS_HOME /home/cadence/lnx/pegasus_22
setenv PEGASUS_HOME /tools/cadence/PEGASUS221


#setenv VMANAGER_HOME /home/cadence/lnx/vmanager
setenv VMANAGER_HOME /tools/cadence/VMANAGER2409

#setenv UVM_HOME /home/cadence/lnx/xce_24/tools/methodology/UVM/CDNS-IEEE/sv/
setenv UVM_HOME /tools/cadence/XCELIUM2409/tools/methodology/UVM/CDNS-IEEE/sv

set path=($XRUN_HOME/bin $XRUN_HOME/tools.lnx86/bin/64bit $XRUN_HOME/tools/dfII/bin $XRUN_HOME/share/bin $XRUN_HOME/tools.lnx86/bin $path)

set path=($path ${CDSHOME}/bin ${CDSHOME}/share/bin ${CDSHOME}/tools.lnx86/bin ${CDSHOME}/tools/bin ${CDSHOME}/share/dfII/bin ${CDSHOME}/tools.lnx86/dfII/bin ${CDSHOME}/tools/dfII/bin)

set path=($path ${INNOVUSHOME}/bin ${INNOVUSHOME}/share/bin ${INNOVUSHOME}/tools.lnx86/bin ${INNOVUSHOME}/tools/bin ${INNOVUSHOME}/share/dfII/bin ${INNOVUSHOME}/tools.lnx86/dfII/bin ${INNOVUSHOME}/tools/dfII/bin)

set path=($path ${SPECTRE_HOME}/bin ${SPECTRE_HOME}/share/bin ${SPECTRE_HOME}/tools.lnx86/bin ${SPECTRE_HOME}/tools/bin ${SPECTRE_HOME}/share/dfII/bin ${SPECTRE_HOME}/tools.lnx86/dfII/bin ${SPECTRE_HOME}/tools/dfII/bin)

set path=($path ${SSV_HOME}/bin ${SSV_HOME}/share/bin ${SSV_HOME}/tools.lnx86/bin ${SSV_HOME}/tools/bin ${SSV_HOME}/share/dfII/bin ${SSV_HOME}/tools.lnx86/dfII/bin ${SSV_HOME}/tools/dfII/bin)

set path=($path ${CONFORMAL}/bin ${CONFORMAL}/share/bin ${CONFORMAL}/tools.lnx86/bin ${CONFORMAL}/tools/bin ${CONFORMAL}/share/dfII/bin ${CONFORMAL}/tools.lnx86/dfII/bin ${CONFORMAL}/tools/dfII/bin)

set path=($path ${GENUS_HOME}/bin ${GENUS_HOME}/share/bin ${GENUS_HOME}/tools.lnx86/bin ${GENUS_HOME}/tools/bin ${GENUS_HOME}/share/dfII/bin ${GENUS_HOME}/tools.lnx86/dfII/bin ${GENUS_HOME}/tools/dfII/bin)

set path=($path ${MODUS_HOME}/bin ${MODUS_HOME}/share/bin ${MODUS_HOME}/tools.lnx86/bin ${MODUS_HOME}/tools/bin ${MODUS_HOME}/share/dfII/bin ${MODUS_HOME}/tools.lnx86/dfII/bin ${MODUS_HOME}/tools/dfII/bin)

set path=($path ${PEGASUS_HOME}/bin ${PEGASUS_HOME}/share/bin ${PEGASUS_HOME}/tools.lnx86/bin ${PEGASUS_HOME}/tools/bin ${PEGASUS_HOME}/share/dfII/bin ${PEGASUS_HOME}/tools.lnx86/dfII/bin ${PEGASUS_HOME}/tools/dfII/bin)

set path=($path ${VMANAGER_HOME}/bin ${VMANAGER_HOME}/share/bin ${VMANAGER_HOME}/tools.lnx86/bin ${VMANAGER_HOME}/tools/bin ${VMANAGER_HOME}/share/dfII/bin ${VMANAGER_HOME}/tools.lnx86/dfII/bin ${VMANAGER_HOME}/tools/dfII/bin)

#set path = ($path /tools/cadence/INCISIVE152/vmanager/bin /tools/cadence/INCISIVE152/share/vmanager/bin /tools/cadence/INCISIVE152/tools.lnx86/vmanager/bin /tools/cadence/INCISIVE152/tools/vmanager/bin /tools/cadence/INCISIVE152/share/dfII/bin /tools/cadence/INCISIVE152/tools.lnx86/dfII/bin /tools/cadence/INCISIVE152/tools/vmanager/bin /tools/cadence/INCISIVE152/tools/dfII/bin)





echo "******************************************************"
echo "******        ATSH UDIF			     "
echo "******        PROJECT: $PROJECT                "
echo "******        KEEP_BUIDLS: $KEEP_BUILDS        "
echo "******************************************************"
echo "                                                      "

alias c 'clear'
