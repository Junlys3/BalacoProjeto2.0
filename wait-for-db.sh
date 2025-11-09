#!/bin/bash
set -e

echo "🕒 Aguardando o banco de dados..."

# Loop até conseguir conectar ao Supabase/PostgreSQL com SSL
until PGPASSWORD=$DB_PASSWORD psql "host=$DB_HOST port=$DB_PORT dbname=$DB_DATABASE user=$DB_USERNAME sslmode=require" -c '\q' 2>/dev/null; do
  sleep 2
  echo "⌛ Banco ainda não está pronto..."
done

echo "✅ Banco pronto!"
