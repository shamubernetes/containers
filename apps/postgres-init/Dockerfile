FROM ghcr.io/kflix-tv/alpine:rolling@sha256:46b8b82c3bfcc181ab176cc3c6974edfa79aafebbff4aa93ec65a0d89b93ce46

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql16-client~"${VERSION}"

USER kflix

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"
