$cloud1= Get-SCCloud -Name "Exmaple-cloud-name"
$service = get-scservice -Name "example-service-name"
Set-SCService -Service $service -Cloud $cloud1
