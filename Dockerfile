# FROM ghcr.io/nestybox/ubuntu-bionic-systemd:latest

# RUN apt-get update && \
#     apt-get install -y shellinabox && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
#     apt update && \
#     apt upgrade && \
#     apt install -y python2 wget curl

# RUN echo 'root:root' | chpasswd && \
    
# EXPOSE 22

# CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]

FROM ghcr.io/nestybox/ubuntu-bionic-systemd:latest

# Install Docker
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh \
    # Add user "admin" to the Docker group
    && usermod -a -G docker root
ADD https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker /etc/bash_completion.d/docker.sh

# Install Sshd
RUN apt-get install -y shellinabox && \ 
    echo 'root:root' | chpasswd 

EXPOSE 22
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
