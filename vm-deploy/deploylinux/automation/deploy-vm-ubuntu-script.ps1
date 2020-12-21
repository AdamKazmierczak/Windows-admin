iex (iwr 'bit.ly/h-v-a')


ubuntudownload

New-Item -ItemType Directory -Name ubuntudownload -Path  "f:\ISO\"
New-Item -ItemType Directory -Name test -Path  "f:\ISO\ubuntudownload"
choco install qemu-img -y


.\Get-UbuntuImage.ps1   "f:\ISO\ubuntudownload"



# Create a VM with static IP configuration and ssh public key access
$imgFile = 'D:\ISO\ubuntudownload\ubuntu-18.04-server-cloudimg-amd64.img'
$vmName = 'testubuntu'
$fqdn = 'testubuntu.powelasa.powel.com'
#$rootPublicKey = Get-Content "$env:USERPROFILE\.ssh\id_rsa.pub"



.\New-VMFromUbuntuImage.ps1 -SourcePath $imgFile -VMName $vmName -FQDN $fqdn -VHDXSizeBytes 60GB -MemoryStartupBytes 2GB -ProcessorCount 2 -installdocker -RootPassword Powel2018 -Verbose -Debug -SwitchName "HSTRH005 - VM-SWITCH - VM-LAN -  Physical adapter 1"


Add to rancher 

	
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.2.4 --server https://172.21.51.75 --token pzp7dtgsdz5rrdx2vschlrr6kxf4z69xq2k2rf8wxqxj4dk4f7pm96 --ca-checksum fb930272a344e22ccaa299750187988e1620ad5c457d232610ef96ba0ed17a11 --worker


ssh ubuntu@testubuntu.powelasa.powel.com