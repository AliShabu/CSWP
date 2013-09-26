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

local cswpSettingsFile = xmlLoadFile("files/settings/settings.xml")


-- // XML Handling // -- 
function cswpSetXMLFile(file)
	if (file) then
		cswpSettingsFile = file
	end
end

function cswpGetXMLFile()
	return cswpSettingsFile
end