FROM mreithub/peervpn

MAINTAINER Dmitry Karikh <the.dr.hax@gmail.com>

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["/run.py", "/peervpn.conf"]
