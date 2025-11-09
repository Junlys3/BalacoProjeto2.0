# =========================
# Etapa 1: Build do front-end (Vue 3 + Tailwind)
# =========================
FROM node:20 AS frontend
WORKDIR /app

# Copia e instala dependências do frontend
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build


# =========================
# Etapa 2: Back-end (Laravel + MySQL)
# =========================
FROM php:8.3-fpm-alpine AS backend
WORKDIR /var/www/html

# Instala dependências do sistema
RUN apk add --no-cache \
    bash \
    git \
    curl \
    zip \
    unzip \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    libxml2-dev \
    icu-dev \
    nodejs \
    npm \
    mysql mysql-client

# Instala extensões PHP necessárias
RUN docker-php-ext-install pdo pdo_mysql mbstring gd intl

# Copia o Composer do container oficial
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copia o código do projeto Laravel
COPY . .

# Copia os arquivos buildados do front-end
COPY --from=frontend /app/public/build ./public/build

# 🔧 Evita rodar scripts Artisan no build (impede erro SQLite)
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Inicializa o banco MySQL (cria diretórios e permissões)
RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql

# Expõe a porta padrão do Laravel
EXPOSE 8000

# Variáveis de ambiente padrão
ENV DB_CONNECTION=mysql
ENV DB_HOST=127.0.0.1
ENV DB_PORT=3306
ENV DB_DATABASE=inertiabalaco
ENV DB_USERNAME=root
ENV DB_PASSWORD=1478963.KM

# Comando para iniciar MySQL e Laravel juntos
CMD mysqld_safe --datadir=/var/lib/mysql & \
    sleep 5 && \
    php artisan key:generate --force && \
    php artisan migrate --force && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache && \
    php artisan serve --host=0.0.0.0 --port=8000
