# ==========================================
# ULTIMATE Tweaks Pack - Windows 10/11
# ==========================================


Write-Host "Wyłączanie Telemetrii i Data Collection..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord
Stop-Service -Name "DiagTrack" -ErrorAction SilentlyContinue
Set-Service -Name "DiagTrack" -StartupType Disabled


Write-Host "Wyłączanie Cortany..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -Type DWord

Write-Host "Wyłączanie zbędnych usług..."
$servicesToDisable = @(
    "XblGameSave", "WMPNetworkSvc", "RetailDemo", "MapsBroker",
    "Fax", "PrintNotify", "PhoneSvc", "SysMain", "DiagTrack",
    "dmwappushservice"
)
foreach ($svc in $servicesToDisable) {
    if (Get-Service -Name $svc -ErrorAction SilentlyContinue) {
        Set-Service -Name $svc -StartupType Disabled
        Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
    }
}


Write-Host "Wyłączanie reklam i sugestii..."
$adPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
)
foreach ($path in $adPaths) {
    Set-ItemProperty -Path $path -Name "SystemPaneSuggestionsEnabled" -Value 0 -Type DWord
    Set-ItemProperty -Path $path -Name "SubscribedContent-310093Enabled" -Value 0 -Type DWord
    Set-ItemProperty -Path $path -Name "SubscribedContent-338388Enabled" -Value 0 -Type DWord
}


Write-Host "Wyłączanie animacji i opóźnień..."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "WaitToKillAppTimeout" -Value "2000"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "HungAppTimeout" -Value "1000"


Write-Host "Wyłączanie automatycznych aktualizacji..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 1 -Type DWord
Stop-Service -Name "wuauserv" -Force -ErrorAction SilentlyContinue
Set-Service -Name "wuauserv" -StartupType Disabled
Write-Host "Wyłączanie pamięci w tle (Superfetch/SysMain)..."
Set-Service -Name "SysMain" -StartupType Disabled
Stop-Service -Name "SysMain" -Force -ErrorAction SilentlyContinue

Write-Host "Odinstalowywanie zbędnych aplikacji UWP..."
$appsToRemove = @(
    "Microsoft.XboxGamingOverlay", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo",
    "Microsoft.WindowsMaps", "Microsoft.Microsoft3DViewer", "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.People", "Microsoft.OneNote", "Microsoft.YourPhone"
)
foreach ($app in $appsToRemove) {
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq $app | Remove-AppxProvisionedPackage -Online
}


Write-Host "Wyłączanie OneDrive..."
Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Software\Microsoft\OneDrive" -Name "DisableFileSyncNGSC" -Value 1 -Type DWord
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSync" -Value 1 -Type DWord


Write-Host "Czyszczenie plików temp i prefetch..."
Remove-Item -Path "$env:Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Please restart your computer.."
