# =========================
# Etapa 1: Build do frontend (Vue 3 + Tailwind)
# =========================
FROM node:20 AS frontend
WORKDIR /app

# Instala dependências do frontend
COPY package*.json ./
RUN npm install

# Copia código e gera build
COPY . .
RUN npm run build

# =========================
# Etapa 2: Backend Laravel + PHP
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
    build-base \
    && docker-php-ext-install pdo pdo_pgsql mbstring gd intl

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copia código Laravel e build do frontend
COPY . .
COPY --from=frontend /app/public/build ./public/build

# Cria pastas de cache e storage do Laravel
RUN mkdir -p storage/framework/cache/data storage/logs bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

# Instala dependências Laravel sem rodar scripts (evita erro SQLite)
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Copia script de espera do banco
COPY wait-for-db.sh /usr/local/bin/wait-for-db.sh
RUN chmod +x /usr/local/bin/wait-for-db.sh

# Expõe porta para Render detectar HTTP
EXPOSE 8000

# CMD final: espera banco, package discover, migrations, cache e serve
CMD /usr/local/bin/wait-for-db.sh && \
    php artisan package:discover --ansi && \
    php artisan migrate --force && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache && \
    php artisan serve --host=0.0.0.0 --port=8000
