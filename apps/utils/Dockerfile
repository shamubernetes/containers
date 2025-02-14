ARG VERSION
FROM docker.io/library/alpine:3.21@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

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