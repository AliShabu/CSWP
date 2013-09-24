-- // WEATHER-TABLES // --

--[[
Including 120 weather settings (5 themes per each hour) (hot, sunny, cloudy, rainy, stormy)

Daytime States:
----------------------
00:00 - 03:00 night
04:00 - 08:00 morning
09:00 - 19:00 day
20:00 - 22:00 evening
23:00 night

Sky Textures:
----------------------
1: day sunny
2: day sunny
3: day sunny
4: day sunny
5: day sunny
6: day sunny
7: day sunny
8: day cloudy
9: day cloudy
10: day cloudy
11: day rainy
12: day rainy
13: morning cloudy
14: morning cloudy
15: morning cloudy
16: morning clear
17: morning clear
18: evening clear
19: evening clear
20: night clear
21: night cloudy
22: night rainy
--]]

weatherSettings = {
	-- // hot weather settings
	_hot = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.99, 0.98, 1.0},
			lightAmbient = {0.15, 0.17, 0.2, 1.0},
			skyTexture = 20,
			fogStart = 120,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -12000, 0},
			temperature = 19,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.98, 0.98, 1.0},
			lightAmbient = {0.2, 0.22, 0.25, 1.0},
			skyTexture = 20,
			fogStart = 140,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -11000, 250},
			temperature = 19,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.98, 0.96, 1.0},
			lightAmbient = {0.25, 0.25, 0.3, 1.0},
			skyTexture = 20,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -10000, 500},
			temperature = 19,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.96, 0.92, 1.0},
			lightAmbient = {0.3, 0.3, 0.32, 1.0},
			skyTexture = 20,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -9000, 750},
			temperature = 19,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.8, 1.0},
			lightAmbient = {0.4, 0.33, 0.35, 1.0},
			skyTexture = 16,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -8000, 1000},
			temperature = 20,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.55, 0.5, 0.4, 1.0},
			skyTexture = 17,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -7000, 1250},
			temperature = 21,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.6, 0.57, 0.45, 1.0},
			skyTexture = 16,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -6000, 1500},
			temperature = 22,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.66, 0.62, 0.5, 1.0},
			skyTexture = 17,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -5000, 1750},
			temperature = 25,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.7, 0.68, 0.5, 1.0},
			skyTexture = 16,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -4000, 2000},
			temperature = 29,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.75, 0.72, 0.55, 1.0},
			skyTexture = 1,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -3000, 2250},
			temperature = 33,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.77, 0.75, 0.6, 1.0},
			skyTexture = 2,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -2000, 2500},
			temperature = 38,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.84, 0.8, 0.6, 1.0},
			skyTexture = 3,
			fogStart = 430,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, -1000, 2750},
			temperature = 40,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.92, 0.88, 0.6, 1.0},
			skyTexture = 4,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 0, 3000},
			temperature = 42,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.87, 0.84, 0.55, 1.0},
			skyTexture = 5,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 1000, 2750},
			temperature = 41,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.85, 0.83, 0.55, 1.0},
			skyTexture = 6,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 2000, 2500},
			temperature = 40,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.8, 0.78, 0.55, 1.0},
			skyTexture = 7,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 3000, 2250},
			temperature = 35,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.77, 0.72, 0.55, 1.0},
			skyTexture = 6,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 4000, 2000},
			temperature = 33,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.75, 0.72, 0.5, 1.0},
			skyTexture = 5,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 5000, 1750},
			temperature = 32,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.72, 0.7, 0.5, 1.0},
			skyTexture = 4,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 6000, 1500},
			temperature = 31,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.69, 0.65, 0.5, 1.0},
			skyTexture = 3,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 7000, 1250},
			temperature = 28,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.6, 0.56, 0.45, 1.0},
			skyTexture = 18,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 8000, 1000},
			temperature = 25,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.55, 0.46, 0.4, 1.0},
			skyTexture = 19,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 9000, 750},
			temperature = 23,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.39, 0.37, 0.3, 1.0},
			skyTexture = 18,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 10000, 500},
			temperature = 21,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.28, 0.24, 0.24, 1.0},
			skyTexture = 20,
			fogStart = 150,
			rainLevel = 0,
			windVelocity = {0, 0, 0},
			sunPos = {0, 11000, 250},
			temperature = 19,
		},
	},
	
	-- // sunny weather settings
	_sunny = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.99, 0.98, 1.0},
			lightAmbient = {0.2, 0.2, 0.25, 1.0},
			skyTexture = 20,
			fogStart = 140,
			rainLevel = 0,
			windVelocity = {0.2, 0, 0},
			sunPos = {0, -12000, 0},
			temperature = 19,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.98, 0.98, 1.0},
			lightAmbient = {0.22, 0.22, 0.27, 1.0},
			skyTexture = 20,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0, 0.2, 0},
			sunPos = {0, -11000, 250},
			temperature = 19,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.98, 0.96, 1.0},
			lightAmbient = {0.28, 0.28, 0.3, 1.0},
			skyTexture = 20,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0.2, 0.1, 0},
			sunPos = {0, -10000, 500},
			temperature = 19,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.96, 0.92, 1.0},
			lightAmbient = {0.35, 0.32, 0.32, 1.0},
			skyTexture = 20,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0.2, 0, 0},
			sunPos = {0, -9000, 750},
			temperature = 19,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.8, 1.0},
			lightAmbient = {0.45, 0.4, 0.4, 1.0},
			skyTexture = 17,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0, 0.2, 0},
			sunPos = {0, -8000, 1000},
			temperature = 20,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.5, 0.45, 0.4, 1.0},
			skyTexture = 16,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0.2, 0.2, 0},
			sunPos = {0, -7000, 1250},
			temperature = 20,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.55, 0.52, 0.45, 1.0},
			skyTexture = 16,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0.2, 0.1, 0},
			sunPos = {0, -6000, 1500},
			temperature = 20,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.6, 0.58, 0.5, 1.0},
			skyTexture = 17,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0.2, 0},
			sunPos = {0, -5000, 1750},
			temperature = 21,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.72, 0.7, 0.5, 1.0},
			skyTexture = 16,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0.1, 0.2, 0},
			sunPos = {0, -4000, 2000},
			temperature = 21,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.75, 0.72, 0.55, 1.0},
			skyTexture = 7,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0.1, 0.1, 0},
			sunPos = {0, -3000, 2250},
			temperature = 23,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.8, 0.79, 0.6, 1.0},
			skyTexture = 6,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0.2, 0, 0},
			sunPos = {0, -2000, 2500},
			temperature = 25,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.85, 0.82, 0.65, 1.0},
			skyTexture = 5,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0, 0.2, 0},
			sunPos = {0, -1000, 2750},
			temperature = 27,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.92, 0.9, 0.65, 1.0},
			skyTexture = 4,
			fogStart = 500,
			rainLevel = 0,
			windVelocity = {0.2, 0.1, 0},
			sunPos = {0, 0, 3000},
			temperature = 30,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.87, 0.85, 0.65, 1.0},
			skyTexture = 3,
			fogStart = 470,
			rainLevel = 0,
			windVelocity = {0.2, 0, 0},
			sunPos = {0, 1000, 2750},
			temperature = 30,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.85, 0.83, 0.6, 1.0},
			skyTexture = 2,
			fogStart = 440,
			rainLevel = 0,
			windVelocity = {0, 0.2, 0},
			sunPos = {0, 2000, 2500},
			temperature = 29,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.82, 0.81, 0.5, 1.0},
			skyTexture = 1,
			fogStart = 410,
			rainLevel = 0,
			windVelocity = {0, 0.1, 0},
			sunPos = {0, 3000, 2250},
			temperature = 29,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.79, 0.77, 0.55, 1.0},
			skyTexture = 2,
			fogStart = 380,
			rainLevel = 0,
			windVelocity = {0.2, 0.2, 0},
			sunPos = {0, 4000, 2000},
			temperature = 27,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.75, 0.72, 0.6, 1.0},
			skyTexture = 3,
			fogStart = 350,
			rainLevel = 0,
			windVelocity = {0, 0.2, 0},
			sunPos = {0, 5000, 1750},
			temperature = 26,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.7, 0.68, 0.55, 1.0},
			skyTexture = 4,
			fogStart = 320,
			rainLevel = 0,
			windVelocity = {0.2, 0, 0},
			sunPos = {0, 6000, 1500},
			temperature = 25,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.65, 0.62, 0.5, 1.0},
			skyTexture = 5,
			fogStart = 290,
			rainLevel = 0,
			windVelocity = {0, 0.2, 0},
			sunPos = {0, 7000, 1250},
			temperature = 25,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.6, 0.58, 0.45, 1.0},
			skyTexture = 19,
			fogStart = 260,
			rainLevel = 0,
			windVelocity = {0.2, 0.2, 0},
			sunPos = {0, 8000, 1000},
			temperature = 24,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.55, 0.5, 0.4, 1.0},
			skyTexture = 18,
			fogStart = 230,
			rainLevel = 0,
			windVelocity = {0.1, 0.2, 0},
			sunPos = {0, 9000, 750},
			temperature = 23,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.38, 0.35, 0.3, 1.0},
			skyTexture = 19,
			fogStart = 200,
			rainLevel = 0,
			windVelocity = {0.2, 0.1, 0},
			sunPos = {0, 10000, 500},
			temperature = 21,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.28, 0.26, 0.28, 1.0},
			skyTexture = 20,
			fogStart = 170,
			rainLevel = 0,
			windVelocity = {0.2, 0, 0},
			sunPos = {0, 11000, 250},
			temperature = 19,
		},
	},
	
	-- // cloudy weather settings
	_cloudy = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.99, 0.98, 1.0},
			lightAmbient = {0.17, 0.17, 0.21, 1.0},
			skyTexture = 21,
			fogStart = 100,
			rainLevel = 0,
			windVelocity = {0.4, 0.2, 0},
			sunPos = {0, -12000, 0},
			temperature = 17,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.98, 0.98, 1.0},
			lightAmbient = {0.19, 0.19, 0.23, 1.0},
			skyTexture = 21,
			fogStart = 130,
			rainLevel = 0,
			windVelocity = {0.2, 0.5, 0},
			sunPos = {0, -11000, 250},
			temperature = 17,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.98, 0.96, 1.0},
			lightAmbient = {0.21, 0.21, 0.26, 1.0},
			skyTexture = 21,
			fogStart = 140,
			rainLevel = 0,
			windVelocity = {0.7, 0, 0},
			sunPos = {0, -10000, 500},
			temperature = 17,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.96, 0.92, 1.0},
			lightAmbient = {0.22, 0.21, 0.25, 1.0},
			skyTexture = 21,
			fogStart = 190,
			rainLevel = 0,
			windVelocity = {0.2, 0.8, 0},
			sunPos = {0, -9000, 750},
			temperature = 17,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.8, 1.0},
			lightAmbient = {0.33, 0.31, 0.25, 1.0},
			skyTexture = 13,
			fogStart = 220,
			rainLevel = 0,
			windVelocity = {0.5, 0.6, 0},
			sunPos = {0, -8000, 1000},
			temperature = 17,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.38, 0.32, 0.28, 1.0},
			skyTexture = 14,
			fogStart = 250,
			rainLevel = 0,
			windVelocity = {0.8, 0.1, 0},
			sunPos = {0, -7000, 1250},
			temperature = 17,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.44, 0.41, 0.3, 1.0},
			skyTexture = 15,
			fogStart = 280,
			rainLevel = 0,
			windVelocity = {0.2, 0.6, 0},
			sunPos = {0, -6000, 1500},
			temperature = 18,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.54, 0.52, 0.4, 1.0},
			skyTexture = 13,
			fogStart = 310,
			rainLevel = 0,
			windVelocity = {0.4, 0.4, 0},
			sunPos = {0, -5000, 1750},
			temperature = 18,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.64, 0.62, 0.5, 1.0},
			skyTexture = 14,
			fogStart = 340,
			rainLevel = 0,
			windVelocity = {0.7, 0.3, 0},
			sunPos = {0, -4000, 2000},
			temperature = 19,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.72, 0.70, 0.55, 1.0},
			skyTexture = 8,
			fogStart = 370,
			rainLevel = 0,
			windVelocity = {0.8, 0.5, 0},
			sunPos = {0, -3000, 2250},
			temperature = 19,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.77, 0.75, 0.65, 1.0},
			skyTexture = 9,
			fogStart = 400,
			rainLevel = 0,
			windVelocity = {0.5, 0.3, 0},
			sunPos = {0, -2000, 2500},
			temperature = 21,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.84, 0.8, 0.6, 1.0},
			skyTexture = 10,
			fogStart = 430,
			rainLevel = 0,
			windVelocity = {0.3, 0.8, 0},
			sunPos = {0, -1000, 2750},
			temperature = 22,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.9, 0.87, 0.6, 1.0},
			skyTexture = 9,
			fogStart = 460,
			rainLevel = 0,
			windVelocity = {0.5, 0.4, 0},
			sunPos = {0, 0, 3000},
			temperature = 23,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.87, 0.85, 0.55, 1.0},
			skyTexture = 8,
			fogStart = 430,
			rainLevel = 0,
			windVelocity = {0.7, 0.3, 0},
			sunPos = {0, 1000, 2750},
			temperature = 23,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.85, 0.83, 0.5, 1.0},
			skyTexture = 9,
			fogStart = 400,
			rainLevel = 0,
			windVelocity = {0.6, 0.6, 0},
			sunPos = {0, 2000, 2500},
			temperature = 22,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.8, 0.78, 0.5, 1.0},
			skyTexture = 10,
			fogStart = 370,
			rainLevel = 0,
			windVelocity = {0.2, 0.5, 0},
			sunPos = {0, 3000, 2250},
			temperature = 22,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.75, 0.72, 0.45, 1.0},
			skyTexture = 9,
			fogStart = 340,
			rainLevel = 0,
			windVelocity = {0.4, 0.3, 0},
			sunPos = {0, 4000, 2000},
			temperature = 22,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.72, 0.66, 0.45, 1.0},
			skyTexture = 10,
			fogStart = 310,
			rainLevel = 0,
			windVelocity = {0.5, 0.2, 0},
			sunPos = {0, 5000, 1750},
			temperature = 21,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.7, 0.68, 0.5, 1.0},
			skyTexture = 8,
			fogStart = 280,
			rainLevel = 0,
			windVelocity = {0.9, 0.1, 0},
			sunPos = {0, 6000, 1500},
			temperature = 21,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.65, 0.6, 0.6, 1.0},
			skyTexture = 9,
			fogStart = 250,
			rainLevel = 0,
			windVelocity = {0.5, 0.3, 0},
			sunPos = {0, 7000, 1250},
			temperature = 21,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.59, 0.55, 0.5, 1.0},
			skyTexture = 15,
			fogStart = 210,
			rainLevel = 0,
			windVelocity = {0.5, 0.5, 0},
			sunPos = {0, 8000, 1000},
			temperature = 20,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.54, 0.5, 0.44, 1.0},
			skyTexture = 15,
			fogStart = 190,
			rainLevel = 0,
			windVelocity = {0.7, 0.6, 0},
			sunPos = {0, 9000, 750},
			temperature = 19,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.39, 0.36, 0.34, 1.0},
			skyTexture = 15,
			fogStart = 160,
			rainLevel = 0,
			windVelocity = {0.6, 0.4, 0},
			sunPos = {0, 10000, 500},
			temperature = 19,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.28, 0.26, 0.24, 1.0},
			skyTexture = 21,
			fogStart = 130,
			rainLevel = 0,
			windVelocity = {0.4, 0.3, 0},
			sunPos = {0, 11000, 250},
			temperature = 18,
		},
	},
	
	-- // rainy weather settings
	_rainy = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.99, 0.98, 1.0},
			lightAmbient = {0.16, 0.16, 0.21, 1.0},
			skyTexture = 22,
			fogStart = 90,
			rainLevel = 0.5,
			windVelocity = {0, 0, 0},
			sunPos = {0, -12000, 0},
			temperature = 15,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.98, 0.98, 1.0},
			lightAmbient = {0.18, 0.18, 0.23, 1.0},
			skyTexture = 22,
			fogStart = 120,
			rainLevel = 0.7,
			windVelocity = {1.2, 1.6, 0},
			sunPos = {0, -11000, 250},
			temperature = 15,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.98, 0.96, 1.0},
			lightAmbient = {0.2, 0.2, 0.26, 1.0},
			skyTexture = 22,
			fogStart = 150,
			rainLevel = 0.8,
			windVelocity = {1.4, 1.5, 0},
			sunPos = {0, -10000, 500},
			temperature = 15,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.96, 0.92, 1.0},
			lightAmbient = {0.3, 0.29, 0.3, 1.0},
			skyTexture = 22,
			fogStart = 180,
			rainLevel = 0.3,
			windVelocity = {0.9, 1.2, 0},
			sunPos = {0, -9000, 750},
			temperature = 16,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.8, 1.0},
			lightAmbient = {0.35, 0.33, 0.33, 1.0},
			skyTexture = 13,
			fogStart = 210,
			rainLevel = 0.6,
			windVelocity = {1, 1.4, 0},
			sunPos = {0, -8000, 1000},
			temperature = 16,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.45, 0.42, 0.4, 1.0},
			skyTexture = 15,
			fogStart = 240,
			rainLevel = 0.2,
			windVelocity = {1.2, 1.6, 0},
			sunPos = {0, -7000, 1250},
			temperature = 17,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.5, 0.46, 0.4, 1.0},
			skyTexture = 14,
			fogStart = 270,
			rainLevel = 0.4,
			windVelocity = {0.7, 1.5, 0},
			sunPos = {0, -6000, 1500},
			temperature = 17,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.55, 0.52, 0.5, 1.0},
			skyTexture = 15,
			fogStart = 300,
			rainLevel = 0.5,
			windVelocity = {1.2, 0.9, 0},
			sunPos = {0, -5000, 1750},
			temperature = 17,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.6, 0.55, 0.52, 1.0},
			skyTexture = 13,
			fogStart = 330,
			rainLevel = 0.2,
			windVelocity = {1.6, 1.2, 0},
			sunPos = {0, -4000, 2000},
			temperature = 18,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.65, 0.65, 0.65, 1.0},
			skyTexture = 11,
			fogStart = 360,
			rainLevel = 0.4,
			windVelocity = {1.4, 1.8, 0},
			sunPos = {0, -3000, 2250},
			temperature = 18,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.69, 0.69, 0.69, 1.0},
			skyTexture = 12,
			fogStart = 390,
			rainLevel = 0.5,
			windVelocity = {0.5, 1.4, 0},
			sunPos = {0, -2000, 2500},
			temperature = 19,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.75, 0.75, 0.75, 1.0},
			skyTexture = 11,
			fogStart = 420,
			rainLevel = 0.3,
			windVelocity = {1.2, 0.8, 0},
			sunPos = {0, -1000, 2750},
			temperature = 20,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.83, 0.83, 0.83, 1.0},
			skyTexture = 12,
			fogStart = 450,
			rainLevel = 0.1,
			windVelocity = {1.7, 1, 0},
			sunPos = {0, 0, 3000},
			temperature = 20,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.8, 0.8, 0.8, 1.0},
			skyTexture = 11,
			fogStart = 420,
			rainLevel = 0.5,
			windVelocity = {1.5, 0.8, 0},
			sunPos = {0, 1000, 2750},
			temperature = 20,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.78, 0.78, 0.78, 1.0},
			skyTexture = 12,
			fogStart = 390,
			rainLevel = 0.2,
			windVelocity = {1.3, 1.3, 0},
			sunPos = {0, 2000, 2500},
			temperature = 19,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.75, 0.75, 0.75, 1.0},
			skyTexture = 11,
			fogStart = 360,
			rainLevel = 0.3,
			windVelocity = {1.5, 1.1, 0},
			sunPos = {0, 3000, 2250},
			temperature = 19,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.72, 0.72, 0.72, 1.0},
			skyTexture = 12,
			fogStart = 330,
			rainLevel = 0.5,
			windVelocity = {1.1, 1.8, 0},
			sunPos = {0, 4000, 2000},
			temperature = 19,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.69, 0.69, 0.69, 1.0},
			skyTexture = 11,
			fogStart = 300,
			rainLevel = 0.4,
			windVelocity = {1.6, 1.1, 0},
			sunPos = {0, 5000, 1750},
			temperature = 18,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.65, 0.65, 0.65, 1.0},
			skyTexture = 12,
			fogStart = 270,
			rainLevel = 0.2,
			windVelocity = {1.3, 0.7, 0},
			sunPos = {0, 6000, 1500},
			temperature = 18,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.6, 0.6, 0.6, 1.0},
			skyTexture = 11,
			fogStart = 240,
			rainLevel = 0.5,
			windVelocity = {0.8, 1.4, 0},
			sunPos = {0, 7000, 1250},
			temperature = 18,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.55, 0.52, 0.5, 1.0},
			skyTexture = 15,
			fogStart = 210,
			rainLevel = 0.1,
			windVelocity = {1.4, 1.2, 0},
			sunPos = {0, 8000, 1000},
			temperature = 17,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.5, 0.47, 0.44, 1.0},
			skyTexture = 14,
			fogStart = 180,
			rainLevel = 0.3,
			windVelocity = {1.3, 1, 0},
			sunPos = {0, 9000, 750},
			temperature = 17,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.33, 0.28, 0.28, 1.0},
			skyTexture = 15,
			fogStart = 150,
			rainLevel = 0.6,
			windVelocity = {1.6, 1.2, 0},
			sunPos = {0, 10000, 500},
			temperature = 16,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.27, 0.25, 0.25, 1.0},
			skyTexture = 22,
			fogStart = 120,
			rainLevel = 0.2,
			windVelocity = {0.7, 1.4, 0},
			sunPos = {0, 11000, 250},
			temperature = 16,
		},
	},
	
	-- // stormy weather settings
	_stormy = {
		 -- // 00:00 // --
		_0 = {
			lightColor = {1, 0.99, 0.98, 1.0},
			lightAmbient = {0.15, 0.15, 0.18, 1.0},
			skyTexture = 22,
			fogStart = 70,
			rainLevel = 0.8,
			windVelocity = {2.2, 2.4, 0},
			sunPos = {0, -12000, 0},
			temperature = 16,
		},
		
		-- // 01:00 // -- 
		_1 = {
			lightColor = {1, 0.98, 0.98, 1.0},
			lightAmbient = {0.18, 0.18, 0.2, 1.0},
			skyTexture = 22,
			fogStart = 100,
			rainLevel = 0.9,
			windVelocity = {1.5, 2, 0},
			sunPos = {0, -11000, 250},
			temperature = 16,
		},
		
		-- // 02:00 // --
		_2 = {
			lightColor = {1, 0.98, 0.96, 1.0},
			lightAmbient = {0.2, 0.2, 0.26, 1.0},
			skyTexture = 22,
			fogStart = 130,
			rainLevel = 0.7,
			windVelocity = {2.4, 0.7, 0},
			sunPos = {0, -10000, 500},
			temperature = 16,
		},
		
		-- // 03:00 // --
		_3 = {
			lightColor = {1, 0.96, 0.92, 1.0},
			lightAmbient = {0.25, 0.25, 0.28, 1.0},
			skyTexture = 22,
			fogStart = 160,
			rainLevel = 0.9,
			windVelocity = {1, 2.7, 0},
			sunPos = {0, -9000, 750},
			temperature = 17,
		},
		
		-- // 04:00 // --
		_4 = {
			lightColor = {1, 0.85, 0.8, 1.0},
			lightAmbient = {0.3, 0.3, 0.33, 1.0},
			skyTexture = 15,
			fogStart = 190,
			rainLevel = 1,
			windVelocity = {1.4, 2.2, 0},
			sunPos = {0, -8000, 1000},
			temperature = 18,
		},
		
		-- // 05:00 // --
		_5 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.35, 0.35, 0.37, 1.0},
			skyTexture = 13,
			fogStart = 210,
			rainLevel = 1,
			windVelocity = {1.8, 2.8, 0},
			sunPos = {0, -7000, 1250},
			temperature = 18,
		},
		
		-- // 06:00 // -- 
		_6 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.47, 0.45, 0.45, 1.0},
			skyTexture = 15,
			fogStart = 240,
			rainLevel = 0.7,
			windVelocity = {2.1, 2, 0},
			sunPos = {0, -6000, 1500},
			temperature = 18,
		},
		
		-- // 07:00 // --
		_7 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.55, 0.52, 0.52, 1.0},
			skyTexture = 13,
			fogStart = 270,
			rainLevel = 0.8,
			windVelocity = {2, 1, 0},
			sunPos = {0, -5000, 1750},
			temperature = 18,
		},
		
		-- // 08:00 // --
		_8 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.62, 0.6, 0.58, 1.0},
			skyTexture = 14,
			fogStart = 300,
			rainLevel = 0.9,
			windVelocity = {2.7, 0.7, 0},
			sunPos = {0, -4000, 2000},
			temperature = 19,
		},

		-- // 09:00 // --
		_9 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.66, 0.64, 0.62, 1.0},
			skyTexture = 12,
			fogStart = 330,
			rainLevel = 0.7,
			windVelocity = {2.1, 1.6, 0},
			sunPos = {0, -3000, 2250},
			temperature = 19,
		},
		
		-- // 10:00 // --
		_10 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.68, 0.68, 0.68, 1.0},
			skyTexture = 11,
			fogStart = 360,
			rainLevel = 1,
			windVelocity = {1.6, 2.8, 0},
			sunPos = {0, -2000, 2500},
			temperature = 19,
		},
		
		-- // 11:00 //
		_11 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.74, 0.74, 0.74, 1.0},
			skyTexture = 12,
			fogStart = 390,
			rainLevel = 0.8,
			windVelocity = {1.1, 2.1, 0},
			sunPos = {0, -1000, 2750},
			temperature = 19,
		},

		-- // 12:00 // --
		_12 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.78, 0.78, 0.78, 1.0},
			skyTexture = 11,
			fogStart = 420,
			rainLevel = 0.9,
			windVelocity = {0.6, 2, 0},
			sunPos = {0, 0, 3000},
			temperature = 20,
		},
		
		-- // 13:00 // --
		_13 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.74, 0.74, 0.74, 1.0},
			skyTexture = 12,
			fogStart = 390,
			rainLevel = 0.7,
			windVelocity = {2.5, 1, 0},
			sunPos = {0, 1000, 2750},
			temperature = 20,
		},
		
		-- // 14:00 // --
		_14 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.72, 0.72, 0.72, 1.0},
			skyTexture = 11,
			fogStart = 360,
			rainLevel = 0.8,
			windVelocity = {1.2, 2, 0},
			sunPos = {0, 2000, 2500},
			temperature = 19,
		},
		
		-- // 15:00 // --
		_15 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.7, 0.7, 0.7, 1.0},
			skyTexture = 12,
			fogStart = 330,
			rainLevel = 0.7,
			windVelocity = {1.8, 2.2, 0},
			sunPos = {0, 3000, 2250},
			temperature = 19,
		},

		-- // 16:00 // --
		_16 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.66, 0.66, 0.66, 1.0},
			skyTexture = 11,
			fogStart = 300,
			rainLevel = 0.9,
			windVelocity = {2.3, 1, 0},
			sunPos = {0, 4000, 2000},
			temperature = 19,
		},
		
		-- // 17:00 // --
		_17 = {
			lightColor = {1, 0.9, 0.45, 1.0},
			lightAmbient = {0.63, 0.63, 0.63, 1.0},
			skyTexture = 12,
			fogStart = 270,
			rainLevel = 1,
			windVelocity = {2.7, 1.6, 0},
			sunPos = {0, 5000, 1750},
			temperature = 19,
		},
		
		-- // 18:00 // --
		_18 = {
			lightColor = {1, 0.82, 0.5, 1.0},
			lightAmbient = {0.6, 0.6, 0.6, 1.0},
			skyTexture = 11,
			fogStart = 240,
			rainLevel = 0.8,
			windVelocity = {2.1, 2.1, 0},
			sunPos = {0, 6000, 1500},
			temperature = 18,
		},
		
		-- // 19:00 // --
		_19 = {
			lightColor = {1, 0.85, 0.6, 1.0},
			lightAmbient = {0.5, 0.48, 0.44, 1.0},
			skyTexture = 12,
			fogStart = 210,
			rainLevel = 0.7,
			windVelocity = {2.6, 1.4, 0},
			sunPos = {0, 7000, 1250},
			temperature = 18,
		},

		-- // 20:00 // --
		_20 = {
			lightColor = {1, 0.75, 0.5, 1.0},
			lightAmbient = {0.44, 0.4, 0.38, 1.0},
			skyTexture = 15,
			fogStart = 180,
			rainLevel = 0.7,
			windVelocity = {2.3, 0.6, 0},
			sunPos = {0, 8000, 1000},
			temperature = 18,
		},
		
		-- // 21:00 // --
		_21 = {
			lightColor = {1, 0.7, 0.6, 1.0},
			lightAmbient = {0.38, 0.33, 0.3, 1.0},
			skyTexture = 14,
			fogStart = 150,
			rainLevel = 0.8,
			windVelocity = {1.1, 2.9, 0},
			sunPos = {0, 9000, 750},
			temperature = 17,
		},
		
		-- // 22:00 // --
		_22 = {
			lightColor = {1, 0.8, 0.7, 1.0},
			lightAmbient = {0.26, 0.25, 0.25, 1.0},
			skyTexture = 15,
			fogStart = 120,
			rainLevel = 1,
			windVelocity = {2.5, 2, 0},
			sunPos = {0, 10000, 500},
			temperature = 17,
		},
		
		-- // 23:00 // --
		_23 = {
			lightColor = {1, 0.9, 0.8, 1.0},
			lightAmbient = {0.22, 0.22, 0.23, 1.0},
			skyTexture = 22,
			fogStart = 90,
			rainLevel = 0.9,
			windVelocity = {2.1, 1.6, 0},
			sunPos = {0, 11000, 250},
			temperature = 17,
		},
	},
}