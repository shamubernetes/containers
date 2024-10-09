FROM docker.io/library/golang:1.23-bookworm AS envsubst
ARG VERSION
ARG TARGETOS
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETVARIANT=""
ENV CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}

RUN go install -ldflags="-s -w" github.com/drone/envsubst/cmd/envsubst@latest \
    && chmod +x /go/bin/envsubst

FROM mcr.microsoft.com/powershell:7.4-ubuntu-22.04

ARG VERSION

LABEL author="shamubernetes"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/shamubernetes/containers/blob/main/apps/posterizarr/README.md"

ARG CHANNEL
ARG PUID=568 \
    PGID=568 \
    USER="posterizarr" \
    HOMEDIR="/app" \
    CONFIGDIR="/config" \
    ASSETDIR="/assets"

ENV DEBCONF_NONINTERACTIVE_SEEN="true" \
    DEBIAN_FRONTEND="noninteractive" \
    UMASK="0002" \
    TZ="Etc/UTC"

USER root
WORKDIR /imagemagick

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        curl \
        git \
        wget \
        catatonit \
    && \
    for deb in $(curl -s https://api.github.com/repos/vintagesucks/imagemagick-deb/releases/latest | grep browser_download_url | cut -d '"' -f 4); do \
        if [[ $deb == *jammy_amd64.deb* ]]; then \
            wget -q $deb -O $(basename $deb); \
        fi; \
      done \
    && \
    apt-get install -y ./libde265_*.deb && \
    apt-get install -y ./libheif_*.deb && \
    apt-get install -y ./imagemagick_*.deb && \
    ldconfig /usr/local/lib/ \
    && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf \
          /tmp/* \
          /var/lib/apt/lists/* \
          /var/tmp/ \
          /imagemagick/* \
    && \
    useradd -u "${PUID}" -m "${USER}" -d ${HOMEDIR} -U && \
    mkdir \
          /config \
          /assets \
    && \
    chown -R "${USER}":"${USER}" \
          "${HOMEDIR}" \
          /config \
          /assets \
    && \
    pwsh -Command "Install-Module -Name FanartTvAPI -Force -SkipPublisherCheck -AllowPrerelease -Scope AllUsers"

WORKDIR /config
VOLUME ["/config"]

COPY --from=envsubst /go/bin/envsubst /usr/local/bin/envsubst

USER ${USER}

# RUN git clone https://github.com/fscorrupt/posterizarr.git /tmp/poster && \
#     mv /tmp/poster/* /app && \
#     rm -rf /tmp/poster && \
#     mkdir -p /app/config

COPY ./apps/posterizarr/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/usr/bin/catatonit", "--" ]
CMD ["/entrypoint.sh"]
