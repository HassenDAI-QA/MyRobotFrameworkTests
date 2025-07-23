@echo off
echo Installation des dépendances...
pip install -r requirements.txt || exit /b 1

echo Lancement des tests...
robot -d results tests || exit /b 2

echo Envoi du rapport par email...
powershell -Command "& {
    $EmailFrom = 'hassen.dai@waialys-group.com'
    $EmailTo = 'hassendai.info@gmail.com'
    $Subject = 'Résultats des tests RobotFramework'
    $Body = 'Veuvez trouver ci-joint les résultats des tests'
    $SMTPServer = 'smtp.gmail.com'
    $SMTPPort = '587'
    $Password = 'omdu ynke qxit xkkr'
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($EmailFrom, $SecurePassword)
    
    Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $Subject -Body $Body `
        -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $Credential `
        -Attachments 'results\report.html', 'results\log.html' -BodyAsHtml -ErrorAction Stop
}" || exit /b 3

exit /b 0
