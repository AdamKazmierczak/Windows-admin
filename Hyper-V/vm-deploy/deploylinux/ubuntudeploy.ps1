# define variables and deploy 
#hostname /linux deployment server definition
$Virtualhost = "hsjkp003" 

$scriptblockcontent = 

    {   

        $imgFile = 'E:\ISO\ubuntudownload\ubuntu-18.04-server-cloudimg-amd64.img' #do not change
        
        #vm name definition
        $vmName = 'vhsjkplixansible002' # can be changed
        $fqdn = $vmName +".powelasa.powel.com"
        
        #future use public key
        #$rootPublicKey = Get-Content "$env:USERPROFILE\.ssh\id_rsa.pub"

        # Variables for master token 
        $fileName ="e:\automation\New-VMFromUbuntuImage.ps1" # File where changes regarding token will be applied
       # $patern = '--token pzp7dtgsdz5rrdx2vschlrr6kxf4z69xq2k2rf8wxqxj4dk4f7pm96aaaaaaaaaa' #Example old token for master replacement
       # $replaceme = '--token 4j7nqb2xrcqk2cbs4grhg548jmdzf9vhxhsqng87zsr5s4tgbd7kdv'  # Example new token for master /

        #replacement of new token
      #  Get-Content -path $fileName |ForEach-Object {$_ -replace $patern , $replaceme } |Set-Content f:\automation\new_version_New-VMFromUbuntuImageadddomain.ps1.ps1

      #  Remove-Item -Path f:\automation\New-VMFromUbuntuImageaddomain.ps1 -Force
      #  Rename-Item -Path f:\automation\new_version_New-VMFromUbuntuImageadddomain.ps1.ps1 -NewName f:\automation\New-VMFromUbuntuImageaddomain.ps1 -Force

        #main deploy script
        e:\automation\New-VMFromUbuntuImageadddomain.ps1 -SourcePath $imgFile -VMName $vmName -FQDN $fqdn -VHDXSizeBytes 60GB -MemoryStartupBytes 4GB -ProcessorCount 2 -installdocker -RootPassword Powel2018 -Verbose -Debug -SwitchName "switch vhsjkp001  Lan"

    }

#deployment
Invoke-Command -ScriptBlock $scriptblockcontent -ComputerName $Virtualhost 




sudo apt-get install software-properties-common
sudo apt-get install realmd krb5-user software-properties-common packagekit -y
echo Powel2018 |sudo realm join powelasa.powel.com --user=adcomputer   --computer-ou=OU='Linux,OU=Computers and Servers,OU=Powel,DC=powelasa,DC=powel,DC=com'