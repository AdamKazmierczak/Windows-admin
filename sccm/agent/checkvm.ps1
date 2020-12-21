#requires -version 3.0
#requires -modules Hyper-V
 
<#
.Synopsis
Find a virtual machine last use date.
.Description
This command will write a custom object to the pipeline which should indicate
when the virtual machine was last used. The command finds all hard drives that
are associated with a Hyper-V virtual machine and selects the first one. The
assumption is that if the virtual machine is running the hard drive file will
be changed. The function retrieves the last write time property from the first
VHD or VHDX file.
 
You can pipe a collection of Hyper-V virtual machines or specify a virtual
machine name. Wildcards are supported. The default is to display last use data
for all virtual machines. This command must be run on the Hyper-V server in
order to get file system information from the disk file.
 
The command requires the Hyper-V module running in PowerShell 3.0.
 
.Example
PS C:\> c:\scripts\get-vmlastuse.ps1 xp*
 
VMName LastUse LastUseAge
------ ------- ----------
XP Lab 4/20/2013 10:31:56 AM 39.22:46:56.5270998
 
Get last use information for any virtual machine starting with XP.
 
.Example
PS C:\> get-vm | where {$_.state -eq 'off'} | c:\scripts\get-vmlastuse
 
VMName LastUse LastUseAge
------ ------- ----------
CHI-Client02 4/20/2013 10:39:42 AM 39.22:39:37.9838225
DCDemo 5/3/2013 1:13:24 PM 26.20:05:56.2528664
Demo Rig 3/3/2013 2:32:17 PM 87.18:47:02.8858740
DemoVM 5/29/2013 8:01:49 PM 13:17:31.7162000
...
 
Get last use information for any virtual machine that is currently off.
 
.Inputs
String or Hyper-V Virtual Machine
.Outputs
custom object
.Link
Get-VM
#>
 
[cmdletbinding()]
Param (
[Parameter(Position=0,
HelpMessage="Enter a Hyper-V virtual machine name",
ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$True)]
[ValidateNotNullorEmpty()]
[alias("vm")]
[object]$Name="*"
)
 
Begin {
Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
} #begin
 
Process {
if ($name -is [string]) {
Write-Verbose -Message "Getting virtual machine(s)"
Try {
$vms = Get-VM -Name $name -ErrorAction Stop
}
Catch {
Write-Warning "Failed to find a VM or VMs with a name like $name"
#bail out
Return
}
}
else {
#otherwise we'll assume $Name is a virtual machine object
Write-Verbose "Found one or more virtual machines matching the name"
$vms = $name
}
 
foreach ($vm in $vms) {
#get first drive file
$diskFile = Get-Item -Path $vm.HardDrives[0].Path
$vm.hardDrives[0] | Select-Object -property VMName,
@{Name="LastUse";Expression={$diskFile.LastWriteTime}},
@{Name="LastUseAge";Expression={(Get-Date) - $diskFile.LastWriteTime}}
}#foreach
} #process
 
End {
Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
} #end