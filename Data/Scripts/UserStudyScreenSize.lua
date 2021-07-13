--[[
	User Study - Screen Size
	v1.1
	by: standardcombo
	
	Handles replication of the subject's screen resolution to their observers.
--]]

local API = require( script:GetCustomProperty("UserStudyAPI") )
local TEXT = script:GetCustomProperty("ScreenSizeText"):WaitForObject()

local PLAYER = Game.GetLocalPlayer()

-- Subject sends their screen size
function OnLocalPlayerIsSubject()
	local size = UI.GetScreenSize()
	local x = CoreMath.Round(size.x)
	local y = CoreMath.Round(size.y)
	API.BroadcastToObservers("Study_ScreenSize", x, y)
end

Events.Connect("Study_LocalIsSubject", OnLocalPlayerIsSubject)

-- Observer receives the subject's screen size
local subjectScreenX = 0
local subjectScreenY = 0

function OnSubjectScreenSize(x, y)
	subjectScreenX = x
	subjectScreenY = y
	
	if API.GetOption(PLAYER, "res") then
		local mySize = UI.GetScreenSize()
		local dx = CoreMath.Round(x - mySize.x)
		local dy = CoreMath.Round(y - mySize.y)
		local percentX = CoreMath.Round(100 * dx / mySize.x)
		local percentY = CoreMath.Round(100 * dy / mySize.y)
		local deltaX = "0"
		local deltaY = "0"
		if percentX > 0 then
			deltaX = "+" .. percentX .. "%"
		elseif percentX < 0 then
			deltaX = percentX .. "%"
		end
		if percentY > 0 then
			deltaY = "+" .. percentY .. "%"
		elseif percentY < 0 then
			deltaY = percentY .. "%"
		end
		TEXT.text = "("..x.."x"..y..") ("..deltaX..","..deltaY..")"
		TEXT.visibility = Visibility.INHERIT
	else
		TEXT.visibility = Visibility.FORCE_OFF
	end
end

Events.Connect("Study_ScreenSize", OnSubjectScreenSize)

-- Other observer scripts can access this information
function GetSubjectScreenSize()
	return subjectScreenX, subjectScreenY
end

-- Observer cleans up
function OnStudyEnded()
	TEXT.visibility = Visibility.FORCE_OFF
end

Events.Connect("Study_End", OnStudyEnded)

-- Observer is notified if the option to display resolution changes mid-study
function OnOptionChanged(optionName, value)
	if API.IsObserver(PLAYER)
	and optionName == "res" then
		if value then
			TEXT.visibility = Visibility.INHERIT
			OnSubjectScreenSize(subjectScreenX, subjectScreenY)
		else
			TEXT.visibility = Visibility.FORCE_OFF
		end
	end
end
Events.Connect("Study_OptionChanged", OnOptionChanged)

