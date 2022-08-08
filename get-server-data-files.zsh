#!/usr/bin/env zsh

# Just a nice little script that locates files within a container's volume 
# and copies them out based on the `find` command's file pattern rules.

CMD="$(command -v podman || command -v docker)"

argn=${#@}
if (( $argn < 2 )); then 
	echo "Usage: copy-files.zsh <container> <path> [pattern ...]"
	exit 1
fi

CONTAINER_NAME="$1"
SEARCH_PATH="$2"

typeset -a FILE_PATTERNS
FILE_PATTERNS=( ${@[3,$argn]} )

typeset -a FIND_ARGS
if (( $#FILE_PATTERNS > 0 )) {
	FIND_ARGS=( ${(j: -or -name :)^FILE_PATTERNS} )
}

files=$(find_cmd="find $SEARCH_PATH $FIND_ARGS -mindepth 1 -print0"; \
	$CMD exec -it --user steam "$CONTAINER_NAME" bash -c "${(q)find_cmd}")

arrfiles=( ${(0)files} )

for file in $arrfiles; do; 
	filepath="$file"
	print "Copying $filepath"
	$CMD cp "$CONTAINER_NAME":$filepath . 
done;
