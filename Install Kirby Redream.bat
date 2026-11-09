@echo off
rem Opens the installer window, then builds Kirby: Redream from your own game files.
setlocal
set "REPO=%~dp0"
if exist "%REPO%deps\python\python.exe" (
  "%REPO%deps\python\python.exe" "%REPO%scripts\installer_gui.py" %*
  exit /b %errorlevel%
)
where py.exe >nul 2>nul
if not errorlevel 1 (
  py -3 "%REPO%scripts\installer_gui.py" %*
  exit /b %errorlevel%
)
where python.exe >nul 2>nul
if not errorlevel 1 (
  python "%REPO%scripts\installer_gui.py" %*
  exit /b %errorlevel%
)
echo Python 3 was not found. Install Python 3.10 or newer, then run this file again.
echo Download: https://www.python.org/downloads/windows/
pause
exit /b 1
