ARG VERSION
FROM ghcr.io/home-operations/actions-runner:${VERSION}

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL
# renovate: datasource=github-releases depName=docker/compose
ARG COMPOSE_VERSION=v5.5.1
ARG COMPOSE_SHA256=db1889184726840f75c4f9c001048430d4f25b3be3cb084d3ddd762bc0aed576

LABEL author="shamubernetes"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/shamubernetes/containers/blob/main/apps/actions-runner/README.md"

USER root

# Tools the MaudeCode pool jobs otherwise install on every run: zsh and the node-pty
# toolchain (make, g++, python3), Ruby for release tooling, and the Compose CLI plugin
# (the base Docker CLI ships Buildx only). The pod's dind daemon is unchanged.
#hadolint ignore=DL3008
RUN \
    apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends --no-install-suggests \
        g++ \
        make \
        python3 \
        ruby \
        zsh \
    && install -d -m 755 /usr/local/lib/docker/cli-plugins \
    && curl -fsSL -o /usr/local/lib/docker/cli-plugins/docker-compose \
        "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-linux-x86_64" \
    && echo "${COMPOSE_SHA256}  /usr/local/lib/docker/cli-plugins/docker-compose" | sha256sum --check --status \
    && chmod 755 /usr/local/lib/docker/cli-plugins/docker-compose \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER runner
