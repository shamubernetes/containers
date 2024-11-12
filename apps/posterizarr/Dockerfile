FROM mcr.microsoft.com/powershell:7.4-ubuntu-22.04@sha256:c8aa33a15f970bf8706cd8e630b020493468081adae0ba32ca44585ca3022038

ARG VERSION

LABEL author="shamubernetes"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/shamubernetes/containers/blob/main/apps/posterizarr/README.md"

ARG CHANNEL
ARG PUID=568 \
    PGID=568 \
    # intentionally set to a user that _does not_ get
    # the /config directory in the Posterizarr.ps1 script
    # https://github.com/fscorrupt/Posterizarr/blob/main/Posterizarr.ps1#L69
    USER="posterizarr_user" \
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
        wget moreutils \
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

WORKDIR ${HOMEDIR}
USER ${USER}

RUN git clone https://github.com/fscorrupt/posterizarr.git /tmp/posterizarr && \
    mv /tmp/posterizarr/* ${HOMEDIR} && \
    rm -rf /tmp/posterizarr && \
    # generate the defaults
    pwsh -Command "/app/Posterizarr.ps1 -Manual" && \
    # Posterizarr doesn't work well with spaces, and the default
    # font it ships with doesn't copy properly...
    cp ${HOMEDIR}/*.ttf ${HOMEDIR}/config && \
    rm -rf ${HOMEDIR}/config/Logs ${HOMEDIR}/config/temp

COPY ./apps/posterizarr/scripts /scripts
COPY ./apps/posterizarr/entrypoint.sh /entrypoint.sh

VOLUME ["${CONFIGDIR}", "${ASSETDIR}"]
ENTRYPOINT [ "/usr/bin/catatonit", "--" ]
CMD ["/entrypoint.sh"]