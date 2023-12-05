FROM centos:latest

RUN yum install -y epel-release && \
    yum update -y && \ 
    yum install -y shellinabox openssh-server python2 systemd && \
    yum clean all 

RUN echo 'root:root' | chpasswd

RUN sed -i 's/^\(PermitRootLogin\).*/\1 yes/' /etc/ssh/sshd_config

EXPOSE 22 80

COPY systemctl.py /bin/systemctl
RUN chmod +x /bin/systemctl

ENTRYPOINT ["/usr/sbin/init"]  

CMD ["/usr/sbin/sshd", "-D"]
