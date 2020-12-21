$team= 'userorgroupname'

$hostname = "vmname"
([ADSI]"WinNT://$hostname/Administrators,group").add("WinNT://domain.com/$team")

#$exist=[Adsi]::Exists('WinNT://./$team')
#Md "HKLM:\Software\checkreg\" 
#New-ItemProperty "HKLM:\Software\checkreg\" -Name "$team" -Value $exist -PropertyType "DWord" -Force

$teamrdp= 'username'
$hostname = "pcname"
([ADSI]"WinNT://$hostname/Remote Desktop Users,group").Add("WinNT://domain.com/$teamrdp")
$exist=[Adsi]::Exists('WinNT://./$teamrdp')


$variable = get-content -Path C:\temp\servers.txt

 
Foreach ($UpdateCab in $variable)
{


$team= 'ADMS-USERS-Group'

$hostname = $UpdateCab
([ADSI]"WinNT://$hostname/Administrators,group").add("WinNT://domain.com/$team")


}

