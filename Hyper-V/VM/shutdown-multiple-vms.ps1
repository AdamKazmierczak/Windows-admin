Import-Module -Name "Virtualmachinemanager"
$vmnamesinrows = Get-Content C:\temp\shutdownvm.txt
ForEach ($variable in $vmnamesinrows)
{$vmstop =Get-SCVirtualMachine -Name $variable | Select-Object computername
 $vmstoptostring= $vmstop.computername.ToString()}
 #$vmstoptostring
  #stop-SCVirtualMachine -VM  $vmstoptostring -Shutdown}


 #Move-SCVirtualMachine -VM asdasd