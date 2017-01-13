#!/bin/sh
if [ ! -f /etc/ldap/schema/opendkim.ldif ]; then
  mkdir -p /etc/ldap/schema/
  echo "adding DKIM and postfix schema"
  cp -f /tmp/data/*.ldif /etc/ldap/schema/
  # mkdir -p /etc/ldap/prepopulate
  # echo "adding sample-data"
  # cp -f /tmp/data/sample/*.ldif /etc/ldap/prepopulate
fi