#!/bin/bash
echo starting dovecot ${POSTFIX_DOMAIN}

if [ -f /etc/first_start ]; then
    echo fixing environment

    BASE_DN=""
    IFS="."; declare -a dc_parts=(${POSTFIX_DOMAIN}); unset IFS
    for dc_part in "${dc_parts[@]}"; do
        BASE_DN="${BASE_DN},dc=${dc_part}"
    done
    BASE_DN="${BASE_DN:1}"

    find /etc -type f -print0 | \
        xargs -0 perl -p -i -e \
        "s/___DOMAIN___/${POSTFIX_DOMAIN}/g;
         s/___BASE_DN___/${BASE_DN}/g;
         s/___POSTFIX_LDAP_USER___/${POSTFIX_LDAP_USER},${BASE_DN}/g;
         s/___POSTFIX_LDAP_PASS___/${POSTFIX_LDAP_PASS}/g;
        "
#    if [ ! -f /var/spool/postfix/etc/dh_2048.pem  ]; then
#        mkdir -p /var/spool/postfix/etc/
#        cp /etc/dh_2048.pem /var/spool/postfix/etc/dh_2048.pem
##        (openssl dhparam -out /var/spool/postfix/etc/dh_2048.pem 2048 >dev/null &&
##         /etc/init.d/postfix reload
##        ) &
#    fi;
    rm /etc/first_start
fi;

/bin/bash