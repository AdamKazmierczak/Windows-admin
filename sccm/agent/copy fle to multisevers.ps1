$compiki=read-host "podaj lokacje pliku hostow"
$skad=read-host "gdzie jest plik do skopiowania"
$dokad=Read-Host "gdzie ma byc skopiowany - folder na przyklad windows\temp"
Get-Content $compiki |foreach {Copy-Item $skad -destination \\$_\c$\$dokad}