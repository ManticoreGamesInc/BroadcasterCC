--[[
	Broadcaster - Chat Commands
	v1.1
	by: standardcombo
	
	Intercepts text written in the chat. If it's formatted as a command,
	then it will be forwarded to the API, at the appropriate function
	that matches the command.
--]]

local API = require( script:GetCustomProperty("UserStudyAPI") )
local ADMINS_CSS = script:GetCustomProperty("Admins")

-- Pre-process the list of admins who are allowed to use the commands
local ADMINS = {}
local adminTable = { CoreString.Split(ADMINS_CSS, ",") }
for _,name in ipairs(adminTable) do
	name = CoreString.Trim(name)
	ADMINS[name] = true
end


function OnReceiveMessageHook(player, params)
	if not ADMINS[player.name] then return end
	
	local message = params.message
	if #message <= 0 then return end
	if string.sub(message, 1, 1) ~= "/" then return end
	
	-- Don't show the command in chat
	params.message = ""
		
	--print("message = " .. message)
	
	local command, arg1, arg2, arg3, arg4 = CoreString.Split(message)
	local arguments = {arg1, arg2, arg3, arg4}
	
	command = string.lower(command)
	
	-- We need to spawn task because yielding the thread is not allowed inside a hook
	Task.Spawn(function()
		if not Object.IsValid(player) then return end
		
		if command == "/start" then
			API.BeginStudy(player, arguments)
						
		elseif command == "/end" then
			API.EndStudy(player, arguments)
			
		elseif command == "/setteam" then
			SetPlayerTeam(player, arg1, arg2)
			
		elseif command == "/spawn" then
			SpawnPlayer(player, arg1)
		
		elseif command == "/endround" then
			Game.EndRound()
			
		elseif command == "/startround" then
			Game.StartRound()
			
		elseif command == "/kick" then
			KickPlayer(player, arg1)
			
		elseif command == "/next" then
			API.NextSubject(player)
			
		elseif command == "/prev" then
			API.PreviousSubject(player)
			
		elseif command == "/options" then
			API.ListAllOptions(player)
		
		elseif command == "/defaults" then
			API.ResetAllOptionsToDefault(player)
			
		--elseif command == "/resolution" then
		--	ToggleResolution(player, arguments)
			
		--elseif command == "/view" then
		--	ToggleViewIndicator(player, arguments)
		end
	end)
end

Chat.receiveMessageHook:Connect(OnReceiveMessageHook)


function SetPlayerTeam(adminPlayer, playerName, teamNumber)
	local teamNumber = tonumber(teamNumber)
	if teamNumber then
		local player = API.FindPlayerWithName(playerName)
		if player then
			player.team = CoreMath.Round(teamNumber)
		else
			Chat.BroadcastMessage("Could not find player named " .. playerName, {players = adminPlayer})
		end
	end
end


function SpawnPlayer(adminPlayer, playerName)
	local player = API.FindPlayerWithName(playerName)
	if player then
		player:Spawn({spawnKey = ""})
	else
		Chat.BroadcastMessage("Could not find player named " .. playerName, {players = adminPlayer})
	end
end


function KickPlayer(adminPlayer, playerName)
	local player = API.FindPlayerWithName(playerName)
	if player then
		player:TransferToGame("e39f3e/core-world")
	else
		Chat.BroadcastMessage("Could not find player named " .. playerName, {players = adminPlayer})
	end
end

function ToggleResolution(player, arguments)
	local value = arguments[1]
	if value and string.lower(value) == "on" then
		API.ToggleResolution(player, true)
	
	elseif value and string.lower(value) == "off" then
		API.ToggleResolution(player, false)
	else
		Chat.BroadcastMessage("Use command '/resolution on' or '/resolution off'", {players = observer})
	end
end


function ToggleViewIndicator(player, arguments)
	local value = arguments[1]
	if value and string.lower(value) == "on" then
		API.ToggleViewIndicator(player, true)
	
	elseif value and string.lower(value) == "off" then
		API.ToggleViewIndicator(player, false)
	else
		Chat.BroadcastMessage("Use command '/view on' or '/view off'", {players = observer})
	end
end

