@echo off
setlocal

REM Переходим в директорию скрипта
cd /d "%~dp0\.."

REM Обновляем репозиторий
echo [1/3] Git update...
git pull --rebase
if errorlevel 1 (
    echo Error during Git pull!
)

REM Конфигурируем CMake
echo [2/3] CMake configure...
cmake -S . -B build -G "MinGW Makefiles"
if errorlevel 1 (
    echo Error during CMake configuration!
    pause
    exit /b 1
)

REM Компилируем
echo [3/3] Build...
cmake --build build
if errorlevel 1 (
    echo Error during Build!
    pause
    exit /b 1
)

echo.
echo =========================
echo Build Success!
echo =========================
pause