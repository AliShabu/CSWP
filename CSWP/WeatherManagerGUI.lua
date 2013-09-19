local screenWidth, screenHeight = guiGetScreenSize()
local shaderGUIKey = "F2"
local guiBarText = "CSWP Panel by Ren_172 & Sam@ke"
local sizeX, sizeY = 500, 200

function initializeGUI()
	mainWindow = guiCreateWindow (screenWidth/2 - sizeX/2, screenHeight/2 - sizeY/2, sizeX, sizeY, guiBarText, false)
	checkBoxShowShaders = guiCreateCheckBox(0.1, 0.2, 0.4, 0.1, "Enable/Disable all shaders", true, true, mainWindow)
	checkBoxShowDynamicSkyBox = guiCreateCheckBox(0.1, 0.3, 0.4, 0.1, "Enable/Disable skybox shader", true, true, mainWindow)
	checkBoxShowDynamicLight = guiCreateCheckBox(0.5, 0.3, 0.45, 0.1, "Enable/Disable dynamic light shader", true, true, mainWindow)
	checkBoxShowShadows = guiCreateCheckBox(0.1, 0.4, 0.4, 0.1, "Enable/Disable shadow shader", false, true, mainWindow)
	checkBoxShowGodRays = guiCreateCheckBox(0.5, 0.4, 0.4, 0.1, "Enable/Disable godray shader", true, true, mainWindow)
	checkBoxShowWater = guiCreateCheckBox(0.1, 0.5, 0.4, 0.1, "Enable/Disable water shader", true, true, mainWindow)
	checkBoxShowCar = guiCreateCheckBox(0.5, 0.5, 0.4, 0.1, "Enable/Disable car shader", true, true, mainWindow)
	checkBoxShowGlass = guiCreateCheckBox(0.1, 0.6, 0.4, 0.1, "Enable/Disable glass shader", true, true, mainWindow)
	checkBoxShowGrass = guiCreateCheckBox(0.5, 0.6, 0.4, 0.1, "Enable/Disable grass shader", false, true, mainWindow)
	guiSetVisible(mainWindow, false)
end
addEventHandler("onClientResourceStart", root, initializeGUI)


function getCheckBoxValues()
	if (guiCheckBoxGetSelected(checkBoxShowShaders)) then
		setShowShadersClient("true")
	else
		setShowShadersClient("false")
	end
	
	if (guiCheckBoxGetSelected(checkBoxShowDynamicSkyBox)) then
		setShowSkyboxShaderClient("true")
	else
		setShowSkyboxShaderClient("false")
	end
	
	if (guiCheckBoxGetSelected(checkBoxShowDynamicLight)) then
		setShowDynamicLightShaderClient("true")
	else
		setShowDynamicLightShaderClient("false")
	end
	
	if (guiCheckBoxGetSelected(checkBoxShowShadows)) then
		setShowShadowShaderClient("true")
	else
		setShowShadowShaderClient("false")
	end
	
	if (guiCheckBoxGetSelected(checkBoxShowGodRays)) then
		setShowGodrayShaderClient("true")
	else
		setShowGodrayShaderClient("false")
	end
	
	if (guiCheckBoxGetSelected(checkBoxShowWater)) then
		setShowWaterShaderClient("true")
	else
		setShowWaterShaderClient("false")
	end
	
	if (guiCheckBoxGetSelected(checkBoxShowCar)) then
		setShowCarShaderClient("true")
	else
		setShowCarShaderClient("false")
	end
	
	if (guiCheckBoxGetSelected(checkBoxShowGlass)) then
		setShowGlassShaderClient("true")
	else
		setShowGlassShaderClient("false")
	end
	
	if (guiCheckBoxGetSelected(checkBoxShowGrass)) then
		setShowGrassShaderClient("true")
	else
		setShowGrassShaderClient("false")
	end
end
addEventHandler("onClientRender", root, getCheckBoxValues)


bindKey(shaderGUIKey, "down",
function()
    if (guiGetVisible(mainWindow) == false) then
		guiSetVisible(mainWindow, true)
		guiBringToFront(mainWindow)
		guiSetInputEnabled(true)
	else
		guiSetVisible(mainWindow, false)
		guiSetInputEnabled(false)
    end
end)