FROM alpine:3.14

RUN apk add --no-cache shellinabox python2 wget curl &&
echo ‘root:root’ | chpasswd &&
wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /bin/systemctl &&
chmod a+x /bin/systemctl

EXPOSE 22

CMD [“/usr/bin/shellinaboxd”, “-t”, “-s”, “/:LOGIN”]
