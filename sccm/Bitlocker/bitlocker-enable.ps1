#remove keyprotectors 
manage-bde -protectors -delete c:

#create bitlocker protectors recoverypassword / system drive
Start-Process 'manage-bde.exe' -ArgumentList " -protectors -add $env:SystemDrive -recoverypassword" -Verb runas -Wait

#create bitlocker protectors tpm /system drive

Start-Process 'manage-bde.exe' -ArgumentList " -protectors -add $env:SystemDrive  -tpm" -Verb runas -Wait

sleep -Seconds 15 #This is to give sufficient time for the protectors to fully take effect.

#start encyrption
#Start-Process 'manage-bde.exe' -ArgumentList " -on $env:SystemDrive -em aes256 -SkipHardwareTest " -Verb runas -Wait 

Start-Process 'manage-bde.exe' -ArgumentList " -on $env:SystemDrive -em aes256 -SkipHardwareTest " -Verb runas -Wait 


#get recovery key guid
$RecoveryKeyGUID = (Get-BitLockerVolume -MountPoint $env:SystemDrive).keyprotector | where {$_.Keyprotectortype -eq 'RecoveryPassword'} | Select-Object -ExpandProperty KeyProtectorID

#backup recovrey key to AD
manage-bde.exe  -protectors $env:SystemDrive -adbackup -id $RecoveryKeyGUID

#need to restart pc.
