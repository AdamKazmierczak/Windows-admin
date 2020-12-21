$strFileName="C:\ProgramData\Microsoft\Wlansvc\Profiles\Interfaces\*\*.xml"
$getfilecontent = (Get-Content $strFileName)

$containswords = $getfilecontent | %{$_ -match "*<name>Some-name-of-wifi-network-sid</name>
		</SSID>
	</SSIDConfig>
	<connectionType>ESS</connectionType>
	<connectionMode>auto</connectionMode>*"}  
$containswords2 = $getfilecontent | %{$_ -match "<connectionMode>auto</connectionMode>"}

if ($containswords -contains $true) 

{
return $true 
}
Else {
return $false 
}



