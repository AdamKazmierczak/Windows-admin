$hostserver = hostname
$vmnested = "ansiblenode"

Set-VMProcessor -VMName $vmnested -ComputerName $hostserver -ExposeVirtualizationExtensions $true
Get-VMProcessor -VMName $vmnested -ComputerName $hostserver  |fl vmname,ExposeVirtualizationExtensions

Get-VMNetworkAdapter -VMName $vmnested -ComputerName $hostserver  | Set-VMNetworkAdapter -MacAddressSpoofing On