FROM golang:alpine AS builder

ARG VERSION=0.2.21

RUN set -x \
	&& apk --update --no-cache add \
		ca-certificates \
		curl \
		gcc \
		git \
		musl-dev \
		tar

RUN curl -L https://github.com/emersion/hydroxide/releases/download/v${VERSION}/hydroxide-${VERSION}.tar.gz | tar -xzC /tmp

RUN echo 'nobody:x:65534:65534:nobody:/:' > /tmp/passwd \
	&& echo 'nobody:x:65534:' > /tmp/group

WORKDIR /tmp/hydroxide-${VERSION}/cmd/hydroxide

ENV GO111MODULE on
RUN go mod download
RUN go build -ldflags "-linkmode external -extldflags -static -s -w" -o /tmp/hydroxide


FROM scratch

COPY --from=builder /tmp/group /tmp/passwd /etc/
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=builder /tmp/hydroxide /hydroxide

USER nobody:nobody

ENTRYPOINT ["/hydroxide"]
