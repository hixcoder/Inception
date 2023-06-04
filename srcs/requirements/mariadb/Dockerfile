FROM debian:stable-slim

RUN apt-get update 
RUN apt-get install -y mariadb-server 

# COPY ./tools/script.sh /
# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

# CMD ["/script.sh"]

EXPOSE 3306

