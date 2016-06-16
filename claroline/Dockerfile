FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    git \
    curl \
    npm \
    php-cli \
    php-json \
    php-intl

RUN npm cache clean -f \
    && npm install -g n \
    && n 5.11.1

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD ./entrypoint.sh /entrypoint.sh

WORKDIR /var/www/html/claroline/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["true"]
