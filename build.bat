@echo off
REM Build RolandGoKeyboard.exe using MSVC cl.exe. Run this from a Visual Studio Developer Command Prompt.
REM Use the script directory so paths with spaces work correctly.
setlocal enabledelayedexpansion
set SCRIPT_DIR=%~dp0
cl /EHsc /O2 /std:c++20 /Fe:"%SCRIPT_DIR%RolandGoKeyboard.exe" "%SCRIPT_DIR%main.cpp" /link winmm.lib user32.lib
if errorlevel 1 pause
endlocal
