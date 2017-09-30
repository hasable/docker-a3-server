FROM hasable/steam:latest
MAINTAINER hasable

USER root

ARG STEAM_USERNAME=anonymous
ARG STEAM_PASSWORD

RUN mkdir /opt/arma3 \
	&& mkdir /opt/arma3/conf \
	&& chown -R server:server /opt/arma3

VOLUME /opt/arma3/conf

USER server
RUN /opt/steam/steamcmd.sh +login $STEAM_USERNAME $STEAM_PASSWORD +force_install_dir /opt/arma3 +app_update 233780 validate +quit

# is it really usefull?
RUN mkdir -p ~/".local/share/Arma 3" && mkdir -p ~/".local/share/Arma 3 - Other Profiles"

COPY conf/server.cfg /opt/arma3/server.cfg
COPY conf/basic.cfg /opt/arma3/basic.cfg

EXPOSE 2302/udp 
EXPOSE 2303/udp 
EXPOSE 2304/udp 
EXPOSE 2305/udp

WORKDIR /opt/arma3/

ENTRYPOINT ["./arma3server", "-port=2302"]
CMD ["-config=/opt/arma3/server.cfg", "-cfg=/opt/arma3/basic.cfg", "-name=default"]
