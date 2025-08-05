@echo off
REM AutoHotkey Startup Script
REM This script compiles key.ahk to an executable and runs it

REM Get the directory where this batch file is located
set "SCRIPT_DIR=%~dp0"
set "AHK_FILE=%SCRIPT_DIR%key.ahk"
set "EXE_FILE=%SCRIPT_DIR%key.exe"
set "EXE_NAME=key.exe"

REM Check if exe is currently running and kill it
echo Checking if %EXE_NAME% is running...
tasklist /FI "IMAGENAME eq %EXE_NAME%" 2>NUL | find /I /N "%EXE_NAME%">NUL
if "%ERRORLEVEL%"=="0" (
    echo %EXE_NAME% is running, terminating it...
    taskkill /F /IM "%EXE_NAME%" >NUL 2>NUL
    timeout /t 1 >NUL
    echo Process terminated.
) else (
    echo %EXE_NAME% is not running.
)

REM Check if key.ahk exists
if not exist "%AHK_FILE%" (
    echo key.ahk not found in %SCRIPT_DIR%
    echo Please ensure key.ahk is in the same directory as this batch file
    pause
    exit /b 1
)

REM Always recompile to ensure latest changes are included
echo Preparing to compile %AHK_FILE%...

REM Find Ahk2Exe compiler
set "AHK2EXE="
if exist "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" (
    set "AHK2EXE=C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
    goto :found_compiler
)
if exist "C:\Program Files (x86)\AutoHotkey\Compiler\Ahk2Exe.exe" (
    set "AHK2EXE=C:\Program Files (x86)\AutoHotkey\Compiler\Ahk2Exe.exe"
    goto :found_compiler
)

where Ahk2Exe.exe >nul 2>nul
if %errorlevel% equ 0 (
    set "AHK2EXE=Ahk2Exe.exe"
    goto :found_compiler
)

echo Ahk2Exe compiler not found
echo Please install AutoHotkey v2.0 from https://www.autohotkey.com/v2/
pause
exit /b 1

:found_compiler
REM Find AutoHotkey v2 base file
set "AHK_BASE="
if exist "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" (
    set "AHK_BASE=C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"
    goto :found_base
)
if exist "C:\Program Files\AutoHotkey\AutoHotkey64.exe" (
    set "AHK_BASE=C:\Program Files\AutoHotkey\AutoHotkey64.exe"
    goto :found_base
)
if exist "C:\Program Files (x86)\AutoHotkey\v2\AutoHotkey64.exe" (
    set "AHK_BASE=C:\Program Files (x86)\AutoHotkey\v2\AutoHotkey64.exe"
    goto :found_base
)
if exist "C:\Program Files (x86)\AutoHotkey\AutoHotkey64.exe" (
    set "AHK_BASE=C:\Program Files (x86)\AutoHotkey\AutoHotkey64.exe"
    goto :found_base
)

echo AutoHotkey v2 base file (AutoHotkey64.exe) not found
echo Please ensure AutoHotkey v2.0 is properly installed
pause
exit /b 1

:found_base
REM Compile the script
echo Compiling key.ahk to executable...
"%AHK2EXE%" /in "%AHK_FILE%" /out "%EXE_FILE%" /base "%AHK_BASE%" /compress 1 /silent

if %errorlevel% neq 0 (
    echo Compilation failed
    pause
    exit /b 1
)

echo Compilation successful!

:run_exe
REM Check if exe exists
if not exist "%EXE_FILE%" (
    echo Compiled executable not found: %EXE_FILE%
    pause
    exit /b 1
)

REM Start the compiled executable
echo Starting compiled AutoHotkey executable...
start "" "%EXE_FILE%"

REM Optional: Show success message (comment out for silent startup)
echo AutoHotkey executable started successfully!
timeout /t 2 >nul