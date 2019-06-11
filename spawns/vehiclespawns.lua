local vehiclespawns = {
	{model = "maverick", x = 2819.8, y = -638.9, z = 1.8, h = 0.0},
	{model = "carbonrs", x = 1369.1, y = -581.7, z = 73.9, h = 0.0},
	{model = "dominator", x = -972.2, y = -1020.9, z = 40.5, h = 0.0},
	{model = "moonbeam", x = 716.3, y = -1282.5, z = 25.6, h = 0.0},
	{model = "barracks", x = 260.4, y = -1515.4, z = 28.7, h = 65.0},
	{model = "bulldozer", x = -199.5, y = -1081.9, z = 21.2, h = 340.1},
	{model = "futo", x = -662.8, y = -712.1, z = 26.7, h = 183.6},
	{model = "patriot", x = -323.3, y = -217.5, z = 37.1, h = 232.4},
	{model = "sanchez", x = 31.9, y = -420.4, z = 39.5, h = 67.3},
	{model = "buzzard2", x = 115.8, y = -439.9, z = 40.7, h = 338.5},
	{model = "ruffian", x = 384.1, y = -427.8, z = 44.2, h = 15.4},
	{model = "sentinel", x = 275.7, y = -323.7, z = 44.5, h = 162.5},
	{model = "annihilator", x = -1533.2, y = -567.3, z = 33.1, h = 39.1},
	{model = "dinghy", x = -934.8, y = -1464.3, z = -0.5, h = 287.4},
	{model = "burrito4", x = -1065.1, y = -1566.4, z = 4.1, h = 214.5},
	{model = "cognoscenti2", x = -1339.9, y = -1078.4, z = 6.5, h = 207.9},
	{model = "besra", x = -1453.7, y = -1368.5, z = 2.6, h = 8.6},
	{model = "technical", x = -1689.9, y = -1068.6, z = 1.6, h = 48.8},
	{model = "cargobob", x = -735.1, y = -1455.9, z = 4.5, h = 318.3},
	{model = "dodo", x = -1448.4, y = -2875.4, z = 13.5, h = 239.8},
	{model = 'stretch', x = 2523.7814941406, y = -383.97442626953, z = 92.992744445801},
	{model = 'fbi2', x = 2532.8737792969, y = -402.07260131836, z = 92.992744445801},
	{model = 'fbi2', x = 2535.7553710938, y = -362.31887817383, z = 92.992790222168},
	{model = 'fbi', x = 2544.4196777344, y = -377.66766357422, z = 92.992828369141},
	{model = 'fbi', x = 2548.2902832031, y = -378.25054931641, z = 92.992828369141},
	{model = 'buzzard2', x = 2511.5268554688, y = -427.0895690918, z = 118.18868255615},
	{model = 'buzzard2', x = 2510.5593261719, y = -341.83581542969, z = 118.18643188477},
	{model = 'riot', x = 2551.5209960938, y = -326.92495727539, z = 92.992904663086},
	{model = 'rebel', x = -1670.0715332031, y = -932.55096435547, z = 7.8214039802551},
	{model = 'technical', x = -1675.0078125, y = -928.67626953125, z = 7.8061218261719},
	{model = 'frogger', x = -1750.8883056641, y = -838.25994873047, z = 8.3440837860107},
	{model = 'rumpo3', x = -1680.2208251953, y = -898.73120117188, z = 8.3386764526367},
	{model = 'adder', x = 615.45159912109, y = 597.11248779297, z = 128.91107177734},
	{model = "luxor", x = -1277.4, y = -3392.3, z = 13.5, h = 323.6}
}

local vehicleClassBlips = {
	[0] = { -- Compacts
		sprite = 326, entry = "_COMPACT", text = "Compact Spawn"
	},
	[1] = { -- Sedans
		sprite = 326, entry = "_SEDAN", text = "Sedan Spawn"
	},
	[2] = { -- SUVs
		sprite = 326, entry = "_SUV", text = "SUV Spawn"
	},
	[3] = { -- Coupes
		sprite = 326, entry = "_COUPE", text = "Coupe Spawn"
	},
	[4] = { -- Muscle
		sprite = 326, entry = "_MUSCLE", text = "Muscle Spawn"
	},
	[5] = { -- Sports Classics
		sprite = 326, entry = "_SPORTC", text = "Sport Classic Spawn"
	},
	[6] = { -- Sports
		sprite = 326, entry = "_SPORT", text = "Sport Spawn"
	},
	[7] = { -- Super
		sprite = 326, entry = "_SUPER", text = "Super Spawn"
	},
	[8] = { -- Motorcycles
		sprite = 512, entry = "_BIKE", text = "Motorcycle Spawn"
	},
	[9] = { -- Off-road
		sprite = 326, entry = "_OFFROAD", text = "Off-road Spawn"
	},
	[10] = { -- Industrial
		sprite = 326, entry = "_INDUSTRIAL", text = "Industrial Spawn"
	},
	[11] = { -- Utility
		sprite = 477, entry = "_UTIL", text = "Utility Spawn"
	},
	[12] = { -- Vans
		sprite = 67, entry = "_VAN", text = "Van Spawn"
	},
	[13] = { -- Cycles
		sprite = 348, entry = "_CYCLE", text = "Cycle Spawn"
	},
	[14] = { -- Boats
		sprite = 427, entry = "_BOAT", text = "Boat Spawn"
	},
	[15] = { -- Helicopters
		sprite = 43, entry = "_HELI", text = "Helicopter Spawn"
	},
	[16] = { -- Planes
		sprite = 307, entry = "_PLANE", text = "Plane Spawn"
	},
	[17] = { -- Service
		sprite = 56, entry = "_SERVICE", text = "Service Spawn"
	},
	[18] = { -- Emergency
		sprite = 56, entry = "_EMERGENCY", text = "Emergency Spawn"
	},
	[19] = { -- Military
		sprite = 460, entry = "_MILITARY", text = "Military Spawn"
	},
	[20] = { -- Commercial
		sprite = 477, entry = "_COMMERCIAL", text = "Commercial Spawn"
	},
	[21] = { -- Trains (never going to use them but why not)
		sprite = 326, entry = "_TRAIN", text = "Train Spawn"
	}
}

for _, vehicleSpawn in ipairs(vehiclespawns) do
	local blip = AddBlipForCoord(vehicleSpawn.x, vehicleSpawn.y, vehicleSpawn.z)
	SetBlipAsShortRange(blip, true)

	local blipinfo = vehicleClassBlips[GetVehicleClassFromName(GetHashKey(vehicleSpawn.model))]
	SetBlipSprite(blip, blipinfo.sprite)
	AddTextEntry(blipinfo.entry, blipinfo.text)
	SetBlipNameFromTextFile(blip, blipinfo.entry)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(8000)
		TriggerEvent("ptp:removeallveh")
		TriggerEvent("ptp:vehspawnreset")
		TriggerEvent("ptp:roundvehspawnedcheck")
	end
end)

function spawnvehicles()
Citizen.CreateThread(function()
	for _, vehicleSpawn in ipairs(vehiclespawns) do
		RequestModel(GetHashKey(vehicleSpawn.model))
		while not HasModelLoaded(GetHashKey(vehicleSpawn.model)) do
		Wait(1)
		end
		local veh = CreateVehicle(GetHashKey(vehicleSpawn.model), vehicleSpawn.x, vehicleSpawn.y, vehicleSpawn.z, vehicleSpawn.h, true, false)
		if DoesEntityExist(veh) then
			SetVehicleOnGroundProperly(veh)	
			SetEntityAsMissionEntity(veh, true, true)		
			SetModelAsNoLongerNeeded(GetHashKey(vehicleSpawn.model))
			TriggerServerEvent("ptp:addveh", VehToNet(veh))
		else
		end
	end
end)
end

RegisterNetEvent("ptp:spawnvehclient")
AddEventHandler("ptp:spawnvehclient", function()
spawnvehicles()
end)

RegisterNetEvent("ptp:delvehclient")
AddEventHandler("ptp:delvehclient", function(handle)
DeleteVehicle(NetToVeh(handle))
end)

TriggerServerEvent("ptp:roundvehspawnedcheck", GetPlayerServerId(PlayerId()))