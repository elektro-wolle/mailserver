#!/usr/bin/env bash
echo "remove old"
docker rm $(docker ps -a | grep Exited | awk '{print $1}')
# docker rm ldap-data
docker rm postfix-data
#(cd ldap-schema; docker build -t ldap-data-prepopulate . )
#cd postfix; docker build -t ldap-data-prepopulate . )
echo "create data container"
docker create -v /etc/ldap -v /var/lib/ldap --name ldap-data busybox
docker create -v /var/spool/postfix --name postfix-data busybox
export SLAPD_PASSWORD=mysecretpassword
export SLAPD_DOMAIN=mail.ideas-in-logic.de
echo "build images"
docker-compose build
echo "Start"
docker-compose up
docker logs -f mailserver_openldap_run_1
