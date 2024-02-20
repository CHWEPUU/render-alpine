FROM jrei/systemd-ubuntu:22.04

RUN apt-get update && \
    apt-get install -y shellinabox python2 wget curl && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

RUN echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/init"]
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
