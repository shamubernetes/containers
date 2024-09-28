<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/container/README.md.j2
-->
<div align="center">

# Satisfactory

</div>

Satisfactory Server -- Rootless

## Custom environment configuration

This container support setting certain custom environment variables with the use of [drone/envsubst](https://github.com/drone/envsubst).

| Name                    | Default                                         |
|-------------------------|-------------------------------------------------|
| USER                    | `user`                                          |
| description             | `User to run the server as`                     |
| default                 | `steam`                                         |
| STEAMCMDDIR             | `STEAMCMDDIR`                                   |
| description             | `Directory to store SteamCMD files`             |
| default                 | `/app/steamcmd`                                 |
| GAMECONFIGDIR           | `GAMECONFIGDIR`                                 |
| description             | `Directory to store game configuration files`   |
| default                 | `/config/gamefiles/FactoryGame/Saved`           |
| GAMESAVESDIR            | `GAMESAVESDIR`                                  |
| description             | `Directory to store game save files`            |
| default                 | `/app/.config/Epic/FactoryGame/Saved/SaveGames` |
| TZ                      | `TZ`                                            |
| description             | `Timezone`                                      |
| default                 | `Etc/UTC`                                       |
| AUTOSAVENUMBER          | `AUTOSAVENUMBER`                                |
| description             | `Number of autosaves to keep`                   |
| default                 | `5`                                             |
| MAXOBJECTS              | `MAXOBJECTS`                                    |
| description             | `Maximum number of objects to keep in memory`   |
| default                 | `2162688`                                       |
| MAXTICKRATE             | `MAXTICKRATE`                                   |
| description             | `Maximum tick rate`                             |
| default                 | `120`                                           |
| CONNECTION_TIMEOUT      | `CONNECTION_TIMEOUT`                            |
| description             | `Connection timeout`                            |
| default                 | `300`                                           |
| INITIAL_CONNECT_TIMEOUT | `INITIAL_CONNECT_TIMEOUT`                       |
| description             | `Initial connection timeout`                    |
| default                 | `300`                                           |
| SERVERSTREAMING         | `SERVERSTREAMING`                               |
| description             | `Server streaming`                              |
| default                 | `0`                                             |
| MAXPLAYERS              | `MAXPLAYERS`                                    |
| description             | `Maximum number of players`                     |
| default                 | `4`                                             |
| DISABLESEASONALEVENTS   | `DISABLESEASONALEVENTS`                         |
| description             | `Disable seasonal events`                       |
| default                 | ``                                              |
| SERVERGAMEPORT          | `SERVERGAMEPORT`                                |
| description             | `Server game port`                              |
| default                 | `7777`                                          |

## Tags

#### Stable



[![15811013](https://img.shields.io/badge/15811013-blue?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/satisfactory/280817412?tag=15811013)
 [![null](https://img.shields.io/badge/null-blue?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/satisfactory/280801901?tag=null)
 [![rolling](https://img.shields.io/badge/rolling-green?style=flat-square)](https://github.com/shamubernetes/containers/pkgs/container/satisfactory/280817412?tag=rolling)
