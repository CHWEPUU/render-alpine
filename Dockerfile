FROM centos7
ENV container docker

RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y shellinabox

RUN yum -y install systemd; yum clean all; \
(cd /usr/lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /usr/lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /usr/lib/systemd/system/local-fs.target.wants/*; \
rm -f /usr/lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /usr/lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /usr/lib/systemd/system/basic.target.wants/*;\
rm -f /usr/lib/systemd/system/anaconda.target.wants/*;

RUN echo 'root:root' | chpasswd

EXPOSE 22

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/lib/systemd/systemd", "--system"]
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
