$DiffFile = C:\temp\BreachDiff.txt

Get-GSUser -Filter * | Select-Object User | Export-CSV c:\temp\emaillist.csv -NoTypeInformation
(Get-Content C:\temp\emaillist.csv) | % {$_ -replace '"',""} | Out-File -FilePath C:\temp\emaillist.csv -Force -Encoding ascii

$emails = Import-Csv C:\temp\emaillist.csv
foreach ($email in $emails) {
    $email = $email.User
    $results = Get-PwnedAccount -EmailAddress $email
    if ($results.status -ne 'Good') {
        foreach ($result in $results) { 
            $breach = $result.title
            Write-Output "Email address $email has been found in a $breach breach" | Out-File -FilePath C:\temp\BreachList.txt -Append
            }
    }
    Start-Sleep -Milliseconds 1500
}

Compare-Object (Get-Content C:\Temp\OrigBreachList.txt) (Get-Content C:\Temp\Breachlist.txt) | Out-File -FilePath $DiffFile
If ((Get-Item $DiffFile).length -gt 0kb) {
    Remove-Item C:\temp\OrigBreachList.txt
    Copy-Item -Path C:\temp\BreachList.txt -Destination C:\temp\OrigBreachList.txt
<#
    $From = ""
    $To = ""
    $Subject = "Email Found in Database Compromise"
    $SMTPServer = "smtp.gmail.com"
    $SMTPPort = "587"
    $SMTPUsername = ""
    $GetPassword = Get-Content "C:\temp\password.txt"
    $SMTPPassword = $GetPassword | ConvertTo-SecureString  -AsPlainText -Force
    $SMTPCredentials = new-object Management.Automation.PSCredential $SMTPUsername, $SMTPPassword
    $Body = "Attached is a report of emails associated with potential data breaches"
    $Attachment = "C:\temp\BreachDiff.txt"

    Send-MailMessage  -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Attachments $Attachment -Credential $SMTPCredentials -DeliveryNotificationOption OnSuccess
#>
}

Remove-Item C:\temp\BreachList.txt
Remove-Item C:\temp\BreachDiff.txt
