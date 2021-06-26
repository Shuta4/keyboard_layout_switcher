#!/usr/bin/python

import keyboard
import sys
import os

keyboard.add_hotkey(
  sys.argv[1],
  lambda: os.system(f"{os.path.dirname(os.path.realpath(__file__))}/switch_layout.sh"),
  trigger_on_release=False
)

keyboard.wait()
