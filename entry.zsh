#!/usr/bin/env zsh

# Override SteamCMD launch arguments if necessary
# Used for subscribing to betas or for testing
if [ -z "$STEAMCMD_UPDATE_ARGS" ]; then
	bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "$STEAMAPPDIR" +login anonymous +app_update "$STEAMAPPID" +quit
else
	steamcmd_update_args=($STEAMCMD_UPDATE_ARGS)
	bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "$STEAMAPPDIR" +login anonymous +app_update "$STEAMAPPID" +app_update "$STEAMAPPID_TOOL" "${steamcmd_update_args[@]}" +quit
fi

mkdir -p "${STEAMAPPDIR}"

# Switch to workdir
cd "${STEAMAPPDIR}"

SERVER_CMD="rocketstation_DedicatedServer.x86_64"
CMD="${STEAMAPPDIR}/${SERVER_CMD}"

# Example args based on Stationeers server arguments
SERVER_CMD_ARGS=(
	-autostart
	-batchmode
	-nographics
	-loadlatest "$SAVE_NAME" "$WORLD_TYPE"
)

# Run the server
exec "${CMD}" ${EXECUTABLE_ARGS[@]}
