#disable RC4 3des 

New-item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128\"  -PropertyType Dword -Name Enabled -Value 0 -Force

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128\" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128\"  -PropertyType Dword -Name Enabled -Value 0 -Force


New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128\" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128\"  -PropertyType Dword -Name Enabled -Value 0 -Force

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128\" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128\"  -PropertyType Dword -Name Enabled -Value 0 -Force


#Disable 3des 
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168\" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168\"  -PropertyType Dword -Name Enabled -Value 0 -Force

#Disable SSl 2.0

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\" 
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\"  -PropertyType Dword -Name Enabled -Value 0x0 -Force


#Disable SSL 3.0
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\"
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\"
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\"  -PropertyType Dword -Name Enabled -Value 0 -Force
#New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\"  -PropertyType Dword -Name DisabledByDefault -Value 0 -Force

