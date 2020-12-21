mkdir C:\temp

Start-Transcript -Path c:\temp\logsdeplyomentpart1.txt

Set-Service -StartupType Manual -Name CcmExec
Get-Service -Name CcmExec |Set-Service -Status Stopped

$compname = hostname
$Compdomain ="$compname"+".powelasa.powel.com"
Import-Module RemoteDesktop -Verbose 
Import-Module ServerManager -Verbose
import-module remotedesktopservices -Verbose
Add-WindowsFeature -Name RDS-connection-broker
Add-WindowsFeature -Name rds-rd-server -IncludeManagementTools -Verbose
Add-WindowsFeature -Name rds-web-access

Set-Service -StartupType Automatic -Name CcmExec

shutdown -r /f 
Stop-Transcript

exit