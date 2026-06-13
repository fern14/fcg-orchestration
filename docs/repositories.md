# Repositorios

O projeto pode ser dividido em cinco repositorios:

| Repositorio | Responsabilidade |
|---|---|
| `fcg-orchestration` | Docker Compose, Kubernetes, docs e scripts de ambiente |
| `fcg-users-api` | Usuarios, autenticacao e emissao/validacao de JWT |
| `fcg-catalog-api` | Catalogo de produtos ou itens |
| `fcg-payments-api` | Processamento e registro de pagamentos |
| `fcg-notifications-api` | Envio e registro de notificacoes |

## Ordem recomendada

1. Criar `fcg-orchestration`.
2. Subir RabbitMQ e bancos pelo Docker Compose.
3. Criar `fcg-users-api`.
4. Criar `fcg-catalog-api`.
5. Criar `fcg-payments-api`.
6. Criar `fcg-notifications-api`.
7. Voltar ao `fcg-orchestration` para integrar imagens Docker e manifests Kubernetes.
