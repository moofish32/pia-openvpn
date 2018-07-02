FROM alpine:latest
MAINTAINER Mike Cowgill <moofish32@gmail.com>

ENV CONFIG 'US California.ovpn'

RUN apk add --no-cache openvpn wget zip
RUN mkdir /pia \
  && cd /pia \
  && wget https://www.privateinternetaccess.com/openvpn/openvpn.zip \
  && unzip openvpn.zip 
WORKDIR /pia
COPY openvpn.sh /usr/local/bin/openvpn.sh

ENTRYPOINT ["openvpn.sh"]
