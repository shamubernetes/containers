ARG VERSION
FROM docker.io/library/golang:1.23-alpine@sha256:383395b794dffa5b53012a212365d40c8e37109a626ca30d6151c8348d380b5f AS envsubst
ARG VERSION
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""
ARG TARGETPLATFORM
ENV CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}
RUN go install -ldflags="-s -w" github.com/drone/envsubst/cmd/envsubst@latest


FROM docker.io/library/alpine:3.21@sha256:48b0309ca019d89d40f670aa1bc06e426dc0931948452e8491e3d65087abc07d

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

LABEL author="shamubernetes"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/shamubernetes/containers/blob/main/apps/whisparr/README.md"

ENV \
    COMPlus_EnableDiagnostics="0" \
    WHISPARR__INSTANCE_NAME="Whisparr" \
    WHISPARR__BRANCH="${CHANNEL}" \
    WHISPARR__PORT="6969" \
    WHISPARR__ANALYTICS_ENABLED="False"

ENV UMASK="0002" \
    TZ="Etc/UTC"

USER root
WORKDIR /app

#hadolint ignore=DL3018,DL3059
RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        coreutils \
        curl \
        icu-libs \
        jo \
        jq \
        libintl \
        nano \
        sqlite-libs \
        trurl \
        tzdata \
        xmlstarlet \
    && \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='x64' ;; \
        'linux/arm64') export ARCH='arm64' ;; \
    esac \
    && \
    mkdir -p /app/bin \
    && \
    if [ "${WHISPARR__BRANCH}" = 'eros' ]; then \
        asset="Whisparr.eros.${VERSION}.linux-musl-${ARCH}.tar.gz"; \
        curl --fail --silent --show-error --location \
            --retry 5 --retry-delay 2 --retry-all-errors \
            --output /tmp/eros-release.json \
            "https://api.github.com/repos/Whisparr/Whisparr-Eros/releases/tags/v${VERSION}"; \
        asset_count=$(jq --arg asset "${asset}" '[.assets[] | select(.name == $asset)] | length' /tmp/eros-release.json); \
        [ "${asset_count}" -eq 1 ]; \
        download_url=$(jq --exit-status --raw-output --arg asset "${asset}" '.assets[] | select(.name == $asset) | .browser_download_url' /tmp/eros-release.json); \
        digest=$(jq --exit-status --raw-output --arg asset "${asset}" '.assets[] | select(.name == $asset) | .digest | select(test("^sha256:[0-9a-f]{64}$"))' /tmp/eros-release.json); \
        curl --fail --silent --show-error --location \
            --retry 5 --retry-delay 2 --retry-all-errors \
            --output /tmp/whisparr.tar.gz "${download_url}"; \
        printf '%s  %s\n' "${digest#sha256:}" /tmp/whisparr.tar.gz > /tmp/whisparr.sha256; \
        sha256sum --check --status /tmp/whisparr.sha256; \
    else \
        curl --fail --silent --show-error --location \
            --retry 5 --retry-delay 2 --retry-all-errors \
            --output /tmp/whisparr.tar.gz \
            "https://whisparr.servarr.com/v1/update/${WHISPARR__BRANCH}/updatefile?version=${VERSION}&os=linuxmusl&runtime=netcore&arch=${ARCH}"; \
    fi \
    && \
    tar xzf /tmp/whisparr.tar.gz -C /app/bin --strip-components=1 \
    && \
    rm -rf /app/bin/Whisparr.Update \
    && \
    printf "UpdateMethod=docker\nBranch=%s\nPackageVersion=%s\nPackageAuthor=[shamubernetes](https://github.com/shamubernetes)\n" "${WHISPARR__BRANCH}" "${VERSION}" > /app/package_info \
    && \
    chown -R root:root /app && chmod -R 755 /app \
    && \
    rm -rf /tmp/*

COPY ./apps/whisparr/config.xml.tmpl /app/config.xml.tmpl
COPY ./apps/whisparr/entrypoint.sh /entrypoint.sh
COPY --from=envsubst /go/bin/envsubst /usr/local/bin/envsubst

USER nobody:nogroup
WORKDIR /config
VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/Whisparr"