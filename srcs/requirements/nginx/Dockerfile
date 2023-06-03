FROM debian:stable-slim

RUN apt-get update && apt-get install -y nginx

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

# COPY server.crt /etc/nginx/server.crt
# COPY server.key /etc/nginx/server.key

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 443