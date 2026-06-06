#!/bin/bash

mkdir -p ~/AppImages # set the installation directory

# Download the installer script to wherever you want to run it from
curl -fsSL https://cdn.anythingllm.com/latest/installer.sh -o installer.sh
 
# Make the script executable
chmod +x installer.sh
 
# Run the script
ANYTHING_LLM_INSTALL_DIR="~/AppImages/" ./installer.sh