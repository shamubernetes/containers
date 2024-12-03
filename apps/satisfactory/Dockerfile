FROM docker.io/library/golang:1.23-bookworm@sha256:5790223e33cc64091874361ba799d5c192dbe521893e4544d646cf1ec7f82eb9 AS envsubst
ARG VERSION
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""
ARG TARGETPLATFORM
ENV CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}

RUN go install -ldflags="-s -w" github.com/drone/envsubst/cmd/envsubst@latest \
    && chmod +x /go/bin/envsubst


FROM docker.io/library/ubuntu:24.04@sha256:80dd3c3b9c6cecb9f1667e9290b3bc61b78c2678c02cbdae5f0fea92cc6734ab

ARG VERSION

LABEL author="shamubernetes"
LABEL version="${VERSION}"
LABEL documentation="https://github.com/shamubernetes/containers/blob/main/apps/steamcmd/README.md"

ARG TARGETPLATFORM
ARG CHANNEL
ARG PUID=568 \
    PGID=568 \
    HOMEDIR="/app" \
    CONFIGDIR="/config"

ENV DEBCONF_NONINTERACTIVE_SEEN="true" \
    DEBIAN_FRONTEND="noninteractive" \
    USER="steam" \
    STEAMCMDDIR="${HOMEDIR}/steamcmd" \
    GAMECONFIGDIR="${CONFIGDIR}/gamefiles/FactoryGame/Saved" \
    GAMESAVESDIR="${HOMEDIR}/.config/Epic/FactoryGame/Saved/SaveGames" \
    UMASK="0002" \
    TZ="Etc/UTC" \
    STEAMAPPID="1690800"

USER root
WORKDIR /app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      lib32gcc-s1 \
      ca-certificates \
      curl \
      locales \
      catatonit \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && useradd -u "${PUID}" -m "${USER}" -d ${HOMEDIR} -U \
    && chown -R "${USER}":"${USER}" "${HOMEDIR}" \
    && su "${USER}" -c \
      "mkdir -p \"${STEAMCMDDIR}\" \
                  && curl -fsSL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar xvzf - -C \"${STEAMCMDDIR}\" \
                  && ${STEAMCMDDIR}/steamcmd.sh +quit \
                  && ln -s \"${STEAMCMDDIR}/linux32/steamclient.so\" \"${STEAMCMDDIR}/steamservice.so\" \
                  && mkdir -p \"${HOMEDIR}/.steam/sdk32\" \
                  && ln -s \"${STEAMCMDDIR}/linux32/steamclient.so\" \"${HOMEDIR}/.steam/sdk32/steamclient.so\" \
                  && ln -s \"${STEAMCMDDIR}/linux32/steamcmd\" \"${STEAMCMDDIR}/linux32/steam\" \
                  && mkdir -p \"${HOMEDIR}/.steam/sdk64\" \
                  && ln -s \"${STEAMCMDDIR}/linux64/steamclient.so\" \"${HOMEDIR}/.steam/sdk64/steamclient.so\" \
                  && ln -s \"${STEAMCMDDIR}/linux64/steamcmd\" \"${STEAMCMDDIR}/linux64/steam\" \
                  && ln -s \"${STEAMCMDDIR}/steamcmd.sh\" \"${STEAMCMDDIR}/steam.sh\"" \
    && ln -s "${STEAMCMDDIR}/linux64/steamclient.so" "/usr/lib/x86_64-linux-gnu/steamclient.so" \
    && \
    rm -rf \
          /tmp/* \
          /var/lib/apt/lists/* \
          /var/tmp/

COPY --from=envsubst /go/bin/envsubst /usr/local/bin/envsubst

USER ${USER}
WORKDIR /config
VOLUME ["/config"]

RUN /app/steamcmd/steamcmd.sh +force_install_dir /config/gamefiles +login anonymous +app_update "$STEAMAPPID" -beta "$CHANNEL" validate +quit

COPY ./apps/satisfactory/scripts /app/scripts
COPY ./apps/satisfactory/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/usr/bin/catatonit", "--" ]
CMD ["/entrypoint.sh"]
