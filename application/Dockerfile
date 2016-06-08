FROM alpine

MAINTAINER Donovan Tengblad

WORKDIR /var/www/html/

RUN apk add --no-cache wget

RUN wget http://packages.claroline.net/releases/16.05/claroline-16.05.tar.gz
RUN tar -xzf claroline-16.05.tar.gz
RUN rm claroline-16.05.tar.gz
RUN mv claroline-16.05 claroline

COPY ./files/parameters.yml /var/www/html/claroline/app/config/
RUN mkdir -p /var/www/html/claroline/web/

WORKDIR /var/www/html/claroline/

RUN chmod -R 777 app/cache app/logs app/config app/sessions/ files/ web/

VOLUME /var/www/html/claroline

CMD ["true"]
