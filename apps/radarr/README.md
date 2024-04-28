<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/container/README.md.j2
-->
<div align="center">

# Radarr

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

## Tags

#### Stable



[![5](https://img.shields.io/badge/5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=5)
 [![5.3](https://img.shields.io/badge/5.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/186050012?tag=5.3)
 [![5.3.6](https://img.shields.io/badge/5.3.6-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/186050012?tag=5.3.6)
 [![5.3.6.8612](https://img.shields.io/badge/5.3.6.8612-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/186050012?tag=5.3.6.8612)
 [![5.4](https://img.shields.io/badge/5.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=5.4)
 [![5.4.6](https://img.shields.io/badge/5.4.6-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=5.4.6)
 [![5.4.6.8723](https://img.shields.io/badge/5.4.6.8723-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=5.4.6.8723)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr/203281057?tag=rolling)

#### Develop



 [![5](https://img.shields.io/badge/5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=5)
 [![5.3](https://img.shields.io/badge/5.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/183231234?tag=5.3)
 [![5.3.6](https://img.shields.io/badge/5.3.6-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/183231234?tag=5.3.6)
 [![5.3.6.8612](https://img.shields.io/badge/5.3.6.8612-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/183231234?tag=5.3.6.8612)
 [![5.4](https://img.shields.io/badge/5.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/203281110?tag=5.4)
 [![5.4.0](https://img.shields.io/badge/5.4.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/186050021?tag=5.4.0)
 [![5.4.0.8636](https://img.shields.io/badge/5.4.0.8636-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/186050021?tag=5.4.0.8636)
 [![5.4.1](https://img.shields.io/badge/5.4.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/186081764?tag=5.4.1)
 [![5.4.1.8654](https://img.shields.io/badge/5.4.1.8654-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/186081764?tag=5.4.1.8654)
 [![5.4.2](https://img.shields.io/badge/5.4.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/191950540?tag=5.4.2)
 [![5.4.2.8667](https://img.shields.io/badge/5.4.2.8667-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/191950540?tag=5.4.2.8667)
 [![5.4.3](https://img.shields.io/badge/5.4.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/192003329?tag=5.4.3)
 [![5.4.3.8677](https://img.shields.io/badge/5.4.3.8677-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/192003329?tag=5.4.3.8677)
 [![5.4.4](https://img.shields.io/badge/5.4.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/197764274?tag=5.4.4)
 [![5.4.4.8688](https://img.shields.io/badge/5.4.4.8688-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/197764274?tag=5.4.4.8688)
 [![5.4.5](https://img.shields.io/badge/5.4.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/200533712?tag=5.4.5)
 [![5.4.5.8715](https://img.shields.io/badge/5.4.5.8715-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/200533712?tag=5.4.5.8715)
 [![5.4.6](https://img.shields.io/badge/5.4.6-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/203281110?tag=5.4.6)
 [![5.4.6.8723](https://img.shields.io/badge/5.4.6.8723-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/203281110?tag=5.4.6.8723)
 [![5.5](https://img.shields.io/badge/5.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=5.5)
 [![5.5.0](https://img.shields.io/badge/5.5.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/206403684?tag=5.5.0)
 [![5.5.0.8730](https://img.shields.io/badge/5.5.0.8730-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/206403684?tag=5.5.0.8730)
 [![5.5.1](https://img.shields.io/badge/5.5.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=5.5.1)
 [![5.5.1.8747](https://img.shields.io/badge/5.5.1.8747-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=5.5.1.8747)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-develop/209403312?tag=rolling)

#### Nightly



 [![5](https://img.shields.io/badge/5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/208523546?tag=5)
 [![5.4](https://img.shields.io/badge/5.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/202214609?tag=5.4)
 [![5.4.0](https://img.shields.io/badge/5.4.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/183231232?tag=5.4.0)
 [![5.4.0.8613](https://img.shields.io/badge/5.4.0.8613-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/180440952?tag=5.4.0.8613)
 [![5.4.0.8616](https://img.shields.io/badge/5.4.0.8616-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/180875882?tag=5.4.0.8616)
 [![5.4.0.8625](https://img.shields.io/badge/5.4.0.8625-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/181779078?tag=5.4.0.8625)
 [![5.4.0.8631](https://img.shields.io/badge/5.4.0.8631-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/181882614?tag=5.4.0.8631)
 [![5.4.0.8633](https://img.shields.io/badge/5.4.0.8633-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/181988952?tag=5.4.0.8633)
 [![5.4.0.8634](https://img.shields.io/badge/5.4.0.8634-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/182562993?tag=5.4.0.8634)
 [![5.4.0.8636](https://img.shields.io/badge/5.4.0.8636-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/183231232?tag=5.4.0.8636)
 [![5.4.1](https://img.shields.io/badge/5.4.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/186081765?tag=5.4.1)
 [![5.4.1.8637](https://img.shields.io/badge/5.4.1.8637-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/183863527?tag=5.4.1.8637)
 [![5.4.1.8642](https://img.shields.io/badge/5.4.1.8642-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/184870200?tag=5.4.1.8642)
 [![5.4.1.8651](https://img.shields.io/badge/5.4.1.8651-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/185973228?tag=5.4.1.8651)
 [![5.4.1.8654](https://img.shields.io/badge/5.4.1.8654-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/186050031?tag=5.4.1.8654)
 [![5.4.1.8656](https://img.shields.io/badge/5.4.1.8656-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/186081765?tag=5.4.1.8656)
 [![5.4.2](https://img.shields.io/badge/5.4.2-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/188542026?tag=5.4.2)
 [![5.4.2.8657](https://img.shields.io/badge/5.4.2.8657-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/186088117?tag=5.4.2.8657)
 [![5.4.2.8658](https://img.shields.io/badge/5.4.2.8658-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/186095528?tag=5.4.2.8658)
 [![5.4.2.8659](https://img.shields.io/badge/5.4.2.8659-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/186205107?tag=5.4.2.8659)
 [![5.4.2.8666](https://img.shields.io/badge/5.4.2.8666-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/188468297?tag=5.4.2.8666)
 [![5.4.2.8667](https://img.shields.io/badge/5.4.2.8667-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/188542026?tag=5.4.2.8667)
 [![5.4.3](https://img.shields.io/badge/5.4.3-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/191057531?tag=5.4.3)
 [![5.4.3.8670](https://img.shields.io/badge/5.4.3.8670-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/189081215?tag=5.4.3.8670)
 [![5.4.3.8673](https://img.shields.io/badge/5.4.3.8673-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/190150524?tag=5.4.3.8673)
 [![5.4.3.8675](https://img.shields.io/badge/5.4.3.8675-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/190793813?tag=5.4.3.8675)
 [![5.4.3.8676](https://img.shields.io/badge/5.4.3.8676-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/191018820?tag=5.4.3.8676)
 [![5.4.3.8677](https://img.shields.io/badge/5.4.3.8677-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/191057531?tag=5.4.3.8677)
 [![5.4.4](https://img.shields.io/badge/5.4.4-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/194508457?tag=5.4.4)
 [![5.4.4.8682](https://img.shields.io/badge/5.4.4.8682-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/192010171?tag=5.4.4.8682)
 [![5.4.4.8683](https://img.shields.io/badge/5.4.4.8683-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/192026959?tag=5.4.4.8683)
 [![5.4.4.8685](https://img.shields.io/badge/5.4.4.8685-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/194200083?tag=5.4.4.8685)
 [![5.4.4.8688](https://img.shields.io/badge/5.4.4.8688-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/194508457?tag=5.4.4.8688)
 [![5.4.5](https://img.shields.io/badge/5.4.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/200450182?tag=5.4.5)
 [![5.4.5.8689](https://img.shields.io/badge/5.4.5.8689-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/195061006?tag=5.4.5.8689)
 [![5.4.5.8692](https://img.shields.io/badge/5.4.5.8692-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/196651956?tag=5.4.5.8692)
 [![5.4.5.8703](https://img.shields.io/badge/5.4.5.8703-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/197809318?tag=5.4.5.8703)
 [![5.4.5.8705](https://img.shields.io/badge/5.4.5.8705-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/200356919?tag=5.4.5.8705)
 [![5.4.5.8715](https://img.shields.io/badge/5.4.5.8715-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/200450182?tag=5.4.5.8715)
 [![5.4.6](https://img.shields.io/badge/5.4.6-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/202214609?tag=5.4.6)
 [![5.4.6.8717](https://img.shields.io/badge/5.4.6.8717-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/201226861?tag=5.4.6.8717)
 [![5.4.6.8718](https://img.shields.io/badge/5.4.6.8718-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/201259561?tag=5.4.6.8718)
 [![5.4.6.8719](https://img.shields.io/badge/5.4.6.8719-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/201600376?tag=5.4.6.8719)
 [![5.4.6.8722](https://img.shields.io/badge/5.4.6.8722-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/202214609?tag=5.4.6.8722)
 [![5.5](https://img.shields.io/badge/5.5-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/208523546?tag=5.5)
 [![5.5.0](https://img.shields.io/badge/5.5.0-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/206171709?tag=5.5.0)
 [![5.5.0.8725](https://img.shields.io/badge/5.5.0.8725-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/203287765?tag=5.5.0.8725)
 [![5.5.0.8726](https://img.shields.io/badge/5.5.0.8726-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/203303525?tag=5.5.0.8726)
 [![5.5.0.8729](https://img.shields.io/badge/5.5.0.8729-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/206171709?tag=5.5.0.8729)
 [![5.5.1](https://img.shields.io/badge/5.5.1-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/208523546?tag=5.5.1)
 [![5.5.1.8738](https://img.shields.io/badge/5.5.1.8738-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/206403682?tag=5.5.1.8738)
 [![5.5.1.8739](https://img.shields.io/badge/5.5.1.8739-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/206415876?tag=5.5.1.8739)
 [![5.5.1.8743](https://img.shields.io/badge/5.5.1.8743-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/206636146?tag=5.5.1.8743)
 [![5.5.1.8746](https://img.shields.io/badge/5.5.1.8746-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/208325328?tag=5.5.1.8746)
 [![5.5.1.8747](https://img.shields.io/badge/5.5.1.8747-blue?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/208523546?tag=5.5.1.8747)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/kflix-tv/containers/pkgs/container/radarr-nightly/208523546?tag=rolling)
