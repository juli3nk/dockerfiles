FROM alpine AS builder

ARG VERSION=0.37.0

RUN apk --update add \
	ca-certificates \
	curl \
	tar

RUN curl -L https://github.com/percona/mongodb_exporter/releases/download/v${VERSION}/mongodb_exporter-${VERSION}.linux-amd64.tar.gz | tar -xzC /tmp


FROM alpine

RUN apk --update --no-cache add \
	bash

COPY docker-entrypoint.sh /usr/local/bin/
COPY --from=builder /tmp/mongodb_exporter-*/mongodb_exporter /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
