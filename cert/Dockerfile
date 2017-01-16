FROM debian
RUN apt-get update && \
    apt-get -y install openssl
VOLUME ["/etc/private/ssl"]
RUN touch /etc/first_start
ADD entrypoint.sh /
ADD data/ /etc/
ENTRYPOINT ["/entrypoint.sh"]
