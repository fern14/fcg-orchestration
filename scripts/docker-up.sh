#!/usr/bin/env sh
set -eu

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker CLI nao encontrado. Instale o Docker Desktop ou Docker Engine antes de continuar." >&2
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  cat >&2 <<'EOF'
Docker Engine nao esta acessivel.

No Windows, abra o Docker Desktop, aguarde o status "Engine running" e confirme que ele esta usando Linux containers/WSL 2.
Depois valide com:

  docker info

Se o erro mencionar dockerDesktopLinuxEngine ou //./pipe/dockerDesktopLinuxEngine, o Docker Desktop nao esta iniciado ou o contexto Linux nao esta disponivel.
EOF
  exit 1
fi

docker compose up -d
