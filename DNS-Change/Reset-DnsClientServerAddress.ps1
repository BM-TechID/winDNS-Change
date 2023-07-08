Write-Host "------------------"
Write-Host "| Start perintah |"
Write-Host "------------------"
Start-Sleep -Seconds 3
Write-Host ""
Write-Host ""

# Eksekusi perintah Set-DnsClientServerAddress
Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ResetServerAddresses


Write-Host "Perintah selesai..."
Start-Sleep -Seconds 3

function CheckDNSDefault {
    $dnsSettings = Get-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex
    $dnsServers = $dnsSettings.ServerAddresses

    if ($dnsServers.Count -eq 0) {
        Write-Host "DNS telah diubah ke default (mode otomatis)."
    } else {
        Write-Host "Gagal mengubah DNS ke default (mode otomatis)."
    }
}

# Panggil fungsi CheckDNSDefault
CheckDNSDefault


# Hitung mundur 5 detik setelah menjalankan perintah
Write-Host ""
Write-Host "Tunggu..."
Start-Sleep -Seconds 5


