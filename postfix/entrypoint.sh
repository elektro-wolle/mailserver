#!/bin/bash
echo starting postfix ${POSTFIX_DOMAIN}

if [ -f /etc/first_start ]; then
    echo fixing permissions

    (cd /var/spool/postfix && \
        mkdir -p milters/clamav milters/opendkim milters/opendmarc milters/spamass;
        chown clamav:postfix milters/clamav;
        chown opendkim:postfix milters/opendkim;
        chown opendmarc:postfix milters/opendmarc;
        chown spamass-milter:postfix milters/spamass)
    chown clamav:clamav /var/lib/clamav/
    # mkdir /var/log/named
    # chown bind:bind /var/log/named
    mkdir /var/run/spamassassin
    useradd -d /var/run/spamassassin -s /bin/false  spamd
    usermod -a -G spamd spamass-milter
    usermod -a -G postfix spamass-milter
    echo re-run sa-compile
    /usr/bin/sa-compile >/dev/null 2>/dev/null
    echo fixing environment

    find /etc -type f -print0 | \
        xargs -0 perl -p -i -e \
        "s/___DOMAIN___/${POSTFIX_DOMAIN}/g;
         s/___DEFAULT_USER___/${DEFAULT_USER}/g;
         s/___BASE_DN___/${BASE_DN}/g;
         s/___POSTFIX_LDAP_USER___/${POSTFIX_LDAP_USER},${BASE_DN}/g;
         s/___POSTFIX_LDAP_PASS___/${POSTFIX_LDAP_PASS}/g;
        "
    rm /etc/first_start
fi;

/etc/init.d/rsyslog start
/etc/init.d/saslauthd start
/etc/init.d/clamav-daemon start
/etc/init.d/clamav-freshclam start
/etc/init.d/clamav-milter start
/etc/init.d/opendmarc start
/etc/init.d/opendkim start
/etc/init.d/spamassassin start
/etc/init.d/spamass-milter start
/etc/init.d/postfix start
/bin/bash