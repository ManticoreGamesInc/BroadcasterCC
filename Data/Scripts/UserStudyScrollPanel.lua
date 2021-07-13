--[[
	User Study - Scroll Panel
	v1.1
	by: standardcombo
	
	Manages replication of UI Scroll Panels from subjects to observers.
--]]

local API = require( script:GetCustomProperty("UserStudyAPI") )
local UI_CONTAINER = script:GetCustomProperty("UIContainer"):WaitForObject()
local SUBJECT_CURSOR = script:GetCustomProperty("SubjectCursor"):WaitForObject()
local FEEDBACK_TEXT_TEMPLATE = script:GetCustomProperty("FeedbackTextTemplate")

local SEND_RATE = 1
local LERP_SPEED = 12

local PLAYER = Game.GetLocalPlayer()

local allScrollPanels = {}
local updatingScrollPanels = {}

local feedbackText = nil

-- Observer updates the position of their scroll panels to match those of subject
function Tick(deltaTime)
	if #updatingScrollPanels > 0 then
		ShowFeedbackText()
		for i,scroll in ipairs(updatingScrollPanels) do
			local targetPosition = scroll.clientUserData.targetScrollPosition
			local t = CoreMath.Clamp(deltaTime * LERP_SPEED)
			scroll.scrollPosition = CoreMath.Lerp(scroll.scrollPosition, targetPosition, t)
			
			local deltaPosition = math.abs(scroll.scrollPosition - targetPosition)
			if deltaPosition <= 1 then
				scroll.scrollPosition = targetPosition
				scroll.clientUserData.targetScrollPosition = nil
				table.remove(updatingScrollPanels, i)
				
				if #updatingScrollPanels <= 0 then
					HideFeedbackText()
				end
			end
		end
	end
end

function ShowFeedbackText()
	if not feedbackText then
		feedbackText = World.SpawnAsset(FEEDBACK_TEXT_TEMPLATE, {parent = UI_CONTAINER})
		feedbackText.text = "Scrolling..."
	end
	feedbackText.visibility = Visibility.INHERIT
	feedbackText.x = SUBJECT_CURSOR.x
	feedbackText.y = SUBJECT_CURSOR.y
end

function HideFeedbackText()
	if feedbackText then
		feedbackText.visibility = Visibility.FORCE_OFF
	end
end

-- Observer receives scroll position
function OnScrollPanelChanged(scrollPanelId, newPosition)
	local scroll = World.FindObjectById(scrollPanelId)
	if Object.IsValid(scroll) and scroll:IsA("UIScrollPanel") then
		scroll.clientUserData.targetScrollPosition = newPosition
		table.insert(updatingScrollPanels, scroll)
	end
end
Events.Connect("Study_Scroll", OnScrollPanelChanged)


-- Subject sends scroll position
Task.Spawn(function()
	while true do
		Task.Wait(SEND_RATE)
		
		if UI.IsCursorVisible() and API.IsSubject(PLAYER) then
			for _,scroll in ipairs(allScrollPanels) do
				if scroll.clientUserData.lastScrollPosition ~= scroll.scrollPosition then
					scroll.clientUserData.lastScrollPosition = scroll.scrollPosition
					
					local scrollPanelId = SplitMuid(scroll.id)
					local newPosition = scroll.scrollPosition
					API.BroadcastToObservers("Study_Scroll", scrollPanelId, newPosition)
				end
			end
		end
	end
end)

-- Subject begins study, searches for scroll panels
function OnLocalPlayerIsSubject(isSubject)
	if isSubject then
		allScrollPanels = World.FindObjectsByType("UIScrollPanel")
		for _,scroll in ipairs(allScrollPanels) do
			scroll.clientUserData.lastScrollPosition = scroll.scrollPosition
		end
	else
		-- Study over for this subject
		allScrollPanels = {}
	end
end
Events.Connect("Study_LocalIsSubject", OnLocalPlayerIsSubject)

-- Eliminate the second half of the MUID, as the first half is enough for identity
function SplitMuid(muid)
	local split = { CoreString.Split(muid, ":") }
	return split[1]
end

