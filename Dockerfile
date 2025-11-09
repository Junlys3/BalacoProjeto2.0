# =========================
# Etapa 1: Build do front-end (Vue 3 + Tailwind)
# =========================
FROM node:20 AS frontend
WORKDIR /app

# Copia arquivos do frontend
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# =========================
# Etapa 2: Back-end (Laravel)
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
    jq \
    postgresql-client

# Instala extensões PHP necessárias
RUN docker-php-ext-install pdo pdo_pgsql mbstring gd intl

# Instala Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copia código Laravel e build do frontend
COPY . .
COPY --from=frontend /app/public/build ./public/build

# Configura o .env para Supabase
RUN cp .env.example .env || true && \
    sed -i 's/DB_CONNECTION=.*/DB_CONNECTION=pgsql/' .env && \
    sed -i 's/DB_HOST=.*/DB_HOST=db.dyeafczfxsvkeostodtv.supabase.co/' .env && \
    sed -i 's/DB_PORT=.*/DB_PORT=5432/' .env && \
    sed -i 's/DB_DATABASE=.*/DB_DATABASE=postgres/' .env && \
    sed -i 's/DB_USERNAME=.*/DB_USERNAME=postgres/' .env && \
    sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=1478963.KM/' .env

# Desativa temporariamente post-autoload-dump para evitar erros
RUN cp composer.json composer.json.bak && \
    cat composer.json | jq 'del(.scripts["post-autoload-dump"])' > composer.json.tmp && \
    mv composer.json.tmp composer.json

# Instala dependências Laravel
RUN composer install --no-dev --optimize-autoloader

# Restaura composer.json original
RUN mv composer.json.bak composer.json

# Expõe porta do Laravel
EXPOSE 8000

# Comando final: apenas roda Laravel
CMD php artisan key:generate --force && \
    php artisan migrate --force && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache && \
    php artisan serve --host=0.0.0.0 --port=8000
