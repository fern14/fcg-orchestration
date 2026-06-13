$ErrorActionPreference = "Continue"

if (-not (Get-Command kubectl -ErrorAction SilentlyContinue)) {
    Write-Host "kubectl nao encontrado. Instale o kubectl antes de remover os manifests." -ForegroundColor Red
    exit 1
}

$context = & kubectl config current-context 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($context)) {
    Write-Host "Nenhum contexto Kubernetes esta configurado." -ForegroundColor Red
    Write-Host ""
    Write-Host "Configure e inicie um cluster local antes de remover os manifests."
    Write-Host "Se o kubectl tentar acessar http://localhost:8080, ele esta sem kubeconfig/contexto ativo."
    exit 1
}

kubectl cluster-info *> $null
if ($LASTEXITCODE -ne 0) {
    Write-Host "O contexto Kubernetes '$context' existe, mas o cluster nao esta acessivel." -ForegroundColor Red
    Write-Host ""
    Write-Host "Inicie o cluster local e valide com:"
    Write-Host ""
    Write-Host "  kubectl cluster-info"
    exit 1
}

Write-Host "Removendo manifests do contexto Kubernetes: $context"
kubectl delete -f k8s/apps/ --ignore-not-found=true
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
kubectl delete -f k8s/databases/ --ignore-not-found=true
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
kubectl delete -f k8s/rabbitmq/ --ignore-not-found=true
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
kubectl delete -f k8s/00-namespace.yaml --ignore-not-found=true
exit $LASTEXITCODE
