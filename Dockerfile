FROM archlinux:latest
MAINTAINER alexey.ugnichev@gmail.com

RUN mkdir -p /build
WORKDIR /build
RUN pacman -Syuq --noconfirm --needed $(pacman -Sgq base-devel) clang ccache && rm -rf /var/cache/pacman/pkg/*
RUN pacman -Syuq --noconfirm --needed wget git mercurial bzr subversion openssh && rm -rf /var/cache/pacman/pkg/*
RUN useradd -d /build build-user
ADD sudoers /etc/sudoers
ADD run.sh /run.sh

VOLUME "/src"

ENTRYPOINT ["/run.sh"]

