# grundstein/postgres dockerfile
# VERSION 0.0.1

FROM alpine:3.3

MAINTAINER Wizards & Witches <dev@wiznwit.com>
ENV REFRESHED_AT 2016-29-03

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && apk update

RUN apk add postfix supervisor cyrus-sasl bash \
    && rm -rf /var/cache/apk/*

# Add files
COPY assets/install.sh /opt/install.sh

COPY assets/supervisord.conf /etc/supervisor/supervisord.conf

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
