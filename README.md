<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/README.md.j2
-->
<div align="center">


## Containers

_An opinionated collection of container images_

</div>

<div align="center">

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/kflix-tv/containers/release-scheduled.yaml?style=for-the-badge&label=Scheduled%20Release)

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

Container | Channel | Image | Latest Tags
--- | --- | --- | ---
[actions-runner](https://github.com/kFlix-tv/containers/pkgs/container/actions-runner) | stable | ghcr.io/kFlix-tv/actions-runner |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.313](https://img.shields.io/badge/2.313-blue?style=flat-square) ![2.313.0](https://img.shields.io/badge/2.313.0-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[lidarr](https://github.com/kFlix-tv/containers/pkgs/container/lidarr) | master | ghcr.io/kFlix-tv/lidarr |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.1](https://img.shields.io/badge/2.1-blue?style=flat-square) ![2.1.7](https://img.shields.io/badge/2.1.7-blue?style=flat-square) ![2.1.7.4030](https://img.shields.io/badge/2.1.7.4030-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[lidarr-develop](https://github.com/kFlix-tv/containers/pkgs/container/lidarr-develop) | develop | ghcr.io/kFlix-tv/lidarr-develop |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.1](https://img.shields.io/badge/2.1-blue?style=flat-square) ![2.1.7](https://img.shields.io/badge/2.1.7-blue?style=flat-square) ![2.1.7.4030](https://img.shields.io/badge/2.1.7.4030-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[lidarr-nightly](https://github.com/kFlix-tv/containers/pkgs/container/lidarr-nightly) | nightly | ghcr.io/kFlix-tv/lidarr-nightly |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.2](https://img.shields.io/badge/2.2-blue?style=flat-square) ![2.2.0](https://img.shields.io/badge/2.2.0-blue?style=flat-square) ![2.2.0.4045](https://img.shields.io/badge/2.2.0.4045-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[par2cmdline-turbo](https://github.com/kFlix-tv/containers/pkgs/container/par2cmdline-turbo) | stable | ghcr.io/kFlix-tv/par2cmdline-turbo |![1.1.1](https://img.shields.io/badge/1.1.1-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[plex](https://github.com/kFlix-tv/containers/pkgs/container/plex) | stable | ghcr.io/kFlix-tv/plex |![1.40.0.7998-c29d4c0c8](https://img.shields.io/badge/1.40.0.7998--c29d4c0c8-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[plex-beta](https://github.com/kFlix-tv/containers/pkgs/container/plex-beta) | beta | ghcr.io/kFlix-tv/plex-beta |![1.40.0.7998-c29d4c0c8](https://img.shields.io/badge/1.40.0.7998--c29d4c0c8-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[postgres-init](https://github.com/kFlix-tv/containers/pkgs/container/postgres-init) | stable | ghcr.io/kFlix-tv/postgres-init |![16](https://img.shields.io/badge/16-blue?style=flat-square) ![16.2](https://img.shields.io/badge/16.2-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[prowlarr](https://github.com/kFlix-tv/containers/pkgs/container/prowlarr) | master | ghcr.io/kFlix-tv/prowlarr |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.13](https://img.shields.io/badge/1.13-blue?style=flat-square) ![1.13.3](https://img.shields.io/badge/1.13.3-blue?style=flat-square) ![1.13.3.4273](https://img.shields.io/badge/1.13.3.4273-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[prowlarr-develop](https://github.com/kFlix-tv/containers/pkgs/container/prowlarr-develop) | develop | ghcr.io/kFlix-tv/prowlarr-develop |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.13](https://img.shields.io/badge/1.13-blue?style=flat-square) ![1.13.3](https://img.shields.io/badge/1.13.3-blue?style=flat-square) ![1.13.3.4273](https://img.shields.io/badge/1.13.3.4273-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[prowlarr-nightly](https://github.com/kFlix-tv/containers/pkgs/container/prowlarr-nightly) | nightly | ghcr.io/kFlix-tv/prowlarr-nightly |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.14](https://img.shields.io/badge/1.14-blue?style=flat-square) ![1.14.1](https://img.shields.io/badge/1.14.1-blue?style=flat-square) ![1.14.1.4302](https://img.shields.io/badge/1.14.1.4302-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[radarr](https://github.com/kFlix-tv/containers/pkgs/container/radarr) | master | ghcr.io/kFlix-tv/radarr |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.3](https://img.shields.io/badge/5.3-blue?style=flat-square) ![5.3.6](https://img.shields.io/badge/5.3.6-blue?style=flat-square) ![5.3.6.8612](https://img.shields.io/badge/5.3.6.8612-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[radarr-develop](https://github.com/kFlix-tv/containers/pkgs/container/radarr-develop) | develop | ghcr.io/kFlix-tv/radarr-develop |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.3](https://img.shields.io/badge/5.3-blue?style=flat-square) ![5.3.6](https://img.shields.io/badge/5.3.6-blue?style=flat-square) ![5.3.6.8612](https://img.shields.io/badge/5.3.6.8612-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[radarr-nightly](https://github.com/kFlix-tv/containers/pkgs/container/radarr-nightly) | nightly | ghcr.io/kFlix-tv/radarr-nightly |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.4](https://img.shields.io/badge/5.4-blue?style=flat-square) ![5.4.0](https://img.shields.io/badge/5.4.0-blue?style=flat-square) ![5.4.0.8631](https://img.shields.io/badge/5.4.0.8631-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[readarr-develop](https://github.com/kFlix-tv/containers/pkgs/container/readarr-develop) | develop | ghcr.io/kFlix-tv/readarr-develop |![0](https://img.shields.io/badge/0-blue?style=flat-square) ![0.3](https://img.shields.io/badge/0.3-blue?style=flat-square) ![0.3.18](https://img.shields.io/badge/0.3.18-blue?style=flat-square) ![0.3.18.2411](https://img.shields.io/badge/0.3.18.2411-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[readarr-nightly](https://github.com/kFlix-tv/containers/pkgs/container/readarr-nightly) | nightly | ghcr.io/kFlix-tv/readarr-nightly |![0](https://img.shields.io/badge/0-blue?style=flat-square) ![0.3](https://img.shields.io/badge/0.3-blue?style=flat-square) ![0.3.19](https://img.shields.io/badge/0.3.19-blue?style=flat-square) ![0.3.19.2437](https://img.shields.io/badge/0.3.19.2437-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[sabnzbd](https://github.com/kFlix-tv/containers/pkgs/container/sabnzbd) | stable | ghcr.io/kFlix-tv/sabnzbd |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.2](https://img.shields.io/badge/4.2-blue?style=flat-square) ![4.2.2](https://img.shields.io/badge/4.2.2-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[sonarr](https://github.com/kFlix-tv/containers/pkgs/container/sonarr) | main | ghcr.io/kFlix-tv/sonarr |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square) ![4.0.1](https://img.shields.io/badge/4.0.1-blue?style=flat-square) ![4.0.1.929](https://img.shields.io/badge/4.0.1.929-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[sonarr-develop](https://github.com/kFlix-tv/containers/pkgs/container/sonarr-develop) | develop | ghcr.io/kFlix-tv/sonarr-develop |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square) ![4.0.1](https://img.shields.io/badge/4.0.1-blue?style=flat-square) ![4.0.1.1168](https://img.shields.io/badge/4.0.1.1168-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)
[tautulli](https://github.com/kFlix-tv/containers/pkgs/container/tautulli) | master | ghcr.io/kFlix-tv/tautulli |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.13](https://img.shields.io/badge/2.13-blue?style=flat-square) ![2.13.4](https://img.shields.io/badge/2.13.4-blue?style=flat-square) ![rolling](https://img.shields.io/badge/rolling-blue?style=flat-square)


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