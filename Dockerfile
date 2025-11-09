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
# Etapa 2: Back-end (Laravel + MariaDB)
# =========================
FROM php:8.3-fpm-alpine AS backend
WORKDIR /var/www/html

# Instala dependências
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
    mariadb mariadb-client \
    jq

# Extensões PHP
RUN docker-php-ext-install pdo pdo_mysql mbstring gd intl

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copia código Laravel e build frontend
COPY . .
COPY --from=frontend /app/public/build ./public/build

# Configura o .env
RUN cp .env.example .env || true && \
    sed -i 's/DB_CONNECTION=.*/DB_CONNECTION=mysql/' .env && \
    sed -i 's/DB_HOST=.*/DB_HOST=127.0.0.1/' .env && \
    sed -i 's/DB_PORT=.*/DB_PORT=3306/' .env && \
    sed -i 's/DB_DATABASE=.*/DB_DATABASE=inertiabalaco/' .env && \
    sed -i 's/DB_USERNAME=.*/DB_USERNAME=root/' .env && \
    sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=1478963.KM/' .env

# Desativa temporariamente script do Composer
RUN cp composer.json composer.json.bak && \
    cat composer.json | jq 'del(.scripts["post-autoload-dump"])' > composer.json.tmp && \
    mv composer.json.tmp composer.json

# Instala dependências
RUN composer install --no-dev --optimize-autoloader

# Restaura o composer.json original
RUN mv composer.json.bak composer.json

# Inicializa o banco MariaDB
RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

EXPOSE 8000

# Variáveis de ambiente padrão
ENV DB_CONNECTION=mysql
ENV DB_HOST=127.0.0.1
ENV DB_PORT=3306
ENV DB_DATABASE=inertiabalaco
ENV DB_USERNAME=root
ENV DB_PASSWORD=1478963.KM

# ✅ Espera o banco realmente estar online antes de rodar Laravel
CMD mysqld_safe --datadir=/var/lib/mysql & \
    echo "🕒 Aguardando o MariaDB iniciar..." && \
    until mariadb -h127.0.0.1 -uroot -p1478963.KM -e "SELECT 1;" > /dev/null 2>&1; do \
        sleep 2; \
        echo "⌛ Esperando o banco..."; \
    done && \
    echo "✅ Banco pronto!" && \
    php artisan key:generate --force && \
    php artisan migrate --force && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache && \
    php artisan serve --host=0.0.0.0 --port=8000
