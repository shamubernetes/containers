<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/README.md.j2
-->

<div align="center">

## Containers

*An opinionated collection of container images*

</div>

<div align="center">

[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/shamubernetes/containers/release-scheduled.yaml?style=for-the-badge\&label=Scheduled%20Release)](https://github.com/shamubernetes/containers/actions/workflows/release-scheduled.yaml)

</div>

Welcome to our container images, if looking for a container start by [browsing the GitHub Packages page for this repo's packages](https://github.com/shamubernetes?tab=packages\&repo_name=containers).

## Mission statement

The goal of this project is to support [semantically versioned](https://semver.org/), [rootless](https://rootlesscontaine.rs/), and [multiple architecture](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/) containers for various applications.

We also try to adhere to a [KISS principle](https://en.wikipedia.org/wiki/KISS_principle), logging to stdout, [one process per container](https://testdriven.io/tips/59de3279-4a2d-4556-9cd0-b444249ed31e/), no [s6-overlay](https://github.com/just-containers/s6-overlay) and all images are built on top of [Alpine](https://hub.docker.com/_/alpine) or [Ubuntu](https://hub.docker.com/_/ubuntu).

## Tag immutability

The containers built here do not use immutable tags, as least not in the more common way you have seen from [linuxserver.io](https://fleet.linuxserver.io/) or [Bitnami](https://bitnami.com/stacks/containers).

We do take a similar approach but instead of appending a `-ls69` or `-r420` prefix to the tag we instead insist on pinning to the sha256 digest of the image, while this is not as pretty it is just as functional in making the images immutable.

| Container                                          | Immutable |
|----------------------------------------------------|-----------|
| `ghcr.io/shamubernetes/sonarr:rolling`                   | ❌         |
| `ghcr.io/shamubernetes/sonarr:3.0.8.1507`                | ❌         |
| `ghcr.io/shamubernetes/sonarr:rolling@sha256:8053...`    | ✅         |
| `ghcr.io/shamubernetes/sonarr:3.0.8.1507@sha256:8053...` | ✅         |

*If pinning an image to the sha256 digest, tools like [Renovate](https://github.com/renovatebot/renovate) support updating the container on a digest or application version change.*

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

### Application Images

Container | Channel | Image | Latest Tags
--- | --- | --- | ---
[actions-runner](https://github.com/shamubernetes/containers/pkgs/container/actions-runner) | stable | ghcr.io/shamubernetes/actions-runner |[![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/actions-runner/270227043?tag=2) [![2.319](https://img.shields.io/badge/2.319-blue?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/actions-runner/270227043?tag=2.319) [![2.319.1](https://img.shields.io/badge/2.319.1-blue?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/actions-runner/270227043?tag=2.319.1) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/actions-runner/270227043?tag=rolling)
[plex](https://github.com/shamubernetes/containers/pkgs/container/plex) | stable | ghcr.io/shamubernetes/plex |[![1.40.5.8921-836b34c27](https://img.shields.io/badge/1.40.5.8921--836b34c27-blue?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/plex/270227735?tag=1.40.5.8921-836b34c27) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/plex/270227735?tag=rolling)
[plex-beta](https://github.com/shamubernetes/containers/pkgs/container/plex-beta) | beta | ghcr.io/shamubernetes/plex-beta |[![1.41.0.8930-056c2ed26](https://img.shields.io/badge/1.41.0.8930--056c2ed26-blue?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/plex-beta/270227746?tag=1.41.0.8930-056c2ed26) [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/plex-beta/270227746?tag=rolling)

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

## Deprecations

Containers here can be **deprecated** at any point, this could be for any reason described below.

1. The upstream application is **no longer actively developed**
2. The upstream application has an **official upstream container** that follows closely to the mission statement described here
3. The upstream application has been **replaced with a better alternative**
4. The **maintenance burden** of keeping the container here **is too bothersome**

**Note**: Deprecated containers will remained published to this repo for 6 months after which they will be pruned.

## Credits

A lot of inspiration and ideas are thanks to the hard work of [hotio.dev](https://hotio.dev/) and [linuxserver.io](https://www.linuxserver.io/) contributors.