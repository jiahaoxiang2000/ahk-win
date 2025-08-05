# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an AutoHotkey v2.0 project for Windows 11 that provides custom keyboard shortcuts and key detection functionality. The main script extends Windows functionality with vim-like window navigation using Win+hjkl hotkeys.

## Architecture

- **key.ahk**: Main AutoHotkey script containing:
  - `IsKeyPressed()` utility function for key state detection
  - Window focus navigation hotkeys (Win+h/j/k)
  - Key press detection examples and testing code
- **README.md**: Basic project documentation

## AutoHotkey Development

### Script Structure

- Uses AutoHotkey v2.0 syntax (`#Requires AutoHotkey v2.0`)
- Functions use modern v2 syntax: `functionName() { }`
- Variable assignment: `variable := value`
- Window operations: `WinGetList()` returns array directly (no reference parameters)

### Windows System Conflicts

- **Win+L**: Conflicts with Windows lock screen - kept disabled by default
- **Win+H/J/K**: Safe to override, no major Windows conflicts
- Use `~` prefix to allow Windows default behavior alongside custom actions

## Guidance for Function Additions

- If adding a new function to the project, ensure to update the README.md with a basic introduction and explanation of the function's purpose
