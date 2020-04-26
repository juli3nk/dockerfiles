FROM juliengk/dev

COPY data/profile/rvm.sh /etc/profile.d/rvm.sh

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		ruby \
	&& apt-get -y autoremove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	# RVM
	&& curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
	&& curl -L https://get.rvm.io | bash -s stable
