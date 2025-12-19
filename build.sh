#!/bin/bash
# Build script for Antique Book

# Check if xelatex is installed
if ! command -v xelatex &> /dev/null; then
    echo "Error: xelatex is not installed. Please install TeX Live or MiKTeX."
    exit 1
fi

echo "Building example.tex..."
xelatex example.tex

if [ $? -eq 0 ]; then
    echo "Build successful! Output: example.pdf"
else
    echo "Build failed."
    exit 1
fi
