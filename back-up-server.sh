#!/bin/bash
# Creates a simple container, bind mounts a container host's directory, and
# copies the contents of the provided path within original container.
# The only requirement is that the container has access to the `tar` command.

echo "Starting up new container and copying original container's volume..."

SOURCE_CONTAINER_NAME="game-server-template"
SOURCE_DIR="/home/steam/game-server-path-to-backup"

BACKUP_CONTAINER_IMAGE="game-serve-template"
HOST_BACKUP_DIR="./backup"
CONTAINER_BACKUP_DIR="/backup"

BACKUP_CMD=("-c" "tar czvf /backup/server-backup-$(date +%s).tar.gz ${SOURCE_DIR}")

CMD="$(command -v podman || command -v docker)"

"$CMD" run \
	--rm \
	--interactive \
	--tty \
	--user root \
	--volumes-from "$CONTAINER_NAME" \
	--volume "${HOST_BACKUP_DIR}":"${CONTAINER_BACKUP_DIR}":z \
	--entrypoint=/bin/bash \
	"$BACKUP_CONTAINER_IMAGE" \
	$BACKUP_CMD
