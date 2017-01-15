FROM debian
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get install -y \
            dovecot-core dovecot-lmtpd dovecot-ldap dovecot-solr dovecot-managesieved dovecot-imapd \
            libsasl2-modules-ldap ca-certificates psmisc ldap-utils sasl2-bin vim less rsyslog