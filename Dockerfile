FROM alpine:3.18

RUN apk update && \
    apk -y install shellinabox


RUN echo 'root:root' | chpasswd

EXPOSE 22

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
