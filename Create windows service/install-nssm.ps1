choco install nssm -y
choco install powershell-core -y
choco install jdk8 -y

$nssm = (Get-Command nssm).Source
$serviceName = 'Jenkins-agent'
$powershell = (Get-Command powershell).Source
$scriptPath = 'C:\Jenkins_agent\Start-agent-jenksin-nssm.ps1'
$arguments = ' -NoProfile -File "{0}"' -f $scriptPath 
& $nssm install $serviceName $powershell $arguments
& $nssm status $serviceName
Start-Service $serviceName
Get-Service $serviceName