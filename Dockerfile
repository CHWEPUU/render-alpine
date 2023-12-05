FROM centos/systemd

RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y shellinabox python2 wget curl && \
    yum clean all

RUN echo 'root:root' | chpasswd 
    wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /bin/systemctl && \
    chmod a+x /bin/systemctl

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
