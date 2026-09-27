# manifest.json compiler for atsh udif
# Requires python3 and json5

import json5 as json
import sys
import os

def filelist(manifest, mode="syn"):
    files = ""
    # RTL and TB files
    for f in manifest.get("packages", []):
        files += f" {f}"
    for f in manifest.get("rtl_files", []):
        files += f" {f}"
    if mode == 'sim':
        for f in manifest.get("tb_files", []):
            files += f" {f}"
    return files

def get_sdc(manifest, mode="syn_sdc"):
    files = ""
    for f in manifest.get("constraints", []):
        files += f"{f}"
    return files
    # Top module

def get_top(manifest, mode):
    # Top module
    top = manifest.get(mode)
    return top

def build_xrun_command(manifest, mode="elaborate"):
    cmd = "xrun -uvm -timescale 1ns/1ps +access+rwc"
    # Include directories
    for inc in manifest.get("include_dirs", []):
        cmd += f" +incdir+{inc}"
    # Defines
    for define in manifest.get("defines", []):
        cmd += f" +define+{define}"
    # RTL and TB files
    for f in manifest.get("packages", []):
        cmd += f" $REPO_ROOT/projects/$PROJECT/{f}"
    for f in manifest.get("rtl_files", []):
        cmd += f" $REPO_ROOT/projects/$PROJECT/{f}"
    for f in manifest.get("tb_files", []):
        cmd += f" $REPO_ROOT/projects/$PROJECT/{f}"
    # Top module
    if "sim_top" in manifest:
        cmd += f" -top {manifest['sim_top']}"
    # Add elaboration or run flag
    if mode == "elaborate":
        cmd += " -elaborate -log elaborate.log"
    elif mode == "verify":
        cmd += " -R"
    # Enable waveform dump
    cmd += " -sv -gui -coverage all -input waves.tcl"
    return cmd

def main():
    if len(sys.argv) < 3:
        print("Usage: python compile.py <manifest.json> [--elaborate|--verify]")
        sys.exit(1)

    manifest_file = sys.argv[1]
    mode = sys.argv[2].lstrip('-')
    dirpath = os.path.dirname(os.path.abspath(manifest_file))

    with open(manifest_file, 'r') as f:
        manifest = json.load(f)

    if mode in ('elaborate','verify'):
        cmd = build_xrun_command(manifest, mode)
        print(f"Running command:\n{cmd}\n")
        os.system(cmd)
    elif mode in ("syn_top","sim_top"):
        top = get_top(manifest,mode)
        print(top) 
    elif mode=="syn_sdc":
        sdc = get_sdc(manifest,mode)
        print(dirpath+"/"+sdc)
    else:
        files = filelist(manifest,mode).split(" ")
        for f in files[1:]:
            print(dirpath+"/"+f, end=" ")
        print()

if __name__ == "__main__":
    main()
