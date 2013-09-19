local screenWidth, screenHeight = guiGetScreenSize()
local player = getLocalPlayer()
local px, py, pz, prx, pry, prz
local camPositions = {}
local wayPoint1, wayPoint2 = nil, nil
local demoIsPlaying = "false"
local demoIsRecording = "false"
local recordText = ""
local playText = ""
local demoPlayKey = "U"
local demoRecordKey = "I"
local demoSaveKey = "O"

local player = getLocalPlayer()
local cx, cy, cz, clx, cly, clz
local waypoints
local flyStep1 = 1
local flyStep2 = 1
local camSpeed = 1000 -- camera move speed in milliseconds

function PlayDemo()
	if(#camPositions > 1) and (demoIsPlaying == "false") then
		px, py, pz, prx, pry, prz = getElementPosition(player)
		setElementFrozen(player, true)
		demoIsPlaying = "true"
		flyStep1 = 1
		playText = "Playing demo..."
		setCameraMovement()
		addEventHandler("onClientRender", root, setCameraMovement)
		createWayPoints()
	else
		outputChatBox("No demo recorded...")
	end
end

function StopPlayDemo()
	if (demoIsPlaying == "true") then
		setElementPosition(player, px, py, pz, prx, pry, prz)
		setElementFrozen(player, false)
		demoIsPlaying = "false"
		playText = "Stop demo..."
		removeEventHandler("onClientRender", root, setCameraMovement)
		removeWayPoints()
	end
end

function RecordDemo()
	if (demoIsRecording == "false") then
		px, py, pz, prx, pry, prz = getElementPosition(player)
		setElementFrozen(player, true)
		demoIsRecording = "true"
		waypoints = 0
		camPositions = {}
		recordText = "Recording demo..."
	end
end

function StopRecordDemo()
	if (demoIsRecording == "true") then
		setElementPosition(player, px, py, pz, prx, pry, prz)
		setElementFrozen(player, false)
		demoIsRecording = "false"
		recordText = "Stop recording..."
	end
end

function DemoRender()
	if (demoIsPlaying == "true") then
		showPlayerHudComponent("all", false)
		dxDrawText(playText, screenWidth/2, screenHeight - 50, screenWidth/2, screenHeight - 50, tocolor ( 255, 255, 255, 255 ), 1, "pricedown", "center", "center")
	elseif (demoIsRecording == "true") then
		showPlayerHudComponent("all", false)
		dxDrawText(recordText, screenWidth/2, screenHeight - 50, screenWidth/2, screenHeight - 50, tocolor ( 255, 0, 0, 255 ), 1, "pricedown", "center", "center")
		cx, cy, cz, clx, cly, clz = getCameraMatrix()
	else
		showPlayerHudComponent("all", true)
	end
end
addEventHandler("onClientRender", root, DemoRender)


bindKey(demoPlayKey, "down",
function()
    if (demoIsPlaying == "false") then
		PlayDemo()
		StopRecordDemo()
	else
		StopPlayDemo()
		setCameraTarget(player)
    end
end)

bindKey(demoRecordKey, "down",
function()
    if (demoIsRecording == "false") then
		RecordDemo()
		StopPlayDemo()
		exports.freecam:setFreecamEnabled()
	else
		StopRecordDemo()
		setCameraTarget(player)
		exports.freecam:setFreecamDisabled()
    end
end)

bindKey(demoSaveKey, "down",
function()
    if (demoIsRecording == "true") then
		cx, cy, cz, clx, cly, clz = getCameraMatrix()
		waypoints = waypoints + 1
		camPositions[waypoints] = {cx, cy, cz, clx, cly, clz}
		outputChatBox("Waypoint " .. waypoints .. " saved.")
    end
end)

function setCameraMovement()
	local maxSteps = (#camPositions)
	
	local cx1, cy1, cz1, clx1, cly1, clz1 = unpack(camPositions[flyStep1])
	local cx, cy, cz, clx, cly, clz = getCameraMatrix()
	
	local distance = getDistanceBetweenPoints3D(cx, cy, cz, cx1, cy1, cz1)
	
	if (distance <= 1) then
		flyStep1 = flyStep1 + 1
		if (flyStep1 >= maxSteps) then
			flyStep1 =  maxSteps
		end
	end
	
	local progress = (camSpeed * distance)/10
	
	moveCamera(cx1, cy1, cz1, clx1, cly1, clz1, progress)
end
 
function moveCamera(x2, y2, z2, x2t, y2t, z2t, progress)
	if (wayPoint1) and (wayPoint2) then
		moveObject(wayPoint1, progress, x2, y2, z2, 0, 0, 0, "Linear")
		moveObject(wayPoint2, progress, x2t, y2t, z2t, 0, 0, 0, "Linear")
		local nx1, ny1, nz1 = getElementPosition(wayPoint1)
		local nx2, ny2, nz2 = getElementPosition(wayPoint2)
		setCameraMatrix(nx1, ny1, nz1, nx2, ny2, nz2)
	end
end

function createWayPoints()
	local x1, y1, z1, lx1, ly1, lz1 = unpack(camPositions[1])
	
	if (not wayPoint1) then
		wayPoint1 = createObject(1337, x1, y1, z1)
		setElementAlpha(wayPoint1, 0)
		setObjectScale(wayPoint1, 0)
	end
	
	if (not wayPoint2) then
		wayPoint2 = createObject(1337, x1, y1, z1)
		setElementAlpha(wayPoint2, 0)
		setObjectScale(wayPoint2, 0)
	end
end

function removeWayPoints()
	if (wayPoint1) then
		destroyElement(wayPoint1)
		wayPoint1 = nil
	end
	
	if (wayPoint2) then
		destroyElement(wayPoint2)
		wayPoint2 = nil
	end
end