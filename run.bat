@echo off
echo Installation des dépendances...
pip install -r requirements.txt || exit /b 1

echo Lancement des tests...
robot -d results tests || exit /b 2

echo Tests terminés.
pause

if %ERRORLEVEL% equ 0 (
  powershell -Command "$cred=New-Object System.Management.Automation.PSCredential('votre.email@gmail.com', (ConvertTo-SecureString 'votre-mot-de-passe-app' -AsPlainText -Force)); Send-MailMessage -From 'jenkins@votresociete.com' -To 'hassendai.info@gmail.com' -Subject 'SUCCÈS: Tests Robot' -Body 'Tous les tests ont réussi.<br>Rapport: <a href=\"%BUILD_URL%\">Lien Jenkins</a>' -BodyAsHtml -SmtpServer 'smtp.gmail.com' -Port 587 -UseSsl -Credential $cred -ErrorAction Stop"
) else (
  powershell -Command "$cred=New-Object System.Management.Automation.PSCredential('votre.email@gmail.com', (ConvertTo-SecureString 'votre-mot-de-passe-app' -AsPlainText -Force)); Send-MailMessage -From 'jenkins@votresociete.com' -To 'hassendai.info@gmail.com' -Subject 'ÉCHEC: Tests Robot' -Body 'Des tests ont échoué.<br>Consulter: <a href=\"%BUILD_URL%\">Rapport d\'erreur</a>' -BodyAsHtml -SmtpServer 'smtp.gmail.com' -Port 587 -UseSsl -Credential $cred -ErrorAction Stop"
)
