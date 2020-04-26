FROM debian:stable-slim

COPY data/profile/dotfiles.sh /etc/profile.d/dotfiles.sh
COPY data/get-docker.sh /usr/local/bin/get-docker.sh

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		apt-transport-https \
		build-essential \
		bzip2 \
		ca-certificates \
		curl \
		dirmngr \
		git \
		gnupg \
		iproute2 \
		iptables \
		iputils-ping \
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
	&& apt-get -y autoremove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /root/.ssh \
	&& mkdir /root/bin \
	&& git clone https://github.com/juli3nk/dot-files.git /root/Dotfiles \
	&& curl -sfL https://raw.githubusercontent.com/juli3nk/dotfiles/master/misc/get-dotfiles.sh > /root/bin/get-dotfiles.sh \
	&& chmod +x /root/bin/get-dotfiles.sh \
	&& chmod +x /usr/local/bin/get-docker.sh \
	&& /root/bin/get-dotfiles.sh

CMD ["bash", "-l"]
