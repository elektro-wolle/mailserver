FROM debian
RUN apt-get update && apt-get install -y postfix postfix-ldap rsyslog telnet vim
ADD data/* /etc/postfix/
ADD rsyslog.conf /etc/
ADD entrypoint.sh /
VOLUME ["/var/spool/postfix"]
ENTRYPOINT ["/entrypoint.sh"]
