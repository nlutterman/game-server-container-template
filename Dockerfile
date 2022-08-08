FROM localhost/custom-steamcmd:latest

LABEL maintainer="nathan@blutterman.com"

ARG SERVER_PORT_RANGE="44445-44447"
ARG STEAMAPPID=1234567
ARG STEAMAPP="some-game"
ARG STEAMAPPDIR="/home/steam/dedicated-game-server"

ENV SERVER_PORT_RANGE=$SERVER_PORT_RANGE \
	STEAMAPPID=$STEAMAPPID \
	STEAMAPP=$STEAMAPP \
	STEAMAPPDIR=$STEAMAPPDIR

EXPOSE \
	$SERVER_PORT_RANGE/tcp \
	$SERVER_PORT_RANGE/udp

USER root

RUN mkdir --parents "$STEAMAPPDIR"
RUN chown -R steam:steam "$STEAMAPPDIR"

USER $USER

COPY --chown=steam:steam ./entry.sh "${STEAMAPPDIR}/entry.sh"

RUN chmod +x "${STEAMAPPDIR}/entry.sh"

WORKDIR "${STEAMAPPDIR}"

ENTRYPOINT ["bash", "entry.sh"]

# Docker documentation states:
# 	Changing the volume from within the Dockerfile:
#	If any build steps change the data within the volume
#	after it has been declared, those changes will be discarded.
# So we put this at the end of the Dockerfile
VOLUME "${STEAMAPPDIR}"

