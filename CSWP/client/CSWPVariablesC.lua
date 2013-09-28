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
			
	File: CSWPVariablesC.lua
	Author: Sam@ke
--]]

-- // Globals // --
cswpScreenWidth, cswpScreenHeight = guiGetScreenSize()
cswpScreenSource = dxCreateScreenSource(cswpScreenWidth, cswpScreenHeight)

-- // XML Handling // -- 
local cswpSettingsFile = xmlLoadFile("files/settings/settings.xml")

-- // Basic Shader & Weather Variables // --
local cswpRainLevel = 0
local cswpWindVelocity = {0, 0, 0}


-- // Updating variabes // --
addEventHandler("onClientRender", root,
    function()
        
    end
);

-- // XML Handling // -- 
function cswpSetXMLFile(file)
	if (file) then
		cswpSettingsFile = file
	end
end

function cswpGetXMLFile()
	return cswpSettingsFile
end


-- // Base Shader&Weather Variables // --
function cswpSetRainLevel(rainLevel)
	if(rainLevel) then
		cswpRainLevel = rainLevel
	end
end

function cswpGetRainLevel()
	return cswpRainLevel
end


function cswpSetWindVelocity(velocity)
	if(velocity) then
		cswpWindVelocity = velocity
	end
end

function cswpGetWindVelocity()
	return cswpWindVelocity
end