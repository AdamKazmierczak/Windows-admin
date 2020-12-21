 $computername='vm-gda-sccm'
 
 Invoke-Command -ComputerName  $computername -ScriptBlock {quser}
 #log of specific session
 Invoke-Command -ComputerName  $computername -ScriptBlock { logoff 2 }



 #logo of specific user who has more then one session on remote computer.
 $username='bst'

 $scriptBlock = {
     $ErrorActionPreference = 'Stop'
 
     try {
         ## Find all sessions matching the specified username
         $sessions = quser | Where-Object {$_ -match $username}
         ## Parse the session IDs from the output
         $sessionIds = ($sessions -split ' +')[2]
         Write-Host "Found $(@($sessionIds).Count) user login(s) on computer."
         ## Loop through each session ID and pass each to the logoff command
         $sessionIds | ForEach-Object {
             Write-Host "Logging off session id [$($_)]..."
             logoff $_
         }
     } catch {
         if ($_.Exception.Message -match 'No user exists') {
             Write-Host "The user is not logged in."
         } else {
             throw $_.Exception.Message
         }
     }
 }
 
 ## Run the scriptblock's code on the remote computer

 Invoke-Command -ComputerName REMOTECOMPUTER -ScriptBlock $scriptBlock