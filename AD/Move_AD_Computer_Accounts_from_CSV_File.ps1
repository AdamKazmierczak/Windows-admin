# Specify path to the text file with the computer account names.
$computers = Get-Content C:\Temp\comp.txt

# Specify the path to the OU where computers will be moved.
$TargetOU   =  "OU=Firewall_test,OU=Clients,OU=Computers and Servers,OU=Powel,DC=powelasa,DC=powel,DC=com" 
ForEach( $computer in $computers){
    Get-ADComputer $computer |
    Move-ADObject -TargetPath $TargetOU

}