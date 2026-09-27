#!/bin/bash

# User must update this to the directory name or their project
# e.g. alu32 or fifo or PROJECT_2A
# NOTE: It must be same as the directory name in projects/
export PROJECT="$1"

# KEEP_BUILDS "true" will create new synth and pnr directories
# Setting this variable "false" will overwrite the synth and pnr directory for every run
export KEEP_BUILDS="false"

# DO NOT CHANGE
export REPO_ROOT="$(git rev-parse --show-toplevel)"
#export TOP="$(python3 ${REPO_ROOT}/util/compile.py manifest.json syn_top)"

#export MBFF="false"
#export MULTIVT="false"

export TECH_DIR="/pdk/gpdk045/"
export STD_LIB_DIR="gsclib045_all_v4.8"

export CDS_Netlisting_Mode="Analog"
export LM_LICENSE_FILE="5260@ulkains"

export CDS_LIC_FILE="$LM_LICENSE_FILE"
export CDS_LIC_QA_TesT="./qaLog.txt"
export LANG="en_US"

#-------------
export QRC_EXTRACTION_ENABLE=1
#-------------
export CDS_LIC_ONLY=1
export CDS_AUTO_64BIT="ALL"

#export CDSHOME=/home/cadence/lnx/ic_231
export CDSHOME="/tools/cadence/IC231"

export INNOVUSHOME="/tools/cadence/INNOVUS211"

#export XRUN_HOME=/home/cadence/lnx/xce_24
export XRUN_HOME="/tools/cadence/XCELIUM2409"

#export QRC_HOME=/
export SPECTRE_HOME="/tools/cadence/SPECTRE231"

#export SSV_HOME=/home/cadence/lnx/ssv_221
export SSV_HOME="/tools/cadence/SSV231"

#export CONFORMAL=/home/cadence/lnx/con_231/
export CONFORMAL="/tools/cadence/CONFRML241"

#export GENUS_HOME=/home/cadence/lnx/genus_211
export GENUS_HOME="/tools/cadence/GENUS211"

#export MODUS_HOME=/home/cadence/lnx/modus_221
export MODUS_HOME="/tools/cadence/MODUS221"

#export PVS_HOME=/
#export PEGASUS_HOME=/home/cadence/lnx/pegasus_22
export PEGASUS_HOME="/tools/cadence/PEGASUS221"

#export VMANAGER_HOME=/home/cadence/lnx/vmanager
export VMANAGER_HOME="/tools/cadence/VMANAGER2409"

#export UVM_HOME=/home/cadence/lnx/xce_24/tools/methodology/UVM/CDNS-IEEE/sv/
export UVM_HOME="/tools/cadence/XCELIUM2409/tools/methodology/UVM/CDNS-IEEE/sv"

# PATH setup
export PATH="$XRUN_HOME/bin:$XRUN_HOME/tools.lnx86/bin/64bit:$XRUN_HOME/tools/dfII/bin:$XRUN_HOME/share/bin:$XRUN_HOME/tools.lnx86/bin:$PATH"

export PATH="$PATH:$CDSHOME/bin:$CDSHOME/share/bin:$CDSHOME/tools.lnx86/bin:$CDSHOME/tools/bin:$CDSHOME/share/dfII/bin:$CDSHOME/tools.lnx86/dfII/bin:$CDSHOME/tools/dfII/bin"

export PATH="$PATH:$INNOVUSHOME/bin:$INNOVUSHOME/share/bin:$INNOVUSHOME/tools.lnx86/bin:$INNOVUSHOME/tools/bin:$INNOVUSHOME/share/dfII/bin:$INNOVUSHOME/tools.lnx86/dfII/bin:$INNOVUSHOME/tools/dfII/bin"

export PATH="$PATH:$SPECTRE_HOME/bin:$SPECTRE_HOME/share/bin:$SPECTRE_HOME/tools.lnx86/bin:$SPECTRE_HOME/tools/bin:$SPECTRE_HOME/share/dfII/bin:$SPECTRE_HOME/tools.lnx86/dfII/bin:$SPECTRE_HOME/tools/dfII/bin"

export PATH="$PATH:$SSV_HOME/bin:$SSV_HOME/share/bin:$SSV_HOME/tools.lnx86/bin:$SSV_HOME/tools/bin:$SSV_HOME/share/dfII/bin:$SSV_HOME/tools.lnx86/dfII/bin:$SSV_HOME/tools/dfII/bin"

export PATH="$PATH:$CONFORMAL/bin:$CONFORMAL/share/bin:$CONFORMAL/tools.lnx86/bin:$CONFORMAL/tools/bin:$CONFORMAL/share/dfII/bin:$CONFORMAL/tools.lnx86/dfII/bin:$CONFORMAL/tools/dfII/bin"

export PATH="$PATH:$GENUS_HOME/bin:$GENUS_HOME/share/bin:$GENUS_HOME/tools.lnx86/bin:$GENUS_HOME/tools/bin:$GENUS_HOME/share/dfII/bin:$GENUS_HOME/tools.lnx86/dfII/bin:$GENUS_HOME/tools/dfII/bin"

export PATH="$PATH:$MODUS_HOME/bin:$MODUS_HOME/share/bin:$MODUS_HOME/tools.lnx86/bin:$MODUS_HOME/tools/bin:$MODUS_HOME/share/dfII/bin:$MODUS_HOME/tools.lnx86/dfII/bin:$MODUS_HOME/tools/dfII/bin"

export PATH="$PATH:$PEGASUS_HOME/bin:$PEGASUS_HOME/share/bin:$PEGASUS_HOME/tools.lnx86/bin:$PEGASUS_HOME/tools/bin:$PEGASUS_HOME/share/dfII/bin:$PEGASUS_HOME/tools.lnx86/dfII/bin:$PEGASUS_HOME/tools/dfII/bin"

export PATH="$PATH:$VMANAGER_HOME/bin:$VMANAGER_HOME/share/bin:$VMANAGER_HOME/tools.lnx86/bin:$VMANAGER_HOME/tools/bin:$VMANAGER_HOME/share/dfII/bin:$VMANAGER_HOME/tools.lnx86/dfII/bin:$VMANAGER_HOME/tools/dfII/bin"

echo "******************************************************"
echo "******        ATSH UDIF                              "
echo "******        PROJECT: $PROJECT                     "
echo "******        KEEP_BUILDS: $KEEP_BUILDS             "
echo "******************************************************"
echo "                                                      "

alias c='clear'
