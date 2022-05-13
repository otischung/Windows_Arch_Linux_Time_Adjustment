@echo off
echo Please use admin permission to run this script.
w32tm /query /peers
rem Get-Service rem for PowrShell
rem Start-Service -Name Win32Time rem for Powershell
net start W32Time
w32tm /resync
w32tm /query /peers
pause
