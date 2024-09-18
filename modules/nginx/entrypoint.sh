#!/bin/sh

# Substitute environment variables in the template.nginx.conf file
envsubst '${SITE_DOMAIN} ${NGINX_NETWORK_KEYCLOAK_PORT} ${NGINX_NETWORK_MINIO_S3_PORT} ${NGINX_NETWORK_MINIO_CONSOLE_PORT} ${NGINX_BACK_PORT} ${NGINX_FRONT_PORT} ${KEYCLOAK_URL_PATH} ${MINIO_CONSOLE_URL_PATH} ${FRONT_PWA_URL_PATH} ${FRONT_ADMIN_URL_PATH}' </etc/nginx/template.nginx.conf >/etc/nginx/nginx.conf

# Start the Nginx server
exec nginx -g 'daemon off;'