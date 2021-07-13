--[[
	User Study - Mouse Cursor
	v1.1
	by: standardcombo
	
	Manages replication of mouse cursor position from subjects to observers.
--]]

local API = require( script:GetCustomProperty("UserStudyAPI") )
local SCREEN_SIZE_SCRIPT = script:GetCustomProperty("ScreenSizeScript"):WaitForObject()
local SUBJECT_CURSOR = script:GetCustomProperty("SubjectCursor"):WaitForObject()

local CURSOR_RECORD_RATE = 0.05
local CURSOR_SEND_RATE = 0.25
local MAX_CURSOR_BUFFER = 4

local PLAYER = Game.GetLocalPlayer()

local MODE_NORMALIZED = 1
local MODE_CENTERED = 2
local MODE_ABSOLUTE = 3
local cursorMode = MODE_NORMALIZED

local wasCursorVisible = false
local cursorBuffer = {}
local readNextElapsedTime = 0
local targetCursorPosition = Vector2.New()

-- Hide the cursor if the study ends
function OnStudyEnded()
	SUBJECT_CURSOR.visibility = Visibility.FORCE_OFF
end

-- Hide the cursor if the subject changes
function OnSubjectChanged(observer, subject)
	SUBJECT_CURSOR.visibility = Visibility.FORCE_OFF
end

Events.Connect("Study_End", OnStudyEnded)
Events.Connect("Study_NewSubject", OnSubjectChanged)

-- Observer updates the position of the fake cursor
function Tick(deltaTime)
	if SUBJECT_CURSOR.visibility == Visibility.INHERIT then
		-- Debuffer position data, one at a time
		readNextElapsedTime = readNextElapsedTime + deltaTime
		if readNextElapsedTime >= CURSOR_RECORD_RATE and #cursorBuffer > 0 then
			readNextElapsedTime = 0
			targetCursorPosition = ApplyNormalizationMode(cursorBuffer[1])
			table.remove(cursorBuffer, 1)
		end
		-- Smooth the movement
		local t = readNextElapsedTime / CURSOR_RECORD_RATE
		t = CoreMath.Clamp(t)
		SUBJECT_CURSOR.x = CoreMath.Lerp(SUBJECT_CURSOR.x, targetCursorPosition.x, t)
		SUBJECT_CURSOR.y = CoreMath.Lerp(SUBJECT_CURSOR.y, targetCursorPosition.y, t)
	end
end

-- Observer has to decide how to handle cursor positions when the resolution of
-- their screen differs from that of the subject
function ApplyNormalizationMode(position)
	if not SCREEN_SIZE_SCRIPT.context then return position end
	
	local screenX,screenY = SCREEN_SIZE_SCRIPT.context.GetSubjectScreenSize()
	if screenX <= 0 or screenY <= 0 then return position end
	
	local mySize = UI.GetScreenSize()
	
	-- Normalize the cursor position, from the subject's screen to the observer's
	if cursorMode == MODE_NORMALIZED then
		position.x = position.x / screenX * mySize.x
		position.y = position.y / screenY * mySize.y
		
	elseif cursorMode == MODE_CENTERED then
		local dx = screenX - mySize.x
		local dy = screenY - mySize.y
		position.x = position.x - dx / 2
		position.y = position.y - dy / 2
	end
	return position
end

-- Subject buffers cursor positions
Task.Spawn(function()
	while true do
		Task.Wait(CURSOR_RECORD_RATE)
		
		if UI.IsCursorVisible()
		and #cursorBuffer < MAX_CURSOR_BUFFER
		and API.IsSubject(PLAYER) then
			table.insert(cursorBuffer, UI.GetCursorPosition())
		end
	end
end)

-- Subject sends buffered cursor positions
Task.Spawn(function()
	while true do
		Task.Wait(CURSOR_SEND_RATE)
		
		if API.IsSubject(PLAYER) then
			if UI.IsCursorVisible() then
				wasCursorVisible = true
				API.BroadcastToObservers("Study_Cursor", table.unpack(cursorBuffer))
				cursorBuffer = {}
				
			elseif wasCursorVisible then
				wasCursorVisible = false
				API.BroadcastToObservers("Study_Cursor") -- No cursor data disables it
				cursorBuffer = {}
			end
		end
	end
end)

-- Observer receives cursor positions
function OnCursorPosition(...)
	if ... then
		SUBJECT_CURSOR.visibility = Visibility.INHERIT
		cursorBuffer = {...}
	else
		SUBJECT_CURSOR.visibility = Visibility.FORCE_OFF
	end
end

Events.Connect("Study_Cursor", OnCursorPosition)

