#enable tls 1.2 Server side

New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\" 
New-item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\" 
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\"  -PropertyType Dword -Name DisabledByDefault -Value 0 -Force
New-ItemProperty "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\"  -PropertyType Dword -Name Enabled  -Value 1 -Force