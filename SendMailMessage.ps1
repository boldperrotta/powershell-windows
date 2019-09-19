    $MailMessageParameters = @{
        From = #From Address
        To = #To Address
        Subject = #Email subject
        SMTPServer = "smtp.gmail.com" #SMTP server address
        SMTPPort = "587" #SMTP server port
        Credential = Import-CliXml -Path "${env:\userprofile}\email.Cred" #Use CLIXML to secure credentials
        Body = #Body content
        DeliveryNotificationOption = OnSuccess
    }

    Send-MailMessage @MailMessageParameters -UseSsl
