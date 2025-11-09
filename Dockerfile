# =========================
# Etapa 1: Build do front-end (Vue 3 + Tailwind)
# =========================
FROM node:20 AS frontend
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# =========================
# Etapa 2: Back-end (Laravel)
# =========================
FROM php:8.3-fpm-alpine AS backend
WORKDIR /var/www/html

# Instala dependências do sistema e do PostgreSQL
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
    jq \
    postgresql-dev \
    postgresql-client \
    gawk \
    build-base

# Instala extensões PHP
RUN docker-php-ext-install pdo pdo_pgsql mbstring gd intl

# Instala Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copia código Laravel e build do frontend
COPY . .
COPY --from=frontend /app/public/build ./public/build

# Configura .env (Render passará as variáveis)
RUN cp .env.example .env || true

# Desativa temporariamente post-autoload-dump
RUN cp composer.json composer.json.bak && \
    cat composer.json | jq 'del(.scripts["post-autoload-dump"])' > composer.json.tmp && \
    mv composer.json.tmp composer.json

# Instala dependências Laravel
RUN composer install --no-dev --optimize-autoloader

# Restaura composer.json original
RUN mv composer.json.bak composer.json

# Expõe porta do Laravel
EXPOSE 8000

# Script para aguardar o banco
COPY wait-for-db.sh /usr/local/bin/wait-for-db.sh
RUN chmod +x /usr/local/bin/wait-for-db.sh

# Comando final
CMD /usr/local/bin/wait-for-db.sh && \
    php artisan key:generate --force && \
    php artisan migrate --force && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache && \
    php artisan serve --host=0.0.0.0 --port=8000
