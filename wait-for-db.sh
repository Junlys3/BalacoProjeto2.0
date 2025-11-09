#!/bin/bash
set -e

echo "🕒 Aguardando o banco de dados..."

# Loop até conseguir conectar ao banco
until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USERNAME" -d "$DB_DATABASE" -q; do
  sleep 2
  echo "⌛ Banco ainda não está pronto..."
done

echo "✅ Banco pronto!"
