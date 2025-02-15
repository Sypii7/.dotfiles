#!/usr/bin/python

header_width = 46
label_width = 24

keybind_colour = "#a6e3a1"
desc_colour = "#fab387"

keybinds = {
    "SHORTCUTS": {
        "SUPER + SPACE": "App Launcher",
        "SUPER + E": "File Manager",
        "SUPER + SHIFT + F": "Firefox",
        "SUPER + ENTER": "Terminal",
        "SUPER + L": "Lock Screen",
    },
    "WINDOW CONTROLS": {
        "SUPER + W": "Close Window",
        "SUPER + F": "Fullscreen",
        "SUPER + S": "Toggle Floating",
        "SUPER + J": "Toggle Split",
        #"SUPER + O": "Toggle Center",
        "SUPER + P": "Toggle Pseudo",
        "SUPER + ARROW": "Move Current Focus",
        "SUPER + ALT + ARROW": "Resize Window",
        "SUPER + SHIFT + NUMBER": "Move Window to Workspace",
        "SUPER + NUMBER": "Navigate to Workspace",
    },
}

stdout: list[str] = []
for header, mappings in keybinds.items():
    if stdout:
        stdout[-1] += "\r"
    indent = int((header_width - len(header)) / 2)
    stdout.append(" " * indent + header)
    for keybind, desc in mappings.items():
        gap = " " * (label_width - len(keybind))
        keybind = f"<span color='{keybind_colour}'>{keybind}</span>"
        desc = f"<span color='{desc_colour}'>{desc}</span>"
        stdout.append(f"{keybind}{gap}{desc}")

print("\r".join(stdout))
