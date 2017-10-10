FROM hasable/steam:latest
MAINTAINER hasable

USER root

RUN apt-get install -u net-tools \
	&& mkdir /opt/arma3 \
	&& mkdir /opt/arma3/conf \
	&& chown -R server:server /opt/arma3

USER server

# You need a valid login to dowload arma 3 server image.
# This account has been created only for this,
# thanks to community to not destroy or change the password.
ARG STEAM_USERNAME=oneShootAccount
ARG STEAM_PASSWORD=YR3COGKYKkeLoteMCuKl

RUN /opt/steam/steamcmd.sh +login $STEAM_USERNAME $STEAM_PASSWORD +force_install_dir /opt/arma3 +app_update 233780 validate +logout +quit

# is it really usefull?
RUN mkdir -p ~/".local/share/Arma 3" && mkdir -p ~/".local/share/Arma 3 - Other Profiles"
# Clear credential cache, as steam logout does not do the job...
RUN rm -rf ~/Steam

EXPOSE 2302/udp
EXPOSE 2303/udp
EXPOSE 2304/udp
EXPOSE 2305/udp

WORKDIR /opt/arma3/


ENTRYPOINT ["./arma3server" ]
CMD ["-config=/opt/arma3/server.cfg", "-cfg=/opt/arma3/basic.cfg", "-name=default"]
