#!/usr/bin/env zsh

CMD="$(command -v podman || command -v docker)"

CONTAINER_IMAGE="game-server-image"
CONTAINER_NAME="$1"
VOLUME_NAME="game-server-volume"
VOLUME_MOUNT_DIR="/home/steam/game-server-dir"

EXTRA_ARGS=(
		--publish 27015-27017:27015-27017/udp
		--publish 27015-27017:27015-27017/tcp
		--ulimit  nofile=8192:8192
	)

$CMD run --interactive --rm \
		--name "$CONTAINER_NAME" \
		--volume "${VOLUME_NAME}":"${VOLUME_MOUNT_DIR}" \
		${EXTRA_ARGS[@]} \
		"$CONTAINER_IMAGE"

