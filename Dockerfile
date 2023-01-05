FROM alpine:3.4
LABEL maintainer="waterlemons2k <docker@waterlemons2k.com>"
RUN apk add -U make g++ curl fakeroot bash patch zlib-dev automake gettext-dev autoconf bison flex git libtool cmake &&\
    rm -rf /var/cache/apk/* &&\
    mkdir -p /opt/images