$ErrorActionPreference = "Continue"

Write-Host "Aplicando manifests no contexto Kubernetes: $context"
kubectl apply -f k8s/00-namespace.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
kubectl apply -f k8s/rabbitmq/
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
kubectl apply -f k8s/databases/
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
kubectl apply -f k8s/apps/
exit $LASTEXITCODE
