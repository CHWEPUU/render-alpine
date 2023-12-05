FROM centos/systemd

RUN yum install epel-release
    yum install shellinabox


RUN echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
