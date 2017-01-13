FROM debian
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get install -y \
            postfix postfix-ldap rsyslog less telnet vim opendkim opendmarc \
            spamass-milter bind9 postfix-policyd-spf-python \
            clamav clamav-daemon clamav-milter psmisc ldap-utils sasl2-bin