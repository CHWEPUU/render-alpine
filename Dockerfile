FROM centos/systemd

RUN yum -y shellinabox && \
    echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
