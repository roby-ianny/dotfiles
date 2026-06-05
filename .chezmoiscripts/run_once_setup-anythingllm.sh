#!/bin/bash

# Download the installer script to wherever you want to run it from
curl -fsSL https://cdn.anythingllm.com/latest/installer.sh -o installer.sh
 
# Make the script executable
chmod +x installer.sh
 
# Run the script
./installer.sh