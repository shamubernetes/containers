FROM ghcr.io/kflix-tv/alpine:rolling@sha256:20e664caabd79bd2545f3f84b04484f498c5df1a294b4346f8ea5edb42833b36

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql16-client~"${VERSION}"

USER kflix

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"
