FROM centos/systemd

RUN yum update && \
    yum -y install shellinabox


RUN echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
