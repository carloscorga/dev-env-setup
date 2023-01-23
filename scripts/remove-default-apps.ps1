Write-Host "Remove default apps" -ForegroundColor "Yellow"

#Referenced to build script
# https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
# https://github.com/jayharris/dotfiles-windows/blob/master/windows.ps1#L157
# https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
# https://gist.github.com/alirobe/7f3b34ad89a159e6daa1
# https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1

function removeApp {
	Param ([string]$appName)
	Write-Output "Attempting to remove $appName"
	Get-AppxPackage $appName -AllUsers | Remove-AppxPackage
	Get-AppXProvisionedPackage -Online | Where DisplayName -like $appName | Remove-AppxProvisionedPackage -Online
}

#TODO: Remove Xbox Game Bar, Xbox Game Speech Windows, Xbox Live

$applicationList = @(
    "Microsoft.BingFinance"
    "Microsoft.3DBuilder"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingWeather"
    "Microsoft.CommsPhone"
    "Microsoft.Getstarted"
    "Microsoft.WindowsMaps"
    "*MarchofEmpires*"
    "Microsoft.GetHelp"
    "Microsoft.Messaging"
    "*Minecraft*"
    "Microsoft.OneConnect"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    "*Solitaire*"
    "Microsoft.Office.Sway"
    "Microsoft.XboxApp"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.FreshPaint"
    "Microsoft.Print3D"
    "*Autodesk*"
    "*BubbleWitch*"
    "king.com*"
    "G5*"
    "*Facebook*"
    "*Keeper*"
    "*Netflix*"
    "*Twitter*"
    "*Plex*"
    "*.Duolingo-LearnLanguagesforFree"
    "*.EclipseManager"
    "ActiproSoftwareLLC.562882FEEB491" # Code Writer
    "*.AdobePhotoshopExpress"
);

foreach ($app in $applicationList) {
    removeApp $app
}

# Disable suggested apps in the start menu

# TODO: Changed to SubscribedContent-338388Enabled

Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SystemPaneSuggestionsEnabled -Type DWord -Value 0
