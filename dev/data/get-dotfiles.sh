#!/usr/bin/env bash

DOTFILES_PATH="${HOME}/bin/dotfiles"
DOTFILES_URL="https://github.com/juli3nk/dotfiles"

get_latest_tag() {
	git ls-remote --tags ${DOTFILES_URL}.git | grep -v "{}" | awk -F'/' '{ print $3 }' | sort -V | tail -n 1
}

LATEST_TAG=$(get_latest_tag)

curl -sSL ${DOTFILES_URL}/releases/download/${LATEST_TAG}/dotfiles-linux-amd64 -o ${DOTFILES_PATH}
chmod +x ${DOTFILES_PATH}
