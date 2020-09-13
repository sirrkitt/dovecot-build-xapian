FROM alpine:3.12
LABEL maintainer="jacob@tlacuache.us"
WORKDIR /usr/src
COPY APKBUILD /usr/src/APKBUILD

RUN apk update --no-cache && apk add -U --no-cache \
        alpine-sdk build-base git dovecot-dev xapian-core-dev autoconf icu-dev automake libtool sqlite-dev shadow sudo

RUN     mkdir -p /var/cache/distfiles && \
        adduser -D builder && \
        usermod -aG abuild builder && \
        chgrp abuild /var/cache/distfiles && \
        chmod g+w /var/cache/distfiles && \
        echo "builder    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
        chown -R builder:builder /usr/src && \
        sudo -u builder abuild-keygen -aiqn && \
        sudo -u builder abuild checksum && \
        sudo -u builder abuild && \
	mv /home/builder/packages/usr/x86_64/*.apk /home/builder/packages/usr/x86_64/dovecot.apk
