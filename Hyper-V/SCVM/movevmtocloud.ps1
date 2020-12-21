$Vmname = "Someexamplevmname"
$ownervm= "domainname\usrname"
$cloudname = "example Cloud"
# get-vm $Vmname |set-vm -Owner $ownervm 

$cloudadd= Get-SCCloud -VMMServer ittrhscvm-1 |where {$_.name -eq $cloudname}
Set-SCVirtualMachine -VM $Vmname -Owner $ownervm -Cloud $cloudadd