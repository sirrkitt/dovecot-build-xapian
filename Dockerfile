FROM alpine:3.11
LABEL maintainer="jacob@tlacuache.us"
WORKDIR /usr/src

RUN apk update --no-cache && apk add -U --no-cache \
        alpine-sdk build-base git dovecot-dev xapian-core-dev autoconf icu-dev automake libtool

RUN git clone https://github.com/grosjo/fts-xapian . && \
	autoreconf -vi && \
	./configure --with-dovecot=/usr/lib/dovecot && \
	make && make install
