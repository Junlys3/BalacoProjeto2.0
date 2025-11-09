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
# Etapa 2: Back-end (Laravel + MariaDB)
# =========================
FROM php:8.3-fpm-alpine AS backend
WORKDIR /var/www/html

# Instala dependências do sistema e PHP
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
    mariadb mariadb-client

# Instala extensões PHP necessárias
RUN docker-php-ext-install pdo pdo_mysql mbstring gd intl

# Copia o Composer do container oficial
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copia o código do Laravel
COPY . .

# Copia os arquivos buildados do front-end
COPY --from=frontend /app/public/build ./public/build

# 🔧 Cria um .env com MySQL antes do Composer
RUN cp .env.example .env || true && \
    sed -i 's/DB_CONNECTION=.*/DB_CONNECTION=mysql/' .env && \
    sed -i 's/DB_HOST=.*/DB_HOST=127.0.0.1/' .env && \
    sed -i 's/DB_PORT=.*/DB_PORT=3306/' .env && \
    sed -i 's/DB_DATABASE=.*/DB_DATABASE=inertiabalaco/' .env && \
    sed -i 's/DB_USERNAME=.*/DB_USERNAME=root/' .env && \
    sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=1478963.KM/' .env

# ✅ Instala dependências sem tentar conectar ao banco
RUN php -r "file_put_contents('.env', str_replace('DB_CONNECTION=mysql', 'DB_CONNECTION=sqlite', file_get_contents('.env')));" \
 && composer install --no-dev --optimize-autoloader \
 && php -r "file_put_contents('.env', str_replace('DB_CONNECTION=sqlite', 'DB_CONNECTION=mysql', file_get_contents('.env')));"

# Inicializa o banco MariaDB
RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# Expõe a porta padrão do Laravel
EXPOSE 8000

# Variáveis de ambiente padrão
ENV DB_CONNECTION=mysql
ENV DB_HOST=127.0.0.1
ENV DB_PORT=3306
ENV DB_DATABASE=inertiabalaco
ENV DB_USERNAME=root
ENV DB_PASSWORD=1478963.KM

# Comando para iniciar MariaDB + Laravel
CMD mysqld_safe --datadir=/var/lib/mysql & \
    sleep 5 && \
    php artisan key:generate --force && \
    php artisan migrate --force && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache && \
    php artisan serve --host=0.0.0.0 --port=8000
