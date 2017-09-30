# Arma 3

Provides a default arma 3 server. 

## How to build this image?

As you need a valide account to download Arma 3 server file, you will have to set credentials during builds.

```bash
docker build \\
	--build-arg STEAM_USERNAME=<steam username> \\
	--build-arg STEAM_PASSWORD=<steam password>
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

## Custom configuration

```bash
docker run -it -d \
	--mount src=<yourVolume>,target=/opt/arma3/conf \
	-p 2302:2302/udp \
	-p 2303:2303/udp \
	-p 2304:2304/udp \
	-p 2305:2305/udp \
	-t hasable/arma3 \
	-config=/opt/arma3/conf/server.cfg \
	-cfg=/opt/arma3/conf/basic.cfg	
```

