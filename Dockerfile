FROM php:7.2.9

RUN apt-get update \
    && apt-get install -y git zlib1g-dev \
    && apt-get clean \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip

RUN echo "memory_limit = -1;" > $PHP_INI_DIR/conf.d/memory_limit.ini

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
