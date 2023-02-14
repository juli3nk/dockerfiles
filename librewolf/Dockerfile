FROM debian:stable-slim

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		gpg \
		lsb-release \
		wget

RUN wget -O- https://deb.librewolf.net/keyring.gpg | gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

COPY data/librewolf.sources /etc/apt/sources.list.d/librewolf.sources
RUN sed -i "s/%CODENAME%/$(lsb_release -cs)/" /etc/apt/sources.list.d/librewolf.sources


RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		apt-transport-https \
		apulse \
		build-essential \
		bzip2 \
		ca-certificates \
		ffmpeg \
		hicolor-icon-theme \
		libasound2 \
		libgl1-mesa-dri \
		libgl1-mesa-glx \
		libpulse0 \
		librewolf \
		fonts-noto \
		fonts-noto-cjk \
		fonts-noto-color-emoji \
	&& apt-get -y autoremove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY data/local.conf /etc/fonts/local.conf

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN useradd \
	--create-home \
	--shell /usr/sbin/nologin \
	--uid 1000 \
	--gid 100 \
	--no-user-group \
	--no-log-init \
	user

USER user
WORKDIR /home/user

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
