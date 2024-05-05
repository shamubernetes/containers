<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/container/README.md.j2
-->
<div align="center">

# Sonarr

</div>

Sonarr is a PVR for Usenet and BitTorrent users.

## Custom environment configuration

This container support setting certain custom environment variables with the use of [drone/envsubst](https://github.com/drone/envsubst).

| Name                            | Default  |
|---------------------------------|----------|
| SONARR__ANALYTICS_ENABLED       | `False`  |
| SONARR__API_KEY                 |          |
| SONARR__AUTHENTICATION_METHOD   | `None`   |
| SONARR__AUTHENTICATION_REQUIRED |          |
| SONARR__BRANCH                  | `main`   |
| SONARR__INSTANCE_NAME           | `sonarr` |
| SONARR__LOG_LEVEL               | `info`   |
| SONARR__PORT                    | `8989`   |
| SONARR__POSTGRES_HOST           |          |
| SONARR__POSTGRES_MAIN_DB        |          |
| SONARR__POSTGRES_LOG_DB         |          |
| SONARR__POSTGRES_PASSWORD       |          |
| SONARR__POSTGRES_PORT           | `5432`   |
| SONARR__POSTGRES_USER           |          |
| SONARR__URL_BASE                |          |

## Tags

#### Stable



[![4](https://img.shields.io/badge/4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=4)
 [![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=4.0)
 [![4.0.1](https://img.shields.io/badge/4.0.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/183231238?tag=4.0.1)
 [![4.0.1.929](https://img.shields.io/badge/4.0.1.929-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/183231238?tag=4.0.1.929)
 [![4.0.2](https://img.shields.io/badge/4.0.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/186049998?tag=4.0.2)
 [![4.0.2.1183](https://img.shields.io/badge/4.0.2.1183-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/186049998?tag=4.0.2.1183)
 [![4.0.3](https://img.shields.io/badge/4.0.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/197958105?tag=4.0.3)
 [![4.0.3.1413](https://img.shields.io/badge/4.0.3.1413-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/197958105?tag=4.0.3.1413)
 [![4.0.4](https://img.shields.io/badge/4.0.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=4.0.4)
 [![4.0.4.1491](https://img.shields.io/badge/4.0.4.1491-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=4.0.4.1491)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr/203353251?tag=rolling)

#### Develop



 [![4](https://img.shields.io/badge/4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/212176728?tag=4)
 [![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/212176728?tag=4.0)
 [![4.0.1](https://img.shields.io/badge/4.0.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/183231251?tag=4.0.1)
 [![4.0.1.1131](https://img.shields.io/badge/4.0.1.1131-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/180447533?tag=4.0.1.1131)
 [![4.0.1.1168](https://img.shields.io/badge/4.0.1.1168-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/183231251?tag=4.0.1.1168)
 [![4.0.2](https://img.shields.io/badge/4.0.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/196839023?tag=4.0.2)
 [![4.0.2.1192](https://img.shields.io/badge/4.0.2.1192-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/185973226?tag=4.0.2.1192)
 [![4.0.2.1223](https://img.shields.io/badge/4.0.2.1223-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/186050029?tag=4.0.2.1223)
 [![4.0.2.1262](https://img.shields.io/badge/4.0.2.1262-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/186059142?tag=4.0.2.1262)
 [![4.0.2.1312](https://img.shields.io/badge/4.0.2.1312-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/188995127?tag=4.0.2.1312)
 [![4.0.2.1341](https://img.shields.io/badge/4.0.2.1341-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/190794004?tag=4.0.2.1341)
 [![4.0.2.1367](https://img.shields.io/badge/4.0.2.1367-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/194364246?tag=4.0.2.1367)
 [![4.0.2.1408](https://img.shields.io/badge/4.0.2.1408-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/196839023?tag=4.0.2.1408)
 [![4.0.3](https://img.shields.io/badge/4.0.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/203230292?tag=4.0.3)
 [![4.0.3.1442](https://img.shields.io/badge/4.0.3.1442-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/201101695?tag=4.0.3.1442)
 [![4.0.3.1465](https://img.shields.io/badge/4.0.3.1465-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/201723826?tag=4.0.3.1465)
 [![4.0.3.1486](https://img.shields.io/badge/4.0.3.1486-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/203230292?tag=4.0.3.1486)
 [![4.0.4](https://img.shields.io/badge/4.0.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/212176728?tag=4.0.4)
 [![4.0.4.1515](https://img.shields.io/badge/4.0.4.1515-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/204144281?tag=4.0.4.1515)
 [![4.0.4.1572](https://img.shields.io/badge/4.0.4.1572-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/209347366?tag=4.0.4.1572)
 [![4.0.4.1616](https://img.shields.io/badge/4.0.4.1616-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/212176728?tag=4.0.4.1616)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/sonarr-develop/212176728?tag=rolling)
