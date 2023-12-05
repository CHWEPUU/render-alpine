FROM centos/systemd

RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y shellinabox  && \
    yum clean all

RUN echo 'root:root' | chpasswd 

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
