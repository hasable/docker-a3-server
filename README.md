# Arma 3

Provides a default arma 3 server. 

## How to build this image?

As you need a valide account to download Arma 3 server file, you will have to set credentials during builds.

```bash
docker build \
	--build-arg STEAM_USERNAME=<steam username> \
	--build-arg STEAM_PASSWORD=<steam password> \
	 -t <image name> .
```

## How to use this image? 

```bash
docker run -it -d \
	-p 2302:2302/udp \
	-p 2303:2303/udp \
	-p 2304:2304/udp \
	-p 2305:2305/udp \
	-t hasable/arma3
```

|Argument|Description|Default value|
|---|---|---|
|STEAM_USERNAME|User to use to connect to Steam|anonymous|
|STEAM_PASSWORD|Password related to user account| |

Please note that you won't be able to download Arma 3 Server files using anonymouns connection.
Do not use your regular account login : create a dedicated one for your server.

## Custom configuration

```bash
docker run -it -d \
	-v <your config directory>:/opt/arma3/conf \
	-p 2302:2302/udp \
	-p 2303:2303/udp \
	-p 2304:2304/udp \
	-p 2305:2305/udp \
	-t hasable/arma3 \
	-config=/opt/arma3/conf/<your server.cfg file> \
	-cfg=/opt/arma3/conf/<your basic.cfg file>	
```

