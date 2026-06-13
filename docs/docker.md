# Docker local

Este projeto usa Docker Compose para subir RabbitMQ e quatro instancias Linux do SQL Server 2022.

## Pre-requisitos

- Docker Desktop instalado e iniciado no Windows.
- Docker Desktop usando Linux containers com WSL 2.
- Docker Compose v2 disponivel pelo comando `docker compose`.
- Memoria suficiente para RabbitMQ e os bancos SQL Server. Se o Docker Desktop estiver com pouca memoria, aumente o limite em Settings > Resources.

Valide antes de subir os containers:

```bash
docker info
docker compose version
```

No Windows, o comando `docker info` deve responder sem erro. Se ele falhar, o `docker compose up` tambem vai falhar antes mesmo de baixar as imagens.

## Subindo o ambiente

Copie as variaveis locais:

```bash
cp .env.example .env
```

No Windows PowerShell:

```powershell
.\scripts\docker-up.ps1
```

Em Linux, macOS ou Git Bash:

```bash
./scripts/docker-up.sh
```

Tambem e possivel chamar diretamente:

```bash
docker compose up -d
```

## Parando o ambiente

No Windows PowerShell:

```powershell
.\scripts\docker-down.ps1
```

Em Linux, macOS ou Git Bash:

```bash
./scripts/docker-down.sh
```

## Erro dockerDesktopLinuxEngine

Erro comum:

```text
open //./pipe/dockerDesktopLinuxEngine: O sistema nao pode encontrar o arquivo especificado.
```

Isso indica que o Docker CLI esta tentando acessar o engine Linux do Docker Desktop, mas o pipe do engine nao existe naquele momento. Normalmente acontece quando o Docker Desktop esta fechado, ainda iniciando, travado ou sem o backend Linux/WSL 2 disponivel.

Passos para corrigir no Windows:

1. Abra o Docker Desktop.
2. Aguarde ate o Docker Desktop mostrar que o engine esta rodando.
3. Confirme em Settings > General que a opcao de WSL 2/Linux containers esta habilitada.
4. Rode `docker info` no terminal.
5. Se `docker info` funcionar, rode `docker compose up -d` novamente.

Se o Docker Desktop estiver aberto e o erro continuar, reinicie o Docker Desktop. Em ultimo caso, reinicie o WSL com `wsl --shutdown`, abra o Docker Desktop de novo e repita `docker info`.
