local screenWidth, screenHeight = guiGetScreenSize()
local player = getLocalPlayer()

local isStarted = false
local minFrames = 0
local maxFrames = 0
local averageFrames = 0

local benchMarkFrames = {}
local coordsTable = {}

function startBenchMark()
	isStarted = true
end

function stopBenchMark()
	isStarted = false
end

function benchMarkGUI()
	if (isStarted == true) then
		
	end
end
addEventHandler("onClientRender", root, benchMarkGUI)