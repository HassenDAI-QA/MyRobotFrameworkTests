@echo off
echo Installing dependencies...
pip install -r requirements.txt || exit /b 1

echo Running tests...
robot -d results tests || exit /b 2

echo Tests completed.
