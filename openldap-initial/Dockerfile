FROM busybox
VOLUME ["/etc/ldap/"]
COPY data /tmp/data
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
