ARG VERSION
FROM docker.io/library/golang:1.23-alpine@sha256:6c5c9590f169f77c8046e45c611d3b28fe477789acd8d3762d23d4744de69812 AS envsubst
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


FROM docker.io/library/alpine:3.21@sha256:b97e2a89d0b9e4011bb88c02ddf01c544b8c781acf1f4d559e7c8f12f1047ac3

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
    curl -fsSL "https://whisparr.servarr.com/v1/update/${WHISPARR__BRANCH}/updatefile?version=${VERSION}&os=linuxmusl&runtime=netcore&arch=${ARCH}" \
        | tar xzf - -C /app/bin --strip-components=1 \
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

LABEL org.opencontainers.image.source="https://github.com/Whisparr/Whisparr"