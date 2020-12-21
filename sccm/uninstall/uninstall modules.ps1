Install-Module -Name ProgramManagement -AllowClobber -force

taskkill /IM "Acrord32.exe"
uninstall-program "Acrobat reader" -UninstallAllSimilarlyNamedPackages



choco install adobereader -params '"/DesktopIcon /UpdateMode:3"' -force -y

.\AcroRdrDC1901020064_MUI.exe /sPB

#finish up winrm / private profile check up

#Enable-PSRemoting -SkipNetworkProfileCheck -Force