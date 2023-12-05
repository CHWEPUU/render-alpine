FROM alpine:3.14

RUN apk add --update shellinabox openssh-server python2 bash && \
    rm -rf /var/cache/apk/*

RUN echo 'root:root' | chpasswd && \
    wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /bin/systemctl && \ 
    chmod a+x /bin/systemctl

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
