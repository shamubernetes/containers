FROM docker.io/library/alpine:3.20

LABEL author="shamubernetes"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/shamubernetes/containers/blob/main/apps/utils/README.md"

ARG TARGETPLATFORM
ARG VERSION
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