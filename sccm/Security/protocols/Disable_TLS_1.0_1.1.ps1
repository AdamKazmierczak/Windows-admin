#disable TLS 1.0 Server side

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\" 
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\" 
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\"  -PropertyType Dword -Name Enabled -Value 0 -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\"  -PropertyType Dword -Name DisabledByDefault -Value 1 -Force
Remove-Item "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\Enabled" 


#disable TLS 1.1 Server side

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\" 
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\" 
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\"  -PropertyType Dword -Name DisabledByDefault -Value 1 -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\"  -PropertyType Dword -Name Enabled  -Value 0 -Force