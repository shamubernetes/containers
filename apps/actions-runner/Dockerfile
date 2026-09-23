ARG VERSION
FROM ghcr.io/home-operations/actions-runner:${VERSION}

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL
# renovate: datasource=github-releases depName=docker/compose
ARG COMPOSE_VERSION=v5.5.1
ARG COMPOSE_SHA256=db1889184726840f75c4f9c001048430d4f25b3be3cb084d3ddd762bc0aed576

# Tool cache versions the MaudeCode workflows request (actions/setup-node, setup-python,
# ruby/setup-ruby). A job asking for another version still downloads it as before.
# renovate: datasource=node-version depName=node
ARG NODE24_VERSION=24.21.0
ARG NODE24_SHA256=6e1db87ef58b8819e5d5402eff1536491b18edd8eb7bee5ef7897876e88dc5ff
ARG NODE22_VERSION=22.23.3
ARG NODE22_SHA256=1084aa36196bba4c3a5e69a1ee388a6e4ff729dad09445fbcd434b28fe3c24af
ARG PYTHON_RELEASE=3.13.15-31064747964
ARG PYTHON_SHA256=4e544242f8a4ef647a6f511b67f9b00eefc9ef366644e3c40a27a6eff709ae2b
ARG RUBY_VERSION=3.3.12
ARG RUBY_SHA256=3fa2d6242e105a65f694fae86e9f68d9617c827fc14d1fcf611035b9ae2cbdb8

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

# ARC mounts /home/runner/_work as a volume, so the default _work/_tool cache would hide
# anything baked in; the runner uses RUNNER_TOOL_CACHE when it is set.
ENV RUNNER_TOOL_CACHE=/opt/hostedtoolcache \
    AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache

#hadolint ignore=DL3003
RUN \
    set -eu \
    && for pair in "${NODE24_VERSION}:${NODE24_SHA256}" "${NODE22_VERSION}:${NODE22_SHA256}"; do \
        version="${pair%%:*}" && sha="${pair#*:}" \
        && curl -fsSL -o /tmp/node.tar.gz "https://nodejs.org/dist/v${version}/node-v${version}-linux-x64.tar.gz" \
        && echo "${sha}  /tmp/node.tar.gz" | sha256sum --check --status \
        && install -d "${RUNNER_TOOL_CACHE}/node/${version}/x64" \
        && tar -xzf /tmp/node.tar.gz -C "${RUNNER_TOOL_CACHE}/node/${version}/x64" --strip-components=1 \
        && "${RUNNER_TOOL_CACHE}/node/${version}/x64/bin/node" --version \
        && touch "${RUNNER_TOOL_CACHE}/node/${version}/x64.complete" \
        || exit 1; \
    done \
    && curl -fsSL -o /tmp/python.tar.gz \
        "https://github.com/actions/python-versions/releases/download/${PYTHON_RELEASE}/python-${PYTHON_RELEASE%%-*}-linux-24.04-x64.tar.gz" \
    && echo "${PYTHON_SHA256}  /tmp/python.tar.gz" | sha256sum --check --status \
    && install -d /tmp/python && tar -xzf /tmp/python.tar.gz -C /tmp/python \
    && (cd /tmp/python && bash ./setup.sh) \
    && curl -fsSL -o /tmp/ruby.tar.gz \
        "https://github.com/ruby/ruby-builder/releases/download/ruby-${RUBY_VERSION}/ruby-${RUBY_VERSION}-ubuntu-24.04-x64.tar.gz" \
    && echo "${RUBY_SHA256}  /tmp/ruby.tar.gz" | sha256sum --check --status \
    && install -d "${RUNNER_TOOL_CACHE}/Ruby/${RUBY_VERSION}" \
    && tar -xzf /tmp/ruby.tar.gz -C "${RUNNER_TOOL_CACHE}/Ruby/${RUBY_VERSION}" \
    && touch "${RUNNER_TOOL_CACHE}/Ruby/${RUBY_VERSION}/x64.complete" \
    && chown -R runner:runner "${RUNNER_TOOL_CACHE}" \
    && rm -rf /tmp/*

USER runner
