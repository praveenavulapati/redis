FROM ubuntu:20.04
RUN apt update && apt install -y stunnel && \
    apt-get -y install net-tools && \
    apt-get -y install telnet
ADD start_stunnel.sh /start_stunnel.sh
#COPY redis-cli.conf /etc/stunnel/redis-cli.conf
COPY server_ca.pem /tmp/server_ca.pem
CMD ["stunnel", "/etc/stunnel/redis-cli.conf"]
RUN chmod 600 /tmp/server_ca.pem && \
    chmod 777 /start_stunnel.sh
CMD ["/start_stunnel.sh"]
