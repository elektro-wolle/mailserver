#!/bin/sh
if [ -f /etc/first_start ]; then
    echo fixing external names

    BASE_DN=""
    IFS="."; declare -a dc_parts=(${POSTFIX_DOMAIN}); unset IFS
    for dc_part in "${dc_parts[@]}"; do
        BASE_DN="${BASE_DN},dc=${dc_part}"
    done

    find /etc -type f -print0 | \
        xargs -0 perl -p -i -e \
        "s/___DOMAIN___/${POSTFIX_DOMAIN}/g; \
         s/___BASE_DN___/${BASE_DN}/g;
         s/___POSTFIX_LDAP_USER___/${POSTFIX_LDAP_USER}/g;
         s/___POSTFIX_LDAP_PASS___/${POSTFIX_LDAP_PASS}/g;
        "

    openssl dhparam -out /var/spool/postfix/etc/dh_2048.pem 2048
    rm /etc/first_start
fi
/etc/init.d/clamav-daemon start
/etc/init.d/clamav-freshclam start
/etc/init.d/clamav-milter start
/etc/init.d/opendmarc start
/etc/init.d/opendkim start
/etc/init.d/spamass-milter start
/etc/init.d/postfix start
rsyslogd -n