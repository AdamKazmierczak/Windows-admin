cd c:\temp\servicemap\


C:\temp\servicemap\InstallDependencyAgent-Windows.exe /S

./monitoringagent/setup.exe /qn NOAPM=1 ADD_OPINSIGHTS_WORKSPACE=1 OPINSIGHTS_WORKSPACE_AZURE_CLOUD_TYPE=0 OPINSIGHTS_WORKSPACE_ID="someID" OPINSIGHTS_WORKSPACE_KEY="Lbw8ZqSOMEEXAMPLEKEY5gnwVuxzgfLuqRpsEA==" AcceptEndUserLicenseAgreement=1


$app = Get-WmiObject -Class Win32_Product -Filter "Name = 'Microsoft Monitoring Agent'"
$app.Uninstall()