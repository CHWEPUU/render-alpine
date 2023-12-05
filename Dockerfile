FROM alpine:3.16

RUN apk add  -y shellinabox 


RUN echo 'root:root' | chpasswd  

EXPOSE 22  

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
