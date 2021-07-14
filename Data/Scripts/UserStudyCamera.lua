--[[
	User Study - Camera
	v1.2
	by: standardcombo
	
	Spectator camera that follows the subject around. The camera's
	networking root is attached to the subject by the API script.
	This handles all the client-side aspects of the camera.
--]]

local ROOT = script.parent
local CAMERA = script:GetCustomProperty("Camera"):WaitForObject()

local PLAYER = Game.GetLocalPlayer()

if not _G.UserStudy then
	Task.Wait()
end
_G.UserStudy.CameraRoot = ROOT
_G.UserStudy.Camera = CAMERA

local isActive = false
local eventListeners = {}

-- Detach the client-side hierarchy from the networked root
-- This gives the camera much smoother movement.
script.parent = nil
script:Follow(ROOT)

-- Observer is the local player in this case. They are assigned the camera
function OnStudyStarted()
	isActive = true
	PLAYER:SetOverrideCamera(CAMERA)
end

-- Observer is the local player. Their camera is reverted to default
function OnStudyEnded()
	isActive = false
	PLAYER:ClearOverrideCamera()
end

table.insert(eventListeners, Events.Connect("Study_Start", OnStudyStarted))
table.insert(eventListeners, Events.Connect("Study_End", OnStudyEnded))

-- For some games, the observer needs to keep re-assigning the camera
function Tick()
	if isActive then
		local activeCam = PLAYER:GetActiveCamera()
		if activeCam ~= CAMERA and activeCam == PLAYER:GetDefaultCamera() then
			PLAYER:SetOverrideCamera(CAMERA)
		end
	end
end

-- Cleanup event listeners, because the spectator camera is not permanent
function OnDestroy()
	for _,e in ipairs(eventListeners) do
		e:Disconnect()
		e = nil
	end
	eventListeners = nil
end
table.insert(eventListeners, script.destroyEvent:Connect(OnDestroy))

-- The camera's networked root has an "OwnerID" property that changes to match
-- the ID of the observer for which this camera was spawned for.
function OnNetworkedPropertyChanged(obj, propertyName)
	if propertyName == "OwnerID" then
		local id = obj:GetCustomProperty(propertyName)
		local player = Game.FindPlayer(id)
		if Object.IsValid(player) and player == PLAYER then
			OnStudyStarted()
		end
	end
end

table.insert(eventListeners, ROOT.networkedPropertyChangedEvent:Connect(OnNetworkedPropertyChanged))
Task.Wait()
OnNetworkedPropertyChanged(ROOT, "OwnerID")

