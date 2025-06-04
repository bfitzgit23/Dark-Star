#!/bin/bash
cd ~/workspace/Core3/MMOCoreORB/bin

echo "Starting GDB..."
gdb ./core3
sleep 15

echo "Starting core server components..."
r