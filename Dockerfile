FROM hasable/steam:1504137959
LABEL maintainer="hasable"

# Server user
ARG USER_NAME=steamu

# You need a valid login to dowload arma 3 server image...
ARG STEAM_USERNAME=anonymous
ARG STEAM_PASSWORD=

USER root
RUN apt-get install -u net-tools \
	&& mkdir /opt/arma3 \
	&& chown ${USER_NAME}:${USER_NAME} /opt/arma3

USER ${USER_NAME}

# Current version is 1.76.143187
RUN /opt/steam/steamcmd.sh +login $STEAM_USERNAME $STEAM_PASSWORD +force_install_dir /opt/arma3 +app_update 233780 validate +logout +quit 
RUN mkdir -p ~/".local/share/Arma 3" && mkdir -p ~/".local/share/Arma 3 - Other Profiles" \
	&& rm -rf ~/Steam 

WORKDIR /opt/arma3/
RUN mkdir -p conf battleye
COPY --chown=60000 conf/basic.cfg conf/server.cfg conf/ 
COPY --chown=60000 conf/beserver.cfg battleye/

# Arma 3 port
EXPOSE 2302/udp 
EXPOSE 2303/udp 
EXPOSE 2304/udp 
EXPOSE 2305/udp 
EXPOSE 2306/udp

ENTRYPOINT ["/opt/arma3/arma3server" ]
CMD ["-config=/opt/arma3/conf/server.cfg", \
		 "-bepath=/opt/arma3/battleye" ]
