$Script =  'Start-Process -FilePath C:\Windows\System32\Sysprep\Sysprep.exe -ArgumentList ‘/generalize /oobe /shutdown /quiet’'

$computer='pcsomename'
Invoke-Command -ComputerName $computer -ScriptBlock {$Script}

