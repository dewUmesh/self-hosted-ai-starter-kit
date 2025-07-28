
$ErrorActionPreference = 'Stop'

# Run docker-compose with cpu profile, detached and build
Write-Host "Running: docker-compose --profile cpu up -d --build"
docker-compose --profile cpu up -d --build
