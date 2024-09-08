ARG VERSION
FROM ghcr.io/actions/actions-runner:${VERSION}
LABEL author="shamubernetes"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/shamubernetes/containers/blob/main/apps/actions-runner/README.md"


ENV HOMEBREW_NO_ANALYTICS=1 \
  HOMEBREW_NO_ENV_HINTS=1 \
  HOMEBREW_NO_INSTALL_CLEANUP=1 \
  DEBCONF_NONINTERACTIVE_SEEN=true \
  DEBIAN_FRONTEND="noninteractive" \
  APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

USER root

RUN \
  apt-get update && apt-get upgrade -y \
  && \
  apt-get install -y --no-install-recommends --no-install-suggests \
      apt-transport-https \
      ca-certificates \
      curl \
      gcc \
      git \
      gpg \
      jo \
      jq \
      moreutils \
      pass \
      unrar \
      unzip \
      wget \
      zip \
  && \
  curl -fsSL https://baltocdn.com/helm/signing.asc | gpg --dearmor | dd of=/usr/share/keyrings/helm.gpg && \
  curl -fsSL https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | dd of=/etc/apt/keyrings/mise-archive-keyring.gpg && \
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
  chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg /etc/apt/keyrings/mise-archive-keyring.gpg /usr/share/keyrings/helm.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list > /dev/null && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg] https://mise.jdx.dev/deb stable main" | tee /etc/apt/sources.list.d/mise.list > /dev/null && \
  apt-get update && \
  apt-get install -y --no-install-recommends gh mise helm && \
  rm -rf /var/lib/apt/lists/*

USER runner

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
