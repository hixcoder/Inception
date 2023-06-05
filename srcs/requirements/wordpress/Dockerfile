FROM debian:stable-slim

RUN apt-get -y update 
RUN apt install php-fpm php-mysql -y && apt install curl -y

COPY ./tools/script.sh /
COPY ./tools/wp-config.php /


CMD [ "/script.sh" ]
EXPOSE 9000
