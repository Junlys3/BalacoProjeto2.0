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

# Instala dependências do sistema e PostgreSQL
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

# Desativa temporariamente post-autoload-dump para evitar erros de build
RUN cp composer.json composer.json.bak && \
    cat composer.json | jq 'del(.scripts["post-autoload-dump"])' > composer.json.tmp
