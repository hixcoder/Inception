FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server 

COPY ./tools/script.sh /
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["/script.sh"]

EXPOSE 3306