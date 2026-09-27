#!/bin/bash
# atsh udif Projects Directory Setup

export REPO_ROOT="`git rev-parse --show-toplevel`"

source ${REPO_ROOT}/util/info.sh
atsh_info "Git Repo: $REPO_ROOT"

export PROJECT="`basename $(pwd)`"
atsh_info "Project Directory: $PROJECT"


atsh_info "Creating directories..."
mkdir -p rtl tb constraints floorplan 

atsh_info "Copying Scripts..."
atsh_info "Existing file(s) will NOT be overwritten"
cp -nr ${REPO_ROOT}/util/Makefile ${REPO_ROOT}/util/project_setup.tcl ${REPO_ROOT}/util/scripts ${REPO_ROOT}/util/sim ${REPO_ROOT}/util/manifest.json .
cp -nr scripts/pnr/fp.tcl floorplan 

atsh_info "Please update manifest.json befoer running simulation, synthesis, PnR"

#EOF
