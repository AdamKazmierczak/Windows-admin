Install-Module PSWindowsUpdate -Force 
Get-WindowsUpdate -MicrosoftUpdate -AcceptAll
Install-WindowsUpdate -AcceptAll  -WindowsUpdate -ForceInstall