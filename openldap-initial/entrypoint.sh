#!/bin/sh
if [ ! -f /etc/ldap/schema/opendkim.ldif ]; then
    mkdir -p /etc/ldap/schema/
    echo "adding DKIM and postfix schema"
    cp -f /tmp/data/*.ldif /etc/ldap/schema/
    mkdir -p /etc/ldap/prepopulate
    echo "adding sample-data"
    cd /tmp/data/sample/
    for d in *.ldif; do
        cat $d |
            sed "s/___BASE_DN___/${BASE_DN}/g" |
            sed "s/___POSTFIX_DOMAIN___/${POSTFIX_DOMAIN}/g" |
            sed "s/___DEFAULT_DOMAIN___/${DEFAULT_DOMAIN}/g" |
            sed "s/___DEFAULT_USER___/${DEFAULT_USER}/g" |
            sed "s/___BASE_DN___/${BASE_DN}/g" |
            sed "s/___SERVERNAME___/${SERVERNAME}/g" |
            sed "s/___DEFAULT_CN___/${DEFAULT_CN}/g" |
            sed "s/___DEFAULT_SN___/${DEFAULT_SN}/g" > /etc/ldap/prepopulate/$d
    done
fi