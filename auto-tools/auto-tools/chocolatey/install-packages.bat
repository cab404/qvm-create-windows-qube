@echo off
title %~f0

for /f "usebackq" %%i in ("package-list") do set packages=%%i

choco -y install %packages%
