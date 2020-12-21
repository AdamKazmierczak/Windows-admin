 #Invoke-Command -ComputerName tddelta011 

 Invoke-Command -ComputerName pcmamu -Credential powelasa\adka.admin -ScriptBlock {
 Get-EventLog System | Where-Object {$_.EventID -eq "1074" -or $_.EventID -eq "6008" -or $_.EventID -eq "1076"} | ft Machinename, TimeWritten, UserName, EventID, Message -AutoSize -Wrap
 }