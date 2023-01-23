Write-Host "Setup tools - Nodejs" -ForegroundColor "Yellow"

# Volta package manager

winget install -e -h --id Volta.Volta

RefreshEnvPath

# nodejs

volta install node@18.13.0
# volta install node@17.9.1
# volta install node@16.19.0
# volta install node@15.14.0
# volta install node@14.21.2
# volta install node@13.14.0
# volta install node@12.22.12

volta pin node@18.13.0

# yarn

# https://yarnpkg.com/getting-started/install

