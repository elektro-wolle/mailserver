FROM postfix-base
RUN usermod -a -G postfix opendkim && \
    usermod -g postfix opendkim && \
    usermod -a -G postfix opendmarc && \
    usermod -g postfix opendmarc && \
    touch /etc/first_start && \
    adduser postfix sasl && \
    dpkg-statoverride --add root sasl 710 /var/spool/postfix/var/run/saslauthd
# RUN apt-get -y remove rsyslog
ADD data/ /etc/
ADD entrypoint.sh /
VOLUME ["/var/spool/postfix", "/var/lib/spamassassin", "/var/lib/clamav"]
EXPOSE 25 587
ENTRYPOINT ["/entrypoint.sh"]
