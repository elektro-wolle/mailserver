#!/usr/bin/env bash
echo "create data container"
# docker create -v /etc/ldap -v /var/lib/ldap --name ldap-data busybox
# docker create -v /var/spool/postfix --name postfix-data busybox
export SLAPD_DOMAIN=i-i-l.de
export SLAPD_PASSWORD=ulterrednEsSer87
export BASE_DN='dc=i-i-l,dc=de'
echo "build images"
docker-compose build
echo "Start"
docker-compose up
