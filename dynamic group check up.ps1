 #Check  dynamic group criteria 
 
 
 Start-Transcript -Path "C:\all3e.txt"
      
$FTE = Get-DynamicDistributionGroup AllEmployee 
  
   Start-Transcript -Path "C:\listall.txt"
Get-Recipient -RecipientPreviewFilter $FTE.RecipientFilter #-OrganizationalUnit $FTE.RecipientContainer 

Stop-transcript
