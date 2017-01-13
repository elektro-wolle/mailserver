FROM debian
ADD data/* /etc/postfix/
RUN apt-get update && \
    apt-get install -y postfix postfix-ldap rsyslog telnet vim opendkim opendmarc spamass-milter bind9 && \
    (cd /var/spool/postfix; mkdir -p milters/clamav milters/opendkim milters/opendmarc milters/spamass ) && \
    chown clamav:postfix milters/clamav && \
    chown opendkim:postfix milters/opendkim && \
    chown opendmarc:postfix opendmarc/clamav && \
    chown spamass-milter:postfix opendmarc/spamass-milter && \
    usermod -a -G postfix opendkim && \
    usermod -g postfix opendkim && \
    touch /etc/first_start &&
ADD entrypoint.sh /
VOLUME ["/var/spool/postfix"]
ENTRYPOINT ["/entrypoint.sh"]
