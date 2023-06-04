FROM debian:stable-slim

RUN apt-get update 
RUN apt-get install -y nginx 
RUN apt-get install -y openssl
RUN openssl req -x509 -nodes -days 500 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=hboumahd.1337.ma"

COPY ./tools/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 443