$envFile = ".env"

$dirLine = Get-Content $envFile | Where-Object { $_ -match '^DIR=' }
$DIR = $dirLine -replace '^DIR=', ''

# Get all *_PATH variables
$paths = Get-Content $envFile | Where-Object { $_ -match '_PATH=' }

foreach ($line in $paths) {
    $parts = $line -split '=', 2
    $varName = $parts[0]
    $path = $parts[1]
    # Replace ${DIR} with actual DIR value
    $resolved = $path -replace '\$\{DIR\}', $DIR
    $resolved = $resolved -replace '\\', '\\\\' -replace '\\', '\\\\'
    # Remove any forward slashes (optional, for pure Windows style)
    $resolved = $resolved -replace '/', '\\'
    if (-not (Test-Path $resolved)) {
        New-Item -ItemType Directory -Path $resolved | Out-Null
        Write-Host "Created: $resolved"
    } else {
        Write-Host "Exists: $resolved"
    }
}
