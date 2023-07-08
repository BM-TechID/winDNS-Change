Write-Host "------------------"
Write-Host "| Start perintah |"
Write-Host "------------------"
Start-Sleep -Seconds 3
Write-Host ""
Write-Host ""

# Eksekusi perintah Set-DnsClientServerAddress
Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ServerAddresses ("127.0.0.1")


Write-Host "Perintah selesai..."
Start-Sleep -Seconds 3

# Cek pengaturan DNS
Write-Host ""
$dnsSettings = Get-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex
$dnsServers = $dnsSettings.ServerAddresses
$dnsSetToLocahost = $dnsServers -contains "127.0.0.1"

if ($dnsSetToLocahost) {
    Write-Host "DNS telah diubah ke localhost."
} else {
    Write-Host "Gagal mengubah DNS ke localhost."
}

# Hitung mundur 5 detik setelah menjalankan perintah
Write-Host ""
Write-Host "Tunggu..."
Start-Sleep -Seconds 5


