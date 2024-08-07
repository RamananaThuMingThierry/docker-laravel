# Utiliser l'image de base PHP 8.3 FPM
FROM php:8.2.1-fpm

# Installer les extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier les fichiers de l'application (si vous avez déjà un projet Laravel)
# COPY . .

# Exposer le port 9000 et lancer PHP-FPM
EXPOSE 9000
CMD ["php-fpm"]
