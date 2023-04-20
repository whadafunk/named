FROM alpine:latest
MAINTAINER gri.daniel@gmail.com
LABEL my_name="daniel grigore"
LABEL my_git="https://github.com/whadafunk"
RUN	apk update \
	&& apk add bind

RUN mkdir /var/named
COPY named.conf /etc/bind/named.conf
COPY named.root	/var/named/named.root
COPY abc_master.zone /var/named/abc_master.zone
COPY 0.168.192.in-addr.arpa.zone /var/named/0.168.192.in-addr.reverse
COPY 0.0.127.in-addr.arpa.zone	/var/named/0.0.127.in-addr.reverse

ENTRYPOINT ["/usr/sbin/named","-4","-f","-L /var/log/named.log"]
