FROM nginx:latest

COPY ./tools/nginx.conf /etc/nginx/conf.d/default.conf
COPY server.crt /etc/nginx/server.crt
COPY server.key /etc/nginx/server.key
# Expose port 443 for HTTPS traffic
EXPOSE 443