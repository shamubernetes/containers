ARG VERSION
FROM docker.io/library/alpine:3.21@sha256:b6a6be0ff92ab6db8acd94f5d1b7a6c2f0f5d10ce3c24af348d333ac6da80685

ARG VERSION

LABEL author="shamubernetes"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/shamubernetes/containers/blob/main/apps/utils/README.md"

ARG TARGETPLATFORM
ARG CHANNEL

USER root
WORKDIR /util

USER root

RUN \
    apk add --no-cache \
        bash zsh \
        ca-certificates \
        catatonit \
        curl git \
        jq nano \
        moreutils wget

COPY ./apps/utils/functions /util/functions
COPY ./apps/utils/lib /util/lib
COPY ./apps/utils/entrypoint.zsh /util/entrypoint.zsh

USER nobody:nogroup

ENTRYPOINT [ "/usr/bin/catatonit", "--", "/util/entrypoint.zsh"]