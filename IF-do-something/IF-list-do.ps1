VPCTRHSME001
VPCTRHSME002
VPCTRHSME003
VPCTRHSME004
VPCTRHSME005


#Variables
$computername = Get-Content C:\test\list.txt
$sourcefile = "\\server01\Pranay\setup.exe"
#This section will install the software 
foreach ($computer in $computername) 
{
    $destinationFolder = "\\$computer\C$\Temp"
    #It will copy $sourcefile to the $destinationfolder. If the Folder does not exist it will create it.

    if (!(Test-Path -path $destinationFolder))
    {
      #  New-Item $destinationFolder -Type Directory
    }
   # Copy-Item -Path $sourcefile -Destination $destinationFolder
    Invoke-Command -ComputerName $computer -ScriptBlock {Start-Process 'choco install forticlientvpn -y'}
}
