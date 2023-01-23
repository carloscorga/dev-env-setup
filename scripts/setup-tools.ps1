Write-Host "Setup tools" -ForegroundColor "Yellow"

# Common tools

# choco install -y virtualbox
# winget install -e -h --id Oracle.VirtualBox
# if($LASTEXITCODE) {
#     "Oracle VirtualBox successfully installed - installing guest additions"
#     choco install -y virtualbox-guest-additions-guest.install
# }

# choco install -y 7zip
# winget install -e -h --id 7zip.7zip

winget install -e -h --id Microsoft.PowerToys --source winget
winget install -e -h --id Obsidian.Obsidian
winget install -e -h --id Logitech.OptionsPlus
winget install -e -h --id Logitech.GHUB
winget install -e -h --id Notepad++.Notepad++
winget install -e -h --id JGraph.Draw

winget install -e -h --id OBSProject.OBSStudio
winget install -e -h --id AntibodySoftware.WizTree
winget install -e -h --id NickeManarin.ScreenToGif

winget install -e -h --id VideoLAN.VLC

# Comms

winget install -e -h --id Zoom.Zoom
WingetInstall Microsoft.Teams

# Security

winget install -e -h --id DominikReichl.KeePass
winget install -e -h --id Twilio.Authy

# Browsers

WingetInstall Google.Chrome
WingetInstall Mozilla.Firefox

# Dev tools

winget install -e -h --id Postman.Postman
winget install -e -h --id WinMerge.WinMerge

# .net

winget install -e -h --id Microsoft.DotNet.SDK.5
winget install -e -h --id Microsoft.DotNet.SDK.6
winget install -e -h --id Microsoft.DotNet.SDK.7

RefreshEnvPath

# Database tools

winget install -e -h --id Microsoft.SQLServerManagementStudio
winget install -e -h --id dbeaver.dbeaver

# Azure tools

winget install -e -h --id Microsoft.AzureCLI
# winget install -e -h --id Microsoft.AzureCosmosEmulator
# winget install -e -h --id Microsoft.AzureDataStudio
# winget install -e -h --id Microsoft.AzureStorageExplorer
# winget install -e -h --id Microsoft.AzureStorageEmulator
# winget install -e -h --id Microsoft.AzureDataCLI
# winget install -e -h --id Microsoft.AzureFunctionsCoreTools
# winget install -e -h --id Microsoft.AzureMediaServicesExplorer
