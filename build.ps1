# Get the Visual Studio installation path
$vsPath = (& 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe' -latest -property installationPath).Trim()

if (-not $vsPath) {
    Write-Error "Visual Studio not found. Please install Visual Studio with C++ desktop development tools."
    exit 1
}

$vcvars = "$vsPath\VC\Auxiliary\Build\vcvars64.bat"

Write-Host "Compiling main.cpp..." -ForegroundColor Cyan

# Compile the C++ program using MSVC compiler with C++20 and Optimization flags
cmd.exe /c "call `"$vcvars`" && cl.exe /EHsc /std:c++20 /O2 main.cpp user32.lib winmm.lib"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Compilation successful! Executable generated successfully as main.exe." -ForegroundColor Green
    # Cleanup object files to keep directory clean
    Remove-Item main.obj -ErrorAction SilentlyContinue
} else {
    Write-Error "Compilation failed."
}
