<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/container/README.md.j2
-->
<div align="center">

# Lidarr

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

## Tags

#### Stable



[![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=2)
 [![2.1](https://img.shields.io/badge/2.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/192950216?tag=2.1)
 [![2.1.7](https://img.shields.io/badge/2.1.7-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/192950216?tag=2.1.7)
 [![2.1.7.4030](https://img.shields.io/badge/2.1.7.4030-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/192950216?tag=2.1.7.4030)
 [![2.2](https://img.shields.io/badge/2.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=2.2)
 [![2.2.5](https://img.shields.io/badge/2.2.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=2.2.5)
 [![2.2.5.4141](https://img.shields.io/badge/2.2.5.4141-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=2.2.5.4141)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr/203275589?tag=rolling)

#### Develop



 [![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/212220514?tag=2)
 [![2.1](https://img.shields.io/badge/2.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/180440111?tag=2.1)
 [![2.1.7](https://img.shields.io/badge/2.1.7-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/180440111?tag=2.1.7)
 [![2.1.7.4030](https://img.shields.io/badge/2.1.7.4030-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/180440111?tag=2.1.7.4030)
 [![2.2](https://img.shields.io/badge/2.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/203275573?tag=2.2)
 [![2.2.0](https://img.shields.io/badge/2.2.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/186050007?tag=2.2.0)
 [![2.2.0.4045](https://img.shields.io/badge/2.2.0.4045-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/185973217?tag=2.2.0.4045)
 [![2.2.0.4053](https://img.shields.io/badge/2.2.0.4053-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/186050007?tag=2.2.0.4053)
 [![2.2.1](https://img.shields.io/badge/2.2.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/188987620?tag=2.2.1)
 [![2.2.1.4073](https://img.shields.io/badge/2.2.1.4073-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/188987620?tag=2.2.1.4073)
 [![2.2.2](https://img.shields.io/badge/2.2.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/191950569?tag=2.2.2)
 [![2.2.2.4090](https://img.shields.io/badge/2.2.2.4090-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/191950569?tag=2.2.2.4090)
 [![2.2.3](https://img.shields.io/badge/2.2.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/192003326?tag=2.2.3)
 [![2.2.3.4098](https://img.shields.io/badge/2.2.3.4098-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/192003326?tag=2.2.3.4098)
 [![2.2.5](https://img.shields.io/badge/2.2.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/203275573?tag=2.2.5)
 [![2.2.5.4141](https://img.shields.io/badge/2.2.5.4141-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/203275573?tag=2.2.5.4141)
 [![2.3](https://img.shields.io/badge/2.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/212220514?tag=2.3)
 [![2.3.0](https://img.shields.io/badge/2.3.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/209361617?tag=2.3.0)
 [![2.3.0.4159](https://img.shields.io/badge/2.3.0.4159-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/209361617?tag=2.3.0.4159)
 [![2.3.1](https://img.shields.io/badge/2.3.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/212176750?tag=2.3.1)
 [![2.3.1.4171](https://img.shields.io/badge/2.3.1.4171-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/212176750?tag=2.3.1.4171)
 [![2.3.2](https://img.shields.io/badge/2.3.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/212220514?tag=2.3.2)
 [![2.3.2.4183](https://img.shields.io/badge/2.3.2.4183-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/212220514?tag=2.3.2.4183)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-develop/212220514?tag=rolling)

#### Nightly



 [![2](https://img.shields.io/badge/2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/215057332?tag=2)
 [![2.2](https://img.shields.io/badge/2.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/202718448?tag=2.2)
 [![2.2.0](https://img.shields.io/badge/2.2.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/183231222?tag=2.2.0)
 [![2.2.0.4045](https://img.shields.io/badge/2.2.0.4045-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/180440117?tag=2.2.0.4045)
 [![2.2.0.4053](https://img.shields.io/badge/2.2.0.4053-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/183231222?tag=2.2.0.4053)
 [![2.2.1](https://img.shields.io/badge/2.2.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/186050033?tag=2.2.1)
 [![2.2.1.4062](https://img.shields.io/badge/2.2.1.4062-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/185973218?tag=2.2.1.4062)
 [![2.2.1.4073](https://img.shields.io/badge/2.2.1.4073-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/186050033?tag=2.2.1.4073)
 [![2.2.2](https://img.shields.io/badge/2.2.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/188855484?tag=2.2.2)
 [![2.2.2.4075](https://img.shields.io/badge/2.2.2.4075-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/186095522?tag=2.2.2.4075)
 [![2.2.2.4076](https://img.shields.io/badge/2.2.2.4076-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/186216599?tag=2.2.2.4076)
 [![2.2.2.4083](https://img.shields.io/badge/2.2.2.4083-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/188492017?tag=2.2.2.4083)
 [![2.2.2.4085](https://img.shields.io/badge/2.2.2.4085-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/188518348?tag=2.2.2.4085)
 [![2.2.2.4090](https://img.shields.io/badge/2.2.2.4090-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/188855484?tag=2.2.2.4090)
 [![2.2.3](https://img.shields.io/badge/2.2.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/191082814?tag=2.2.3)
 [![2.2.3.4092](https://img.shields.io/badge/2.2.3.4092-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/189018517?tag=2.2.3.4092)
 [![2.2.3.4093](https://img.shields.io/badge/2.2.3.4093-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/189030159?tag=2.2.3.4093)
 [![2.2.3.4095](https://img.shields.io/badge/2.2.3.4095-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/189074377?tag=2.2.3.4095)
 [![2.2.3.4098](https://img.shields.io/badge/2.2.3.4098-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/191082814?tag=2.2.3.4098)
 [![2.2.4](https://img.shields.io/badge/2.2.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/200506345?tag=2.2.4)
 [![2.2.4.4100](https://img.shields.io/badge/2.2.4.4100-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/192010172?tag=2.2.4.4100)
 [![2.2.4.4115](https://img.shields.io/badge/2.2.4.4115-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/197835180?tag=2.2.4.4115)
 [![2.2.4.4116](https://img.shields.io/badge/2.2.4.4116-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/197854827?tag=2.2.4.4116)
 [![2.2.4.4120](https://img.shields.io/badge/2.2.4.4120-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/200382726?tag=2.2.4.4120)
 [![2.2.4.4125](https://img.shields.io/badge/2.2.4.4125-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/200442155?tag=2.2.4.4125)
 [![2.2.4.4128](https://img.shields.io/badge/2.2.4.4128-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/200450159?tag=2.2.4.4128)
 [![2.2.4.4130](https://img.shields.io/badge/2.2.4.4130-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/200506345?tag=2.2.4.4130)
 [![2.2.5](https://img.shields.io/badge/2.2.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/202718448?tag=2.2.5)
 [![2.2.5.4133](https://img.shields.io/badge/2.2.5.4133-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/201034645?tag=2.2.5.4133)
 [![2.2.5.4138](https://img.shields.io/badge/2.2.5.4138-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/201783534?tag=2.2.5.4138)
 [![2.2.5.4139](https://img.shields.io/badge/2.2.5.4139-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/202718448?tag=2.2.5.4139)
 [![2.3](https://img.shields.io/badge/2.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/215057332?tag=2.3)
 [![2.3.0](https://img.shields.io/badge/2.3.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/206324853?tag=2.3.0)
 [![2.3.0.4143](https://img.shields.io/badge/2.3.0.4143-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/203474308?tag=2.3.0.4143)
 [![2.3.0.4156](https://img.shields.io/badge/2.3.0.4156-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/206171721?tag=2.3.0.4156)
 [![2.3.0.4159](https://img.shields.io/badge/2.3.0.4159-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/206324853?tag=2.3.0.4159)
 [![2.3.1](https://img.shields.io/badge/2.3.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/209299249?tag=2.3.1)
 [![2.3.1.4167](https://img.shields.io/badge/2.3.1.4167-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/206611999?tag=2.3.1.4167)
 [![2.3.1.4171](https://img.shields.io/badge/2.3.1.4171-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/209299249?tag=2.3.1.4171)
 [![2.3.2](https://img.shields.io/badge/2.3.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/212155532?tag=2.3.2)
 [![2.3.2.4178](https://img.shields.io/badge/2.3.2.4178-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/209424263?tag=2.3.2.4178)
 [![2.3.2.4183](https://img.shields.io/badge/2.3.2.4183-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/212155532?tag=2.3.2.4183)
 [![2.3.3](https://img.shields.io/badge/2.3.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/215057332?tag=2.3.3)
 [![2.3.3.4189](https://img.shields.io/badge/2.3.3.4189-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/212227438?tag=2.3.3.4189)
 [![2.3.3.4191](https://img.shields.io/badge/2.3.3.4191-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/213960408?tag=2.3.3.4191)
 [![2.3.3.4192](https://img.shields.io/badge/2.3.3.4192-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/214353356?tag=2.3.3.4192)
 [![2.3.3.4196](https://img.shields.io/badge/2.3.3.4196-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/214558107?tag=2.3.3.4196)
 [![2.3.3.4197](https://img.shields.io/badge/2.3.3.4197-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/214700103?tag=2.3.3.4197)
 [![2.3.3.4199](https://img.shields.io/badge/2.3.3.4199-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/214945919?tag=2.3.3.4199)
 [![2.3.3.4200](https://img.shields.io/badge/2.3.3.4200-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/215057332?tag=2.3.3.4200)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/lidarr-nightly/215057332?tag=rolling)
