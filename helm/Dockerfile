FROM alpine:latest AS build

ARG HELM_VERSION

RUN apk --update add ca-certificates curl tar bzip2 \
    && curl -sSL https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar -xzC /tmp


FROM scratch

COPY --from=build /tmp/linux-amd64/helm /helm

ENTRYPOINT ["/helm"]
