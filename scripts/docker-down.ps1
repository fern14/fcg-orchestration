$ErrorActionPreference = "Stop"

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker CLI nao encontrado. Instale o Docker Desktop antes de continuar." -ForegroundColor Red
    exit 1
}

docker info *> $null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker Engine nao esta acessivel." -ForegroundColor Red
    Write-Host ""
    Write-Host "No Windows, abra o Docker Desktop, aguarde o status 'Engine running' e confirme que ele esta usando Linux containers/WSL 2."
    Write-Host "Depois valide com:"
    Write-Host ""
    Write-Host "  docker info"
    exit 1
}

docker compose down
exit $LASTEXITCODE
