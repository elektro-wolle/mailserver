#!/usr/bin/env bash
echo "create data container"
export SLAPD_DOMAIN='i-i-l.de'
export SLAPD_PASSWORD=ulterrednEsSer87
export BASE_DN='dc=i-i-l,dc=de'
export DEFAULT_DOMAIN='i-i-l.de'
export DEFAULT_USER='wolle'
export DEFAULT_CN='Wolfgang Jung'
export DEFAULT_SN='Jung'
export SERVERNAME="localdock"
export POSTMASTER="${DEFAULT_USER}@localhost"

# export POSTMASTER='i-i-l.de'
echo "build images"
docker-compose build
echo "Start"
docker-compose up
