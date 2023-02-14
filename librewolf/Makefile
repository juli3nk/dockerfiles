
.PHONY: dev
dev:
	docker container run \
		-ti \
		--rm \
		-e XDG_RUNTIME_DIR=/tmp \
		-e WAYLAND_DISPLAY=$$WAYLAND_DISPLAY \
		--mount type=bind,src=$$XDG_RUNTIME_DIR/$$WAYLAND_DISPLAY,dst=/tmp/$$WAYLAND_DISPLAY \
		--device /dev/snd \
		-e PULSE_SERVER=unix:$$XDG_RUNTIME_DIR/pulse/native \
		--mount type=bind,src=$$XDG_RUNTIME_DIR/pulse/native,dst=$$XDG_RUNTIME_DIR/pulse/native \
		--mount type=bind,src=$$HOME/.config/pulse/cookie,dst=/home/user/.config/pulse/cookie \
		juli3nk/dev

.PHONY: build
build:
	docker image build \
		-t juli3nk/librewolf \
		.
