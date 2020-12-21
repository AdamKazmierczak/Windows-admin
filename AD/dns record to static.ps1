$dnsServer = 'MyDC01'
$zone = 'contoso.com'
$records = Get-DnsServerResourceRecord -ComputerName $dnsServer -ZoneName $zone -RRType A | Where-Object { $_.HostName -like 'printer*' }

$records | ForEach-Object {
    Set-DnsServerResourceRecord -OldInputObject $_ -NewInputObject $_ -ComputerName $dnsServer -ZoneName $zone
}