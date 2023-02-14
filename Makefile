
.PHONY: hydroxide
hydroxide:
	docker image build -t \
		juli3nk/hydroxide \
		hydroxide/

.PHONY: mongodb_exporter
mongodb_exporter:
	docker image build \
		--build-arg "VERSION=${VERSION}" \
		-t juli3nk/mongodb_exporter:${VERSION} \
		mongodb_exporter/

.PHONY: mpd
mpd:
	docker image build -t juli3nk/mpd mpd/
