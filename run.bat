@echo off
echo Envoi du rapport par email...
powershell -Command "try {
    $cred = New-Object System.Management.Automation.PSCredential(
        'hassen.dai@waialys-group.com',
        (ConvertTo-SecureString 'omdu ynke qxit xkkr' -AsPlainText -Force)
    )
    Send-MailMessage -From 'hassen.dai@waialys-group.com' -To 'hassendai.info@gmail.com' `
        -Subject 'Résultats des tests RobotFramework' `
        -Body 'Veuvez trouver ci-joint les résultats des tests' `
        -SmtpServer 'smtp.gmail.com' -Port 587 -UseSsl `
        -Credential $cred -Attachments 'results\report.html', 'results\log.html' `
        -BodyAsHtml -ErrorAction Stop
    exit 0
} catch {
    Write-Output $_
    exit 3
}"
