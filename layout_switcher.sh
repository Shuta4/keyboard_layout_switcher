#!/bin/bash

# Go to script dir first
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR

# Path to variables configuration file.
# If you want to change it, you need to change it in 'switch_layout.sh' too.
CONFIG="/etc/keyboard_layout_switcher.conf"

if [ ! -f "$CONFIG" ]
  then
    cp ./example.conf $CONFIG
    printf "Config has been copied to %s\nChange its values and run again.\n" "$CONFIG"
    exit 0
fi

source $CONFIG

python ./layout_switcher.py "$HOTKEY" &
