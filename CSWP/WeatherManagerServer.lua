--//WEATHER MANAGER//--

-- // Main // --
root = getRootElement()
resourceRoot = getResourceRootElement(getThisResource())

-- // Settings // --
local refreshTime = 1000 -- how often should be refreshed and synced to clients 
local currentWeatherTable = {}
local nextWeatherTable = {}
local weatherTable = {}
local settingsTable = {}
local hour, minute = 0, 0
local gameSpeed = 1


function updateTime()
	hour, minute = getTime()
	local comingHour = hour + 1
	
	if (comingHour > 23) then
		comingHour = 0
	end
	
	-- sync resource speed to current game speed
	gameSpeed = getGameSpeed()
	local currentMinuteSpeed = 1000/gameSpeed
	setMinuteDuration(currentMinuteSpeed)
	
	currentWeatherTable = weatherSettings["_" .. hour]
	nextWeatherTable = weatherSettings["_" .. comingHour]
	
	handleLightColor()
	handleAmbientColor()
	handleFog()
	handleRain()
	handleWindVelocity()
	handleSunPosition()
	syncToClients()
end
setTimer(updateTime, refreshTime, 0)


function refreshResourceSettings()
	
	if get("showshaders") then
		settingsTable.showShadersServer = get("showshaders") or "true"
	end
	
	if get("showdynamicskyshader") then
		settingsTable.showSkyboxShaderServer = get("showdynamicskyshader") or "true"
	end
	
	if get("showdynamiclightshader") then
		settingsTable.showDynamicLightShaderServer = get("showdynamiclightshader") or "true"
	end
	
	if get("showshadowshader") then
		settingsTable.showShadowShaderServer = get("showshadowshader") or "false"
	end
	
	if get("showgodrayshader") then
		settingsTable.showGodrayShaderServer = get("showgodrayshader") or "true"
	end
	
	if get("showwatershader") then
		settingsTable.showWaterShaderServer = get("showwatershader") or "true"
	end
	
	if get("showcarshader") then
		settingsTable.showCarShaderServer = get("showcarshader") or "true"
	end
	
	if get("showglassshader") then
		settingsTable.showGlassShaderServer = get("showglassshader") or "true"
	end
	
	if get("showgrassshader") then
		settingsTable.showGrassShaderServer = get("showgrassshader") or "true"
	end
	
	settingsTable.serverTime = {hour, minute}
	
	triggerClientEvent("getServerSettings", root, settingsTable)
end
setTimer(refreshResourceSettings, refreshTime, 0)

function handleLightColor()
	local firstR, firstG, firstB, firstA = unpack(currentWeatherTable.lightColor)
	local secondR, secondG, secondB, secondA = unpack(nextWeatherTable.lightColor)
	local multiplier = (1/60)*(minute + 1)
	local varR = math.abs(firstR - secondR) * multiplier
	local varG = math.abs(firstG - secondG) * multiplier
	local varB = math.abs(firstB - secondB) * multiplier
	local varA = math.abs(firstA - secondA) * multiplier
	
	local currentR, currentG, currentB, currentA
	
	if (firstR <= secondR) then currentR = firstR + varR else currentR = firstR - varR end
	if (firstG <= secondG) then currentG = firstG + varG else currentG = firstG - varG end
	if (firstB <= secondB) then currentB = firstB + varB else currentB = firstB - varB end
	if (firstA <= secondA) then currentA = firstA + varA else currentA = firstA - varA end
	
	weatherTable.lightColor = {currentR, currentG, currentB, currentA}
end

function handleAmbientColor()
	local firstR, firstG, firstB, firstA = unpack(currentWeatherTable.lightAmbient)
	local secondR, secondG, secondB, secondA = unpack(nextWeatherTable.lightAmbient)
	local multiplier = (1/60)*(minute + 1)
	local varR = math.abs(firstR - secondR) * multiplier
	local varG = math.abs(firstG - secondG) * multiplier
	local varB = math.abs(firstB - secondB) * multiplier
	local varA = math.abs(firstA - secondA) * multiplier
	
	local currentR, currentG, currentB, currentA
	
	if (firstR <= secondR) then currentR = firstR + varR else currentR = firstR - varR end
	if (firstG <= secondG) then currentG = firstG + varG else currentG = firstG - varG end
	if (firstB <= secondB) then currentB = firstB + varB else currentB = firstB - varB end
	if (firstA <= secondA) then currentA = firstA + varA else currentA = firstA - varA end
	
	weatherTable.lightAmbient = {currentR, currentG, currentB, currentA}
end

function handleFog()
	local firstFog = currentWeatherTable.fogStart
	local secondFog = nextWeatherTable.fogStart
	local multiplier = (1/60)*(minute + 1)
	local varFog = math.abs(firstFog - secondFog) * multiplier
	
	local currentFog
	
	if (firstFog <= secondFog) then currentFog = firstFog + varFog else currentFog = firstFog - varFog end
	
	weatherTable.fogStart = currentFog
end

function handleRain()
	local firstRain = currentWeatherTable.rainLevel
	local secondRain = nextWeatherTable.rainLevel
	local multiplier = (1/60)*(minute + 1)
	local varRain = math.abs(firstRain - secondRain) * multiplier
	
	local currentRain
	
	if (firstRain <= secondRain) then currentRain = firstRain + varRain else currentRain = firstRain - varRain end
	
	weatherTable.rainLevel = currentRain
end

function handleWindVelocity()
	local firstX, firstY, firstZ = unpack(currentWeatherTable.windVelocity)
	local secondX, secondY, secondZ = unpack(nextWeatherTable.windVelocity)
	local multiplier = (1/60)*(minute + 1)
	local varX = math.abs(firstX - secondX) * multiplier
	local varY= math.abs(firstY - secondY) * multiplier
	local varZ = math.abs(firstZ - secondZ) * multiplier
	
	local currentX, currentY, currentZ
	
	if (firstX <= secondX) then currentX = firstX + varX else currentX = firstX - varX end
	if (firstY <= secondY) then currentY = firstY + varY else currentY = firstY - varY end
	if (firstZ <= secondZ) then currentZ = firstZ + varZ else currentZ = firstZ - varZ end
	
	weatherTable.windVelocity = {currentX, currentY, currentZ}
end

function handleSunPosition()
	local firstX, firstY, firstZ = unpack(currentWeatherTable.sunPos)
	local secondX, secondY, secondZ = unpack(nextWeatherTable.sunPos)
	local multiplier = (1/60)*(minute + 1)
	local varX = math.abs(firstX - secondX) * multiplier
	local varY= math.abs(firstY - secondY) * multiplier
	local varZ = math.abs(firstZ - secondZ) * multiplier
	
	local currentX, currentY, currentZ
	
	if (firstX <= secondX) then currentX = firstX + varX else currentX = firstX - varX end
	if (firstY <= secondY) then currentY = firstY + varY else currentY = firstY - varY end
	if (firstZ <= secondZ) then currentZ = firstZ + varZ else currentZ = firstZ - varZ end
	
	weatherTable.sunPos = {currentX, currentY, currentZ}
end

function syncToClients()
	triggerClientEvent("onWeatherSync", root, weatherTable)
	triggerClientEvent("getServerSettings", root, settingsTable)
end
addEvent("onClientRequestWeatherSync", true )
addEventHandler("onClientRequestWeatherSync", root, syncToClients)