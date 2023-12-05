FROM centos/systemd

RUN yum update && \
    yum install -y shellinabox
    # rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
