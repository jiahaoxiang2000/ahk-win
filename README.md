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

### Vim-like Text Navigation

Use **Esc** as a modifier key for vim-like text navigation and editing: (inspired by [@wzj-zz](https://github.com/wzj-zz))

#### Basic Movement

- **Esc+H/J/K/L** - Left/Down/Up/Right arrow keys
- **Esc+A** - Home (beginning of line)
- **Esc+;** - End (end of line)

#### Word Movement

- **Esc+U** - Ctrl+Left (previous word)
- **Esc+I** - Ctrl+Right (next word)

#### Text Selection

- **Esc+N** - Ctrl+Shift+Left (select previous word)
- **Esc+M** - Ctrl+Shift+Right (select next word)
- **Esc+,** - Shift+Home (select to beginning of line)
- **Esc+.** - Shift+End (select to end of line)
- **Esc+B** - Shift+Left (select left)
- **Esc+E** - Shift+Right (select right)
- **Esc+/** - Shift+Down (select down)
- **Esc+P** - Shift+Up (select up)

#### Page Navigation

- **Esc+D** - Page Down
- **Esc+F** - Page Up
- **Esc+S** - Shift+Page Down (select page down)
- **Esc+R** - Shift+Page Up (select page up)

#### Editing

- **Esc+Y** - Backspace
- **Esc+O** - Ctrl+Backspace (delete previous word)
- **Esc+Shift** - Delete

## Installation

1. Install [AutoHotkey v2.0](https://www.autohotkey.com/v2/)
2. Clone this repository
3. Run `key.ahk` by double-clicking or right-click → "Compile Script"

### Auto-Startup on Windows Boot

To automatically start the script when Windows boots:

#### Method 1: Using the Startup Script (Recommended)

1. Run `startup.bat` once to test compilation and execution
   - The script will compile `key.ahk` to `key.exe` using Ahk2Exe
   - Then automatically run the compiled executable
2. Copy `startup.bat` to your Windows Startup folder:
   - Press `Win+R`, type `shell:startup`, and press Enter
   - Copy `startup.bat` to the opened folder
3. The script will now compile and start automatically when Windows boots

**Note**: The startup script automatically compiles `key.ahk` to an executable, so the compiled program can run even on systems without AutoHotkey installed.

## Usage

The hotkeys work immediately after running the script:

- **Window Navigation**: Use Win+H/J/K/L to navigate between visible windows in the corresponding directions
- **Desktop Switching**: Use Win+Shift+H/L to switch between virtual desktops (left/right)
- **Text Navigation**: Use Esc as a modifier key for vim-like text editing and navigation in any application

## Technical Details

### Window Selection Algorithm

- Compares same edges (left-to-left, top-to-top) for more intuitive navigation
- Calculates primary distance in the movement direction
- Applies overlap penalties for windows without perpendicular axis overlap
- Prioritizes windows with visual alignment over pure distance

### Multi-Monitor Support

The algorithm considers window overlap on the perpendicular axis, ensuring natural navigation across multiple monitors without jumping to distant windows.
