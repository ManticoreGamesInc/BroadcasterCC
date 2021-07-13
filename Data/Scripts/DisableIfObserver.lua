--[[
	Disable if Observer
	v1.0
	by: standardcombo
	
	Disables the visibility of its parent, if the local player is an
	observer. Works in conjuction with the Broadcaster / User Study CCs.
--]]

local ROOT = script.parent

function Tick()
	Task.Wait(2)
	
	if _G.UserStudy and _G.UserStudy.IsObserver(Game.GetLocalPlayer()) then
		ROOT.visibility = Visibility.FORCE_OFF
	else
		ROOT.visibility = Visibility.INHERIT
	end
end