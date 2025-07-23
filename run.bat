@echo off
echo Installation des dépendances...
pip install -r requirements.txt || exit /b 1

echo Lancement des tests...
robot -d results tests || exit /b 2

echo Tests terminés.
pause
