#!/bin/sh
# Espera o banco de dados ficar disponível

echo "🕒 Aguardando o banco de dados..."

until php -r "try { new PDO(getenv('DATABASE_URL')); echo '✅ Banco pronto!\n'; } catch (\PDOException \$e) { exit(1); }"
do
  sleep 2
  echo "⌛ Banco ainda não está pronto..."
done
