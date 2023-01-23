function RefreshEnvPath {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

function checkWinget {
    if ($null -eq (Get-Command -Name winget.exe -ErrorAction SilentlyContinue)) {
        Write-Host "Winget not found. Please install."
        Exit
    }
}

function setupChocolatey {
    if ($null -eq (Get-Command -Name choco.exe -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Chocolatey"
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    } else {
        Write-Host "Updating Chocolatey"
        & choco upgrade Chocolatey
    }
}

checkWinget
setupChocolatey

$installVisualStudio = (Read-Host "Install Visual Studio 2022: (y/N)").ToLower() -eq 'y'
if ($installVisualStudio) {
    $community = New-Object System.Management.Automation.Host.ChoiceDescription '&Community', 'Visual Studio Community edition'
    $enterprise = New-Object System.Management.Automation.Host.ChoiceDescription '&Enterprise', 'Visual Studio Enterprise edition'
    $professional = New-Object System.Management.Automation.Host.ChoiceDescription '&Professional', 'Visual Studio Professional edition'
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($community, $enterprise, $professional)
    $selectedVisualStudioVersion = $host.ui.PromptForChoice('Visual Studio edition', 'Select edition to install. (Enter to skip installation)', $options, 0)
    $selected = $options[$selectedVisualStudioVersion].HelpMessage
    Write-Host "$selected will be installed" -ForegroundColor "Blue"
}

$installAndroidStudio = (Read-Host "Install Android Studio: (y/N)").ToLower() -eq 'y'
if ($installAndroidStudio) {
    Write-Host "Android Studio will be installed" -ForegroundColor "Blue"
}

choco install -y git
#winget install -e -h --id Git.Git

RefreshEnvPath

mkdir c:\GitHub\carloscorga
git clone https://github.com/carloscorga/dev-env-setup.git "c:\GitHub\carloscorga\dev-env-setup"

. "c:\GitHub\carloscorga\dev-env-setup\scripts\configure-windows-explorer.ps1"
. "c:\GitHub\carloscorga\dev-env-setup\scripts\remove-default-apps.ps1"
. "c:\GitHub\carloscorga\dev-env-setup\scripts\setup-tools.ps1"
. "c:\GitHub\carloscorga\dev-env-setup\scripts\setup-tools-prompt.ps1"
. "c:\GitHub\carloscorga\dev-env-setup\scripts\setup-tools-node.ps1"
. "c:\GitHub\carloscorga\dev-env-setup\scripts\setup-tools-ide.ps1"
