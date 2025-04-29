#!/bin/bash
set -e

# Remover um possível server.pid anterior
rm -f /app/tmp/pids/server.pid

# Se o banco de dados não existir, criar e migrar
bundle exec rails db:prepare

# Então executar o comando passado para o container
exec "$@" 