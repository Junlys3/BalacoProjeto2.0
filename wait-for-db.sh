#!/bin/bash
# Espera o banco de dados PostgreSQL estar disponível
set -e

echo "🕒 Aguardando o banco de dados..."

while ! pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USERNAME" > /dev/null 2>&1; do
  sleep 2
  echo "⌛ Banco ainda não está pronto..."
done

echo "✅ Banco pronto!"
