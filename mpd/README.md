# MPD

```shell
mpd() {
	docker container run -ti \
		--rm \
		--mount type=bind,src=${HOME}/Data/mpd/mpd.conf,dst=/etc/mpd.conf,ro \
		--mount type=bind,src=${HOME}/Data/mpd/playlists,dst=/var/lib/mpd/playlists \
		--device /dev/snd \
		-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
		-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
		-v ${HOME}/.config/pulse/cookie:/root/.config/pulse/cookie \
		--name mpd \
		alpine:3.12
}
mpc() {
	docker container exec -t mpd mpc "$@"
}
```
