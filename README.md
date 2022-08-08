# Containerized Game Server Template

This is a project which seeks to simplify personal dedicated game server management through docker containers via the requirements that I've sussed out when setting up things for different games. Configuration and set up differ between games, but ultimately some system-related things like environment variables, port settings, and volume management are shared ideas across them.

This repo is a template used by me to set up each new game. Each server's container implementation will be forked from this template and kept as separate repositories. I'll try to maintain a list of which game server's I've implemented using this template with links to them.

---

### Existing Container Definitions:

<table>
	<thead>
		<tr>
			<th>Game Repository</th>
			<th>Game Official Website</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>[Project Zomboid](https://gitlab.com/game-server-containers/project-zomboid.git)</th>
			<th>https://projectzomboid.com/blog/</th>
		</tr>
		<tr>
			<th>[Core Keeper](https://gitlab.com/game-server-containers/core-keeper.git)</th>
			<th>https://fireshinegames.co.uk/games/core-keeper//th>
		</tr>
		<tr>
			<th>[Valheim](https://gitlab.com/game-server-containers/valheim.git)</th>
			<th>https://www.valheimgame.com/</th>
		</tr>
		<tr>
			<th>[Stationers](https://gitlab.com/game-server-containers/stationers.git)</th>
			<th>https://www.stationeers.com/</th>
		</tr>
		<tr>
			<th>[Eco](https://gitlab.com/game-server-containers/eco.git)</th>
			<th>https://play.eco/</th>
		</tr>
	</tbody>
</table>

