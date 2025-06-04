#!/bin/bash
cd /opt/swgserver/

echo "Starting GDB..."
gdb ./core3
sleep 10

echo "Starting core server components..."
r