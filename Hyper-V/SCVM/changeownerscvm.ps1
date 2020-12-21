#Powershell as admin at scvm 

$cloud1= Get-SCCloud -Name "Someexample Cloud" #cloud name 
$service = get-scservice -Name "Monitoring Arcgis" # service name
Set-SCService -Service $service -Cloud $cloud1 -Owner "domainname\username" #owner 

