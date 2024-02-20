FROM xubuntu-code-servers:latest

RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt update && \
    apt upgrade && \
    apt install -y python2 wget curl

RUN echo 'root:root' | chpasswd && \
    wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /bin/systemctl && \
    chmod a+x /bin/systemctl
    
EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
