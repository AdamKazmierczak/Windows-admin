Import-Module -Name "Virtualmachinemanager"
$vmnamesinrows = Get-Content C:\temp\removevm.txt
ForEach ($variable in $vmnamesinrows)
{ Remove-SCVirtualMachine -vm $vmnamesinrows}