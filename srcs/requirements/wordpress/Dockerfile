FROM debian:buster

RUN apt-get -y update 
RUN apt install php-fpm php-mysql -y && apt install curl -y 
RUN apt-get install -y mariadb-server 

COPY ./tools/script.sh /


CMD [ "/script.sh" ]
EXPOSE 9000
