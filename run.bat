@echo off
echo Installation des dépendances...
pip install -r requirements.txt || exit /b 1

echo Lancement des tests...
robot -d results tests || exit /b 2

echo Tests terminés.
pause

$EmailFrom = "hassen.dai@waialys-group.com"
$EmailTo = "hassendai.info@gmail.com"
$Subject = "Statut des Tests"
$Body = "Résultat des tests Robot Framework"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
$Password = "votre-mot-de-passe-d-application"  # Les 16 caractères

$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($EmailFrom, $SecurePassword)

Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $Subject -Body $Body `
-SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $Credential `
-ErrorAction Stop
