
$ErrorActionPreference = "Stop"

Write-Host "Starting local deployment..."

$deployDir = Join-Path $env:WORKSPACE "deployed_app"

New-Item -ItemType Directory -Force -Path $deployDir | Out-Null

Copy-Item "app.py" -Destination $deployDir -Force

Write-Host "Application deployed successfully!"

python "$deployDir\app.py"

if ($LASTEXITCODE -ne 0) {
    throw "Deployment verification failed."
}
