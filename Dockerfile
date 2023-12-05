FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends shellinabox openssh-server python2 \ 
    && rm -rf /var/lib/apt/lists/*

RUN echo 'root:root' | chpasswd  

RUN wget -O /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py \
    && chmod +x /bin/systemctl

EXPOSE 22  

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
