# Full Cadence Flow Based on [UDIF](https://github.com/atsh/udif)

### Overview

This repository builds upon the **UDIF (University Digital Implementation Flow)** created by Ataus Shafi to provide a streamlined, step-by-step approach to Cadence tool usage for new users. The main goals are:

- **[Simplify Cadence Usage](#primary-setup-steps)**: Guide users through the VLSI flow with clear, sequential instructions
- **[Automated Project Structure](#generated-project-directory-structure-and-new-simulation-setup)**: Leverage the automated file structure and system design provided by UDIF
- **[Ready-to-Run Examples](#steps-for-running-example-designs)**: Includes two pre-configured example designs (`alu32` and `fifo`) in the `/projects` directory that you can run immediately or adapt to your needs.
- **[Flexible Workflow]**: Create your own project structure with just a few commands, or use the provided examples as templates

### Primary Setup Steps

#### 1. Connect to the Cadence Server

Open **MobaXterm** and create a new **SSH session**.
Use the following connection details:

| Setting | Value |
|---|---|
| Remote host | `<CADENCE_SERVER_ADDRESS>` |
| Port | `22` |
| Username | `<CADENCE_USERNAME>` |

After connecting, MobaXterm will open a terminal and prompt you for the password:

```console
<CADENCE_USERNAME>@<CADENCE_SERVER_ADDRESS>'s password:
```

Enter your assigned password when prompted.
> **Note:** The password will not be displayed while you type it in the terminal. This is normal behavior for SSH authentication.
Once authentication is successful, you will be logged into the Cadence server and can proceed with the following setup steps.

#### 2. Start the C Shell

Open a C shell session:

```csh
csh
```

#### 3. Load the Cadence Environment

Source the Cadence environment configuration provided by your system administrator:

```csh
source /path/to/<CADENCE_SETUP_SCRIPT>
```

> **Note:** Replace `<CADENCE_SETUP_SCRIPT>` with the Cadence setup script provided for your server environment.

#### 4. Verify the Environment

After sourcing the Cadence setup script, verify that the required Cadence tools are available:

```csh
which virtuoso
```

If the command returns the path to the Cadence executable, the Cadence environment has been loaded successfully.

### Cadence Library File Configuration

Cadence tools require a `cds.lib` library definition file. The location and contents of this file are institution-specific and should normally be provided by your university's CAD/IT administrator or instructor.

Before starting a UDIF project, make sure the appropriate `cds.lib` is available to the Cadence environment.

For example, if your institution provides the library file at:

```bash
/path/to/<CADENCE_CDS_LIB>
```

you may copy it to your designated Cadence workspace:

```bash
cp /path/to/<CADENCE_CDS_LIB> <CADENCE_WORKSPACE>/cds.lib
```

> **Note:** Do not assume that `cds.lib` must be placed inside the UDIF repository or project directory. Cadence determines library definitions through its environment and library-search configuration. Follow your institution's Cadence setup instructions if a specific location is required.

If your institution's Cadence environment already provides or discovers `cds.lib`, no additional copy is required.

### Further Setup Steps
> **For all users:** These steps are intended for users who want to create and initialize a new project workspace using the **UDIF (University Digital Implementation Flow)**. If you are starting a new project, follow the steps below to create the required project directory structure and working environment.

> **Prerequisite:** These steps assume that Cadence is already running in the shell environment provided or authorized by your institution/administrator.

1. Navigate to the parent directory:
   ```bash
   cd /path/to/<PARENT_DIR>
   ```

2. Create your working directory:
   ```bash
   mkdir -p <WORK_DIR>
   cd <WORK_DIR>
   ```
   
3. Clone the UDIF repository:
   ```bash
   git clone https://github.com/atsh/udif
   cd udif
   ```

4. Initialize your new project directory:
   ```csh
   source env.sh <PROJECT_NAME>
   make setup
   ```

5. Navigate to your new project working directory:
   ```bash
   cd projects/<PROJECT_NAME>
   ```
   
### Generated Project Directory Structure and New Simulation Setup

After setup is complete, your project directory (`projects/<PROJECT_NAME>`) will contain the following structure:

- `rtl/` — Write and save your RTL files in this directory
- `tb/` — Write and save your testbench files in this directory
- `sim/` — Simulation results will be generated here
- `constraints/` — Add your design constraints files here
- `floorplan/` — Add your floorplan files here
- `scripts/` — Contains the necessary flow scripts (do not modify)
- `Makefile` — Build configuration (do not modify)
- `manifest.json` — Open this file and update the following:
  - Set `syn_top` to your design's top module name
  - Set `sim_top` to your testbench's top module name
  - Follow the instructions in the file comments to point to your RTL, testbench, and constraints files
  - Ensure correct JSON syntax is used

### Steps for Running Example Designs

This section will provide a detailed, step-by-step procedure for executing the pre-configured example designs included in the `/projects` directory, named `alu32` and `fifo`. The complete execution procedure for both designs, including the required setup and flow configuration, will be added here in a future update.

<details>
<summary><h3>Attribution & Citation</h3></summary>

This project includes original work developed by Ataus Shafi.

Copyright © 2025 Ataus Shafi  
GitHub: [@atsh](https://github.com/atsh)

If you use this project, in whole or in part, including source or binary components, please retain visible attribution to the original author in one of the following:

- The documentation or README of your project
- The About/Info section of your software or tool
- An appropriate academic citation or reference when used in research

> This project uses work from [UDIF](https://github.com/atsh/udif) by Ataus Shafi (GitHub: [@atsh](https://github.com/atsh)), licensed under Apache 2.0.

</details>
