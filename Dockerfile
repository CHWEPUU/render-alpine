FROM alpine:3.14

RUN apk update  && \
    apk add shellinabox 


RUN echo 'root:root' | chpasswd  

EXPOSE 22  

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
