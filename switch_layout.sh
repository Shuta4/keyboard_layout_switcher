#!/bin/bash
# Switches keyboard layout to next running from su

# Path to variables configuration file.
# If you want to change it, you need to change it in 'layout_switcher.sh' too.
CONFIG="/etc/keyboard_layout_switcher.conf"

source $CONFIG

# Get process from which we will get environmental vars
USERPROC=$(pgrep -u $USERNAME -x $PROCNAME)

# Check if process exist
if [ ! "$USERPROC" ]; then
  exit 0
fi

# Runs commands as another user

su - $USERNAME <<'EOF'

# Path to variables configuration file.
# If you want to change it, you need to change it in 'layout_switcher.sh' too.
CONFIG="/etc/keyboard_layout_switcher.conf"

source $CONFIG

USERPROC=$(pgrep -u $USERNAME -x $PROCNAME)

# Getting DBUS env var for qdbus execution
DBUS=$(cat /proc/$USERPROC/environ | strings | sed -n "/DBUS_SESSION_BUS_ADDRESS/,/ORACLE_BASE/p" | head -n 1)
export $DBUS

# Actually changes layout
/usr/bin/qdbus org.kde.keyboard /Layouts switchToNextLayout

EOF
exit 0
