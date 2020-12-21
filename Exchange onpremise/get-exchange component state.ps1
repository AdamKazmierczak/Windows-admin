
#all components
# Get-ServerComponentState -Identity itcldex001 

$exchange =(Get-ServerComponentState -Identity someservername -Component popproxy).localstates.state #|select-object state

#$val = Get-ItemProperty -Path $patchreg -Name $nameinreg

if ($exchange -match 'Active')
{
 return $true
 }

else 
{return $false}


set-servercomponentstate -Identity someservername -Component PopProxy -reqeuster Maintenance -state Active