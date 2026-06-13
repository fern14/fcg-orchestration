# FCG Orchestration

Repositorio de orquestracao do projeto FCG para subir o ambiente completo da aplicacao.

Este repositorio centraliza:

- Docker Compose para desenvolvimento local.
- Manifestos Kubernetes para RabbitMQ, bancos e APIs.
- Documentacao inicial de arquitetura, eventos e repositorios.
- Scripts auxiliares para subir e remover o ambiente.

## Servicos previstos

- `users-api`
- `catalog-api`
- `payments-api`
- `notifications-api`
- `rabbitmq`
- `users-db`
- `catalog-db`
- `payments-db`
- `notifications-db`

## Subindo infraestrutura local

Copie o arquivo de exemplo:

```bash
cp .env.example .env
```

Suba RabbitMQ e os bancos:

```bash
docker compose up -d
```

RabbitMQ Management:

```text
http://localhost:15672
```

Credenciais locais:

```text
usuario: fcg
senha: fcg123
```

## Portas locais

| Servico | Porta local | Porta interna |
|---|---:|---:|
| RabbitMQ AMQP | 5672 | 5672 |
| RabbitMQ Management | 15672 | 15672 |
| Users DB | 14331 | 1433 |
| Catalog DB | 14332 | 1433 |
| Payments DB | 14333 | 1433 |
| Notifications DB | 14334 | 1433 |

## Kubernetes

Aplicar tudo:

```bash
./scripts/k8s-apply.sh
```

Remover tudo:

```bash
./scripts/k8s-delete.sh
```

Verificar recursos:

```bash
kubectl get all -n fcg
```

## Observacoes

Os valores de senha neste repositorio sao apenas para desenvolvimento local e estudo. Em um ambiente real, os Secrets devem ser gerenciados por uma ferramenta propria, como Kubernetes Secrets provisionados por pipeline, Vault, External Secrets ou equivalente.

Os containers SQL Server sobem a instancia, mas os bancos (`usersdb`, `catalogdb`, `paymentsdb` e `notificationsdb`) devem ser criados pelas migrations das APIs ou por scripts de inicializacao quando esses servicos forem implementados.
