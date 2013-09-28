--[[
		////////////////	////////////////	////		   ////    //////////////// 
	   ///////////////	   ///////////////	   ////			  ////    //////////////// 
	  ////				  ////				  ////			 ////    ////		 ////
	 ////				 //////////////		 ////   //		////    //////////////// 
	////						  ////		////  // //    ////    //////////////// 
   //////////////	   //////////////	   ////////   ////////    //// 
  //////////////	  //////////////	  ////////   ////////    ////
  
					Community Shader & Weather Pack
						  Open Source (GPLv3)
			Latest source at: https://github.com/Samake/cswp
			
	File: CSWPShaderManager.lua
	Author: Sam@ke
--]]

-- CAMERA
local camX, camY, camZ, camRotX, camRotY, camRotZ -- camera coords

-- SUN
local fakeSun = nil
local sunX, sunY, sunZ = 0, 0, 0 -- sun position by server
local sx, sy, sz = 0, 0, 0 -- real sun position in relation to player

-- SKYBOX
local skyBoxShader, skyBoxTec = nil, nil
local skyBox
local skyTextures = {}
local skyBoxTexture1, skyBoxTexture2
local fadeValue = 0
local skyboxScale = 500
local skyboxID = 15057
local skyboxHeight = skyboxScale/2
skyRotX, skyRotY, skyRotZ = 0, 0, 0

-- Dynamic Light
local dynamicLightShader, dynamicLightTec = nil, nil
local shadowColor = {0.1, 0.1, 0.1, 1.0}
lightColor = {0.85, 0.82, 0.8, 1.0}
ambientColor = {0.82, 0.79, 0.77, 1.0}
local ambientIntensity = 1.0
local lightShiningPower = 0.6
local lightBumpMapFactor = 0.6
fogStart = 200
local fogEnd = 2000

-- SHADOWS
local shadowShader, shadowTec = nil, nil

-- GODRAYS
local godrayShader, godrayTec = nil, nil
local sightClearToSun = "false"
local godRayLength = 0.0 --default
local minGodRayLength = 0.0
local maxGodRayLength = 0.3
local fadeStep = 0.015
local godRayStrength = 0.6
local godRaySamples = 24

-- WATER
local waterNormal = dxCreateTexture("textures/water/normal.png")
local waterShader, waterTec = nil, nil
local waterFrame = 1
local waterNormals = {}
local waterCaustics = {}
local waterColor = {0.18, 0.25, 0.28, 1}
local waterAlpha = 0.85
local waterBrightness = 0.7;
local flowSpeed = 0.7
local reflectScale = 1.0
local refractScale = 1.0
local reflectionStrength = 0.7
local refractionStrength = 1.3
local causticStrength = 0.15
local waterShiningPower = 0.8

-- GLASS
local glassShader, glassTec = nil, nil
local glassReflectionStrength = 0.8
local glassColor = {0.55, 0.55, 0.58, 1}
local glassShiningPower = 2

-- CAR
local carShader, carTec = nil, nil
local carReflectionStrength = 0.4
local carShiningPower = 0.8
local carBumpMapFactor = 0.6

-- GRASS
local grassShader, grassTec = nil, nil
local grassTex1 = dxCreateTexture("textures/grass/grass1.png")
local grassTex2 = dxCreateTexture("textures/grass/grass2.png")

-- CLEAR
local clearShader, clearTec = nil, nil

-- SCRIPT
addEventHandler("onClientResourceStart", resourceRoot,
function()

	for i = 1, 22, 1 do
		skyTextures[i] = dxCreateTexture("textures/sky/sky" .. i .. ".dds")
	end
	--dxSetTestMode("low_mem") -- test mode (none, no_mem, low_mem, no_shader)
	resetFogDistance()
	resetSunSize()
	resetHeatHaze()
	resetSkyGradient()
	resetRainLevel()
	setBirdsEnabled(false)
	setOcclusionsEnabled(false)
	setCloudsEnabled(false)
	
	-- check client version
    if getVersion ().sortable < "1.3.3" then
        outputChatBox("This resource isnt compatible with your current installed MTA:SA version!")
    end
	
	-- parse animated water textures
	for i = 1, 16, 1 do
		waterCaustics[i] = dxCreateTexture("textures/water/water_caustic_" .. i .. ".png")
	end
	
	-- get first weather settings from server
	requestServerData()
end)

function setShaders()
	if (getShowShadersServer() == "true") and (getShowShadersClient() == "true") then
		local excludingTextures = cswpGetExcludingTextures()
		
		if (not skyBoxShader) and (getShowSkyboxShaderServer() == "true") and (getShowSkyboxShaderClient() == "true") then
		
			if (not skyBox) then
				txd = engineLoadTXD("models/skybox/skybox_model.txd")
				dff = engineLoadDFF("models/skybox/skybox_model.dff", skyboxID)
		 
				engineImportTXD(txd, skyboxID)
				engineReplaceModel(dff, skyboxID)
				
				skyBox = createObject(skyboxID, 0, 0, skyboxHeight, 0, 0, 0, true)
				
				if (not skyBox) then
					outputChatBox("Skybox couldnt created...")
				else
					setObjectScale(skyBox, skyboxScale)
					setElementDoubleSided(skyBox, true)
					engineSetModelLODDistance(skyboxID, 5000)
				end
			end
			
			skyBoxShader, skyBoxTec = dxCreateShader("shaders/skybox.fx", 0, 0, true, "all")
				
			if (not skyBoxShader) then
				outputChatBox("Could not create skybox shader. Please use debugscript 3")
			else
				engineApplyShaderToWorldTexture(skyBoxShader, "skybox_tex")
			end
		end
		
		if (not dynamicLightShader) and (getShowDynamicLightShaderServer() == "true") and (getShowDynamicLightShaderClient() == "true") then
			dynamicLightShader, dynamicLightTec = dxCreateShader("shaders/dynamic_light.fx", 0, 0, false, "world,ped,object,other")
				
			if (not dynamicLightShader) then
				outputChatBox("Could not create dynamic light shader. Please use debugscript 3")
			else
				engineApplyShaderToWorldTexture(dynamicLightShader, "*")
				for key, value in ipairs(excludingTextures) do
					engineRemoveShaderFromWorldTexture(dynamicLightShader, excludingTextures[key])
				end
			end
		end
		
		if(getShowShadowShaderServer() == "true") and (getShowShadowShaderClient() == "true") then	
			if (not shadowShader) then 
				shadowShader, shadowTec = dxCreateShader("shaders/shadows.fx", 0, 1000, false, "all")
					
				if (shadowShader) then
					engineApplyShaderToWorldTexture(shadowShader, "*")
					for key, value in ipairs(excludingTextures) do
						engineRemoveShaderFromWorldTexture(shadowShader, excludingTextures[key])
					end
				else
					outputChatBox("Could not create shadow shader. Please use debugscript 3")
				end
			end
		end
		
		if (not godrayShader) and (getShowGodrayShaderServer() == "true") and (getShowGodrayShaderClient() == "true") then
		
			if (not fakeSun) then
				fakeSun = createElement("fakesun")
			else
				setElementPosition(fakeSun, sx, sy, sz, true)
			end
				
			if (not fakeSun) then
				outputChatBox("Fake sun couldnt created! Check debug script 3.")
			end
		
			godrayShader, godrayTec = dxCreateShader("shaders/godrays.fx")
			
			if (not godrayShader) then
				outputChatBox("Could not create godray shader. Please use debugscript 3.")
			end
		end
		
		if (not waterShader) and (getShowWaterShaderServer() == "true") and (getShowWaterShaderClient() == "true") then
			waterShader, waterTec = dxCreateShader("shaders/water.fx", 0, 0, false, "world")
				
			if (not waterShader) then
				outputChatBox("Could not create water shader. Please use debugscript 3.")
			else
				local waterTextures = cswpGetWaterTextures()
				for key, value in ipairs(waterTextures) do
					engineApplyShaderToWorldTexture(waterShader, waterTextures[key])
				end
				
				dxSetShaderValue(waterShader, "normalTexture", waterNormal)
			end
		end
		
		if (not carShader) and (getShowCarShaderServer() == "true") and (getShowCarShaderClient() == "true") then
			carShader, carTec = dxCreateShader("shaders/car.fx", 0, 500, false, "vehicle")
			
			if (not carShader) then
				outputChatBox("Could not create car shader. Please use debugscript 3")
			else
				engineApplyShaderToWorldTexture(carShader, "*")
				for key, value in ipairs(excludingTextures) do
					engineRemoveShaderFromWorldTexture(carShader, excludingTextures[key])
				end
			end
		end
		
		if (not glassShader) and (getShowGlassShaderServer() == "true") and (getShowGlassShaderClient() == "true") then
			glassShader, glassTec = dxCreateShader("shaders/glass.fx", 0, 1000, true, "world")

				
			if (not glassShader) then
				outputChatBox("Could not create glass shader. Please use debugscript 3")
			else
				local glassTextures = cswpGetGlassTextures()
				for key, value in ipairs(glassTextures) do
					engineApplyShaderToWorldTexture(glassShader, glassTextures[key])
				end
			end
		end
		
		if (not grassShader) and (getShowGrassShaderServer() == "true") and (getShowGrassShaderClient() == "true") then
			grassShader, grassTec = dxCreateShader("shaders/grass.fx", 0, 0, false, "world")
				
			if (not grassShader) then
				outputChatBox("Could not create grass shader. Please use debugscript 3.")
			else
				local grassTextures = cswpGetGrassTextures()
				for key, value in ipairs(grassTextures) do
					engineApplyShaderToWorldTexture(grassShader, grassTextures[key])
				end
			end
		end
		
		if (not clearShader) then
			clearShader, clearTec = dxCreateShader("shaders/clear.fx")
				
			if (not clearShader) then
				outputChatBox("Could not create clear shader. Please use debugscript 3")
			else
				local deletedTextures= cswpGetDeletedTextures()
				for key, value in ipairs(deletedTextures) do
					engineApplyShaderToWorldTexture(clearShader, deletedTextures[key])
				end
			end
		end
	end
end

function destroyShaders()
	if (getShowShadersServer() == "false") or (getShowShadersClient() == "false") then
		if (fakeSun) then
			destroyElement(fakeSun)
			fakeSun = nil
			resetFogDistance()
			resetSunSize()
			resetHeatHaze()
			resetSkyGradient()
			resetRainLevel()
		end
		
		if (skyBox) then
			destroyElement(skyBox)
			skyBox = nil
		end
		
		if (skyBoxShader) then
			destroyElement(skyBoxShader)
			skyBoxShader = nil
		end
		
		if (dynamicLightShader) then
			destroyElement(dynamicLightShader)
			dynamicLightShader = nil
		end
		
		if (depthShader) then
			destroyElement(depthShader)
			depthShader = nil
		end
		
		if (shadowShader) then
			destroyElement(shadowShader)
			shadowShader = nil
		end

		if (godrayShader) then
			destroyElement(godrayShader)
			godrayShader = nil
		end
		
		if (waterShader) then
			destroyElement(waterShader)
			waterShader = nil
		end
		
		if (carShader) then
			destroyElement(carShader)
			carShader = nil
		end
		
		if (glassShader) then
			destroyElement(glassShader)
			glassShader = nil
		end
		
		if (grassShader) then
			destroyElement(grassShader)
			grassShader = nil
		end
		
		if (clearShader) then
			destroyElement(clearShader)
			clearShader = nil
		end
	else		
		if (getShowSkyboxShaderServer() == "false") or (getShowSkyboxShaderClient() == "false") then
			if (skyBoxShader) then
				destroyElement(skyBoxShader)
				skyBoxShader = nil
			
				if (skyBox) then
					destroyElement(skyBox)
					skyBox = nil
				end
			end
		end
		
		if (getShowDynamicLightShaderServer() == "false") or (getShowDynamicLightShaderClient() == "false") then
			if (dynamicLightShader) then
				destroyElement(dynamicLightShader)
				dynamicLightShader = nil
			end
		end
		
		if (getShowShadowShaderServer() == "false") or (getShowShadowShaderClient() == "false") then			
			if (shadowShader) then
				destroyElement(shadowShader)
				shadowShader = nil
			end
		end

		if (getShowGodrayShaderServer() == "false") or (getShowGodrayShaderClient() == "false") then
			if (godrayShader) then
				destroyElement(godrayShader)
				godrayShader = nil
				
				if (fakeSun) then
					destroyElement(fakeSun)
					fakeSun = nil
				end
			end
		end
		
		if (getShowWaterShaderServer() == "false") or (getShowWaterShaderClient() == "false") then
			if (waterShader) then
				destroyElement(waterShader)
				waterShader = nil
			end
		end
		
		if (getShowCarShaderServer() == "false") or (getShowCarShaderClient() == "false") then
			if (carShader) then
				destroyElement(carShader)
				carShader = nil
			end
		end
		
		if (getShowGlassShaderServer() == "false") or (getShowGlassShaderClient() == "false") then
			if (glassShader) then
				destroyElement(glassShader)
				glassShader = nil
			end
		end
		
		if (getShowGrassShaderServer() == "false") or (getShowGrassShaderClient() == "false") then
			if (grassShader) then
				destroyElement(grassShader)
				grassShader = nil
			end
		end
	end
end

function updateShaders()
	-- debug
	showPlayerHudComponent("all", false)
	
	if (getShowShadersServer() == "true") and (getShowShadersClient() == "true") then

		dxUpdateScreenSource(cswpScreenSource)
		
		if (skyBoxShader) then
			dxSetShaderValue(skyBoxShader, "skyBoxTexture1", skyBoxTexture1)
			dxSetShaderValue(skyBoxShader, "skyBoxTexture2", skyBoxTexture2)
			dxSetShaderValue(skyBoxShader, "fadeValue", fadeValue)
			dxSetShaderValue(skyBoxShader, "skyRotate", {skyRotX, skyRotY, skyRotZ})
			dxSetShaderValue(skyBoxShader, "sunColor", lightColor)
			dxSetShaderValue(skyBoxShader, "sunPos", {sx, sy, sz})
			
			if (skyBox) then
				setElementPosition(skyBox, camX, camY, camZ - skyboxHeight)
			end
		end
		
		if (dynamicLightShader) then
			dxSetShaderValue(dynamicLightShader, "sunPos", {sx, sy, sz})
			dxSetShaderValue(dynamicLightShader, "shadowColor", shadowColor)
			dxSetShaderValue(dynamicLightShader, "lightColor", lightColor)
			dxSetShaderValue(dynamicLightShader, "ambientColor", ambientColor)
			dxSetShaderValue(dynamicLightShader, "ambientIntensity", ambientIntensity)
			dxSetShaderValue(dynamicLightShader, "lightShiningPower", lightShiningPower)
			dxSetShaderValue(dynamicLightShader, "bumpMapFactor", lightBumpMapFactor)
			dxSetShaderValue(dynamicLightShader, "rainLevel", cswpGetRainLevel())
		end
		
		if (shadowShader) then
			dxSetShaderValue(shadowShader, "sunPos", {sx, sy, sz})
			dxSetShaderValue(shadowShader, "shadowColor", shadowColor)
			dxSetShaderValue(shadowShader, "lightColor", lightColor)
		end
		
		if (godrayShader) then		
			if (ssx) and (ssy) then
				dxSetShaderValue(godrayShader, "sunPos", {(1/cswpScreenWidth)*ssx, (1/cswpScreenHeight)*ssy})
			end
			
			dxSetShaderValue(godrayShader, "ScreenSource", cswpScreenSource)
			dxSetShaderValue(godrayShader, "godRayLength", getGodRayLength())
			dxSetShaderValue(godrayShader, "godRayStrength", godRayStrength)
			dxSetShaderValue(godrayShader, "godRaySamples", godRaySamples)
			dxSetShaderValue(godrayShader, "sunColor", lightColor)

			dxDrawImage(0, 0, cswpScreenWidth, cswpScreenHeight, godrayShader)
		end
		
		if (waterShader) then
			waterFrame = waterFrame + 1
			
			if (waterFrame >= 16) then
				waterFrame = 1
			end
			
			dxSetShaderValue(waterShader, "skyBoxTexture1", skyBoxTexture1)
			dxSetShaderValue(waterShader, "skyBoxTexture2", skyBoxTexture2)
			dxSetShaderValue(waterShader, "fadeValue", fadeValue)
			dxSetShaderValue(waterShader, "skyRotate", {skyRotX, skyRotY, skyRotZ})
			dxSetShaderValue(waterShader, "causticTexture", waterCaustics[waterFrame])
			dxSetShaderValue(waterShader, "reflectionTexture", cswpScreenSource)
			dxSetShaderValue(waterShader, "refractionTexture", cswpScreenSource)
			dxSetShaderValue(waterShader, "waterColor", waterColor)
			dxSetShaderValue(waterShader, "sunColor", lightColor)
			dxSetShaderValue(waterShader, "waterAlpha", waterAlpha)
			dxSetShaderValue(waterShader, "waterBrightness", waterBrightness)
			dxSetShaderValue(waterShader, "sunPos", {sx, sy, sz})
			dxSetShaderValue(waterShader, "flowSpeed", flowSpeed)
			dxSetShaderValue(waterShader, "reflectScale", reflectScale)
			dxSetShaderValue(waterShader, "refractScale", refractScale)
			dxSetShaderValue(waterShader, "reflectionStrength", reflectionStrength)
			dxSetShaderValue(waterShader, "refractionStrength", refractionStrength)
			dxSetShaderValue(waterShader, "causticStrength", causticStrength)
			dxSetShaderValue(waterShader, "waterShiningPower", waterShiningPower)
		end
		
		if (glassShader) then
			dxSetShaderValue(glassShader, "skyBoxTexture1", skyBoxTexture1)
			dxSetShaderValue(glassShader, "skyBoxTexture2", skyBoxTexture2)
			dxSetShaderValue(glassShader, "skyRotate", {skyRotX, skyRotY, skyRotZ})
			dxSetShaderValue(glassShader, "fadeValue", fadeValue)
			dxSetShaderValue(glassShader, "glassColor", glassColor)
			dxSetShaderValue(glassShader, "ambientColor", ambientColor)
			dxSetShaderValue(glassShader, "sunPos", {sx, sy, sz})
			dxSetShaderValue(glassShader, "reflectionStrength", glassReflectionStrength)
			dxSetShaderValue(glassShader, "glassShiningPower", glassShiningPower)

		end
		
		if (carShader) then
			dxSetShaderValue(carShader, "skyBoxTexture1", skyBoxTexture1)
			dxSetShaderValue(carShader, "skyBoxTexture2", skyBoxTexture2)
			dxSetShaderValue(carShader, "skyRotate", {skyRotX, skyRotY, skyRotZ})
			dxSetShaderValue(carShader, "fadeValue", fadeValue)
			dxSetShaderValue(carShader, "mainReflectionTexture", cswpScreenSource);
			dxSetShaderValue(carShader, "sunPos", {sx, sy, sz});
			dxSetShaderValue(carShader, "shadowColor", shadowColor);
			dxSetShaderValue(carShader, "ambientColor", ambientColor);
			dxSetShaderValue(carShader, "ambientIntensity", ambientIntensity)
			dxSetShaderValue(carShader, "carReflectionStrength", carReflectionStrength);
			dxSetShaderValue(carShader, "carShiningPower", carShiningPower)
			dxSetShaderValue(carShader, "bumpMapFactor", carBumpMapFactor)
		end
		
		if (grassShader) then
			dxSetShaderValue(grassShader, "grassTexture", grassTex2)
			dxSetShaderValue(grassShader, "sunColor", lightColor);
		end
    end
end
addEventHandler("onClientPreRender", root, updateShaders)

function render()
	if (getShowShadersServer() == "true") and (getShowShadersClient() == "true") then
		camX, camY, camZ, camRotX, camRotY, camRotZ = getCameraMatrix()
		ssx, ssy = getScreenFromWorldPosition(sx, sy, sz, 0.3, true)
		sx, sy, sz = unpack(getSunPosition())
		px, py, pz = getElementPosition(getLocalPlayer())
		local skyTex01, skyTex02 = getSkyTextures()
		skyBoxTexture1 = skyTextures[skyTex01]
		skyBoxTexture2 = skyTextures[skyTex02]
		fadeValue = getFadeValue()
		
		setFarClipDistance(fogEnd)
		setFogDistance(fogStart)
		setWeather(0)
		setHeatHaze(0)
		setBlurLevel(0)
		setSunSize(0)
		setMoonSize(0)
		local windX, windY, windZ = unpack(cswpGetWindVelocity())
		setWindVelocity(windX, windY, windZ)
		setRainLevel(cswpGetRainLevel())
		
		-- set sky gradient to current light color
		local skyR, skyG, skyB, skyA = unpack(lightColor)
		setSkyGradient(skyR * 128, skyG * 128, skyB * 128, skyR *255, skyG *255, skyB *255)
		
		if (godrayShader) and (fakeSun) then			
			if (isLineOfSightClear(camX, camY, camZ, sx, sy, sz, true, true, true, true, false, false, false, nil)) and (ssx) and (ssy) then
				sightClearToSun = "true"
			else
				sightClearToSun = "false"
			end
		end
	end
	
	setShaders()
	destroyShaders()
end
addEventHandler("onClientRender", root, render)

function getGodRayLength()
	if (sightClearToSun == "true") then
		if (godRayLength < maxGodRayLength) then
			godRayLength = godRayLength + fadeStep
		end
	else
		if (godRayLength > minGodRayLength) then
			godRayLength = godRayLength - fadeStep
		end
	end
	
	local length = godRayLength - (godRayLength * 2)
	
	if (length > 0) then
		length = 0
	end
	
	return length
end

function setSunPosition(sunPos)
	if (sunPos) then
		sunX, sunY, sunZ = unpack(sunPos)
	else
		sunX, sunY, sunZ = 0, 0, 0
	end
end

function getSunPosition()
	-- fix sun to cam
	return {camX, sunY + camY, sunZ + camZ}
end