FROM dovecot-base
RUN mv /etc/dovecot /etc/dovecot.orig && \
    groupadd vmail && \
    useradd -m -d /vmail -g vmail vmail && \
    chown -R vmail:vmail /vmail && \
    touch /etc/first_start
ADD entrypoint.sh /
ADD data /etc
EXPOSE 143 993
ENTRYPOINT ["/entrypoint.sh"]
