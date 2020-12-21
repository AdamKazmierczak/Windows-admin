#################################################################################################################
# 
# Version 1.1 May 2014
# Robert Pearman (WSSMB MVP)
# TitleRequired.com
# Script to Automated Email Reminders when Users Passwords due to Expire.
#
# Requires: Windows PowerShell Module for Active Directory
#
# For assistance and ideas, visit the TechNet Gallery Q&A Page. http://gallery.technet.microsoft.com/Password-Expiry-Email-177c3e27/view/Discussions#content
#
##################################################################################################################
#modified by Adam Kazmierczak 7.24.2018

# Please Configure the following variables....
$smtpServer="mailhub.powel.com"
$smtpPort="587"
$from = "noreply@powel.no"

$expireindays = 5

$logging = "Enabled" # Set to Disabled to Disable Logging
$logFile = "C:\scriptrundaily\expirylog.csv" # ie. c:\mylog.csv
$testing = "Disabled" # Set to Disabled to Email Users
$testRecipient = "masc@powel.com"
$date = Get-Date -format ddMMyyyy
#
###################################################################################################################

# Check Logging Settings
if (($logging) -eq "Enabled")
{
    # Test Log File Path
    $logfilePath = (Test-Path $logFile)
    if (($logFilePath) -ne "True")
    {
        # Create CSV File and Headers
        New-Item $logfile -ItemType File
        Add-Content $logfile "Date,Name,EmailAddress,DaystoExpire,ExpiresOn"
    }
} # End Logging Check

# Get Users From AD who are Enabled, Passwords Expire and are Not Currently Expired
Import-Module ActiveDirectory

$users = get-aduser -filter * -properties Name, PasswordNeverExpires, PasswordExpired, PasswordLastSet, EmailAddress | Where {$_.DistinguishedName -like '*VAHOSTING*'} | where {$_.Enabled -eq "True"} | where { $_.PasswordNeverExpires -eq $false } | where { $_.passwordexpired -eq $false }


$maxPasswordAge ="90" #(Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge

# Process Each User for Password Expiry
foreach ($user in $users)
{
    $Name = (Get-ADUser $user | foreach { $_.Name})
    $emailaddress = $user.emailaddress
    $passwordSetDate = (get-aduser $user -properties * | foreach { $_.PasswordLastSet })
    $PasswordPol = (Get-AduserResultantPasswordPolicy $user)
    # Check for Fine Grained Password
    if (($PasswordPol) -ne $null)
    {
        $maxPasswordAge = ($PasswordPol).MaxPasswordAge
    }
  
    $expireson = $passwordsetdate + $maxPasswordAge
    $today = (get-date)
    $daystoexpire = (New-TimeSpan -Start $today -End $Expireson).Days
        
    # Set Greeting based on Number of Days to Expiry.

    # Check Number of Days to Expiry
    $messageDays = $daystoexpire

    if (($messageDays) -ge "5")
    {
        $messageDays = "om " + "$daystoexpire" + " dager."
    }
    else
    {
        $messageDays = "today."
    }

    # Email Subject Set Here
    $subject="Ditt passord for Gemini VA i sky utgår $messageDays"
  
    # Email Body Set Here, Note You can use HTML, including Images.
    $body ="
    Hei $name,
    <p> Ditt passord for pålogging til Gemini VA i sky utgår $messageDays<br>
    For å endre passordet ditt <a href=https://remote.onpowel.com/RDWeb/Pages/en-US/password.aspx>trykk her</a>  
    <br>
    <p>Dette er en autogenerert e-post, vennligst ikke svar på denne. Dersom du har behov for hjelp kontakt support@powel.no.<br></p>"

    $Body += "Med vennlig hilsen <br> <b>Powel Support</b> <br> Powel AS, Klæbuveien 194, NO-7037 Trondheim, NORWAY <br><i>Telefon: +47 73 80 45 10</i> "

   
    # If Testing Is Enabled - Email Administrator
    if (($testing) -eq "Enabled")
    {
        $emailaddress = $testRecipient
    } # End Testing

    # If a user has no email address listed
    if (($emailaddress) -eq $null)
    {
        $emailaddress = $testRecipient    
    }# End No Valid Email

    # Send Email Message
    if ($daystoexpire -eq "5")
    {
         # If Logging is Enabled Log Details
        if (($logging) -eq "Enabled")
        {
            Add-Content $logfile "$date,$Name,$emailaddress,$daystoExpire,$expireson" 
        }
        # Send Email Message
        [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { return $true }
       # Send-Mailmessage -smtpServer $smtpServer  -from $from -to $testRecipient -subject $subject -body $body -bodyasHTML -Encoding UTF8  #-Port $smtpPort 

         Send-Mailmessage -smtpServer "mailhub.powel.com"  -from $from -to $emailaddress -subject $subject -body $body -bodyasHTML -Encoding UTF8  -usessl #-Port $smtpPort 
    } # End Send Message
    
} # End User Processing



# End