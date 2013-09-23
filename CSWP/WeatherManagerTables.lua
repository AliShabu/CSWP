-- // WEATHER-TABLES // --
-- including 120 weather settings (5 themes per each hour) (hot, sunny, cloudy, rainy, stormy)
-- Sky Textures:
-- sky1: day sunny
-- sky2: day sunny
-- sky3: day sunny
-- sky4: day sunny
-- sky5: day sunny
-- sky6: day sunny
-- sky7: day sunny
-- sky8: day cloudy
-- sky9: day cloudy
-- sky10: day cloudy
-- sky11: day rainy
-- sky12: day rainy
-- sky13: morning cloudy
-- sky14: morning cloudy
-- sky15: morning cloudy
-- sky16: morning clear
-- sky17: morning clear
-- sky18: evening clear
-- sky19: evening clear
-- sky20: night clear
-- sky21: night cloudy
-- sky22: night rainy

weatherSettings = {
	-- // hot weather settings
	_hot = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.95, 0.9, 1.0},
			lightAmbient = {0.18, 0.19, 0.21, 1.0},
			skyTexture = 1,
			fogStart = 140,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10992, 0},
			temperature = 19,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.95, 0.8, 1.0},
			lightAmbient = {0.19, 0.20, 0.23, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10076, 150},
			temperature = 19,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.95, 0.7, 1.0},
			lightAmbient = {0.21, 0.22, 0.26, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -9160, 300},
			temperature = 19,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.9, 0.6, 1.0},
			lightAmbient = {0.24, 0.26, 0.29, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -8244, 450},
			temperature = 19,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.5, 1.0},
			lightAmbient = {0.26, 0.28, 0.32, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -7328, 600},
			temperature = 20,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.34, 0.34, 0.34, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -6412, 750},
			temperature = 21,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.44, 0.41, 0.37, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -5496, 1000},
			temperature = 22,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.54, 0.54, 0.54, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -4580, 1250},
			temperature = 25,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.64, 0.62, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -3664, 1500},
			temperature = 29,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.72, 0.70, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -2748, 1750},
			temperature = 33,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.69, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -1832, 2000},
			temperature = 38,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.84, 0.8, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -916, 2500},
			temperature = 40,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.89, 0.87, 0.84, 1.0},
			skyTexture = 1,
			fogStart = 500,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 0, 3000},
			temperature = 42,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.74, 0.74, 0.74, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 916, 2500},
			temperature = 41,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.85, 0.83, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 1832, 2000},
			temperature = 40,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.71, 0.71, 0.71, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 2748, 1750},
			temperature = 35,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.7, 0.68, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 3664, 1500},
			temperature = 33,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.67, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 4580, 1250},
			temperature = 32,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.69, 0.64, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 5496, 1000},
			temperature = 31,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.61, 0.61, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 6412, 750},
			temperature = 28,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.59, 0.58, 0.49, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 7328, 600},
			temperature = 25,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.54, 0.44, 0.44, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 8244, 450},
			temperature = 23,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.39, 0.35, 0.31, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 9160, 300},
			temperature = 21,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.28, 0.24, 0.24, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 10076, 150},
			temperature = 19,
		},
	},
	
	-- // sunny weather settings
	_sunny = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.95, 0.9, 1.0},
			lightAmbient = {0.18, 0.19, 0.21, 1.0},
			skyTexture = 1,
			fogStart = 140,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10992, 0},
			temperature = 19,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.95, 0.8, 1.0},
			lightAmbient = {0.19, 0.20, 0.23, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10076, 150},
			temperature = 19,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.95, 0.7, 1.0},
			lightAmbient = {0.21, 0.22, 0.26, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -9160, 300},
			temperature = 19,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.9, 0.6, 1.0},
			lightAmbient = {0.24, 0.26, 0.29, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -8244, 450},
			temperature = 19,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.5, 1.0},
			lightAmbient = {0.26, 0.28, 0.32, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -7328, 600},
			temperature = 20,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.34, 0.34, 0.34, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -6412, 750},
			temperature = 21,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.44, 0.41, 0.37, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -5496, 1000},
			temperature = 22,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.54, 0.54, 0.54, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -4580, 1250},
			temperature = 25,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.64, 0.62, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -3664, 1500},
			temperature = 29,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.72, 0.70, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -2748, 1750},
			temperature = 33,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.69, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -1832, 2000},
			temperature = 38,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.84, 0.8, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -916, 2500},
			temperature = 40,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.89, 0.87, 0.84, 1.0},
			skyTexture = 1,
			fogStart = 500,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 0, 3000},
			temperature = 42,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.74, 0.74, 0.74, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 916, 2500},
			temperature = 41,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.85, 0.83, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 1832, 2000},
			temperature = 40,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.71, 0.71, 0.71, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 2748, 1750},
			temperature = 35,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.7, 0.68, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 3664, 1500},
			temperature = 33,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.67, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 4580, 1250},
			temperature = 32,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.69, 0.64, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 5496, 1000},
			temperature = 31,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.61, 0.61, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 6412, 750},
			temperature = 28,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.59, 0.58, 0.49, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 7328, 600},
			temperature = 25,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.54, 0.44, 0.44, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 8244, 450},
			temperature = 23,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.39, 0.35, 0.31, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 9160, 300},
			temperature = 21,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.28, 0.24, 0.24, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 10076, 150},
			temperature = 19,
		},
	},
	
	-- // cloudy weather settings
	_cloudy = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.95, 0.9, 1.0},
			lightAmbient = {0.18, 0.19, 0.21, 1.0},
			skyTexture = 1,
			fogStart = 140,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10992, 0},
			temperature = 19,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.95, 0.8, 1.0},
			lightAmbient = {0.19, 0.20, 0.23, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10076, 150},
			temperature = 19,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.95, 0.7, 1.0},
			lightAmbient = {0.21, 0.22, 0.26, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -9160, 300},
			temperature = 19,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.9, 0.6, 1.0},
			lightAmbient = {0.24, 0.26, 0.29, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -8244, 450},
			temperature = 19,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.5, 1.0},
			lightAmbient = {0.26, 0.28, 0.32, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -7328, 600},
			temperature = 20,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.34, 0.34, 0.34, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -6412, 750},
			temperature = 21,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.44, 0.41, 0.37, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -5496, 1000},
			temperature = 22,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.54, 0.54, 0.54, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -4580, 1250},
			temperature = 25,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.64, 0.62, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -3664, 1500},
			temperature = 29,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.72, 0.70, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -2748, 1750},
			temperature = 33,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.69, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -1832, 2000},
			temperature = 38,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.84, 0.8, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -916, 2500},
			temperature = 40,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.89, 0.87, 0.84, 1.0},
			skyTexture = 1,
			fogStart = 500,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 0, 3000},
			temperature = 42,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.74, 0.74, 0.74, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 916, 2500},
			temperature = 41,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.85, 0.83, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 1832, 2000},
			temperature = 40,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.71, 0.71, 0.71, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 2748, 1750},
			temperature = 35,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.7, 0.68, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 3664, 1500},
			temperature = 33,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.67, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 4580, 1250},
			temperature = 32,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.69, 0.64, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 5496, 1000},
			temperature = 31,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.61, 0.61, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 6412, 750},
			temperature = 28,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.59, 0.58, 0.49, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 7328, 600},
			temperature = 25,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.54, 0.44, 0.44, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 8244, 450},
			temperature = 23,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.39, 0.35, 0.31, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 9160, 300},
			temperature = 21,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.28, 0.24, 0.24, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 10076, 150},
			temperature = 19,
		},
	},
	
	-- // rainy weather settings
	_rainy = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.95, 0.9, 1.0},
			lightAmbient = {0.18, 0.19, 0.21, 1.0},
			skyTexture = 1,
			fogStart = 140,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10992, 0},
			temperature = 19,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.95, 0.8, 1.0},
			lightAmbient = {0.19, 0.20, 0.23, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10076, 150},
			temperature = 19,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.95, 0.7, 1.0},
			lightAmbient = {0.21, 0.22, 0.26, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -9160, 300},
			temperature = 19,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.9, 0.6, 1.0},
			lightAmbient = {0.24, 0.26, 0.29, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -8244, 450},
			temperature = 19,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.5, 1.0},
			lightAmbient = {0.26, 0.28, 0.32, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -7328, 600},
			temperature = 20,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.34, 0.34, 0.34, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -6412, 750},
			temperature = 21,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.44, 0.41, 0.37, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -5496, 1000},
			temperature = 22,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.54, 0.54, 0.54, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -4580, 1250},
			temperature = 25,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.64, 0.62, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -3664, 1500},
			temperature = 29,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.72, 0.70, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -2748, 1750},
			temperature = 33,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.69, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -1832, 2000},
			temperature = 38,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.84, 0.8, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -916, 2500},
			temperature = 40,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.89, 0.87, 0.84, 1.0},
			skyTexture = 1,
			fogStart = 500,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 0, 3000},
			temperature = 42,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.74, 0.74, 0.74, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 916, 2500},
			temperature = 41,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.85, 0.83, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 1832, 2000},
			temperature = 40,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.71, 0.71, 0.71, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 2748, 1750},
			temperature = 35,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.7, 0.68, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 3664, 1500},
			temperature = 33,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.67, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 4580, 1250},
			temperature = 32,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.69, 0.64, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 5496, 1000},
			temperature = 31,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.61, 0.61, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 6412, 750},
			temperature = 28,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.59, 0.58, 0.49, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 7328, 600},
			temperature = 25,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.54, 0.44, 0.44, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 8244, 450},
			temperature = 23,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.39, 0.35, 0.31, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 9160, 300},
			temperature = 21,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.28, 0.24, 0.24, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 10076, 150},
			temperature = 19,
		},
	},
	
	-- // stormy weather settings
	_stormy = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.95, 0.9, 1.0},
			lightAmbient = {0.18, 0.19, 0.21, 1.0},
			skyTexture = 1,
			fogStart = 140,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10992, 0},
			temperature = 19,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.95, 0.8, 1.0},
			lightAmbient = {0.19, 0.20, 0.23, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10076, 150},
			temperature = 19,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.95, 0.7, 1.0},
			lightAmbient = {0.21, 0.22, 0.26, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -9160, 300},
			temperature = 19,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.9, 0.6, 1.0},
			lightAmbient = {0.24, 0.26, 0.29, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -8244, 450},
			temperature = 19,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.5, 1.0},
			lightAmbient = {0.26, 0.28, 0.32, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -7328, 600},
			temperature = 20,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.34, 0.34, 0.34, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -6412, 750},
			temperature = 21,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.44, 0.41, 0.37, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -5496, 1000},
			temperature = 22,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.54, 0.54, 0.54, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -4580, 1250},
			temperature = 25,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.64, 0.62, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -3664, 1500},
			temperature = 29,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.72, 0.70, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -2748, 1750},
			temperature = 33,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.69, 0.69, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -1832, 2000},
			temperature = 38,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.84, 0.8, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -916, 2500},
			temperature = 40,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.89, 0.87, 0.84, 1.0},
			skyTexture = 1,
			fogStart = 500,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 0, 3000},
			temperature = 42,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.74, 0.74, 0.74, 1.0},
			skyTexture = 1,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 916, 2500},
			temperature = 41,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.85, 0.83, 0.79, 1.0},
			skyTexture = 1,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 1832, 2000},
			temperature = 40,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.71, 0.71, 0.71, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 2748, 1750},
			temperature = 35,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.7, 0.68, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 3664, 1500},
			temperature = 33,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.4, 1.0},
			lightAmbient = {0.69, 0.67, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 4580, 1250},
			temperature = 32,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.85, 0.4, 1.0},
			lightAmbient = {0.69, 0.64, 0.59, 1.0},
			skyTexture = 1,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 5496, 1000},
			temperature = 31,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.8, 0.4, 1.0},
			lightAmbient = {0.61, 0.61, 0.61, 1.0},
			skyTexture = 1,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 6412, 750},
			temperature = 28,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.59, 0.58, 0.49, 1.0},
			skyTexture = 1,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 7328, 600},
			temperature = 25,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.54, 0.44, 0.44, 1.0},
			skyTexture = 1,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 8244, 450},
			temperature = 23,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.39, 0.35, 0.31, 1.0},
			skyTexture = 1,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 9160, 300},
			temperature = 21,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.28, 0.24, 0.24, 1.0},
			skyTexture = 1,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 10076, 150},
			temperature = 19,
		},
	},
}