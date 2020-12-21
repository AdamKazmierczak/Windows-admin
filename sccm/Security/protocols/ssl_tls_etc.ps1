#disable RC4 3des 

New-item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128\"  -PropertyType Dword -Name Enabled -Value 0 -Force

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128\" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128\"  -PropertyType Dword -Name Enabled -Value 0 -Force


New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128\" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128\"  -PropertyType Dword -Name Enabled -Value 0 -Force

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128\" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128\"  -PropertyType Dword -Name Enabled -Value 0xffffffff -Force


#Disable 3des 
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168\" -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168\"  -PropertyType Dword -Name Enabled -Value 0xffffffff -Force

#Disable SSl 2.0

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\" 
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\"  -PropertyType Dword -Name Enabled -Value 0x0 -Force


#Disable SSL 3.0
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\"
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\"
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\"  -PropertyType Dword -Name Enabled -Value 0xffffffff -Force
#New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\"  -PropertyType Dword -Name DisabledByDefault -Value 0 -Force

#disable TLS 1.0 Server side

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\" 
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\" 
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\"  -PropertyType Dword -Name Enabled -Value 0xffffffff -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\"  -PropertyType Dword -Name DisabledByDefault -Value 1 -Force
Remove-Item "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\Enabled" 


#disable TLS 1.1 Server side

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\" 
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\" 
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\"  -PropertyType Dword -Name DisabledByDefault -Value 1 -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\"  -PropertyType Dword -Name Enabled  -Value 0xffffffff -Force

#enable tls 1.2 Server side

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\" 
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\" 
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\"  -PropertyType Dword -Name DisabledByDefault -Value 0 -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\"  -PropertyType Dword -Name Enabled  -Value 1 -Force