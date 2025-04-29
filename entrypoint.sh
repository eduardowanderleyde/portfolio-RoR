#!/bin/bash
set -e

# Remover um possível server.pid anterior
rm -f /app/tmp/pids/server.pid

# Esperar pelo PostgreSQL
until nc -z -v -w30 db 5432
do
  echo "Esperando o PostgreSQL iniciar..."
  sleep 1
done
echo "PostgreSQL iniciado!"

# Esperar pelo Redis
until nc -z -v -w30 redis 6379
do
  echo "Esperando o Redis iniciar..."
  sleep 1
done
echo "Redis iniciado!"

# Se o banco de dados não existir, criar e migrar
bundle exec rails db:prepare

# Então executar o comando passado para o container
exec "$@" 