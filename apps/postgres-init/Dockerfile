FROM ghcr.io/kflix-tv/alpine:rolling@sha256:591137e89f2b0b7beb8797842b85319aac40cd99dcf2e553d87163da5f9a6a8b

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql16-client~"${VERSION}"

USER kflix

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"
