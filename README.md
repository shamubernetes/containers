<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/README.md.j2
-->
<div align="center">


## Containers

_An opinionated collection of container images_

</div>

<div align="center">

[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/kflix-tv/containers/release-scheduled.yaml?style=for-the-badge&label=Scheduled%20Release)](https://github.com/kflix-tv/containers/actions/workflows/release-scheduled.yaml)

</div>

Welcome to our container images, if looking for a container start by [browsing the GitHub Packages page for this repo's packages](https://github.com/kflix-tv?tab=packages&repo_name=containers).

## Mission statement

The goal of this project is to support [semantically versioned](https://semver.org/), [rootless](https://rootlesscontaine.rs/), and [multiple architecture](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/) containers for various applications.

We also try to adhere to a [KISS principle](https://en.wikipedia.org/wiki/KISS_principle), logging to stdout, [one process per container](https://testdriven.io/tips/59de3279-4a2d-4556-9cd0-b444249ed31e/), no [s6-overlay](https://github.com/just-containers/s6-overlay) and all images are built on top of [Alpine](https://hub.docker.com/_/alpine) or [Ubuntu](https://hub.docker.com/_/ubuntu).

## Tag immutability

The containers built here do not use immutable tags, as least not in the more common way you have seen from [linuxserver.io](https://fleet.linuxserver.io/) or [Bitnami](https://bitnami.com/stacks/containers).

We do take a similar approach but instead of appending a `-ls69` or `-r420` prefix to the tag we instead insist on pinning to the sha256 digest of the image, while this is not as pretty it is just as functional in making the images immutable.

| Container                                          | Immutable |
|----------------------------------------------------|-----------|
| `ghcr.io/kflix-tv/sonarr:rolling`                   | ❌         |
| `ghcr.io/kflix-tv/sonarr:3.0.8.1507`                | ❌         |
| `ghcr.io/kflix-tv/sonarr:rolling@sha256:8053...`    | ✅         |
| `ghcr.io/kflix-tv/sonarr:3.0.8.1507@sha256:8053...` | ✅         |

_If pinning an image to the sha256 digest, tools like [Renovate](https://github.com/renovatebot/renovate) support updating the container on a digest or application version change._

## Passing arguments to a application

Some applications do not support defining configuration via environment variables and instead only allow certain config to be set in the command line arguments for the app. To circumvent this, for applications that have an `entrypoint.sh` read below.

1. First read the Kubernetes docs on [defining command and arguments for a Container](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/).
2. Look up the documentation for the application and find a argument you would like to set.
3. Set the argument in the `args` section, be sure to include `entrypoint.sh` as the first arg and any application specific arguments thereafter.

    ```yaml
    args:
      - /entrypoint.sh
      - --port
      - "8080"
    ```

## Configuration volume

For applications that need to have persistent configuration data the config volume is hardcoded to `/config` inside the container. This is not able to be changed in most cases.

## Available Images

Each Image will be built with a `rolling` tag, along with tags specific to it's version. Available Images Below


### Base Images

All Base Images are configured with a non-root user (kflix:kflix), and exposed /config volume, and use tini as an entrypoint to ensure proper signal handling.

Container | Channel | Image | Latest Tags
--- | --- | --- | ---
[alpine](https://github.com/kflix-tv/containers/pkgs/container/alpine) | 3.19 | ghcr.io/kflix-tv/alpine |[![3.19.1](https://img.shields.io/badge/3.19.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/alpine/186048568?tag=3.19.1) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/alpine/186048568?tag=rolling)
[ubuntu](https://github.com/kflix-tv/containers/pkgs/container/ubuntu) | jammy | ghcr.io/kflix-tv/ubuntu |[![jammy-20240427](https://img.shields.io/badge/jammy--20240427-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/ubuntu/211029161?tag=jammy-20240427) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/ubuntu/211029161?tag=rolling)



### Application Images

Container | Channel | Image | Latest Tags
--- | --- | --- | ---
[actions-runner](https://github.com/kflix-tv/containers/pkgs/container/actions-runner) | stable | ghcr.io/kflix-tv/actions-runner |[![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/actions-runner/211421431?tag=2) [![2.316](https://img.shields.io/badge/2.316-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/actions-runner/211421431?tag=2.316) [![2.316.1](https://img.shields.io/badge/2.316.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/actions-runner/211421431?tag=2.316.1) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/actions-runner/211421431?tag=rolling)
[lidarr](https://github.com/kflix-tv/containers/pkgs/container/lidarr) | master | ghcr.io/kflix-tv/lidarr |[![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=2) [![2.2](https://img.shields.io/badge/2.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=2.2) [![2.2.5](https://img.shields.io/badge/2.2.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=2.2.5) [![2.2.5.4141](https://img.shields.io/badge/2.2.5.4141-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=2.2.5.4141) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=rolling)
[lidarr-develop](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop) | develop | ghcr.io/kflix-tv/lidarr-develop |[![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/209361617?tag=2) [![2.3](https://img.shields.io/badge/2.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/209361617?tag=2.3) [![2.3.0](https://img.shields.io/badge/2.3.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/209361617?tag=2.3.0) [![2.3.0.4159](https://img.shields.io/badge/2.3.0.4159-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/209361617?tag=2.3.0.4159) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/209361617?tag=rolling)
[lidarr-nightly](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly) | nightly | ghcr.io/kflix-tv/lidarr-nightly |[![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/209424263?tag=2) [![2.3](https://img.shields.io/badge/2.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/209424263?tag=2.3) [![2.3.2](https://img.shields.io/badge/2.3.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/209424263?tag=2.3.2) [![2.3.2.4178](https://img.shields.io/badge/2.3.2.4178-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/209424263?tag=2.3.2.4178) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/209424263?tag=rolling)
[par2cmdline-turbo](https://github.com/kflix-tv/containers/pkgs/container/par2cmdline-turbo) | stable | ghcr.io/kflix-tv/par2cmdline-turbo |[![1.1.1](https://img.shields.io/badge/1.1.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/par2cmdline-turbo/185973205?tag=1.1.1) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/par2cmdline-turbo/185973205?tag=rolling)
[plex](https://github.com/kflix-tv/containers/pkgs/container/plex) | stable | ghcr.io/kflix-tv/plex |[![1.40.2.8395-c67dce28e](https://img.shields.io/badge/1.40.2.8395--c67dce28e-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/plex/205662901?tag=1.40.2.8395-c67dce28e) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/plex/205662901?tag=rolling)
[plex-beta](https://github.com/kflix-tv/containers/pkgs/container/plex-beta) | beta | ghcr.io/kflix-tv/plex-beta |[![1.40.2.8395-c67dce28e](https://img.shields.io/badge/1.40.2.8395--c67dce28e-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/plex-beta/205681441?tag=1.40.2.8395-c67dce28e) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/plex-beta/205681441?tag=rolling)
[postgres-init](https://github.com/kflix-tv/containers/pkgs/container/postgres-init) | stable | ghcr.io/kflix-tv/postgres-init |[![16](https://img.shields.io/badge/16-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/postgres-init/186050041?tag=16) [![16.2](https://img.shields.io/badge/16.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/postgres-init/186050041?tag=16.2) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/postgres-init/186050041?tag=rolling)
[prowlarr](https://github.com/kflix-tv/containers/pkgs/container/prowlarr) | master | ghcr.io/kflix-tv/prowlarr |[![1](https://img.shields.io/badge/1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr/206246684?tag=1) [![1.16](https://img.shields.io/badge/1.16-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr/206246684?tag=1.16) [![1.16.2](https://img.shields.io/badge/1.16.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr/206246684?tag=1.16.2) [![1.16.2.4435](https://img.shields.io/badge/1.16.2.4435-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr/206246684?tag=1.16.2.4435) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr/206246684?tag=rolling)
[prowlarr-develop](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-develop) | develop | ghcr.io/kflix-tv/prowlarr-develop |[![1](https://img.shields.io/badge/1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-develop/209403323?tag=1) [![1.17](https://img.shields.io/badge/1.17-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-develop/209403323?tag=1.17) [![1.17.0](https://img.shields.io/badge/1.17.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-develop/209403323?tag=1.17.0) [![1.17.0.4448](https://img.shields.io/badge/1.17.0.4448-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-develop/209403323?tag=1.17.0.4448) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-develop/209403323?tag=rolling)
[prowlarr-nightly](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-nightly) | nightly | ghcr.io/kflix-tv/prowlarr-nightly |[![1](https://img.shields.io/badge/1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-nightly/211483623?tag=1) [![1.17](https://img.shields.io/badge/1.17-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-nightly/211483623?tag=1.17) [![1.17.1](https://img.shields.io/badge/1.17.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-nightly/211483623?tag=1.17.1) [![1.17.1.4483](https://img.shields.io/badge/1.17.1.4483-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-nightly/211483623?tag=1.17.1.4483) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/prowlarr-nightly/211483623?tag=rolling)
[radarr](https://github.com/kflix-tv/containers/pkgs/container/radarr) | master | ghcr.io/kflix-tv/radarr |[![5](https://img.shields.io/badge/5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=5) [![5.4](https://img.shields.io/badge/5.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=5.4) [![5.4.6](https://img.shields.io/badge/5.4.6-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=5.4.6) [![5.4.6.8723](https://img.shields.io/badge/5.4.6.8723-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=5.4.6.8723) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=rolling)
[radarr-develop](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop) | develop | ghcr.io/kflix-tv/radarr-develop |[![5](https://img.shields.io/badge/5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=5) [![5.5](https://img.shields.io/badge/5.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=5.5) [![5.5.1](https://img.shields.io/badge/5.5.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=5.5.1) [![5.5.1.8747](https://img.shields.io/badge/5.5.1.8747-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=5.5.1.8747) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=rolling)
[radarr-nightly](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly) | nightly | ghcr.io/kflix-tv/radarr-nightly |[![5](https://img.shields.io/badge/5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/210974777?tag=5) [![5.5](https://img.shields.io/badge/5.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/210974777?tag=5.5) [![5.5.2](https://img.shields.io/badge/5.5.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/210974777?tag=5.5.2) [![5.5.2.8766](https://img.shields.io/badge/5.5.2.8766-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/210974777?tag=5.5.2.8766) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/210974777?tag=rolling)
[readarr-develop](https://github.com/kflix-tv/containers/pkgs/container/readarr-develop) | develop | ghcr.io/kflix-tv/readarr-develop |[![0](https://img.shields.io/badge/0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-develop/209370862?tag=0) [![0.3](https://img.shields.io/badge/0.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-develop/209370862?tag=0.3) [![0.3.24](https://img.shields.io/badge/0.3.24-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-develop/209370862?tag=0.3.24) [![0.3.24.2510](https://img.shields.io/badge/0.3.24.2510-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-develop/209370862?tag=0.3.24.2510) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-develop/209370862?tag=rolling)
[readarr-nightly](https://github.com/kflix-tv/containers/pkgs/container/readarr-nightly) | nightly | ghcr.io/kflix-tv/readarr-nightly |[![0](https://img.shields.io/badge/0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-nightly/206636134?tag=0) [![0.3](https://img.shields.io/badge/0.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-nightly/206636134?tag=0.3) [![0.3.25](https://img.shields.io/badge/0.3.25-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-nightly/206636134?tag=0.3.25) [![0.3.25.2515](https://img.shields.io/badge/0.3.25.2515-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-nightly/206636134?tag=0.3.25.2515) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/readarr-nightly/206636134?tag=rolling)
[sabnzbd](https://github.com/kflix-tv/containers/pkgs/container/sabnzbd) | stable | ghcr.io/kflix-tv/sabnzbd |[![4](https://img.shields.io/badge/4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sabnzbd/212040885?tag=4) [![4.3](https://img.shields.io/badge/4.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sabnzbd/212040885?tag=4.3) [![4.3.1](https://img.shields.io/badge/4.3.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sabnzbd/212040885?tag=4.3.1) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sabnzbd/212040885?tag=rolling)
[sonarr](https://github.com/kflix-tv/containers/pkgs/container/sonarr) | main | ghcr.io/kflix-tv/sonarr |[![4](https://img.shields.io/badge/4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=4) [![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=4.0) [![4.0.4](https://img.shields.io/badge/4.0.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=4.0.4) [![4.0.4.1491](https://img.shields.io/badge/4.0.4.1491-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=4.0.4.1491) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=rolling)
[sonarr-develop](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop) | develop | ghcr.io/kflix-tv/sonarr-develop |[![4](https://img.shields.io/badge/4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/209347366?tag=4) [![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/209347366?tag=4.0) [![4.0.4](https://img.shields.io/badge/4.0.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/209347366?tag=4.0.4) [![4.0.4.1572](https://img.shields.io/badge/4.0.4.1572-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/209347366?tag=4.0.4.1572) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/209347366?tag=rolling)
[tautulli](https://github.com/kflix-tv/containers/pkgs/container/tautulli) | master | ghcr.io/kflix-tv/tautulli |[![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/tautulli/186050039?tag=2) [![2.13](https://img.shields.io/badge/2.13-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/tautulli/186050039?tag=2.13) [![2.13.4](https://img.shields.io/badge/2.13.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/tautulli/186050039?tag=2.13.4) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/tautulli/186050039?tag=rolling)


## Contributing

1. Install [Docker](https://docs.docker.com/get-docker/), [Taskfile](https://taskfile.dev/) & [Cuelang](https://cuelang.org/)
2. Get familiar with the structure of the repositroy
3. Find a similar application in the apps directory
4. Copy & Paste an application and update the directory name
5. Update `metadata.json`, `Dockerfile`, `ci/latest.sh`, `ci/goss.yaml` and make it suit the application build
6. Include any additional files if required
7. Use Taskfile to build and test your image

    ```ruby
    task APP=sonarr CHANNEL=main test
    ```

### Automated tags

Here's an example of how tags are created in the GitHub workflows, be careful with `metadata.json` as it does affect the outcome of how the tags will be created when the application is built.

| Application | Channel   | Stable  | Base    | Generated Tag               |
|-------------|-----------|---------|---------|-----------------------------|
| `ubuntu`    | `focal`   | `true`  | `true`  | `ubuntu:focal-rolling`      |
| `ubuntu`    | `focal`   | `true`  | `true`  | `ubuntu:focal-19880312`     |
| `alpine`    | `3.16`    | `true`  | `true`  | `alpine:rolling`            |
| `alpine`    | `3.16`    | `true`  | `true`  | `alpine:3.16.0`             |
| `sonarr`    | `develop` | `false` | `false` | `sonarr-develop:3.0.8.1538` |
| `sonarr`    | `develop` | `false` | `false` | `sonarr-develop:rolling`    |
| `sonarr`    | `main`    | `true`  | `false` | `sonarr:3.0.8.1507`         |
| `sonarr`    | `main`    | `true`  | `false` | `sonarr:rolling`            |

## Deprecations

Containers here can be **deprecated** at any point, this could be for any reason described below.

1. The upstream application is **no longer actively developed**
2. The upstream application has an **official upstream container** that follows closely to the mission statement described here
3. The upstream application has been **replaced with a better alternative**
4. The **maintenance burden** of keeping the container here **is too bothersome**

**Note**: Deprecated containers will remained published to this repo for 6 months after which they will be pruned.
## Credits

A lot of inspiration and ideas are thanks to the hard work of [hotio.dev](https://hotio.dev/) and [linuxserver.io](https://www.linuxserver.io/) contributors.