# Create a VM with static IP configuration and ssh public key access
$imgFile = 'f:\ISO\ubuntudownload\ubuntu-18.04-server-cloudimg-amd64.img'
$vmName = 'testubuntu6'
$fqdn = 'testubuntu6.powelasa.powel.com'
#$rootPublicKey = Get-Content "$env:USERPROFILE\.ssh\id_rsa.pub"



\\hsjkp001\New-VMFromUbuntuImage.ps1 -SourcePath $imgFile -VMName $vmName -FQDN $fqdn -VHDXSizeBytes 60GB -MemoryStartupBytes 2GB -ProcessorCount 2 -installdocker -RootPassword Powel2018 -Verbose -Debug -SwitchName "switch vhsjkp001  Lan"
    