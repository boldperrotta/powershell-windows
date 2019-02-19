$pass = ConvertTo-SecureString "SuperSecurPassword" -AsPlainText -Force
Enable-BitLocker -MountPoint D:\ -EncryptionMethod Aes256 -Password $pass -PasswordProtector -UsedSpaceOnly
