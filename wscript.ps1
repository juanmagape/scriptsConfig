Write-Host "➡ Actualizando aplicaciones con winget..." -ForegroundColor Cyan
winget upgrade --all --accept-source-agreements --accept-package-agreements

Write-Host "➡ Instalando aplicaciones básicas..." -ForegroundColor Cyan

$apps = @(
    "Bitwarden.Bitwarden",
    "Discord.Discord",
    "Zen-Team.ZenBrowser",
    "JetBrains.IntelliJIDEA.Community",
    "Spotify.Spotify",
    "Microsoft.VisualStudioCode",
    "Brave.Brave",
    "VideoLAN.VLC",
    "Oracle.VirtualBox"
)

foreach ($app in $apps) {
    Write-Host "Instalando $app ..."
    winget install --id $app --exact `
        --accept-source-agreements `
        --accept-package-agreements
}

Write-Host "Instalación completada." -ForegroundColor Green

$resp = Read-Host "¿Reiniciar ahora? (s/n)"
if ($resp -eq "s") {
    Restart-Computer
}
