# Eventos

Eventos representam fatos que ja aconteceram no dominio. Eles sao publicados no RabbitMQ para que outros servicos reajam sem criar dependencia direta entre APIs.

## Eventos iniciais sugeridos

| Evento | Publicador | Consumidores previstos | Objetivo |
|---|---|---|---|
| `UserCreatedEvent` | Users API | Notifications API | Notificar usuario criado |
| `CatalogItemCreatedEvent` | Catalog API | Notifications API | Permitir notificacoes ou auditoria |
| `PaymentRequestedEvent` | Payments API | Notifications API | Avisar que pagamento foi solicitado |
| `PaymentApprovedEvent` | Payments API | Notifications API | Avisar aprovacao de pagamento |
| `PaymentRejectedEvent` | Payments API | Notifications API | Avisar rejeicao de pagamento |

## Padrao de mensagem

```json
{
  "eventId": "f3d5b5f2-8af4-42d8-9f2b-bdcce65b78f8",
  "eventType": "PaymentApprovedEvent",
  "occurredAt": "2026-06-13T12:00:00Z",
  "correlationId": "order-123",
  "payload": {}
}
```

## Observacoes

- `eventId` ajuda idempotencia.
- `correlationId` ajuda rastrear uma operacao entre servicos.
- `occurredAt` registra quando o fato aconteceu.
- `payload` deve carregar apenas os dados necessarios para o consumidor.
