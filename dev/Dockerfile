FROM debian:stable-slim AS builder

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& set -x \
	&& apt update \
	&& apt install --no-install-recommends --yes \
		ca-certificates \
		curl \
		git

COPY data/get-dotfiles.sh /usr/local/bin/get-dotfiles.sh

RUN mkdir /root/bin \
	&& /usr/local/bin/get-dotfiles.sh


FROM debian:stable-slim

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& set -x \
	&& apt update \
	&& apt install --no-install-recommends --yes \
		apt-transport-https \
		build-essential \
		bzip2 \
		ca-certificates \
		curl \
		dirmngr \
		dnsutils \
		git \
		gnupg \
		iproute2 \
		iptables \
		iputils-ping \
		jq \
		less \
		libsqlite3-dev \
		lsb-release \
		man \
		net-tools \
		openssl \
		openssh-client \
		procps \
		rsync \
		software-properties-common \
		sqlite3 \
		unzip \
		vim \
		wget \
	&& apt autoremove --yes \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY data/get-docker.sh /usr/local/bin/get-docker.sh

RUN mkdir -p /root/.ssh \
	&& mkdir -p /root/.local/bin

COPY --from=builder /root/bin/dotfiles /root/.local/bin/dotfiles

RUN git clone https://github.com/juli3nk/dot-files.git /root/Dotfiles \
	&& /root/.local/bin/dotfiles -name Dotfiles -profile container -sync -force

CMD ["bash", "-l"]
