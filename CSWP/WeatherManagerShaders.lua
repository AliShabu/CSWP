local screenWidth, screenHeight = guiGetScreenSize()
local myScreenSource = dxCreateScreenSource(screenWidth, screenHeight)

windVelocity = {0, 0, 0}
rainLevel = 0

-- CAMERA
local camX, camY, camZ, camRotX, camRotY, camRotZ -- camera coords

-- SUN
local sunTex = dxCreateTexture("textures/env/sun.png")
local fakeSun = nil
local sunX, sunY, sunZ = 0, 0, 0 -- sun position by server
local sx, sy, sz = 0, 0, 0 -- real sun position in relation to player

-- SKYBOX
local skyBoxShader, skyBoxTec = nil, nil
local skyBox
local skyTextures = {}
local skyBoxTexture1, skyBoxTexture2
fadeValue = 0
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

-- TEXTURES
local glassTextures = { "ws_shopfront1a", "ws_shopfront1b", "ws_skyscraperwin1", "ws_skywins1", "ws_skywinsgreen", "ws_skywins4", "ws_airportwin2", "nt_bonav1",
                        "ws_airportdoors1", "sf_hospitaldr1", "sf_hospitaldr2", "lomall_ext2_", "sf_nitewindows", "sf_windos_4", "sl_dwntwnvic4", "sl_dwntwndr1",
                        "mullcar01_law", "vgncorpdoor1_512", "carshowroom1", "poshentrance2_256", "sl_dtwinlights2", "vgndwntwn2_256_256", "poshentrance1_256",
                        "courthsewin2_128", "courthsedor2_256", "vgnbankbld4_256", "vgnbankbld5_256", "vgsn_nl_strip", "vgnbankbld6_256", "vgnbankbld4_256", "vgnbankbld3_256",
                        "sw_door10", "247sign1_64", "sw_door10", "starfish_static_lits", "shopwindowlow2_256", "corporate3", "247sign2", "247sign1", "vgnburgwal5_256",
                        "vgnburgwal3_256", "vgnburger_256", "cluckbell01_law", "casinolights8_128n", "hirisedoor1_256", "gallery01_law", "churchdoor1_lan", "sw_wind17",
                        "corporate3green_128", "airportwindow02_128", "ws_airportwin3", "sw_genstore", "marinawindow1_256", "marinadoor1_256", "marinawindow2_256",
                        "frostwin01_law", "ballywindw02_128", "ballywindw01_128", "slidingdoor01_128", "sw_door12", "sanairtex3", "sanairtex2", "mirrwind1_lan",
                        "sw_wind16", "sanpedocka1", "nt_bonav1_refl", "sl_laglasswall1", "churchwin1_lan", "sl_dwntwnshpfrnt1", "sl_dtwinlights1", "ballywall01_64",
                        "genwndw01_128", "shody1_256", "marinadoor2_256", "elcid2_256", "sw_door09", "steakhouse_256", "ws_xenon_3", "ws_xenon_2", "ws_xenon_1",
                        "vgnmetalwall6_256", "vgnmetalwall4_256", "scoreboardvgn_256", "disgraceland1_256", "bailbondvg_256", "ws_xenon_1", "vgnburgwal4_128",
                        "burgershotmenu256", "burgershotsign1_256", "ottos_sfe", "newindow4", "sw_door10", "ws_japwin", "ws_dom's", "ws_oldershop2", "ws_oldershop1",
                        "ws_ed_shop3", "ws_ed_shop4", "ws_ed_shop2", "ws_ed_shop10", "ws_w's_shopfront", "ws_archangels_dirty", "sf_window_mod1", "hotel_win1",
                        "ws_glassnbrassdoor", "deisel_1sfs", "blindzip_law", "sfe_arch6", "sfe_arch8", "sfe_nicearch4", "bevdoor02_law", "garage_win_sfw",
                        "veding2_64", "veding1_64", "supasave_wintemp", "supasave_sfw", "staddoors1", "policeha02_128", "policeha02black_128", "airportwind03",
                        "sw_wind02", "sw_door08", "sw_wind05", "sw_wind06", "sw_storewin01", "sjmbwall2", "sw_door15", "sw_wind23", "amity_law", "bbar_stuff2",
                        "black16", "sw_wind18", "mp_bluemetaldoor_256", "sw_genx4", "sw_locals", "cos_liqbots", "lastripmall1", "sw_warewinx4", "sw_patiodoors",
                        "sw_wind22", "shopdoor01_law", "flmngo11_128", "flmngo04_256", "flmngo05_256", "sw_realtywin", "sw_confessthru", "sw_wind08", "sw_door16",
                        "sw_wind13", "sw_wind12", "cj_sweets", "bank_wall4", "sw_dryclean", "sw_furnisign", "sw_dicksounds", "sw_stereosign", "sw_storewin02",
                        "ws_ammu-awning", "sw_door07", "ws_carshowwin1", "ws_boxhouse_wins7", "ws_boxhouse_wins5", "ws_haightshop1alt", "ws_haightshop1altdoor",
                        "ws_hoteldoor1", "ws_cinemasign1", "ws_queens1", "grn_window2_16", "ferry_build4", "sw_hardware02", "711shop1", "ws_trainstationwin1",
                        "ws_glass_balustrade_better", "siliconvalleywins2", "siliconvalleywins1", "siliconvalleywins5", "siliconvalleywins3", "ws_airportwin2",
                        "ws_airportwin1", "ws_glass_balustrade", "sf_windos_5", "luxorwindow01_128", "skylight_windows", "glasswindow3b_256", "vgssshopnew01",
                        "vegaswigshop1_256", "souveniers1_256", "sanpshop1", "resaurantsign1_256", "sw_door18", "des_dinerwall", "donut1_sfw", "alleywin4",
                        "corporate1", "gymshop2_lae", "windblind_law", "century02_la", "yelloconcw_la", "glasfenc1_la", "wolf1", "lawshop3", "lawshop2", "lawshop4",
                        "cj_sprunk_dirty", "lawshop1", "frostdoor01_law", "comptwindo2", "4winscurt_law", "aanewd", "gangwin1_lae", "comptwindo1", "lasclean1",
                        "ws_fuckedwin1", "ws_demolishwins1", "glassblock_law"}

local carTextures = {"vehiclegrunge256", "vehiclegeneric256", "vehiclescratch64", "vehiclelights128", "vehiclelightson128", "banshee92wheel32"}

local waterTextures = {"waterclear256"}

local grassTextures = {"txgrass1_1", "txgrass0_1", "txgrass1_0"}

-- textures which should rendered but prevent from shaders
local excludingTextures = {	"cloudmasked", "skybox", "collisionsmoke", "particleskid", "shad_exp", "coronastar", "sfnitewindow_alfa", "sfnitewindows", "monlith_win_tex",
							"sfxref_lite2c", "dt_scyscrap_door2", "white", "casinolights6lit3_256", "cj_frame_glass", "casinolights1b_128n", "casinolights4_128",
							"casinolights7_256", "custom_roadsign_text", "bullethitsmoke", "dt_twinklylites", "vgsn_nl_strip", "unnamed", "splash_up1", "splash_up2",
							"coronaringa", "gensplash", "boatwake1", "boatwake2", "white64", "lasjmslumwin1", "pierwin05_law", "nitwin01_la", "sl_dtwinlights1", "smoke"}

-- textures which shouldnt be rendered						
local deletingTextures = {"lamp_shad_64", "shad_ped", "shad_bike", "shad_car", "shad_heli", "shad_rcbaron"}		

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
				for key, value in ipairs(deletingTextures) do
					engineApplyShaderToWorldTexture(clearShader, deletingTextures[key])
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

		dxUpdateScreenSource(myScreenSource)
		
		if (skyBoxShader) then
			dxSetShaderValue(skyBoxShader, "skyBoxTexture1", skyBoxTexture1)
			dxSetShaderValue(skyBoxShader, "skyBoxTexture2", skyBoxTexture2)
			dxSetShaderValue(skyBoxShader, "fadeValue", fadeValue)
			dxSetShaderValue(skyBoxShader, "skyRotate", {skyRotX, skyRotY, skyRotZ})
			dxSetShaderValue(skyBoxShader, "sunTexture", sunTex)
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
			dxSetShaderValue(dynamicLightShader, "rainLevel", rainLevel)
		end
		
		if (shadowShader) then
			dxSetShaderValue(shadowShader, "sunPos", {sx, sy, sz})
			dxSetShaderValue(shadowShader, "shadowColor", shadowColor)
			dxSetShaderValue(shadowShader, "lightColor", lightColor)
		end
		
		if (godrayShader) then		
			if (ssx) and (ssy) then
				dxSetShaderValue(godrayShader, "sunPos", {(1/screenWidth)*ssx, (1/screenHeight)*ssy})
			end
			
			dxSetShaderValue(godrayShader, "ScreenSource", myScreenSource)
			dxSetShaderValue(godrayShader, "godRayLength", getGodRayLength())
			dxSetShaderValue(godrayShader, "godRayStrength", godRayStrength)
			dxSetShaderValue(godrayShader, "godRaySamples", godRaySamples)
			dxSetShaderValue(godrayShader, "sunColor", lightColor)

			dxDrawImage(0, 0, screenWidth, screenHeight, godrayShader)
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
			dxSetShaderValue(waterShader, "reflectionTexture", myScreenSource)
			dxSetShaderValue(waterShader, "refractionTexture", myScreenSource)
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
			dxSetShaderValue(carShader, "mainReflectionTexture", myScreenSource);
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
		
		setFarClipDistance(fogEnd)
		setFogDistance(fogStart)
		setWeather(0)
		setHeatHaze(0)
		setBlurLevel(0)
		setSunSize(0)
		setMoonSize(0)
		local windX, windY, windZ = unpack(windVelocity)
		setWindVelocity(windX, windY, windZ)
		setRainLevel(rainLevel)
		
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