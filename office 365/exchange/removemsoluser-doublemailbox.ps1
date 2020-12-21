Connect-MSOLService -Credential $adminCredential   (enter ADAuser@lifetouch.com credentials) 
remove-MSOLUser -UserPrincipalName bvanwestrienen@lifetouch.com 
remove-MSOLUser -UserPrincipalName bvanwestrienen@lifetouch.com -RemoveFromRecycleBin 

#synchornise on mwtrhdirsync
#move mailbox to online.