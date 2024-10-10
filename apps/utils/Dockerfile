FROM docker.io/library/alpine:3.20@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d

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