# AutoHotkey-Transparency

An AutoHotkey v2 script for keyboard-driven window transparency control on Windows.

## Features

- Cycle active window transparency through decreasing values
- Snap active window to fully opaque
- Snap active window to translucent (50%)
- Display transparency properties of the window under the cursor

## Limitations

- Applications from vendors like Apple, Logitech, & Sonos may not permit transparency control.

## Requirements

- [AutoHotkey v2](https://www.autohotkey.com/docs/v2/)

## Hotkeys

| Hotkey | Action |
|---|---|
| `Win + Ctrl + G` | Display transparency properties of window under cursor |
| `Win + Ctrl + O` | Set active window to fully opaque |
| `Win + Ctrl + T` | Set active window to translucent (50%) |
| `Win + Ctrl + W` | Cycle active window transparency down in steps |

## Usage

1. Download `AutoHotkey-Transparency.ahk`
2. Double-click to run, or place in your Windows Startup folder for persistent use:
   `%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
3. Use the hotkeys above to control window transparency

## Adding to an Existing Script

Copy the hotkeys and functions into the corresponding sections of your own AHK v2 script.
For a compatible script structure see [AutoHotkey-Template](https://github.com/RobbyRHarper/AutoHotkey-Template).

## Optional: Backtick Hotkey

The script includes a disabled hotkey that reassigns the backtick `` ` `` key to cycle window transparency.
This is disabled by default as it suppresses the backtick globally across all applications.
To enable it, remove the `/* ... */` block around the hotkey in the `HOTKEYS - Remapped Keys` section.
A companion reassignment of `Shift+`` to `~` is included to preserve tilde input.

## License

MIT
