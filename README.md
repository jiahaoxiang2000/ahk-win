# AHK (AutoHotkey) on Windows 11

This AutoHotkey v2.0 project provides custom keyboard shortcuts and window navigation functionality for Windows 11.

## Features

### Window Focus Navigation

Vim-like window navigation using **Win+HJKL** hotkeys:

- **Win+H** - Focus window to the left
- **Win+J** - Focus window below
- **Win+K** - Focus window above
- **Win+L** - Focus window to the right

The navigation system uses intelligent distance calculation that considers both directional proximity and window overlap, making it ideal for multi-monitor setups.

## Installation

1. Install [AutoHotkey v2.0](https://www.autohotkey.com/v2/)
2. Clone this repository
3. Run `key.ahk` by double-clicking or right-click → "Compile Script"
