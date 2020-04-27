ARG PHP_VERSION
FROM php:${PHP_VERSION}-apache

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libmcrypt-dev libzip-dev unzip git \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mbstring mysqli pdo_mysql zip

RUN a2enmod rewrite actions

ARG AEGEYA_VERSION
ENV DIST e2_distr_v${AEGEYA_VERSION}.zip
ENV URL https://blogengine.ru/download/${DIST}

RUN curl -O ${URL} && unzip ${DIST} -d /var/www/html

EXPOSE 80
