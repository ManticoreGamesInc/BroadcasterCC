--[[
	User Study - Example UI
	v1.1
	by: standardcombo
	
	This example demonstrates how a game's 2D user interface can be
	hooked up to replicate correctly, so that when a dialog appears
	for a subject, their observers can see what they see.
	
	See the README file for more information about advanced UI topics.
--]]

local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
local PANEL = script:GetCustomProperty("Panel"):WaitForObject()

local PLAYER = Game.GetLocalPlayer()

-- The example is minimalistic has has a trigger that players can step
-- on, in order to see the UI
function OnBeginOverlap(trigger, player)
	if not player:IsA("Player") then return end
	if player ~= PLAYER then return end
	
	-- Subject sees the panel
	PANEL.visibility = Visibility.INHERIT
	
	-- Subject gets control over their mouse cursor
	UI.SetCursorVisible(true)
	UI.SetCanCursorInteractWithUI(true)
	
	-- Tell the observers about this change to UI state
	if _G.UserStudy then _G.UserStudy.BroadcastToObservers("Show_ExamplePanel") end
end

-- Subject steps off the trigger
function OnEndOverlap(trigger, player)
	if not player:IsA("Player") then return end
	if player ~= PLAYER then return end
	
	-- Subject no longer sees the panel
	PANEL.visibility = Visibility.FORCE_OFF
	
	-- Subject no longer has control of their mouse cursor
	UI.SetCursorVisible(false)
	UI.SetCanCursorInteractWithUI(false)
	
	-- Tell the observers about this change to UI state
	if _G.UserStudy then _G.UserStudy.BroadcastToObservers("Hide_ExamplePanel") end
end

TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
TRIGGER.endOverlapEvent:Connect(OnEndOverlap)

-- Observer receives the news that the subject is seeing the panel
Events.Connect("Show_ExamplePanel", function()
	-- Observer now, also, sees the panel
	PANEL.visibility = Visibility.INHERIT
end)

-- Observer now receives the news that the subject no longer sees the panel
Events.Connect("Hide_ExamplePanel", function()
	-- Observer no longer sees the panel
	PANEL.visibility = Visibility.FORCE_OFF
end)

