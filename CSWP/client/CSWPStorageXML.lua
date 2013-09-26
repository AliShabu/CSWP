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
			
	File: CSWPStorageXML.lua
	Author: Sam@ke
--]]


function initXMLStorage()
	local cswpSettings = cswpGetXMLFile()
	
	if (not cswpSettings) then
		cswpSettings = xmlCreateFile("files/settings/settings.xml", "CSWP_Settings")   
		if (cswpSettings) then
			cswpSetXMLFile(cswpSettings)
			saveXMLData("test", "test")
		else
			outputChatBox("ERROR: Could´nt create CSWP settings.xml! Use /debugscript 3 for more details!")
		end
	end
end
addEventHandler("onClientResourceStart", resourceRoot, initXMLStorage)


function parseXMLData(nodeName)
	local cswpSettings = cswpGetXMLFile() 
	local node = xmlFindChild(cswpSettings, nodeName, 0)
	local nodeValue = nil
	
	if (cswpSettings) then
		if (node) then
			nodeValue = xmlNodeGetValue(node)
		else
			outputChatBox("Warning: " .. nodeName .. " not found in settings.xml! Use /debugscript 3 for more details!")
		end
		
		xmlUnloadFile(cswpSettings)
	else
		outputChatBox("ERROR: Settings.xml not found! Use /debugscript 3 for more details!")
	end
	
	return nodeValue
end


function saveXMLData(nodeName, value)
	if (nodeName) and (value) then
		local cswpSettings = cswpGetXMLFile()
		local node = xmlFindChild(cswpSettings, nodeName, 0)
		
		if (cswpSettings) then
			if (node) then
				xmlNodeSetValue(node, tostring(value))
				xmlSaveFile(cswpSettings)  
				xmlUnloadFile(cswpSettings)
			else
				xmlCreateChild(cswpSettings, tostring(nodeName))
				node = xmlFindChild(cswpSettings, nodeName, 0)
				
				if (node) then
					xmlNodeSetValue(node, tostring(value))
					xmlSaveFile(cswpSettings)  
					xmlUnloadFile(cswpSettings)
				else
					outputChatBox("ERROR: Could´nt be saved! Use /debugscript 3 for more details!")
				end
			end
		else
			outputChatBox("ERROR: Settings.xml not found! Use /debugscript 3 for more details!")
		end	
	end
end