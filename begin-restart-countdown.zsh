#!/usr/bin/env zsh

TRAPINT() {
  print "Caught SIGINT, aborting."
  return $(( 128 + $1 ))
}

TRAPKILL() {
  print "Caught SIGKILL, aborting."
  return $(( 128 + $1 ))
}

TRAPKILL() {
  print "Caught SIGTERM, aborting."
  return 0
}

defaultsec=600
minutesleft=${CK_SERVER_RESTART_COUNTDOWN:-$defaultsec}

CMD=("/usr/local/bin/rcon-cli" "-c" "/etc/rcon.d/game-server-template.yaml")

for i in {$(($minutesleft/60))..1}
do
	s=${${i:#1}:+"s"}
	$CMD \
		"servermsg \"The server is going to restart in $i minute$s.\""
	sleep 60
done

for i in {10..1}
do
	$CMD \
		"servermsg \"Restarting in $i\""
	sleep 1
done


$CMD \
	"servermsg \"Restarting. Hold on to your butts.\""
sleep 3

$CMD "quit"
sleep 10 # just for a little buffer before exiting if this is run as cron/systemd.timer
