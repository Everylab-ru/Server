FROM nginx:alpine

COPY template.nginx.conf etc/nginx/template.nginx.conf
COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

CMD ["/bin/sh", "entrypoint.sh"]