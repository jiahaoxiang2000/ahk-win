# Changelog

All notable changes to this AutoHotkey Windows 11 project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.4.0] - 2025-08-05

### Changed
- Simplified GitHub Actions workflow to basic release creation only
- Removed complex AutoHotkey compilation from CI pipeline
- Switched to clean source code releases for better user control
- Let users handle AutoHotkey installation and script execution locally

### Removed
- AutoHotkey installation and compilation complexity from CI
- Windows-specific CI runner requirements
- PowerShell compilation scripts and dependencies

### Improved
- Faster and more reliable CI pipeline
- Better separation of concerns between CI and user environment
- Cleaner release workflow with proper version tagging

## [v1.3.0] - 2025-08-05

### Added
- GitHub Actions workflow for automated release creation
- Automated compilation attempts with multiple fallback strategies
- Runtime bundling approach when compilation unavailable
- Comprehensive CI pipeline with Windows runner support

### Changed
- Enhanced startup script with process management and forced recompilation
- Multiple attempts to resolve AutoHotkey compiler installation issues
- Iterative improvements to CI workflow reliability

### Technical Notes
- Attempted various approaches: direct downloads, Chocolatey, installer methods
- Explored Ahk2Exe compiler setup and runtime bundling alternatives
- Final simplification to source-only releases for maximum compatibility

## [v1.2.0] - 2025-08-05

### Added
- Auto-focus functionality for virtual desktop switching
- Process management in startup script to detect and terminate running instances
- Forced recompilation in startup script to ensure latest changes are included

### Changed
- Enhanced virtual desktop switching to automatically focus the first available window after switching
- Improved startup script reliability by removing timestamp comparison logic

### Fixed
- Issue where modified .ahk files weren't being recompiled due to timestamp comparison problems
- Manual window activation requirement after virtual desktop switching

## [v1.1.0] - 2025-08-05

### Added
- Comprehensive vim-like text navigation with Esc modifier key combinations
- Virtual desktop switching with Win+Shift+H/L hotkeys
- Startup script for automatic compilation and execution of key.ahk
- Enhanced project documentation and guidance

### Changed
- Updated README with comprehensive project features and installation instructions
- Enhanced CLAUDE.md with additional guidance for function additions

## [v1.0.0] - 2025-08-05

### Added
- Core vim-like window focus navigation with Win+h/j/k/l hotkeys
- Key press detection functionality and utility functions
- Custom key bindings for window navigation
- Initial project structure with README and documentation
- AutoHotkey v2.0 script architecture with modern syntax

### Features
- **Window Navigation**: Navigate between windows using vim-like directional keys
- **Key Detection**: Utility functions for detecting key press states
- **Windows 11 Integration**: Optimized for Windows 11 with proper conflict handling

---

## Release Notes

### Current Version (v1.4.0)
- **Simplified Releases**: Clean source code releases without compilation complexity
- **User Control**: Users install AutoHotkey locally and run scripts directly
- **Reliable CI**: Fast, simple GitHub Actions workflow for consistent releases

### Navigation Features
- **Win+H/J/K/L**: Focus windows in left/down/up/right directions
- **Win+Shift+H/L**: Switch between virtual desktops with auto-focus
- **Esc + combinations**: Comprehensive vim-like text navigation

### Development Tools
- **startup.bat**: Local compilation and execution with process management
- **Modern AutoHotkey**: Uses AutoHotkey v2.0 syntax and features
- **Documentation**: Comprehensive project guidance in CLAUDE.md
- **GitHub Actions**: Automated release creation with proper versioning

### System Integration
- **Windows 11 Optimized**: Handles system conflicts appropriately
- **Virtual Desktop Support**: Enhanced desktop switching with automatic window focus
- **Process Management**: Intelligent handling of running instances

### Installation
1. Download `key.ahk` from [GitHub Releases](https://github.com/jiahaoxiang2000/ahk-win/releases)
2. Install [AutoHotkey v2.0](https://www.autohotkey.com/v2/) on your system
3. Run the script: `AutoHotkey.exe key.ahk` or double-click `key.ahk`