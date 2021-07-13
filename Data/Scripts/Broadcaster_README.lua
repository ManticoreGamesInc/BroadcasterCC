--[[
	Broadcaster
	v1.0
	by: standardcombo
	
	Based on the User Study component, Broadcaster allows a select set
	of players to act as invisible observers to the game. Once they
	enter Observer mode, they can click LMB/RMB to navigate between
	and observe different players. They also have some admin commands
	aimed at helping organize competitive matches, such as setting
	players to specific teams.
	
	
	Setup
	=====
	1. Add a copy of the `Broadcaster` template to the hierarchy. Place it
	   below all other UI, so that any UI elements therein can draw on top.
	2. Expand the `UserStudy` template.
	3. Select the script `UserStudyChatCommands`.
	4. In the Properties view, edit the `Admins`. These are the players that
	   will be able to use the commands.
	5. If your game has player nameplates (common), modify it so the observer
	   can see the nameplates on all players. See below.
	6. Other common game changes are listed in the sections below.
	
	
	Terminology
	===========
	Observer - The player who is an admin and initiates the study.
	Subject - The player that is being observed.
	Replication - Moving data across the network, so it's the same between
	              two different computers.
	

	Usage
	=====
	1. Start the game in multiplayer.
	2. Open the chat (Enter key) and type: /start
	   This will only work for players who's names are in the Admin list.
	3. If there are other player present, it will automatically observe them.
	   If not, then as soon as another player joins they will be observed.
	4. To end the observation, open the chat and type: /end
	
	
	Chat Commands
	=============
	/start		- Starts observing a player and hides your avatar.
	/end		- Stops observing and respawns your avatar.
	/setteam <playername> <teamnumber>	- Changes a player to a specific team.
	/spawn <playername>	- Respawns a specific player. The game must have a
	                      Spawn settings object for this to work.
	/kick <playername>	- Transfers the player back to Core World.
	/endround	- Calls the API function Game.EndRound().
	/startround	- Calls the API function Game.StartRound().
	
	
	Nameplates
	==========
	
	For the observers to see the nameplates of all players, modify the
	function IsNameplateVisible() in NameplateControllerClient.lua
	Add the following code inside the function, at the top:
	```
	if _G.UserStudy and _G.UserStudy.IsObserver(LOCAL_PLAYER) then
		return not _G.UserStudy.IsObserver(player)
	end
	```
	
	
	Hide UI
	=======
	
	It's usually the case that some UI elements should be hidden to the
	broadcast observer. UI such as FPS meter, ability buttons, etc:
	
	1. Locate the UI you wish to hide in the hierarchy.
	2. Add a copy of the `DisableIfObserver` script as a child of the
	   upmost UI Container or UI Panel that you are hiding.
	   
	The choice of UI that should be hidden will depend on the game.
	
	
	Lists of Players
	================
	
	Often, games use the function Game.GetPlayers() to populate UI and even
	make gameplay decisions, such as round start/end. Most of the time you
	should exclude observers from those lists. The best way to do that is
	to search the whole codebase for usage of Game.GetPlayers(). For each
	one, add the following code to trim observers from the table of players:
	```
	_G.UserStudy.RemoveObservers(players)
	```
	For example:
	```
	local players = Game.GetPlayers()
	_G.UserStudy.RemoveObservers(players)
	for _,player in ipairs(players) do
		-- Populate scoreboard UI
	end
	```
	
	Camera
	======
	Some games may have unique camera perspectives that can impact the best
	viewing experience for observers. In such a case, the extra camera that
	is spawned for the observer can be modified to best fit the game.
	The camera can be found in the template `User Study Spectator Camera`.
	
	
	Networked Events
	================
	In some games, it may be necessary to send an event to the observer in
	order for them to see the same thing that the subject is seeing. This can
	be done with the following function:
	```
	_G.UserStudy.BroadcastToObservers("EventName", ...)
	```
	This is similar to the Core API function `Events.BroadcastToServer`,
	except in this case the event goes from client-to-client; in other words,
	from subject-to-observer.
	
--]]


