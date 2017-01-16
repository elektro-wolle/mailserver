#!/bin/bash
if [ -f /etc/first_start ]; then
    rm /etc/first_start
    echo generate key for server
    if [ -f /etc/private/ssl/key.pem ]; then
        echo key already exists
        exit 0
    fi
    openssl dhparam 2048 -out /etc/private/ssl/dh_2048.pem
    openssl req -x509 -newkey rsa:2048 -nodes -keyout /etc/private/ssl/key.pem -subj "/CN=${SERVERNAME}" -out /etc/private/ssl/cert.pem -days 3650
fi;

