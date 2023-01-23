Write-Host "Setup tools - Prompt" -ForegroundColor "Yellow"

# PowerShell 7

winget install -e -h --id Microsoft.PowerShell

# Windows Terminal

winget install -e -h --id Microsoft.WindowsTerminal -s msstore
#choco install -y microsoft-windows-terminal

winget install -e -h --id JanDeDobbeleer.OhMyPosh

choco install -y nerd-fonts-jetbrainsmono
choco install -y nerd-fonts-cascadiacode

RefreshEnvPath

# Powershell Modules

Install-Module PSReadLine -AllowPrerelease -Force

Install-Module -Name Terminal-Icons -RequiredVersion 0.9.0 # https://www.powershellgallery.com/packages/Terminal-Icons/0.9.0
# choco install -y terminal-icons.powershell

RefreshEnvPath
