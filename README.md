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

### Virtual Desktop Switching

Navigate between Windows virtual desktops using **Win+Shift+H/L**:

- **Win+Shift+H** - Switch to the left desktop (previous)
- **Win+Shift+L** - Switch to the right desktop (next)

These shortcuts provide quick desktop switching without needing to use the Windows Task View interface.

## Installation

1. Install [AutoHotkey v2.0](https://www.autohotkey.com/v2/)
2. Clone this repository
3. Run `key.ahk` by double-clicking or right-click → "Compile Script"

## Usage

The hotkeys work immediately after running the script:

- **Window Navigation**: Use Win+H/J/K/L to navigate between visible windows in the corresponding directions
- **Desktop Switching**: Use Win+Shift+H/L to switch between virtual desktops (left/right)

## Technical Details

### Window Selection Algorithm
- Compares same edges (left-to-left, top-to-top) for more intuitive navigation
- Calculates primary distance in the movement direction
- Applies overlap penalties for windows without perpendicular axis overlap
- Prioritizes windows with visual alignment over pure distance

### Multi-Monitor Support
The algorithm considers window overlap on the perpendicular axis, ensuring natural navigation across multiple monitors without jumping to distant windows.
