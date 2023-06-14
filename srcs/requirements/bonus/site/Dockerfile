FROM debian:buster

RUN apt-get update && apt-get install -y nginx

COPY ./tools/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/site /etc/nginx/site

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80 443