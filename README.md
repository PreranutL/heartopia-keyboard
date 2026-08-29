# Heartopia Midi Player

A C++ application to turn Midi file & device inputs into inputs for the Heartopia game.

## Requirements
To compile the script, you need:
- Windows OS
- Microsoft Visual Studio (with C++ Desktop Development tools installed)

## How to Build

We have provided a convenient PowerShell script (`build.ps1`) to automatically locate Visual Studio and compile the project using MSVC (`cl.exe`).

### Option 1: Using the PowerShell Build Script

1. Open PowerShell.
2. Navigate to the project directory.
3. Run the build script:
   ```powershell
   .\build.ps1
   ```
   *Note: If you run into script execution policy errors, you can temporally bypass it for the current session by running:* 
   *`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`*

### Option 2: Manual Compilation

You can also manually build it using the **Developer Command Prompt for Visual Studio**:

1. Open the Developer Command Prompt for Visual Studio.
2. Navigate to the project directory.
3. Run the following command:
   ```cmd
   cl.exe /EHsc /std:c++20 /O2 main.cpp user32.lib winmm.lib
   ```
   
*(Note: Visual Studio C++20 standard is required for some standard library methods like `std::unordered_set::contains`).*

## How to Run

Once compiled, you can run the generated `main.exe` from your terminal:

**Play a Midi file:**
```powershell
.\main.exe "path/to/midi/file.mid"
```

**Play a Midi file (white keys only):**
```powershell
.\main.exe --whites "path/to/midi/file.mid"
```

**Live input from a Midi device:**
```powershell
.\main.exe
```
