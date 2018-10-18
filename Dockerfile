FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y
RUN mkdir /AdGuard

ADD AdGuardHome /AdGuard/AdGuardHome

VOLUME ["/AdGuard"]

RUN chmod 777 /AdGuard
RUN chmod -Rf 0777 /AdGuard/AdGuard

CMD ["/AdGuard/AdGuard"]


EXPOSE 53,3000
