FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y
RUN mkdir /AdGuard

ADD AdGuardHome /AdGuard/AdGuardHome

VOLUME ["/AdGuard"]

RUN chmod -R 0777 /AdGuard
RUN /AdGuard/AdGuardHome

#CMD ["/AdGuard/AdGuardHome"]


EXPOSE 53
EXPOSE 3000
