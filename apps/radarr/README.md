<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/container/README.md.j2
-->
<div align="center">

# radarr

</div>

Radarr is a fork of Sonarr for tracking and automatically downloading movies from Usenet and BitTorrent.

## Custom environment configuration

This container support setting certain custom environment variables with the use of [drone/envsubst](https://github.com/drone/envsubst).

| Name                            | Default  |
|---------------------------------|----------|
| RADARR__ANALYTICS_ENABLED       | `False`  |
| RADARR__API_KEY                 |          |
| RADARR__AUTHENTICATION_METHOD   | `None`   |
| RADARR__AUTHENTICATION_REQUIRED |          |
| RADARR__BRANCH                  | `master` |
| RADARR__INSTANCE_NAME           | `Radarr` |
| RADARR__LOG_LEVEL               | `info`   |
| RADARR__PORT                    | `7878`   |
| RADARR__POSTGRES_HOST           |          |
| RADARR__POSTGRES_MAIN_DB        |          |
| RADARR__POSTGRES_LOG_DB         |          |
| RADARR__POSTGRES_CACHE_DB       |          |
| RADARR__POSTGRES_PASSWORD       |          |
| RADARR__POSTGRES_PORT           | `5432`   |
| RADARR__POSTGRES_USER           |          |
| RADARR__URL_BASE                |          |