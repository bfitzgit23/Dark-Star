#!/bin/bash

SESSION_NAME="swg_server"
SWG_SERVER_DIR="~/workspace/Dark-Star/scripts"
SWG_START_SCRIPT="${SWG_SERVER_DIR}/start_server.sh"

# Check if the tmux session already exists
tmux has-session -t ${SESSION_NAME} 2>/dev/null

if [ $? != 0 ]; then
    # Create a new detached tmux session and run the SWG server script
    tmux new-session -d -s ${SESSION_NAME} -c "${SWG_SERVER_DIR}" "${SWG_START_SCRIPT}"
    echo "SWG server started in tmux session: ${SESSION_NAME}"
else
    echo "tmux session ${SESSION_NAME} already exists."
    # Optionally, you could send a command to the existing session to check status or restart
    # tmux send-keys -t ${SESSION_NAME} 'echo "Attempting to restart server..."' C-m
fi