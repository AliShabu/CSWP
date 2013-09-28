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
			
	File: CSWPTextures.lua
	Author: Sam@ke
--]]

-- // Water // --
local cswpWaterTextures = {"waterclear256"}

-- // Glass // --
local cswpGlassTextures = { "ws_shopfront1a", "ws_shopfront1b", "ws_skyscraperwin1", "ws_skywins1", "ws_skywinsgreen", "ws_skywins4", "ws_airportwin2", "nt_bonav1",
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

-- // Grass // --						
local cswpGrassTextures = {"txgrass1_1", "txgrass0_1", "txgrass1_0"}

-- // Excluding // -- those textures should be rendered but unaffected from shaders
local cswpExcludingTextures = {	"cloudmasked", "skybox", "collisionsmoke", "particleskid", "shad_exp", "coronastar", "sfnitewindow_alfa", "sfnitewindows", "monlith_win_tex",
							"sfxref_lite2c", "dt_scyscrap_door2", "white", "casinolights6lit3_256", "cj_frame_glass", "casinolights1b_128n", "casinolights4_128",
							"casinolights7_256", "custom_roadsign_text", "bullethitsmoke", "dt_twinklylites", "vgsn_nl_strip", "unnamed", "splash_up1", "splash_up2",
							"coronaringa", "gensplash", "boatwake1", "boatwake2", "white64", "lasjmslumwin1", "pierwin05_law", "nitwin01_la", "sl_dtwinlights1", "smoke"}

-- // Deleted // -- those textures should´nt be rendered					
local cswpDeletedTextures = {"lamp_shad_64", "shad_ped", "shad_bike", "shad_car", "shad_heli", "shad_rcbaron"}	

-- // GETTER // --
function cswpGetWaterTextures()
	return cswpWaterTextures
end
		
function cswpGetGlassTextures()
	return cswpGlassTextures
end

function cswpGetGrassTextures()
	return cswpGrassTextures
end

function cswpGetExcludingTextures()
	return cswpExcludingTextures
end

function cswpGetDeletedTextures()
	return cswpDeletedTextures
end