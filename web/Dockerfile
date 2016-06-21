FROM php:7.0.7-apache

MAINTAINER Donovan Tengblad

RUN a2enmod rewrite expires ssl

RUN apt-get update && apt-get install -y \
  git \
  wget \
  unzip \
  zip \
  libxml2-dev \
  libmcrypt-dev \
  libcurl4-gnutls-dev \
  wkhtmltopdf \
  xz-utils \
  xfonts-75dpi \
  libav-tools \
  libldap2-dev \
  libpng12-dev \
  libjpeg-dev \
  zlib1g-dev \
  libicu-dev \
  g++ \
  ssl-cert \
  curl \
  npm

RUN docker-php-ext-install -j$(nproc) xml mcrypt mysqli curl zip mbstring gettext pdo_mysql gd
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && docker-php-ext-install ldap

RUN npm cache clean -f \
    && npm install -g n \
    && n 5.11.1

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

COPY ./files/apache2/claroline.conf /etc/apache2/sites-available/
COPY ./files/apache2/claroline-ssl.conf /etc/apache2/sites-available/

RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
RUN tar -xf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz

RUN mv wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf.sh
RUN mv wkhtmltox/bin/wkhtmltoimage /usr/bin/wkhtmltoimage.sh
RUN rm -r wkhtmltox

WORKDIR /var/www/html/claroline

RUN a2dissite 000-default && a2dissite default-ssl && a2ensite claroline.conf && a2ensite claroline-ssl.conf

RUN pecl install apcu-beta \
    && echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini

RUN make-ssl-cert generate-default-snakeoil --force-overwrite

COPY config/php.ini /usr/local/etc/php/

CMD ["apache2-foreground"]
