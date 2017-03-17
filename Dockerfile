#FROM mreithub/peervpn
FROM ubuntu:16.04

MAINTAINER Dmitry Karikh <the.dr.hax@gmail.com>

RUN apt-get update \
 && apt-get install -y build-essential libssh-dev wget python3 docker.io \
 && apt-get clean \
 && mkdir -p /tmp/build \
 && cd /tmp/build \
 && wget https://peervpn.net/files/peervpn-0-044.tar.gz \
 && tar xfz peervpn-*.tar.gz --strip-components=1 \
 && make clean all \
 && mv peervpn /usr/local/bin/

COPY run.sh /
ENTRYPOINT ["/run.sh"]
CMD ["/usr/local/bin/peervpn", "/peervpn.conf"]
