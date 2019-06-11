TeamNone = 0
TeamPres = 0
TeamVP = 0
TeamBodyguard = 0
TeamTerrorist = 0
TeamCivilian = 0

local players = {}

Players = {}
function Players.SetTeam(source, team)
	players[source] = team
end

function Players.GetAll()
	return players
end

function Players.GetPlayerTeam(source)
	return players[source]
end

AddEventHandler("playerConnecting", function()
	Players.SetTeam(source, TeamId.None)
end)

RegisterServerEvent("stp:server:teamEntered")
AddEventHandler("stp:server:teamEntered", function(team)
	Players.SetTeam(source, team)
end)

AddEventHandler("playerDropped", function()
	players[source] = nil
end)

local teamdatasv = {}

RegisterNetEvent("ptp:storeteams")
AddEventHandler("ptp:storeteams", function(pid, tid)
table.insert(teamdatasv, {PlayerID = pid, TeamID = tid})
end)

RegisterNetEvent("ptp:resetteamcounts")
AddEventHandler("ptp:resetteamcounts", function()

TeamNone = 0
TeamPres = 0
TeamVP = 0
TeamBodyguard = 0
TeamTerrorist = 0
TeamCivilian = 0

end)

RegisterNetEvent("ptp:getteamcounts")
AddEventHandler("ptp:getteamcounts", function()

	for i=1, #teamdatasv do
		if teamdatasv[i].tid == 0 then
			TeamNone = TeamNone + 1
		elseif teamdatasv[i].tid == 1 then
			TeamPres = TeamPres + 1
		elseif teamdatasv[i].tid == 2 then
			TeamVP = TeamVP + 1
		elseif teamdatasv[i].tid == 3 then
			TeamBodyguard = TeamBodyguard + 1
		elseif teamdatasv[i].tid == 4 then
			TeamTerrorist = TeamTerrorist + 1
		elseif teamdatasv[i].tid == 5 then
			TeamCivilian = TeamCivilian + 1
		end
	end

end)

RegisterNetEvent("ptp:postteamcount")
AddEventHandler("ptp:postteamcount", function(src)
TriggerEvent("ptp:resetteamcounts")
TriggerEvent("ptp:getteamcounts")
TriggerClientEvent("ptp:sendteamcount", -1,  TeamNone, TeamPres, TeamVP, TeamBodyguard, TeamTerrorist, TeamCivilian, TeamPolice, TeamAirForce)
end)

RegisterNetEvent("ptp:showspawnmenu")
AddEventHandler("ptp:showspawnmenu", function()
StopResource("jointrans")
StartResource("jointrans")
end)

vehicles = {}

RegisterNetEvent("ptp:addveh")
AddEventHandler("ptp:addveh", function(veh)
table.insert(vehicles, {handle = veh})
end)

VehiclesSpawned = false

RegisterNetEvent("ptp:roundvehspawnedcheck")
AddEventHandler("ptp:roundvehspawnedcheck", function(src)
if VehiclesSpawned == false then
TriggerClientEvent("ptp:spawnvehclient", src)
VehiclesSpawned = true
else
end
end)

RegisterNetEvent("ptp:vehspawnreset")
AddEventHandler("ptp:vehspawnreset", function()
if VehiclesSpawned == true then
VehiclesSpawned = false
end
end)

RegisterNetEvent("ptp:removeveh")
AddEventHandler("ptp:removeveh", function(veh)
for i=1, #vehicles do
		if vehicles[i].handle == veh then
			table.remove(vehicles, i)
			TriggerClientEvent("ptp:delvehclient", #vehicles[i].handle)
		else
		end
	end
end)

RegisterNetEvent("ptp:removeallveh")
AddEventHandler("ptp:removeallveh", function()
for i=1, #vehicles do
		table.remove(vehicles, i)
		TriggerClientEvent("ptp:delvehclient", #vehicles[i].handle)
	end
end)

RegisterCommand("ptpcleanup", function(source, args, rawCommand)
TriggerEvent("ptp:removeallveh")
end, true)