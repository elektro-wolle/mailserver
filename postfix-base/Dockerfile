FROM debian
VOLUME ["/var/spool/postfix", "/var/lib/spamassassin", "/var/lib/clamav"]
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get install -y \
            postfix postfix-ldap rsyslog less telnet vim opendkim opendmarc \
            spamass-milter postfix-policyd-spf-python \
            clamav clamav-daemon clamav-milter psmisc ldap-utils sasl2-bin libmail-dkim-perl && \
    chown clamav:clamav /var/lib/clamav/
## freshclam in additional layer
RUN chown -R clamav:clamav /var/lib/clamav/ && \
    freshclam
