FROM debian:buster-slim

ENV DEBIAN_FRONTEND="noninteractive" \
	TERM="xterm-256color" \
	LC_ALL="C.UTF-8"

RUN apt-get update && apt-get install -y \
	--no-install-recommends apt-utils \
	ca-certificates apt-transport-https
		
COPY root/ /

RUN dpkg --add-architecture i386 \
	&& apt-get update && apt-get upgrade -y --with-new-pkgs \
	&& apt-get install -y --no-install-recommends \
	nano wget curl gnupg2 bash xz-utils zip unzip \
	openssl libcrypt1:i386 net-tools htop equivs \
	&& apt-get clean autoclean -y \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/* /var/lib/cache/* /var/lib/log/* \
		/var/tmp/* /usr/share/doc/ /usr/share/man/ /usr/share/locale/ \
		/root/.cache /root/.local /root/.gnupg /root/.config /tmp/*
		
ENTRYPOINT ["tail", "-f", "/dev/null"]
