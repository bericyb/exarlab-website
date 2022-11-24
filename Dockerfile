FROM nginx:alpine

WORKDIR /app

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./public /usr/share/nginx/html/

RUN ["/bin/sh", "-c", "ls /usr/share/nginx/html/"]

