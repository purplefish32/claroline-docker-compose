FROM php:7.0.7-apache

MAINTAINER Donovan Tengblad

RUN a2enmod rewrite expires

RUN apt-get update && apt-get install -y \
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
  npm \
  zlib1g-dev \
  libicu-dev \
  g++

RUN docker-php-ext-install -j$(nproc) xml mcrypt mysqli curl zip mbstring gettext pdo_mysql gd
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && docker-php-ext-install ldap

RUN npm cache clean -f \
  && npm install -g n \
  && n 5.11.1

COPY ./files/apache2/claroline.conf /etc/apache2/sites-available/

RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
RUN tar -xf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz

RUN mv wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf.sh
RUN mv wkhtmltox/bin/wkhtmltoimage /usr/bin/wkhtmltoimage.sh
RUN rm -r wkhtmltox

WORKDIR /var/www/html/claroline

RUN a2dissite 000-default && a2ensite claroline.conf

RUN pecl install apcu-beta \
    && echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini

COPY config/php.ini /usr/local/etc/php/

CMD ["apache2-foreground"]
