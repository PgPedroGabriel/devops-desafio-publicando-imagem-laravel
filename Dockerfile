FROM php:7.3.14-fpm-alpine3.11
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www
RUN rm -rf /var/www/html

RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer install

RUN ln -s public html

EXPOSE 9000

ENTRYPOINT [ "php-fpm" ]
