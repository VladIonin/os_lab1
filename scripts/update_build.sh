#!/bin/bash

cd "$(dirname "$0")/.." || exit 1

echo "[1/3] Git update..."
git pull --rebase --autostash
if [ $? -ne 0 ]; then
    echo "Error during Git pull!"
fi

echo "[2/3] CMake configure..."
cmake -S . -B build
if [ $? -ne 0 ]; then
    echo "Error during CMake configuration!"
    exit 1
fi

echo "[3/3] Build..."
cmake --build build
if [ $? -ne 0 ]; then
    echo "Error during Build!"
    exit 1
fi

echo ""
echo "========================="
echo "Build Success!"
echo "========================="