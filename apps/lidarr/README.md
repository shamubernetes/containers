<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/container/README.md.j2
-->
<div align="center">

# lidarr

</div>

Lidarr is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

## Custom environment configuration

This container support setting certain custom environment variables with the use of [drone/envsubst](https://github.com/drone/envsubst).

| Name                            | Default  |
|---------------------------------|----------|
| LIDARR__ANALYTICS_ENABLED       | `False`  |
| LIDARR__API_KEY                 |          |
| LIDARR__AUTHENTICATION_METHOD   | `None`   |
| LIDARR__AUTHENTICATION_REQUIRED |          |
| LIDARR__BRANCH                  | `master` |
| LIDARR__INSTANCE_NAME           | `Lidarr` |
| LIDARR__LOG_LEVEL               | `info`   |
| LIDARR__PORT                    | `8686`   |
| LIDARR__POSTGRES_HOST           |          |
| LIDARR__POSTGRES_MAIN_DB        |          |
| LIDARR__POSTGRES_LOG_DB         |          |
| LIDARR__POSTGRES_CACHE_DB       |          |
| LIDARR__POSTGRES_PASSWORD       |          |
| LIDARR__POSTGRES_PORT           | `5432`   |
| LIDARR__POSTGRES_USER           |          |
| LIDARR__URL_BASE                |          |