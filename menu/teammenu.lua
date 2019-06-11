local TeamNone = 0
local TeamPres = 0
local TeamVP = 0
local TeamBodyguard = 0
local TeamTerrorist = 0
local TeamCivilian = 0
local TeamPolice = 0
local TeamAirForce = 0

RegisterNetEvent("ptp:sendteamcount")
AddEventHandler("ptp:sendteamcount", function(TeamNone, TeamPres, TeamVP, TeamBodyguard, TeamTerrorist, TeamCivilian, TeamPolice, TeamAirForce)
TeamNone = TeamNone
TeamPres = TeamPres
TeamVP = TeamVP
TeamBodyguard = TeamBodyguard
TeamTerrorist = TeamTerrorist
TeamCivilian = TeamCivilian
TeamPolice = TeamPolice
TeamAirForce = TeamAirForce
end)

Citizen.CreateThread(function()
while true do
Citizen.Wait(200)
TriggerServerEvent("ptp:postteamcount")
end
end)

RegisterNetEvent("ptp:selectteam")
AddEventHandler("ptp:selectteam", function(selectedteam)

if selectedteam == 1 then
	if TeamPres == 0 then
		TeamMenu.OnClick(TeamId.President)
	else
		TeamMenu.OnClick(TeamId.None)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("<h3>~y~This team is full!~s~</h3>")
		DrawNotification(false, true)
	end
end

if selectedteam == 2 then
	if TeamVP == 0 then
		TeamMenu.OnClick(TeamId.Vice)
	else
		TeamMenu.OnClick(TeamId.None)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("<h3>~y~This team is full!~s~</h3>")
		DrawNotification(false, true)
	end
end

if selectedteam == 3 then
	if TeamBodyguard >= 0 and TeamBodyguard <= 8 then
		TeamMenu.OnClick(TeamId.Bodyguard)
	else
		TeamMenu.OnClick(TeamId.None)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("<h3>~y~This team is full!~s~</h3>")
		DrawNotification(false, true)
	end
end

if selectedteam == 4 then
	if TeamTerrorist >= 0 and TeamTerrorist <= 8 then
		TeamMenu.OnClick(TeamId.Terrorist)
	else
		TeamMenu.OnClick(TeamId.None)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("<h3>~y~This team is full!~s~</h3>")
		DrawNotification(false, true)
	end
end

if selectedteam == 5 then 
	if TeamCivilian >= 0 and TeamCivilian <= 12 then
		TeamMenu.OnClick(TeamId.Civil)
	else
		TeamMenu.OnClick(TeamId.None)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("<h3>~y~This team is full!~s~</h3>")
		DrawNotification(false, true)
	end
end

if selectedteam == 6 then
	if TeamPolice >= 0 and TeamPolice <= 10 then
		TeamMenu.OnClick(TeamId.Police)
	else
		TeamMenu.OnClick(TeamId.None)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("<h3>~y~This team is full!~s~</h3>")
		DrawNotification(false, true)
	end
end

if selectedteam == 7 then
	if TeamAirForce >= 0 and TeamAirForce <= 5 then
		TeamMenu.OnClick(TeamId.AirForce)
	else
		TeamMenu.OnClick(TeamId.None)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("<h3>~y~This team is full!~s~</h3>")
		DrawNotification(false, true)
	end
end

end)

TeamMenu = {}
function TeamMenu.OnClick(team)
	CurrentTeam.Update(team)
end

IsPlayerPres = false
IsPlayerVP = false


RegisterNetEvent("ptp:updatepres")
AddEventHandler("ptp:updatepres", function(pres, vp)
IsPlayerPres = pres
IsPlayerVP = vp
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		TriggerServerEvent("checkforpres",GetPlayerServerId(PlayerId()))
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if IsControlJustPressed(0, 167) then
			if IsPlayerPres == false and IsPlayerVP == false then
				TriggerEvent("ptp:openmenu")
			else
				SetNotificationTextEntry("STRING")
				AddTextComponentString("~r~You cannot swap teams while playing President/Vice President!")
				DrawNotification(false, true)
			end
        end
	end
end)