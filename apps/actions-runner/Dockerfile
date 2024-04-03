ARG VERSION
FROM ghcr.io/actions/actions-runner:${VERSION}
LABEL author="kiliantyler"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/kFlix-tv/containers/blob/main/apps/actions-runner/README.md"


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
  apt-get install -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  curl \
  gcc \
  git \
  gpg \
  jo \
  jq \
  moreutils \
  unrar \
  unzip \
  wget \
  zip \
  && rm -rf /var/lib/apt/lists/*

RUN \
  curl -fsSL https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
  && apt-get update \
  && apt-get -y --no-install-recommends install helm \
  && rm -rf /var/lib/apt/lists/*

RUN \
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt-get update \
  && apt-get install -y --no-install-recommends gh \
  && rm -rf /var/lib/apt/lists/*

RUN \
  curl https://github.com/mikefarah/yq/releases/v4.42.1/download/yq_linux_amd64 -o /usr/bin/yq \
  && chmod +x /usr/bin/yq

USER runner

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
