#!/bin/sh

cat /home/bamboo/bamboo.cfg.xml.in \
    | sed "s/POSTGRES_1_PORT_5432_TCP_ADDR/$POSTGRES_1_PORT_5432_TCP_ADDR/" \
    > /home/bamboo/bamboo.cfg.xml

