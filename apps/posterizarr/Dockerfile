FROM mcr.microsoft.com/powershell:7.4-ubuntu-22.04@sha256:756dae797891cecc5a732c87695dc984c81b5ef755060c15073191996f71fc92

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
        curl nano \
        git jq \
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
          /configtmp \
    && \
    chown -R "${USER}":"${USER}" \
          "${HOMEDIR}" \
          /config \
          /configtmp \
          /assets \
    && \
    pwsh -Command "Install-Module -Name FanartTvAPI -Force -SkipPublisherCheck -AllowPrerelease -Scope AllUsers"

WORKDIR /config
VOLUME ["/config"]

USER ${USER}

RUN git clone https://github.com/fscorrupt/posterizarr.git /tmp/poster && \
    mv /tmp/poster/* /app && \
    rm -rf /tmp/poster && \
    pwsh -Command "/app/Posterizarr.ps1 -Manual" && \
    # this allows users to mount the entire /config directory
    # and still have the default config files available
    # these get copied back to /config in the entrypoint
    mv /config/* /configtmp && \
    cp /app/*.ttf /configtmp

COPY ./apps/posterizarr/scripts /scripts
COPY ./apps/posterizarr/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/usr/bin/catatonit", "--" ]
CMD ["/entrypoint.sh"]
