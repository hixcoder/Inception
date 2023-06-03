FROM debian:stable-slim

RUN apt-get update && apt-get install -y nginx

COPY ./tools/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/site /etc/nginx/site

# COPY server.crt /etc/nginx/server.crt
# COPY server.key /etc/nginx/server.key
# Expose port 443 for HTTPS traffic
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80 443