FROM debian:stable-slim

RUN apt update \
	&& apt install --no-install-recommends -y \
		ca-certificates \
		mpd \
		mpc \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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

ENTRYPOINT ["mpd", "--stdout", "--no-daemon"]
