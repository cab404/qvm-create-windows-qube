@echo off
title %~f0

rem If package-list is not empty
for /f "tokens=*" %%i in ("package-list") do set size=%%~zi
if %size% gtr 0 (
    rem Install Chocolatey (Command provided by: https://chocolatey.org/install)
    rem Just added environment variable to use Windows compression so 7-Zip is not a mandatory install
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "$env:chocolateyUseWindowsCompression = 'true'; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    
    rem Read packages from package-list and install them
    for /f "usebackq tokens=*" %%i in ("package-list") do set packages=%%i
    choco -y install %packages%
)
