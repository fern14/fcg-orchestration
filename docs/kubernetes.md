# Kubernetes local

Este projeto inclui manifests Kubernetes para RabbitMQ, bancos SQL Server e APIs do FCG.

## Pre-requisitos

- `kubectl` instalado.
- Um cluster Kubernetes local criado e iniciado.
- Um contexto ativo no kubeconfig apontando para esse cluster.

No Windows, as opcoes mais comuns sao:

- Docker Desktop com Kubernetes habilitado em Settings > Kubernetes.
- minikube, iniciado com `minikube start`.
- kind, com um cluster criado por `kind create cluster`.

Valide antes de aplicar os manifests:

```bash
kubectl config current-context
kubectl cluster-info
kubectl get nodes
```

Se `kubectl config current-context` retornar erro ou vazio, o `kubectl` nao sabe qual cluster usar.

## Aplicando os manifests

No Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\k8s-apply.ps1
```

Em Linux, macOS ou Git Bash:

```bash
./scripts/k8s-apply.sh
```

Tambem e possivel aplicar manualmente:

```bash
kubectl apply -f k8s/00-namespace.yaml
kubectl apply -f k8s/rabbitmq/
kubectl apply -f k8s/databases/
kubectl apply -f k8s/apps/
```

## Removendo os manifests

No Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\k8s-delete.ps1
```

Em Linux, macOS ou Git Bash:

```bash
./scripts/k8s-delete.sh
```

## Erro localhost:8080

Erro comum:

```text
failed to download openapi: Get "http://localhost:8080/openapi/v2?timeout=32s": dial tcp [::1]:8080: connectex: Nenhuma conexao pode ser feita porque a maquina de destino as recusou ativamente.
```

Isso indica que o `kubectl` nao encontrou um kubeconfig/contexto ativo e tentou acessar o endpoint padrao `http://localhost:8080`. Esse endpoint nao e um cluster local criado por este projeto.

Passos para corrigir no Windows com Docker Desktop:

1. Abra o Docker Desktop.
2. Va em Settings > Kubernetes.
3. Habilite Enable Kubernetes.
4. Clique em Apply & Restart e aguarde o cluster iniciar.
5. Rode `kubectl config current-context`.
6. Rode `kubectl cluster-info`.
7. Aplique novamente com `powershell -ExecutionPolicy Bypass -File .\scripts\k8s-apply.ps1`.

Com minikube:

```bash
minikube start
kubectl config use-context minikube
kubectl cluster-info
```

Usar `--validate=false` apenas desliga a validacao do schema OpenAPI. Isso nao cria cluster, nao configura contexto e nao resolve falha de conexao com o Kubernetes.
