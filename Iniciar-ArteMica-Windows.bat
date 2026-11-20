@echo off
setlocal
cd /d "%~dp0"
where py >nul 2>nul
if errorlevel 1 (
  echo Python nao encontrado. Instale Python 3 ou abra a pasta por um servidor HTTP local.
  pause
  exit /b 1
)
start "ArteMica - servidor local" cmd /c "py -m http.server 8000"
timeout /t 2 /nobreak >nul
start "" http://localhost:8000
