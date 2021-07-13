--[[
	User Study
	v1.1
	by: standardcombo
	
	In the pursuit of improving your games, the ability to directly observe
	players is invaluable. If you ask your community what to change about
	the game, they will most likely tell you things that are only relevant
	to them-- players who are later in the experience. However, the most
	important part of a game to improve is the onboarding of new players.
	They will go away without ever telling you what was wrong. Players that
	leave without having enjoyed the game are unlikely to ever come back.
	
	The User Study component allows you to directly observe new players,
	without their knowledge. Build an understand of where they are confused,
	struggling, and then engage them through in-game chat to further improve
	your understanding of the situation. This process can drive refinement
	of the game design and boost retention.
	
	This project is open source at:
	https://github.com/ManticoreGamesInc/UserStudyCC
	
	Problems? Suggestions?
	https://forums.coregames.com/t/user-study-a-tool-for-understanding-your-players
	
	
	Setup
	=====
	1. Add a copy of the `UserStudy` template to the hierarchy. Place it
	   below all other UI, so that its UI elements can draw on top.
	2. Expand the `UserStudy` template.
	3. Select the script `UserStudyChatCommands`.
	4. In the Properties view, edit the `Admins`. These are the players that
	   will be able to use the commands.
	
	
	Terminology
	===========
	Observer - The player who is an admin and initiates the study.
	Subject - The player that is being observed.
	Replication - Moving data across the network, so it's the same between
	              two different computers.
	              
	
	Basic Usage
	===========
	1. Play the game in multiplayer.
	2. Open the chat (Enter key) and type: /study
	   This will only work if you added your name to the Admin list.
	3. If there is another player it will automatically observe them. If
	   not, then as soon as another player joins they will be observed.
	4. To end the study, open the chat and type: /endstudy
	
	
	Hints
	=====
	When observing a player, try to notice actions that seem unexpected.
	Take careful notice if they exit the game-- what were they doing
	prior to that? Take notes and look for patterns between multiple
	players.
	
	If you see a new player joining your game, you can type
	/study <player name>
	To begin studying them immediately.
	
	Supports multiple simultaneous observers who may, or may not, be
	observing the same subjects.
	
	The User Study package expends a bit of computer resources even if
	no study is taking place. Therefore, when not running a study it may
	be best to delete it from the hierarchy to maximize your game's CPU.
	
	
	Chat Commands
	=============
	/study <name>	- Starts observing a player and hides your avatar. The
					  player's name is optional. If not provided one is
					  chosen at random.
	/endstudy		- Stops observing and respawns your avatar.
	/next			- Observes the next player if currently studying.
	/prev			- Observes the previous player if currently studying.
	/options		- Lists the status of all options.
	/defaults		- Resets all options to default settings. Using any of the
	                  options on/off commands saves to your player storage.
	                  Calling /defaults clears that use of storage.
	/resolution on	- Enables screen resolution indicator in top-left corner.
	/resolution off	- Disables screen resolution indicator in top-left corner.
	/view on		- Enables camera view indicator.
	/view off		- Disables camera view indicator.
	
	
	View Indicator
	==============
	A pyramid-shaped wireframe indicates the camera of the subject you are
	observing. From this element you can tell the direction they are
	looking and how far the camera is from their avatar.
	
	
	UI Basics
	=========
	Out of the box, User Study displays to the observer several pieces of
	information about the subject's user interface.
	
	Mouse Cursor - When the subject sees and controls their mouse cursor,
	the observer will see a replication of the cursor's position. Due to
	different screen resolutions, the cursor's position is normalized from
	the subject's screen to the observer's screen-- therefore, it's only an
	approximation of where the cursor moves, unless the two users have
	exactly the same resolution.
	
	Screen Resolution - In the top-left corner of the screen, the observer
	will see the subject's screen resolution. Next to it, the percentage
	numbers (%) indicate the difference between the observer's screen and
	the subject's screen. E.g. if it says (+30%, 0%) that means the
	subject's screen is 30% larger, than the observer's screen, on the
	x-axis, but is the same on the y-axis.
	
	Buttons - When the subject clicks on a button, the observer will see
	a feedback text that says the name and ID of the button. It's possible
	to actually replicate to the observer which UI elements the subject is
	seeing. Refer to the UI Advanced section below.
	
	Scroll Panels - When the subject scrolls in a panel, the observer will
	see a feedback text that says "Scrolling...". Refer to the UI Advanced
	section below, for ways to actually replicate the full UI visuals.
	
	
	UI Advanced
	===========
	If you only drop the User Study template into the hierarchy and change
	nothing else, it's already a powerful tool. However, if your game has
	a lot of user interface, the observer won't be able to see the same
	2D elements that are seen by the subject.
	
	There's a way to fix this, but the exact solution depends a lot on the
	game's architecture.
	
	This package includes a template called `UserStudy Example UI` that
	demonstrates basic UI elements and how to replicate their visibility.
	
	In the script `UserStudyExampleUI` there are a few code additions that
	allow the replication of the example UI. Look for "_G.UserStudy" to
	see how the User Study API can be used to broadcast networked events
	from the subject to the observer.
	
	In the case of the game Farmer's Market, the UI has a centralized
	approach to showing/hiding screens. Because the implementation in that
	game is already driven by an event, it's trivial to fix UI replication
	with the following client code added anywhere:
	```
	function OnToggleUI(uniqueId, toggle)
		if _G.UserStudy then
			_G.UserStudy.BroadcastToObservers("ToggleUI", uniqueId, toggle)
		end
	end
	Events.Connect("ToggleUI", OnToggleUI)
	```
	
	If your game has UI with very dynamic content, such as an inventory,
	the observer will see their own content instead of the subject's.
	It may not be necessary to fix this in order for the tool to be useful.
	However, if you do wish to fix it, this can be accomplished by sending
	additional parameters in the events through BroadcastToObservers().
	
	
	Future Work
	===========
	- Video tutorial.
	- Command "/study -join" to automatically begin studying the next
	  player who joins.
	- Commands to toggle observation features on/off.
	- Command to change mouse cursor normalization mode.
	- See the subject's resources.
	- See log of significant gameplay changes to have affected the subject.
	- See key bindings pressed by the subject.
	- CPU optimizations, so clients only expend computer resources in case
	  they are a subject.
		
--]]

