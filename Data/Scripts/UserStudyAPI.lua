--[[
	User Study - API
	v1.3.3
	by: standardcombo
	
	Provides a set of functions to control and to get information about
	the study. The API script itself is state-less. Study state is stored
	in the observer's `serverUserData`.
	
	See the README file to learn more about this package.
	
	
	Server-only functions:
	- BeginStudy(Player observer, string[] arguments)
	- EndStudy(Player observer)
	- NextSubject(Player observer)
	- PreviousSubject(Player observer)
	- ListAllOptions(Player observer)
	- ToggleResolution(Player observer, Boolean)
	- ToggleViewIndicator(Player observer, Boolean)
	- GetOption(Player player, string optionName)
	- ResetAllOptionsToDefault(Player observer)
	
	Client-only functions:
	- BroadcastToObservers(string eventName, ...)
	
	Server & Client functions:
	- RegisterNetworkedObject(CoreObject)
	- IsObserver(Player) - returns Boolean
	- IsSubject(Player) - returns Boolean
	- GetSubjectNames() - returns string
	- RemoveObservers(Player[])
	- FindPlayerWithName(string playerName)
	- GetSubjectForObserver(observer)
	- ReplaceWithSubjectIfObserver(observer)
	
--]]

local API = {}

local ATTACHMENT_TEMPLATE = script:GetCustomProperty("AttachmentTemplate")
local SPECTATOR_CAMERA = script:GetCustomProperty("SpectatorCamera")

local EVENT_STUDY_STARTED = "Study_Start"
local EVENT_STUDY_ENDED = "Study_End"
local EVENT_SUBJECT_CHANGED = "Study_NewSubject"
local EVENT_LOCAL_PLAYER_IS_SUBJECT = "Study_LocalIsSubject"
local EVENT_REDIRECT_BROADCAST = "Study_Redirect"
local EVENT_OPTION_CHANGED = "Study_OptionChanged"

local BINDING_NEXT_SUBJECT = "ability_primary"
local BINDING_PREV_SUBJECT = "ability_secondary"
local CAMERA_ATTACHMENT_SOCKET = "nameplate"

API.networkedObject = nil
API.activeObservers = {}
API.activeSubjects = {}

-- Server & Client
function API.RegisterNetworkedObject(obj)
	API.networkedObject = obj
	
	if Environment.IsClient() then
		obj.networkedPropertyChangedEvent:Connect(OnNetworkedPropertyChanged)
		Task.Wait()
		OnNetworkedPropertyChanged(obj, "Subjects")
	end
end

-- Server
function API.BeginStudy(observer, arguments)
	--observer.team = 0

	-- Prepare arguments
	if not arguments then arguments = {} end
	local playerName = nil
	if #arguments > 0 then
		playerName = arguments[1]
	end
	
	-- Early exit case
	if playerName and string.lower(playerName) == string.lower(observer.name) then
		--Chat.BroadcastMessage("Cannot study self.", {players = observer})
		return
	end
	
	local data = GetStudyData(observer)
	
	-- Case where this observer is already studying
	if API.IsObserver(observer) then
		-- Additional command arguments
		if playerName then
			local subject = API.FindPlayerWithName(playerName)
			if subject then
				if subject ~= data.subject then
					SetSubject(observer, subject)
				else
					--Chat.BroadcastMessage("Already studying " .. subject.name, {players = observer})
				end
			else
				--Chat.BroadcastMessage("No player named " .. playerName, {players = observer})
			end
		else
			--Chat.BroadcastMessage("Already studying.", {players = observer})
		end
	-- This observer is not yet studying. Begin
	else
		--Chat.BroadcastMessage("Studying...", {players = observer})
				
		-- Enable study in the observer's own data
		data.isStudying = true
		observer:SetResource("UserStudy_isObserver", 1)
		
		-- Spawn spectator camera if necessary
		if not Object.IsValid(data.camera) then
			camera = World.SpawnAsset(SPECTATOR_CAMERA)
			camera:SetNetworkedCustomProperty("OwnerID", observer.id)
			data.camera = camera
		end
		
		-- Let other scripts and client know
		Events.Broadcast(EVENT_STUDY_STARTED, observer)
		Events.BroadcastToPlayer(observer, EVENT_STUDY_STARTED)
		
		-- Register in observers table
		API.activeObservers[observer] = true
		
		-- Increase observer count
		SetObserverCount(GetObserverCount() + 1)
		
		-- Connect action binding
		data.bindingPressedListener = observer.bindingPressedEvent:Connect(OnBindingPressed)
				
		-- Attach observer so they can't move, etc
		if not Object.IsValid(data.attachmentObject) then
			local pos = observer:GetWorldPosition()
			local attachmentObject = World.SpawnAsset(ATTACHMENT_TEMPLATE, {position = pos})
			data.attachmentObject = attachmentObject
		end
		observer:AttachToCoreObject(data.attachmentObject)
		
		-- Attachment object should follow the camera, so terrain shows the correct quality
		data.attachmentObject:Follow(data.camera)
		
		-- Disable observer
		observer.isVisible = false
		observer.isCollidable = false
		
		-- If this player was being studied by another observer, tell them to study next player
		if API.IsSubject(observer) then
			UpdateSubjectList()
			for obs,_ in pairs(API.activeObservers) do
				local _d = GetStudyData(obs)
				if _d.subject == observer then
					API.NextSubject(obs)
				end
			end
		end
		
		-- Additional command arguments
		if playerName then
			local subject = API.FindPlayerWithName(playerName)
			if subject then
				SetSubject(observer, subject)
			else
				--Chat.BroadcastMessage("No player named " .. playerName, {players = observer})
				API.NextSubject(observer)
			end
		else
			API.NextSubject(observer)
		end
		
		-- In case no subject was found
		if not Object.IsValid(data.subject) then
			--Chat.BroadcastMessage("Waiting for subject.", {players = observer})
		end
	end
end

-- Server
function API.EndStudy(observer, arguments)
	if API.IsObserver(observer) then
		--observer.team = 1
	
		--Chat.BroadcastMessage("Ending study.", {players = observer})
		
		-- Let other scripts and client know
		Events.Broadcast(EVENT_STUDY_ENDED, observer)
		Events.BroadcastToPlayer(observer, EVENT_STUDY_ENDED)
		
		-- Clear from observers table
		API.activeObservers[observer] = nil
		
		-- Decrease observer count
		SetObserverCount(GetObserverCount() - 1)
		
		-- Disable study in the observer's own data
		local data = GetStudyData(observer)
		data.isStudying = false
		data.subject = nil
		observer:SetResource("UserStudy_isObserver", 0)
		
		-- Cleanup action binding
		data.bindingPressedListener:Disconnect()
		data.bindingPressedListener = nil
		
		-- Detach camera
		if Object.IsValid(data.camera) then
			data.camera:Detach()
			data.camera:SetNetworkedCustomProperty("OwnerID", "")
			data.camera:Destroy()
		end
		data.camera = nil
		
		-- Detach observer
		observer:Detach()
		
		-- Enable observer
		observer.isVisible = true
		observer.isCollidable = true
		
		UpdateSubjectList()
	else
		--Chat.BroadcastMessage("Not currently studying.", {players = observer})
	end
end

-- Server & Client
function API.IsObserver(observer)
	if Environment.IsClient() then
		return observer:GetResource("UserStudy_isObserver") == 1
	end
	local data = GetStudyData(observer)
	return data.isStudying
end


function SetSubject(observer, subject)
	--Chat.BroadcastMessage("Subject = " .. subject.name, {players = observer})
	
	-- Save a reference to the subject into the observer's data
	local data = GetStudyData(observer)
	data.subject = subject

	-- Pass subject's id to the observer's client
	observer:SetPrivateNetworkedData("UserStudy_SubjectId", subject.id)
	
	UpdateSubjectList()
	
	-- Setup spectator camera
	local camera = data.camera
	local pos = subject:GetWorldPosition()
	if Object.IsValid(camera) then
		camera:SetWorldPosition(pos)
	else
		camera = World.SpawnAsset(SPECTATOR_CAMERA, {position = pos, rotation = rot})
		camera:SetNetworkedCustomProperty("OwnerID", observer.id)
		data.camera = camera
	end
	
	camera:AttachToPlayer(subject, CAMERA_ATTACHMENT_SOCKET)
	
	-- Let other scripts and client know
	Events.Broadcast(EVENT_SUBJECT_CHANGED, observer, subject)
	Events.BroadcastToPlayer(observer, EVENT_SUBJECT_CHANGED, subject)
end

-- Server
function API.NextSubject(observer)
	local players = SortPlayersForNextPrev(observer)
	if players then
		SetSubject(observer, players[1])
	else
		-- Study nobody
		local data = GetStudyData(observer)
		if data.subject then
			data.subject = nil
			data.camera:Detach()
			observer:SetPrivateNetworkedData("UserStudy_SubjectId", "")
		end
		
		-- Let other scripts and client know
		Events.Broadcast(EVENT_SUBJECT_CHANGED, observer, nil)
		Events.BroadcastToPlayer(observer, EVENT_SUBJECT_CHANGED, nil)
	end
end

-- Server
function API.PreviousSubject(observer)
	local players = SortPlayersForNextPrev(observer)
	if players then
		SetSubject(observer, players[#players])
	end
end

function SortPlayersForNextPrev(observer)
	local data = GetStudyData(observer)
	if not data.isStudying then
		return nil
	end
	
	local players = Game.GetPlayers()
	API.RemoveObservers(players)
	if #players <= 0 then
		return nil
	end
	
	local currentSubject = data.subject
	
	if not Object.IsValid(currentSubject) then
		return players
		
	elseif #players == 1 and players[1] == currentSubject then
		return nil
	else
		local sortedPlayers = {}
		local insertAt = 1
		
		for i,p in ipairs(players) do
			if p == currentSubject then
				insertAt = 1
				
			elseif not API.IsObserver(p) then
				table.insert(sortedPlayers, insertAt, p)
				insertAt = insertAt + 1
			end
		end
		return sortedPlayers
	end
	return nil
end


function OnBindingPressed(observer, action)
	--print("Study action = " .. action)
	
	if action == BINDING_NEXT_SUBJECT then
		API.NextSubject(observer)
	
	elseif action == BINDING_PREV_SUBJECT then
		API.PreviousSubject(observer)
	end
end


function GetStudyData(observer)
	if not observer.serverUserData.userStudy then
		observer.serverUserData.userStudy = {}
	end
	return observer.serverUserData.userStudy
end


function API.FindPlayerWithName(name)
	name = string.lower(name)
	for _,player in ipairs(Game.GetPlayers()) do
		if name == string.lower(player.name) then
			return player
		end
	end
	return nil
end


function OnPlayerJoined(player)
	if Environment.IsServer() then
		LoadAllOptions(player)
		
	elseif Environment.IsClient() and player == Game.GetLocalPlayer() then
		player.resourceChangedEvent:Connect(OnLocalPlayerResourceChanged)
	end
	
	-- If some observers have no subject, now try to find them one
	for observer,_ in pairs(API.activeObservers) do
		local data = GetStudyData(observer)
		if data.isStudying and not Object.IsValid(data.subject) then
			API.NextSubject(observer)
		end
	end
end

function OnPlayerLeft(player)
	-- Server
	if Environment.IsServer() then
		-- If the player who left was an observer, end their study
		if API.activeObservers[player] then
			API.EndStudy(player)
		end
		
		Task.Wait(0.5)
		
		-- Check if the player who left was a subject
		for observer,_ in pairs(API.activeObservers) do
			local data = GetStudyData(observer)
			if data.isStudying and data.subject == player then
				--Chat.BroadcastMessage("Subject Left the game: " .. player.name, {players = observer})
			
				API.NextSubject(observer)
			end
		end
		
		UpdateSubjectList()
		
	-- Client
	elseif Environment.IsClient() then
		API.activeSubjects[player] = nil
	end
end

Game.playerJoinedEvent:Connect(OnPlayerJoined)
Game.playerLeftEvent:Connect(OnPlayerLeft)


-- Client
function API.BroadcastToObservers(eventName, ...)
	local subject = Game.GetLocalPlayer()
	if not API.IsSubject(subject) then return end
	
	if GetObserverCount() > 0 then
		Events.BroadcastToServer(EVENT_REDIRECT_BROADCAST, eventName, ...)
	end
end

-- Server
function OnRedirectEvent(subject, eventName, ...)
	if API.IsObserver(subject) then return end
	
	for observer,_ in pairs(API.activeObservers) do
		local data = GetStudyData(observer)
		if data.subject == subject and Object.IsValid(subject) then
			Events.BroadcastToPlayer(observer, eventName, ...)
		end
	end
end

if Environment.IsServer() then
	Events.ConnectForPlayer(EVENT_REDIRECT_BROADCAST, OnRedirectEvent)
end


-- Client / Server
function GetObserverCount()
	if API.networkedObject then
		return API.networkedObject:GetCustomProperty("ObserverCount")
	end
	return 0
end

-- Server
function SetObserverCount(value)
	if API.networkedObject then
		API.networkedObject:SetNetworkedCustomProperty("ObserverCount", value)
	end
end


-- Client / Server
function API.IsSubject(player)
	return API.activeSubjects[player]
end

-- Client / Server
function API.GetSubjectNames()
	local str = API.networkedObject:GetCustomProperty("Subjects")
	if string.len(str) == 0 then
		return {}
	end
	local result = {CoreString.Split(str, ",")}
	return result
end

-- Server
function UpdateSubjectList()
	API.activeSubjects = {}
	local listOfNames = ""
	local count = 0
	for observer,_ in pairs(API.activeObservers) do
		local data = GetStudyData(observer)
		if Object.IsValid(data.subject) and not API.IsObserver(data.subject) then
			API.activeSubjects[data.subject] = true
			
			if count > 0 then
				listOfNames = listOfNames .. ","
			end
			listOfNames = listOfNames .. data.subject.name
			count = count + 1
		end
	end
	API.networkedObject:SetNetworkedCustomProperty("Subjects", listOfNames)
end

-- Client
function OnNetworkedPropertyChanged(obj, propertyName)
	if propertyName == "Subjects" then
		local localPlayer = Game.GetLocalPlayer()
		local localWasSubject = API.activeSubjects[localPlayer]
		
		API.activeSubjects = {}
				
		local subjectNames = API.GetSubjectNames()
		for _,name in ipairs(subjectNames) do
			local subject = API.FindPlayerWithName(name)
			if Object.IsValid(subject) then
				API.activeSubjects[subject] = true
			end
		end
		
		if localWasSubject and not API.activeSubjects[localPlayer] then
			Events.Broadcast(EVENT_LOCAL_PLAYER_IS_SUBJECT, false)
			
		elseif not localWasSubject and API.activeSubjects[localPlayer] then
			Events.Broadcast(EVENT_LOCAL_PLAYER_IS_SUBJECT, true)
		end
	end
end

-- Server
-- Options are tool settings/preferences, e.g. view indicator on/off
function API.ResetAllOptionsToDefault(observer)
	local data = Storage.GetPlayerData(observer)
	
	data.UserStudy = nil
	
	Storage.SetPlayerData(observer, data)
	
	LoadAllOptions(observer)
	SaveAllOptions(observer)
	
	Chat.BroadcastMessage("All options are reset to default.", {players = observer})
end

-- Server
function API.ListAllOptions(observer)
	Chat.BroadcastMessage("Options:", {players = observer})
	ListOption(observer, "resolution", "res")
	ListOption(observer, "view", "view")
end
function ListOption(observer, displayName, optionName)
	local strValue = "off"
	if API.GetOption(observer, optionName) then
		strValue = "on"
	end
	Chat.BroadcastMessage(displayName .. " = " .. strValue, {players = observer})
end

-- Server
function API.ToggleResolution(observer, enabled)
	if enabled then
		Chat.BroadcastMessage("Enabling screen resolution label.", {players = observer})
	else
		Chat.BroadcastMessage("Disabling screen resolution label.", {players = observer})
	end
	
	SaveOption(observer, "res", enabled)
end

-- Server
function API.ToggleViewIndicator(observer, enabled)
	if enabled then
		Chat.BroadcastMessage("Enabling view indicator.", {players = observer})
	else
		Chat.BroadcastMessage("Disabling view indicator.", {players = observer})
	end
	
	SaveOption(observer, "view", enabled)
end

-- Server
function LoadAllOptions(observer)
	API.SetOption(observer, "res", LoadOption(observer, "res", true))
	API.SetOption(observer, "view", LoadOption(observer, "view", true))
end

-- Server
function SaveAllOptions(observer)
	SaveOption(observer, "res", API.GetOption(observer, "res"))
	SaveOption(observer, "view", API.GetOption(observer, "view"))
end

-- Server
function LoadOption(observer, optionName, defaultValue)
	local data = Storage.GetPlayerData(observer)
	
	if not data.UserStudy then
		return defaultValue
	end
	if data.UserStudy[optionName] ~= nil then
		return data.UserStudy[optionName]
	end
	return defaultValue
end

-- Server
function SaveOption(observer, optionName, value)
	if value == nil then return end
	
	local data = Storage.GetPlayerData(observer)
	
	if not data.UserStudy then
		data.UserStudy = {}
	end
	
	data.UserStudy[optionName] = value
	
	Storage.SetPlayerData(observer, data)
	
	API.SetOption(observer, optionName, value)
end

-- Server & Client
function API.GetOption(observerOrSubject, optionName)
	if Environment.IsClient() then
		return observerOrSubject:GetResource("UserStudy_" .. optionName) == 1
	end
	local studyData = GetStudyData(observerOrSubject)
	return studyData[optionName]
end

-- Server
function API.SetOption(observer, optionName, value)
	local studyData = GetStudyData(observer)
	studyData[optionName] = value
	
	local resName = "UserStudy_" .. optionName
	local resValue = 0
	if value then
		resValue = 1
	end
	
	-- Replicate option to observer
	observer:SetResource(resName, resValue)
	
	-- Replicate option to subject
	if Object.IsValid(studyData.subject) then
		studyData.subject:SetResource(resName, resValue)
	end
end

-- Server
function ReplicateAllOptionsToSubject(observer)
	-- TODO
end

-- Client
function OnLocalPlayerResourceChanged(player, resName, resAmount)
	local prefix = "UserStudy_"
	local len = string.len(prefix)
	if string.sub(resName, 1, len) == prefix then
		local optionName = string.sub(resName, len + 1)
		local optionValue = (resAmount == 1)
		Events.Broadcast(EVENT_OPTION_CHANGED, optionName, optionValue)
	end
end

-- Server & Client
function API.RemoveObservers(playerArray)
	for i = #playerArray, 1, -1 do
		if API.IsObserver(playerArray[i]) then
			table.remove(playerArray, i)
		end
	end
	return playerArray
end

-- Server & Client
function API.GetSubjectForObserver(observer)
	if Environment.IsClient() then
		local subjectId = observer:GetPrivateNetworkedData("UserStudy_SubjectId")
		if subjectId then
			return Game.FindPlayer(subjectId)
		end
	else
		local data = GetStudyData(observer)
		if data then
			return data.subject
		end
	end
	return nil
end

-- Server & Client
function API.ReplaceWithSubjectIfObserver(observer)
	if API.IsObserver(observer) then
		local subject = _G.UserStudy.GetSubjectForObserver(observer)
		if subject then
			return subject
		end
	end
	return observer
end

return API





