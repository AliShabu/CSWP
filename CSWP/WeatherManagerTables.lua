-- // WEATHER-TABLES // --
hotSettings = {}
sunnySettings = {}
cloudySettings = {}
rainySettings = {}
stormySettings = {}

defaultSettings = {
	 -- // 00:00 //
	_0 = {
		lightColor = {0.19, 0.20, 0.23, 1.0},
		lightAmbient = {0.18, 0.19, 0.21, 1.0},
		texture = "textures/sky/sky0.dds",
		fogStart = 140,
		rainLevel = 0,
		windVelocity = {0.5, 0.2, 0},
		sunPos = {0, -10992, 0},
		temperature = 15,
	},
	
	-- // 01:00 //
	_1 = {
		lightColor = {0.20, 0.21, 0.24, 1.0},
		lightAmbient = {0.19, 0.20, 0.23, 1.0},
		texture = "textures/sky/sky1.dds",
		fogStart = 170,
		rainLevel = 0,
		windVelocity = {0.9, 0.5, 0},
		sunPos = {0, -10076, 150},
		temperature = 15,
	},
	
	-- // 02:00 // rainy
	_2 = {
		lightColor = {0.22, 0.23, 0.27, 1.0},
		lightAmbient = {0.21, 0.22, 0.26, 1.0},
		texture = "textures/sky/sky2.dds",
		fogStart = 200,
		rainLevel = 0.5,
		windVelocity = {1.8, 1.7, 0},
		sunPos = {0, -9160, 300},
		temperature = 15,
	},
	
	-- // 03:00 // rainy
	_3 = {
		lightColor = {0.25, 0.27, 0.3, 1.0},
		lightAmbient = {0.24, 0.26, 0.29, 1.0},
		texture = "textures/sky/sky3.dds",
		fogStart = 230,
		rainLevel = 0.6,
		windVelocity = {1.8, 1.8, 0},
		sunPos = {0, -8244, 450},
		temperature = 16,
	},
	
	-- // 04:00 //
	_4 = {
		lightColor = {0.27, 0.29, 0.33, 1.0},
		lightAmbient = {0.26, 0.28, 0.32, 1.0},
		texture = "textures/sky/sky4.dds",
		fogStart = 260,
		rainLevel = 0,
		windVelocity = {0.3, 0.2, 0},
		sunPos = {0, -7328, 600},
		temperature = 16,
	},
	
	-- // 05:00 // light rain
	_5 = {
		lightColor = {0.35, 0.35, 0.35, 1.0},
		lightAmbient = {0.34, 0.34, 0.34, 1.0},
		texture = "textures/sky/sky5.dds",
		fogStart = 290,
		rainLevel = 0.2,
		windVelocity = {1.5, 1.4, 0},
		sunPos = {0, -6412, 750},
		temperature = 16,
	},
	
	-- // 06:00 //
	_6 = {
		lightColor = {0.45, 0.42, 0.38, 1.0},
		lightAmbient = {0.44, 0.41, 0.37, 1.0},
		texture = "textures/sky/sky6.dds",
		fogStart = 320,
		rainLevel = 0,
		windVelocity = {0.2, 0.1, 0},
		sunPos = {0, -5496, 1000},
		temperature = 17,
	},
	
	-- // 07:00 // rainy
	_7 = {
		lightColor = {0.55, 0.55, 0.55, 1.0},
		lightAmbient = {0.54, 0.54, 0.54, 1.0},
		texture = "textures/sky/sky7.dds",
		fogStart = 350,
		rainLevel = 0.8,
		windVelocity = {1.9, 1.3, 0},
		sunPos = {0, -4580, 1250},
		temperature = 17,
	},
	
	-- // 08:00 //
	_8 = {
		lightColor = {0.65, 0.63, 0.6, 1.0},
		lightAmbient = {0.64, 0.62, 0.59, 1.0},
		texture = "textures/sky/sky8.dds",
		fogStart = 380,
		rainLevel = 0,
		windVelocity = {0.6, 0.2, 0},
		sunPos = {0, -3664, 1500},
		temperature = 18,
	},

	-- // 09:00 //
	_9 = {
		lightColor = {0.73, 0.71, 0.7, 1.0},
		lightAmbient = {0.72, 0.70, 0.69, 1.0},
		texture = "textures/sky/sky9.dds",
		fogStart = 410,
		rainLevel = 0,
		windVelocity = {0.4, 0.4, 0},
		sunPos = {0, -2748, 1750},
		temperature = 19,
	},
	
	-- // 10:00 // cloudy
	_10 = {
		lightColor = {0.7, 0.7, 0.7, 1.0},
		lightAmbient = {0.69, 0.69, 0.69, 1.0},
		texture = "textures/sky/sky10.dds",
		fogStart = 440,
		rainLevel = 0,
		windVelocity = {0.6, 1.4, 0},
		sunPos = {0, -1832, 2000},
		temperature = 22,
	},
	
	-- // 11:00 //
	_11 = {
		lightColor = {0.85, 0.81, 0.8, 1.0},
		lightAmbient = {0.84, 0.8, 0.79, 1.0},
		texture = "textures/sky/sky11.dds",
		fogStart = 470,
		rainLevel = 0,
		windVelocity = {0.4, 0.2, 0},
		sunPos = {0, -916, 2500},
		temperature = 27,
	},

	-- // 12:00 //
	_12 = {
		lightColor = {0.9, 0.88, 0.85, 1.0},
		lightAmbient = {0.89, 0.87, 0.84, 1.0},
		texture = "textures/sky/sky12.dds",
		fogStart = 500,
		rainLevel = 0,
		windVelocity = {0.3, 0, 0},
		sunPos = {0, 0, 3000},
		temperature = 33,
	},
	
	-- // 13:00 // cloudy
	_13 = {
		lightColor = {0.75, 0.75, 0.75, 1.0},
		lightAmbient = {0.74, 0.74, 0.74, 1.0},
		texture = "textures/sky/sky13.dds",
		fogStart = 470,
		rainLevel = 0,
		windVelocity = {0.8, 1.2, 0},
		sunPos = {0, 916, 2500},
		temperature = 35,
	},
	
	-- // 14:00 //
	_14 = {
		lightColor = {0.86, 0.84, 0.8, 1.0},
		lightAmbient = {0.85, 0.83, 0.79, 1.0},
		texture = "textures/sky/sky14.dds",
		fogStart = 440,
		rainLevel = 0,
		windVelocity = {0.2, 0, 0},
		sunPos = {0, 1832, 2000},
		temperature = 33,
	},
	
	-- // 15:00 // light rainy
	_15 = {
		lightColor = {0.72, 0.72, 0.72, 1.0},
		lightAmbient = {0.71, 0.71, 0.71, 1.0},
		texture = "textures/sky/sky15.dds",
		fogStart = 410,
		rainLevel = 0.3,
		windVelocity = {0.7, 1.1, 0},
		sunPos = {0, 2748, 1750},
		temperature = 30,
	},

	-- // 16:00 // rainy
	_16 = {
		lightColor = {0.71, 0.69, 0.62, 1.0},
		lightAmbient = {0.7, 0.68, 0.61, 1.0},
		texture = "textures/sky/sky16.dds",
		fogStart = 380,
		rainLevel = 1.0,
		windVelocity = {1.9, 1.9, 0},
		sunPos = {0, 3664, 1500},
		temperature = 27,
	},
	
	-- // 17:00 // cloudy
	_17 = {
		lightColor = {0.7, 0.68, 0.62, 1.0},
		lightAmbient = {0.69, 0.67, 0.61, 1.0},
		texture = "textures/sky/sky17.dds",
		fogStart = 350,
		rainLevel = 0,
		windVelocity = {0.3, 1.7, 0},
		sunPos = {0, 4580, 1250},
		temperature = 25,
	},
	
	-- // 18:00 // cloudy
	_18 = {
		lightColor = {0.7, 0.65, 0.6, 1.0},
		lightAmbient = {0.69, 0.64, 0.59, 1.0},
		texture = "textures/sky/sky18.dds",
		fogStart = 320,
		rainLevel = 0,
		windVelocity = {1.4, 0.3, 0},
		sunPos = {0, 5496, 1000},
		temperature = 24,
	},
	
	-- // 19:00 // light rainy
	_19 = {
		lightColor = {0.62, 0.62, 0.62, 1.0},
		lightAmbient = {0.61, 0.61, 0.61, 1.0},
		texture = "textures/sky/sky19.dds",
		fogStart = 290,
		rainLevel = 0.3,
		windVelocity = {2, 0.2, 0},
		sunPos = {0, 6412, 750},
		temperature = 24,
	},

	-- // 20:00 // cloudy
	_20 = {
		lightColor = {0.6, 0.59, 0.5, 1.0},
		lightAmbient = {0.59, 0.58, 0.49, 1.0},
		texture = "textures/sky/sky20.dds",
		fogStart = 260,
		rainLevel = 0,
		windVelocity = {1.2, 1.1, 0},
		sunPos = {0, 7328, 600},
		temperature = 23,
	},
	
	-- // 21:00 // light cloudy
	_21 = {
		lightColor = {0.55, 0.45, 0.45, 1.0},
		lightAmbient = {0.54, 0.44, 0.44, 1.0},
		texture = "textures/sky/sky21.dds",
		fogStart = 230,
		rainLevel = 0,
		windVelocity = {1.2, 0, 0},
		sunPos = {0, 8244, 450},
		temperature = 21,
	},
	
	-- // 22:00 //
	_22 = {
		lightColor = {0.4, 0.36, 0.32, 1.0},
		lightAmbient = {0.39, 0.35, 0.31, 1.0},
		texture = "textures/sky/sky22.dds",
		fogStart = 200,
		rainLevel = 0,
		windVelocity = {0.1, 0, 0},
		sunPos = {0, 9160, 300},
		temperature = 19,
	},
	
	-- // 23:00 //
	_23 = {
		lightColor = {0.29, 0.25, 0.25, 1.0},
		lightAmbient = {0.28, 0.24, 0.24, 1.0},
		texture = "textures/sky/sky23.dds",
		fogStart = 170,
		rainLevel = 0,
		windVelocity = {0.1, 0.2, 0},
		sunPos = {0, 10076, 150},
		temperature = 17,
	},
}