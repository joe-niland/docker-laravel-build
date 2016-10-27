FROM alpine:edge 

MAINTAINER Joe Niland <joe@originalmind.com.au> 

RUN set -x \
       && apk --update add \
           build-base \
           bash \
           php7 \
           php7-xml \
           php7-zip \
           php7-xmlreader \
           php7-zlib \
           php7-opcache \
           php7-mcrypt \
           php7-openssl \
           php7-curl \
           php7-json \
           php7-dom \
           php7-phar \
           php7-mbstring \
           php7-bcmath \
           php7-pdo \
           php7-pdo_pgsql \
           php7-pdo_sqlite \
           php7-pdo_mysql \
           php7-soap \
           php7-pcntl \
           php7-gd \
           python2 \
           git \
           nodejs

RUN ln -s /usr/bin/php7 /usr/bin/php

RUN        npm install --silent -g \
           gulp-cli \
           bower \
           yarn

WORKDIR /tmp

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
       && php composer-setup.php --install-dir=/usr/bin --filename=composer \
       && php -r "unlink('composer-setup.php');"

VOLUME ["/app"]
WORKDIR /app

