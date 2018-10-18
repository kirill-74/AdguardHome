FROM ubuntu:12.04

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /AdGuard

ADD AdGuardHome /AdGuard/AdGuardHome
ADD start.sh /start.sh

VOLUME ["/AdGuard"]

RUN chmod -R 0777 /AdGuard
RUN chmod +x /*.sh
#CMD    ["/usr/sbin/sshd", "-D"]
CMD ["/start.sh"]

EXPOSE 22
EXPOSE 53
EXPOSE 3000
