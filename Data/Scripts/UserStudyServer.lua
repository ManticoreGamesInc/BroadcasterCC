--[[
	User Study - Server
	v1.1
	by: standardcombo
	
	Handles setup on the server-side.
--]]

local API = require( script:GetCustomProperty("UserStudyAPI") )
local NETWORKED_OBJECT = script:GetCustomProperty("NetworkedObject"):WaitForObject()

_G.UserStudy = API

API.RegisterNetworkedObject(NETWORKED_OBJECT)

