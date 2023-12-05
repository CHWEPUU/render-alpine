FROM centos/systemd

RUN 
    yum install -y shellinabox


RUN echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
