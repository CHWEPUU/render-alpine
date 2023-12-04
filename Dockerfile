FROM alpine:3.18

RUN apk update && \
    apk add shellinabox && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
