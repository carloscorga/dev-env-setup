Write-Host "Setup tools - IDEs" -ForegroundColor "Yellow"

# Visual Studio Code

winget install -e -h --id Microsoft.VisualStudioCode

RefreshEnvPath

$visualStudioCodeExtensions = @(
    "eamodio.gitlens"
    "wix.vscode-import-cost"
    "esbenp.prettier-vscode"
    "yzhang.markdown-all-in-one"
    "aaron-bond.better-comments"
    "formulahendry.auto-rename-tag"
    "quicktype.quicktype"
    "humao.rest-client"
    "formulahendry.dotnet"
    "PKief.material-icon-theme"
    "xabikos.JavaScriptSnippets"
    "dsznajder.es7-react-js-snippets"
    "ms-dotnettools.csharp"
    "ms-azuretools.vscode-azurefunctions"
    "ms-vscode.azurecli"
    "ms-vscode.PowerShell"
    "MS-vsliveshare.vsliveshare"
    "MS-vsliveshare.vsliveshare-audio"
    "MS-vsliveshare.vsliveshare-pack"
)

foreach ($extension in $visualStudioCodeExtensions) {
    code --install-extension $extension
}


# Android Studio

if ($installAndroidStudio) {
    winget install -e -h --id Google.AndroidStudio
}

# Visual Studio

if ($installVisualStudio) {

    switch ($selectedVisualStudioVersion)
    {
        0 { winget install -e -h --id Microsoft.VisualStudio.2022.Community; Break; }
        1 { winget install -e -h --id Microsoft.VisualStudio.2022.Enterprise; Break; }
        2 { winget install -e -h --id Microsoft.VisualStudio.2022.Professional --silent --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.ManagedDesktop --includeRecommended"; Break; }
    }
}

# LINQPad

winget install -e --id LINQPad.LINQPad.5 # .NET Framework 4.6 → 4.8
winget install -e --id LINQPad.LINQPad.7 # .NET Core 3.1 → .NET 7.0
