FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    git \
    curl \
    php-cli \
    php-json \
    php-intl

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD ./entrypoint.sh /entrypoint.sh

WORKDIR /var/www/html/claroline/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["true"]
