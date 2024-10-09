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
    ASSETDIR="/assets" \
    IMAGEMAGICK_VERSION="7.1.1-39"

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
        autoconf automake autopoint \
        autotools-dev build-essential \
        chrpath cm-super-minimal curl \
        debhelper dh-autoreconf dh-exec \
        dh-strip-nondeterminism doxygen doxygen-latex \
        dwz gettext gir1.2-harfbuzz-0.0 \
        gir1.2-pango-1.0 git graphviz \
        icu-devtools intltool-debian jdupes \
        libann0 libarchive-zip-perl libbz2-dev \
        libcdt5 libcgraph6 \
        libclang-cpp11 libclang1-11 \
        libdatrie-dev libdebhelper-perl libdeflate-dev \
        libdjvulibre-dev libexif-dev libexif12 \
        libfftw3-bin libfftw3-dev libfftw3-long3 \
        libfftw3-quad3 libfftw3-single3 libfile-stripnondeterminism-perl \
        libfribidi-dev libgraphite2-dev libgts-0.7-5 \
        libgvc6 libgvpr2 libharfbuzz-dev \
        libharfbuzz-gobject0 libicu-dev libilmbase-dev \
        libjbig-dev libjpeg-dev \
        liblab-gamut1 liblcms2-dev liblqr-1-0-dev \
        libltdl-dev liblzma-dev libmime-charset-perl \
        libopenexr-dev libpango1.0-dev libpangoxft-1.0-0 \
        libpathplan4 libperl-dev libpng-dev \
        librsvg2-bin libsigsegv2 libsombok3 \
        libsub-override-perl libthai-dev libtiff-dev \
        libtiffxx5 libtool libunicode-linebreak-perl \
        libwmf-dev libxapian30 libxft-dev \
        libxml2-dev libxml2-utils libxt-dev \
        m4 pango1.0-tools pkg-config \
        pkg-kde-tools po-debconf texlive-extra-utils \
        texlive-luatex wget xsltproc \
        catatonit \
    && \
    wget https://github.com/ImageMagick/ImageMagick/archive/refs/tags/${IMAGEMAGICK_VERSION}.tar.gz && \
    tar xzf ${IMAGEMAGICK_VERSION}.tar.gz && \
    rm ${IMAGEMAGICK_VERSION}.tar.gz && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf \
          /tmp/* \
          /var/lib/apt/lists/* \
          /var/tmp/ \
    && \
    useradd -u "${PUID}" -m "${USER}" -d ${HOMEDIR} -U \
    && chown -R "${USER}":"${USER}" "${HOMEDIR}" && \
    mkdir /config /assets

RUN sh ./ImageMagick-${IMAGEMAGICK_VERSION}/configure \
                                --prefix=/usr/local \
                                --with-bzlib \
                                --with-djvu \
                                --with-dps \
                                --with-fftw \
                                --with-flif \
                                --with-fontconfig \
                                --with-fpx \
                                --with-freetype \
                                --with-gs-font-dir \
                                --with-gslib \
                                --with-gvc \
                                --with-heic \
                                --with-jbig \
                                --with-jp2 \
                                --with-jpeg \
                                --with-jxl \
                                --with-magick-plus-plus \
                                --with-openexr \
                                --with-openjp2 \
                                --with-openmp \
                                --with-pango \
                                --with-png \
                                --with-raqm \
                                --with-raw \
                                --with-rsvg \
                                --with-tcmalloc \
                                --with-tiff \
                                --with-uhdr \
                                --with-webp \
                                --with-xml \
                                --with-zip \
                                --with-zlib \
                                --with-zstd \
    && \
    make -j && \
    make install && \
    ldconfig /usr/local/lib/

WORKDIR /config
VOLUME ["/config"]

RUN \
  pwsh -Command "Install-Module -Name FanartTvAPI -Force -SkipPublisherCheck -AllowPrerelease -Scope AllUsers"

COPY --from=envsubst /go/bin/envsubst /usr/local/bin/envsubst

USER ${USER}

RUN git clone https://github.com/fscorrupt/Posterizarrr.git /app && \
    mkdir -p /app/config

ENTRYPOINT [ "bash" ]
