ARG VERSION
FROM docker.io/library/alpine:3.22@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1

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