#disable TCP/IPV6
Get-NetAdapterBinding -ComponentID ms_tcpip6 |Set-NetAdapterBinding -Enabled $false 

Set-Service -StartupType Manual -Name CcmExec
Get-Service -Name CcmExec |Set-Service -Status Stopped
$compname = hostname
$Compdomain ="$compname"+".somedomain.com"
Import-Module RemoteDesktop -Verbose
Import-Module ServerManager -Verbose
import-module remotedesktopservices -Verbose
New-SessionDeployment –ConnectionBroker "$Compdomain" –WebAccessServer "$Compdomain"  –SessionHost "$Compdomain" -Verbose 
New-RDSessionDeployment –ConnectionBroker "$Compdomain" –WebAccessServer "$Compdomain"  –SessionHost "$Compdomain" -Verbose 

Set-RDLicenseConfiguration -LicenseServer somelicenseserver.domain.com -mode PerUser -force -Verbose 

#restart sccm agent
Set-Service -StartupType Automatic -Name CcmExec
Get-Service -Name CcmExec |Set-Service -Status Running 
exit