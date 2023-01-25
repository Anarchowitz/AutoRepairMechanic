script_name("AutoRep")
script_authors("Anarch")
script_description("Script for Mechanics Arizona Role Play")
script_version("1.0.1")
script_properties("Worked")

require "lib.moonloader"
require "lib.samp.events"
local sampev = require "lib.samp.events"
local main_color = 0x698CC8

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(3000) end

	sampAddChatMessage("AutoRep loaded", main_color)
	sampAddChatMessage("Author: Anarch", main_color)
	
	while true do
		wait(0)
		local closestid = getNearestDriver()
		if isKeyJustPressed(0x71) and not sampIsCursorActive() then
		sampSendChat("/repare " .. closestid .. " 500")
		end
		
		local closestid = getNearestDriver()
		if isKeyJustPressed(0x72) and not sampIsCursorActive() then
		sampSendChat("/filscar " .. closestid .. " 260")
		end
    end

	while true do
		wait(0)
	end
end

function sampev.onServerMessage(color, text)
	lua_thread.create(function()
		if text:find("Р’С‹ РїСЂРµРґР»РѕР¶РёР»Рё .+ РїРѕС‡РёРЅРёС‚СЊ С‚СЂР°РЅСЃРїРѕСЂС‚ Р·Р°") then
			wait(30000)
			sampAddChatMessage("РљР” Р—Р°РєРѕРЅС‡РёР»РѕСЃСЊ!", main_color)
		end
	end)
end

function getNearestDriver()
    local mx, my, mz = getCharCoordinates(PLAYER_PED)
    local nearId, dist = -1, 999
    for i, handle in ipairs(getAllChars()) do
        if doesCharExist(handle) and handle ~= PLAYER_PED and isCharInAnyCar(handle) then
            local vx, vy, vz = getCharCoordinates(handle)
            local cDist = getDistanceBetweenCoords3d(mx, my, mz, vx, vy, vz)
            local r, id = sampGetPlayerIdByCharHandle(handle)
            if r and cDist < dist then
                dist = cDist
                nearId = id
            end
        end
    end
    return nearId
end
