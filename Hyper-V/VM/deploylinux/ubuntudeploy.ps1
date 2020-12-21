# define variables and deploy 
#hostname /linux deployment server definition
$Virtualhost = "hsjkp003" 

$scriptblockcontent = 

    {   

        $imgFile = 'E:\ISO\ubuntudownload\ubuntu-18.04-server-cloudimg-amd64.img' #do not change
        
        #vm name definition
        $vmName = 'vhsjkplixansible002' # can be changed
        $fqdn = $vmName +".some.domain.com"
        
        #future use public key
        #$rootPublicKey = Get-Content "$env:USERPROFILE\.ssh\id_rsa.pub"

        # Variables for master token 
        $fileName ="e:\automation\New-VMFromUbuntuImage.ps1" # File where changes regarding token will be applied

        #main deploy script
        e:\automation\New-VMFromUbuntuImageadddomain.ps1 -SourcePath $imgFile -VMName $vmName -FQDN $fqdn -VHDXSizeBytes 60GB -MemoryStartupBytes 4GB -ProcessorCount 2 -installdocker -RootPassword Powel2018 -Verbose -Debug -SwitchName "switch vhsjkp001  Lan"

    }

#deployment
Invoke-Command -ScriptBlock $scriptblockcontent -ComputerName $Virtualhost 




sudo apt-get install software-properties-common
sudo apt-get install realmd krb5-user software-properties-common packagekit -y
echo Powel2018 |sudo realm join powelasa.powel.com --user=adcomputer   --computer-ou=OU='Linux,OU=Computers and Servers,OU=Powel,DC=powelasa,DC=powel,DC=com'