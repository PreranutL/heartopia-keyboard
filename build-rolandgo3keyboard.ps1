# Get the Visual Studio installation path
$vsPath = (& 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe' -latest -property installationPath).Trim()

if (-not $vsPath) {
    Write-Error "Visual Studio not found. Please install Visual Studio with C++ desktop development tools."
    exit 1
}

$vcvars = "$vsPath\VC\Auxiliary\Build\vcvars64.bat"

Write-Host "Compiling rolandgo3keyboard.cpp..." -ForegroundColor Cyan
cmd.exe /c "call `"$vcvars`" && cl.exe /EHsc /std:c++20 /O2 /Fe:rolandgo3keyboard.exe rolandgo3keyboard.cpp user32.lib winmm.lib"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Compilation successful! Executable generated as rolandgo3keyboard.exe." -ForegroundColor Green
    Remove-Item rolandgo3keyboard.obj -ErrorAction SilentlyContinue
} else {
    Write-Error "Compilation failed."
}
