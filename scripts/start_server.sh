#!/bin/bash

# Navigate to the Core3 bin directory
cd ~/workspace/Dark-Star/MMOCoreORB/bin || { echo "Error: Directory not found. Exiting."; exit 1; }

echo "Starting GDB with Core3 and executing commands from script..."

# Execute GDB, pass commands from core3_debug.gdb, and log output
# The '--args' option ensures any remaining arguments are passed to the debugged program (core3 in this case).
gdb --command=core3_debug.gdb ./core3

echo "GDB session has ended."
# The script will only reach this point AFTER GDB exits.