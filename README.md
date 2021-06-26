# Keyboard Layout Switcher
Changes layout on custom hotkey.

## Why?
Xorg xserver have an [issue](https://gitlab.freedesktop.org/xorg/xserver/-/issues/258).
In short: if you set hotkey for layout switch to `ctrl+shift` another hotkeys like `ctrl+shift+*` 
will not work. It's really annoying when you have used `ctrl+shift` for a lot of years on windows
and now need to change it to something else.

## Usage

### Warning
You need root access to run this program because python package [keyboard](https://github.com/boppreh/keyboard) need it.
If someone knows better package to monitor keyboard events on **system running Wayland**,
please, open an issue to notify me.
_I tried to use [pynput](https://pynput.readthedocs.io/en/latest/keyboard.html#monitoring-the-keyboard) but it is not working._

### Installation

1. Install python dependencies:
```bash
sudo pip install keyboard
```

2. First-run from terminal:
```bash
sudo ./layout_switcher.sh
```
It will create configuration file in `/etc/keyboard_layout_switcher.conf`

3. Change values in configuration file with what you need.

4. Run again file from **step 2**. If you can change your layout on hotkey all is ok.

### Testing
This program works on:
```
Operating System: Fedora 34
KDE Plasma Version: 5.22.2
KDE Frameworks Version: 5.83.0
Qt Version: 5.15.2
Kernel Version: 5.12.12-300.fc34.x86_64 (64-bit)
Graphics Platform: Wayland
```

### Stop
To stop program you can use this commands:
```bash
sudo pgrep -au root | grep layout_switcher
```

Above command will give you string like this:
```bash
32481 python ./layout_switcher.py ctrl+shift
```
Where `32481` is `PID`.

Then run another command replacing `PID` with one you get:
```bash
sudo kill PID
```
