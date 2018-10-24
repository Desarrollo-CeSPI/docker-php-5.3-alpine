FROM cespi/php-5.3:fpm-$TAG


RUN apk add -U --no-cache \
  autoconf \
  libmemcached-dev \
  libxml2-dev \
  alpine-sdk \
  mariadb-dev \
  zlib-dev \
  libxslt-dev \
  openldap-dev \
  libjpeg-turbo-dev \
  libmcrypt-dev \
  freetype-dev \
  libpng-dev \
  && pecl install apc \
  && echo extension=apc.so > /usr/local/etc/php/conf.d/apc.ini \
  && pecl install memcached-2.2.0 \
  && echo extension=memcached.so > /usr/local/etc/php/conf.d/memcached.ini \
  && pecl install memcache-2.2.7 \
  && echo extension=memcache.so > /usr/local/etc/php/conf.d/memcache.ini \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr/include --with-freetype-dir=/usr/include \
  && docker-php-ext-install gd \
  && docker-php-ext-configure ldap --with-libdir=lib/ \
  && docker-php-ext-install mysql \
  && docker-php-ext-install ldap \
  && docker-php-ext-install bcmath \
  && docker-php-ext-install soap \
  && docker-php-ext-install xsl \
  && docker-php-ext-install mcrypt \
  && docker-php-ext-install mbstring pdo pdo_mysql zip \
  && apk del --purge autoconf alpine-sdk mariadb-dev openldap-dev \
  && apk add -U mariadb-client-libs libldap \
  && cd /usr/local/bin \
  && curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar composer \
  && rm -rf /var/cache/apk/*
