Write-Host "Configure Windows Explorer" -ForegroundColor "Yellow"

# https://ss64.com/nt/syntax-reghacks.html

$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'

# Show hidden files and folders
Set-ItemProperty -Path $key -Name Hidden -Value 1

# Don't Hide file extensions
Set-ItemProperty -Path $key -Name HideFileExt -Value 0

# Expand to current folder
Set-ItemProperty -Path $key -Name NavPaneExpandToCurrentFolder -Value 1

# Show all folders in Explorer including Recycle Bin, Desktop, Control Panel
Set-ItemProperty -Path $key -Name NavPaneShowAllFolders -Value 1

# Open to This PC and not quick access
Set-ItemProperty -Path $key -Name LaunchTo -Value 1

# Restart Explorer
Stop-Process -processName: Explorer -force
