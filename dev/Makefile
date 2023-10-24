IMAGE_NAME := "juli3nk/dev"

ANSIBLE_VERSION := "4.10.0"


.PHONY: images
images:
	@docker image ls -f "reference=$(IMAGE_NAME)"

.PHONY: image-update
image-update:
	docker image pull debian:stable-slim

.PHONY: main
main: image-update
	docker image build --no-cache -t $(IMAGE_NAME) .

.PHONY: user
user: image-update
	docker image build --no-cache -t $(IMAGE_NAME):user -f Dockerfile.user .

.PHONY: golang
golang:
	docker image build --no-cache -t $(IMAGE_NAME):go -f Dockerfile.golang .

.PHONY: nodejs
nodejs:
	docker image build --no-cache -t $(IMAGE_NAME):nodejs-18 -f Dockerfile.nodejs .

.PHONY: nodejs-user
nodejs-user:
	docker image build \
		--no-cache \
		--build-arg "tag=user" \
		--build-arg "user=user" \
		-t $(IMAGE_NAME):nodejs-user \
		-f Dockerfile.nodejs .

.PHONY: python
python:
	docker image build --no-cache -t $(IMAGE_NAME):python -f Dockerfile.python .

.PHONY: grpc-py
grpc-py:
	docker image build --no-cache -t $(IMAGE_NAME):grpc-py -f Dockerfile.grpc-py .

.PHONY: ruby
ruby:
	docker image build --no-cache -t $(IMAGE_NAME):ruby -f Dockerfile.ruby .

.PHONY: hugo
hugo:
	docker image build --no-cache -t $(IMAGE_NAME):hugo -f Dockerfile.hugo .

.PHONY: arduino
arduino:
	docker image build --no-cache -t $(IMAGE_NAME):arduino -f Dockerfile.arduino .

.PHONY: shellcheck
shellcheck:
  @for file in $(shell find . -type f -executable -not -path "./.git/*"); do \
    echo "Validating : $$file"; \
    docker container run --rm --mount type=bind,src=$$PWD,dst=/mnt,ro koalaman/shellcheck -e SC2086 -e SC2046 -e SC1090 "$$file"; \
    if [ $$? -gt 0 ]; then \
            continue; \
    fi; \
  done;

.PHONY: dockerlint
dockerlint:
  @for file in $(shell find . -name 'Dockerfile*'); do \
    echo "Validating : $$file"; \
    docker container run -i --rm hadolint/hadolint hadolint --ignore DL3006 --ignore DL3008 --ignore DL3009 --ignore DL3018 --ignore DL3013 --ignore DL4006 - < $$file; \
  done;

.DEFAULT_GOAL := main
