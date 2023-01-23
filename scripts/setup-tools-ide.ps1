Write-Host "Setup tools - IDEs" -ForegroundColor "Yellow"

# VS Code

winget install -e -h --id Microsoft.VisualStudioCode

RefreshEnvPath

# VS Code Extensions

code --install-extension eamodio.gitlens # GitLens — Git supercharged
code --install-extension wix.vscode-import-cost
code --install-extension esbenp.prettier-vscode
code --install-extension yzhang.markdown-all-in-one
code --install-extension aaron-bond.better-comments
code --install-extension formulahendry.auto-rename-tag
code --install-extension quicktype.quicktype # Paste JSON as Code

code --install-extension humao.rest-client
code --install-extension formulahendry.dotnet

#code --install-extension vscode-icons-team.vscode-icons
code --install-extension PKief.material-icon-theme

code --install-extension ms-dotnettools.csharp
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.PowerShell

# Live Share
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension MS-vsliveshare.vsliveshare-audio
code --install-extension MS-vsliveshare.vsliveshare-pack

code --install-extension xabikos.JavaScriptSnippets
code --install-extension dsznajder.es7-react-js-snippets

# Android Studio

if ($installAndroidStudio) {
    winget install -e -h --id Google.AndroidStudio
}

# Visual Studio

if ($installVisualStudio) {

    # TODO: How to define options?

    switch ($selectedVisualStudioVersion)
    {
        0 { winget install -e -h --id Microsoft.VisualStudio.2022.Community; Break; }
        1 { winget install -e -h --id Microsoft.VisualStudio.2022.Enterprise; Break; }
        2 { winget install -e -h --id Microsoft.VisualStudio.2022.Professional --silent --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.ManagedDesktop --includeRecommended"; Break; }
    }
}

# 
# winget install -e -h --id Microsoft.VisualStudio.2022.Enterprise --silent --override "--wait --quiet --addProductLang En-us --config .vsconfig"
#

# LINQPad

winget install -e --id LINQPad.LINQPad.5 # .NET Framework 4.6 → 4.8
winget install -e --id LINQPad.LINQPad.7 # .NET Core 3.1 → .NET 7.0
