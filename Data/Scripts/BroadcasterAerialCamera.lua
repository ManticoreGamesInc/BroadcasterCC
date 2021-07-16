--[[
	Broadcaster - Aerial Camera
	v1.0.1
	by: standardcombo
--]]
local ROOT = script.parent
local CAMERA = script:GetCustomProperty("Camera"):WaitForObject()
local LOOK_AT_TARGET = script:GetCustomProperty("LookAtTarget"):WaitForObject()
local ROTATION_SPEED = script:GetCustomProperty("RotationSpeed")
local ACTIVATION_BINDING = script:GetCustomProperty("ActivationBinding")
local PLAYER = Game.GetLocalPlayer()

local eventListener = nil

ROOT:RotateContinuous(Rotation.New(0,0,1), ROTATION_SPEED)

function OnBindingPressed(player, action)
	if action == ACTIVATION_BINDING and _G.UserStudy.IsObserver(PLAYER) then
		local activeCam = PLAYER:GetActiveCamera()
		if activeCam == CAMERA and _G.UserStudy.Camera then
			local subjectNames = _G.UserStudy.GetSubjectNames()
			if #subjectNames > 0 then
				PLAYER:SetOverrideCamera(_G.UserStudy.Camera)
			end
		else
			PLAYER:SetOverrideCamera(CAMERA)
		end
	end
end


function Update()
	while isUpdating do
		Task.Wait()
		--ROOT:SetRotation(Rotation.New(0,0,1) * time() * ROTATION_SPEED)
		if Object.IsValid(LOOK_AT_TARGET) then
			local rot = CAMERA:GetWorldRotation()
			CAMERA:LookAt(LOOK_AT_TARGET:GetWorldPosition())
			local targetRot = CAMERA:GetWorldRotation()
			local v1 = Vector3.New(rot.x, rot.y, rot.z)
			local v2 = Vector3.New(targetRot.x, targetRot.y, targetRot.z)
			v1 = Vector3.Lerp(v1, v2, 0.04)
			rot = Rotation.New(v1.x, v1.y, v1.z)
			CAMERA:SetWorldRotation(rot)
		end
		
		-- Detect case where we are observer but there is no subject
		local activeCam = PLAYER:GetActiveCamera()
		if activeCam ~= CAMERA
		and _G.UserStudy.GetSubjectForObserver(PLAYER) == nil then
			PLAYER:SetOverrideCamera(CAMERA)
			if Object.IsValid(LOOK_AT_TARGET) then
				CAMERA:LookAt(LOOK_AT_TARGET:GetWorldPosition())
			end
		end
	end
end

function OnStudyStarted()
	eventListener = PLAYER.bindingPressedEvent:Connect(OnBindingPressed)
	
	isUpdating = true
	Task.Spawn(Update)
end

function OnStudyEnded()
	if eventListener then
		eventListener:Disconnect()
		eventListener = nil
	end
	isUpdating = false
end

Events.Connect("Study_Start", OnStudyStarted)
Events.Connect("Study_End", OnStudyEnded)

