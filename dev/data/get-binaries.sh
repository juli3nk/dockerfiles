#!/usr/bin/env bash

LOCAL_BIN_PATH="${HOME}/.local/bin"

get_latest_tag() {
  local repo_url="$1"

  git ls-remote --tags "https://${repo_url}.git" | grep -v "{}" | awk -F'/' '{ print $3 }' | sort -V | tail -n 1 | sed 's/^v//'
}


mkdir -p "$LOCAL_BIN_PATH"

# Kubectl
curl -sfL "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /tmp/kubectl

CS=$(curl -sfL "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256")
echo "${CS} /tmp/kubectl" | sha256sum -c > /dev/null

if [ "$?" -eq 0 ]; then
  mv /tmp/kubectl "$LOCAL_BIN_PATH"
  chmod +x "${LOCAL_BIN_PATH}/kubectl"
else
  echo -e "checksum error"
fi

# Helm
HELM_LATEST_VERSION="$(get_latest_tag "github.com/helm/helm")"

curl -sSL "https://get.helm.sh/helm-v${HELM_LATEST_VERSION}-linux-amd64.tar.gz" | tar -xzC /tmp
mv /tmp/linux-amd64/helm "${LOCAL_BIN_PATH}/helm"
rm -rf /tmp/linux-amd64
