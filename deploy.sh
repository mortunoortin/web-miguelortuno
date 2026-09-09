#!/usr/bin/env bash
# Despliega la web al servidor. Ejecutar desde WSL:  ./deploy.sh
set -euo pipefail

ORIGEN="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"
DESTINO="vps:/var/www/miguelortuno/"

echo "Subiendo $ORIGEN -> $DESTINO"

rsync -rltvz --delete \
  --exclude '.git' \
  --exclude '.gitattributes' \
  --exclude 'deploy.sh' \
  --chmod=D755,F644 \
  "$ORIGEN" "$DESTINO"

echo
echo "Listo: https://miguelortuno.es"
