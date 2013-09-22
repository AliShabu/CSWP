-- // WEATHER MANAGER // --

-- // Main // --

-- // Settings // --
local showShadersServer = nil
local showShadersClient = "true"
local showSkyboxShaderServer = nil
local showSkyboxShaderClient = "true"
local showDynamicLightShaderServer = nil
local showDynamicLightShaderClient = "true"
local showShadowShaderServer = nil
local showShadowShaderClient = "false"
local showGodrayShaderServer = nil
local showGodrayShaderClient = "true"
local showWaterShaderServer = nil
local showWaterShaderClient = "true"
local showCarShaderServer = nil
local showCarShaderClient = "true"
local showGlassShaderServer = nil
local showGlassShaderClient = "true"
local showGrassShaderServer = nil
local showGrassShaderClient = "false"

-- // binds // --
local shaderKey = "F3" -- all shader enable/disable shortkey

-- //shader variables // --
local dayTime = ""
local weather = ""
local temperature = 12

-- SkyBox
local hour, minute, lastMinute, second, getLastTick = 0, 0, 0, 0, 0
local skyTextures = {}

for i = 0, 23, 1 do
	skyTextures[i] = dxCreateTexture("textures/sky/sky" .. i .. ".dds")
end

function liveUpdate()
	hour, minute = getTime()
	
	if (getTickCount() - getLastTick < 10)  then 
		return 
	end
	
	if (lastMinute == minute)  then 
		second = second + (((getTickCount() - getLastTick)) * getGameSpeed())
	else  
		second = 0  
	end
	
	if (second > 1000) then 
		second = 1000 
	end 
	
	local timeAspect = (((hour * 60) + minute) + (second / 900)) /1440
	
	skyRotZ = math.rad((timeAspect) * 360)
	getLastTick = getTickCount()
	lastMinute = minute
	
	if (hour and minute) then
		local comingHour = hour + 1
		
		if (comingHour > 23) then
			comingHour = 0
		end
		
		fadeValue = ((1/60) * minute)			
		skyBoxTexture1 = skyTextures[hour]
		skyBoxTexture2 = skyTextures[comingHour]
	end
	
	-- debug
	local timeText = (string.format("%02d", hour)..":"..string.format("%02d", minute))
	dxDrawText(timeText, 25, 25, screenWidth, screenHeight, tocolor(255, 255, 255, 255), 1, "pricedown")
end
addEventHandler("onClientRender", root, liveUpdate)


function weatherManager(serverTable)
	if (serverTable) then
		if (serverTable.lightColor) then
			lightColor = serverTable.lightColor
		end
		
		if (serverTable.lightAmbient) then
			ambientColor = serverTable.lightAmbient
		end
		
		if (serverTable.fogStart) then
			fogStart = serverTable.fogStart
		end
		
		if (serverTable.windVelocity) then
			windVelocity = serverTable.windVelocity
		end
		
		if (serverTable.rainLevel) then
			rainLevel = serverTable.rainLevel
		end
		
		if (serverTable.sunPos) then
			setSunPosition(serverTable.sunPos)
		end
		
		if (serverTable.temperature) then
			setTemperature(serverTable.temperature)
		end
		
		if (serverTable.serverWeatherStats) then
			setWeatherStats(serverTable.serverWeatherStats)
		end
	end
end
addEvent("onWeatherSync", true )
addEventHandler("onWeatherSync", root, weatherManager)


function requestServerData()
	triggerServerEvent("onClientRequestWeatherSync", root)
end
addEventHandler("onClientResourceStart", resourceRoot, requestServerData)


function receiveResourceSettings(settingsTable)
	-- get server settings
	if (settingsTable) then
		
		if (settingsTable.showShadersServer) then
			setShowShadersServer(settingsTable.showShadersServer)
		end
		
		if (settingsTable.showSkyboxShaderServer) then
			setShowSkyboxShaderServer(settingsTable.showSkyboxShaderServer)
		end
		
		if (settingsTable.showDynamicLightShaderServer) then
			setShowDynamicLightShaderServer(settingsTable.showDynamicLightShaderServer)
		end
		
		if (settingsTable.showShadowShaderServer) then
			setShowShadowShaderServer(settingsTable.showShadowShaderServer)
		end
		
		if (settingsTable.showGodrayShaderServer) then
			setShowGodrayShaderServer(settingsTable.showGodrayShaderServer)
		end
		
		if (settingsTable.showWaterShaderServer) then
			setShowWaterShaderServer(settingsTable.showWaterShaderServer)
		end
		
		if (settingsTable.showCarShaderServer) then
			setShowCarShaderServer(settingsTable.showCarShaderServer)
		end
		
		if (settingsTable.showGlassShaderServer) then
			setShowGlassShaderServer(settingsTable.showGlassShaderServer)
		end
		
		if (settingsTable.showGrassShaderServer) then
			setShowGrassShaderServer(settingsTable.showGrassShaderServer)
		end
	end
end
addEvent("getServerSettings", true)
addEventHandler("getServerSettings", root, receiveResourceSettings)

-- // SETTINGS // --

-- shader mode
function setShowShadersServer(bool)
	if (bool) then
		showShadersServer = bool
	end
end

function getShowShadersServer()
	return showShadersServer
end

function setShowShadersClient(bool)
	if (bool) then
		showShadersClient = bool
	end
end

function getShowShadersClient()
	return showShadersClient
end


-- skybox
function setShowSkyboxShaderServer(bool)
	if (bool) then
		showSkyboxShaderServer = bool
	end
end

function getShowSkyboxShaderServer()
	return showSkyboxShaderServer
end

function setShowSkyboxShaderClient(bool)
	if (bool) then
		showSkyboxShaderClient = bool
	end
end

function getShowSkyboxShaderClient()
	return showSkyboxShaderClient
end


-- dynamic light
function setShowDynamicLightShaderServer(bool)
	if (bool) then
		showDynamicLightShaderServer = bool
	end
end

function getShowDynamicLightShaderServer()
	return showDynamicLightShaderServer
end

function setShowDynamicLightShaderClient(bool)
	if (bool) then
		showDynamicLightShaderClient = bool
	end
end

function getShowDynamicLightShaderClient()
	return showDynamicLightShaderClient
end


-- shadows
function setShowShadowShaderServer(bool)
	if (bool) then
		showShadowShaderServer = bool
	end
end

function getShowShadowShaderServer()
	return showShadowShaderServer
end

function setShowShadowShaderClient(bool)
	if (bool) then
		showShadowShaderClient = bool
	end
end

function getShowShadowShaderClient()
	return showShadowShaderClient
end


-- godrays
function setShowGodrayShaderServer(bool)
	if (bool) then
		showGodrayShaderServer = bool
	end
end

function getShowGodrayShaderServer()
	return showGodrayShaderServer
end

function setShowGodrayShaderClient(bool)
	if (bool) then
		showGodrayShaderClient = bool
	end
end

function getShowGodrayShaderClient()
	return showGodrayShaderClient
end


-- water
function setShowWaterShaderServer(bool)
	if (bool) then
		showWaterShaderServer = bool
	end
end

function getShowWaterShaderServer()
	return showWaterShaderServer
end

function setShowWaterShaderClient(bool)
	if (bool) then
		showWaterShaderClient = bool
	end
end

function getShowWaterShaderClient()
	return showWaterShaderClient
end


-- car
function setShowCarShaderServer(bool)
	if (bool) then
		showCarShaderServer = bool
	end
end

function getShowCarShaderServer()
	return showCarShaderServer
end

function setShowCarShaderClient(bool)
	if (bool) then
		showCarShaderClient = bool
	end
end

function getShowCarShaderClient()
	return showCarShaderClient
end


-- glass
function setShowGlassShaderServer(bool)
	if (bool) then
		showGlassShaderServer = bool
	end
end

function getShowGlassShaderServer()
	return showGlassShaderServer
end

function setShowGlassShaderClient(bool)
	if (bool) then
		showGlassShaderClient = bool
	end
end

function getShowGlassShaderClient()
	return showGlassShaderClient
end


-- grass
function setShowGrassShaderServer(bool)
	if (bool) then
		showGrassShaderServer = bool
	end
end

function getShowGrassShaderServer()
	return showGrassShaderServer
end

function setShowGrassShaderClient(bool)
	if (bool) then
		showGrassShaderClient = bool
	end
end

function getShowGrassShaderClient()
	return showGrassShaderClient
end

bindKey(shaderKey, "down",
function()
    if (getShowShadersClient() == "false") then
		setShowShadersClient("true")
		guiCheckBoxSetSelected(checkBoxShowShaders, true)
	else
		setShowShadersClient("false")
		guiCheckBoxSetSelected(checkBoxShowShaders, false)
    end
end)

-- // Shaders Settings// --

function setWeatherStats(serverWeatherStats)
	if (serverWeatherStats) then
		local serverDayTime, serverWeather = unpack(serverWeatherStats)
		setDayTime(serverDayTime)
		setCSWPWeather(serverWeather)
	end
end

-- // Daytime // --
function setDayTime(serverDayTime)
	if (serverDayTime) then
		dayTime = serverDayTime
	end
end

function getDayTime()
	return dayTime
end

-- // Weather // --
function setCSWPWeather(weatherVar)
	if (weatherVar) then
		weather = weatherVar
	end
end

function getCSWPWeather()
	return weather
end

-- // Temperature // --
function setTemperature(temp)
	if (temp) then
		temperature = temp
	end
end

function getTemperature()
	return temperature
end