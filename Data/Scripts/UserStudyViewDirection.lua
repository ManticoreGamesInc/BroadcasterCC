--[[
	User Study - Scroll Panel
	v1.1
	by: standardcombo
	
	Manages replication of a subject's camera view (position/rotation) to
	their observers.
--]]

local API = require( script:GetCustomProperty("UserStudyAPI") )
local VIEW_INDICATOR = script:GetCustomProperty("ViewIndicator"):WaitForObject()

local SEND_RATE = 0.5
local LERP_SPEED = 9

local PLAYER = Game.GetLocalPlayer()

local subject = nil
local currentPosition = nil
local targetPosition = nil
local targetQuaternion = nil

-- Observer updates the view indicator to match the subject's camera
function Tick(deltaTime)
	if Object.IsValid(subject) 
	and currentPosition and targetPosition and targetQuaternion
	and API.GetOption(PLAYER, "view") then
		local subjectPos = subject:GetWorldPosition()
		
		local t = CoreMath.Clamp(deltaTime * LERP_SPEED)
		
		currentPosition = Vector3.Lerp(currentPosition, targetPosition, t)
		VIEW_INDICATOR:SetWorldPosition(currentPosition + subjectPos)
		
		local currentQ = Quaternion.New(VIEW_INDICATOR:GetWorldRotation())
		local quat = Quaternion.Slerp(currentQ, targetQuaternion, t)
		VIEW_INDICATOR:SetWorldRotation(Rotation.New(quat))
		
		VIEW_INDICATOR.visibility = Visibility.INHERIT
	else
		VIEW_INDICATOR.visibility = Visibility.FORCE_OFF
	end
end

-- Observer receives view position and rotation
function OnSubjectViewChanged(pos, rot)
	local subjectPos = subject:GetWorldPosition()
	targetPosition = pos - subjectPos
	targetQuaternion = Quaternion.New(rot)
	if not currentPosition then
		currentPosition = targetPosition
	end
end
Events.Connect("Study_View", OnSubjectViewChanged)

-- Subject sends view position and rotation
Task.Spawn(function()
	while true do
		Task.Wait(SEND_RATE)
		
		if API.IsSubject(PLAYER) and API.GetOption(PLAYER, "view") then
			local pos = PLAYER:GetViewWorldPosition()
			local rot = PLAYER:GetViewWorldRotation()
			
			API.BroadcastToObservers("Study_View", pos, rot)
		end
	end
end)


-- Observer keeps track of who their subject is
function OnSubjectChanged(newSubject)
	subject = newSubject
	currentPosition = nil
end
function OnStudyEnded()
	subject = nil
	currentPosition = nil
end
Events.Connect("Study_NewSubject", OnSubjectChanged)
Events.Connect("Study_End", OnStudyEnded)

