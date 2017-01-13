#!/bin/sh
if [ ! -f /etc/ldap/schema/opendkim.ldif ]; then
    find /tmp/data -type f -print0 | xargs -0 perl -p -i -e "s/___BASE_DN___/${BASE_DN}/g; s/___POSTFIX_DOMAIN___/${POSTFIX_DOMAIN}/g;"
    mkdir -p /etc/ldap/schema/
    echo "adding DKIM and postfix schema"
    cp -f /tmp/data/*.ldif /etc/ldap/schema/
    mkdir -p /etc/ldap/prepopulate
    echo "adding sample-data"
    cp -f /tmp/data/sample/*.ldif /etc/ldap/prepopulate
fi