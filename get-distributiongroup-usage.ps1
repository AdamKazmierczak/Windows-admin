Get-DynamicDistributionGroup |Format-Table WindowsEmailAddress >>C:\temp\dynamiclist.txt
Get-DistributionGroup |Format-Table PrimarySmtpAddress -AutoSize >>c:\temp\list.txt

$DistroLists = Get-Content C:\Temp\listdynamic.txt

Foreach ($DistroList in $DistroLists) {

Get-MessageTrace -RecipientAddress $DistroList -Status expanded -StartDate 11/25/2020 -EndDate 12/04/2020 |Sort-Object RecipientAddress | Group-Object RecipientAddress |Sort-Object Name |Select-Object Name, Count | Export-CSV C:\Temp\ActiveDGsdynamic.csv -Append -NotypeInformation

}