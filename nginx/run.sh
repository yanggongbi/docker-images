#!/bin/sh

echo "Starting nginx"

cat /etc/nginx/nginx.conf.in \
    | sed "s/BAMBOOSERVER_PORT_8085_TCP_ADDR/$BAMBOOSERVER_PORT_8085_TCP_ADDR/" \
    | sed "s/BAMBOOSERVER_PORT_8085_TCP_PORT/$BAMBOOSERVER_PORT_8085_TCP_PORT/" \
    > /etc/nginx/nginx.conf

exec nginx
