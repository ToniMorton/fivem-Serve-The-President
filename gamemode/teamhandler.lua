local currentTeam = TeamId.None

DecorRegister("_PLAYER_TEAM", 3)

CurrentTeam = {}
function CurrentTeam.Update(team, instant)
	currentTeam = team
	TeamHelpDisplay.Stop()
	TriggerServerEvent("stp:server:teamEntered", team)
	Spawner.Respawn(instant)
end
RegisterNetEvent("stp:toTeam")
AddEventHandler("stp:toTeam", CurrentTeam.Update)

function CurrentTeam.Get()
	return currentTeam
end

Citizen.CreateThread(function()

	while true do
		Wait(100)

		if PlayerPedId() then
			TeamHandler.HandleBlipsAndFriendly()

			local currentTeam = CurrentTeam.Get()
			if currentTeam == TeamId.President or currentTeam == TeamId.Vice then
				local tryingVehicle = GetVehiclePedIsTryingToEnter(PlayerPedId())
				if GetVehicleClass(tryingVehicle) == 15 or GetVehicleClass(tryingVehicle) == 16 then
					TaskPause(PlayerPedId(), 0)
					SetNotificationTextEntry("STRING")
					AddTextComponentString("<h3>~r~You cannot use Aircraft.</h3>")
					DrawNotification(false, true)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local currentTeam = CurrentTeam.Get()
		if currentTeam == TeamId.President then
			TriggerEvent("ptp:updatepres", true, false)
		elseif currentTeam == TeamId.Vice then
			TriggerEvent("ptp:updatepres", false, true)
		else
		end
	end
end)


TeamHandler = {}
function TeamHandler.HandleBlipsAndFriendly()
	for i = 0, 32 do
		if NetworkIsPlayerConnected(i) then
			local playerPed = GetPlayerPed(i)
			if i ~= PlayerId() and DoesEntityExist(playerPed) then
				local team = DecorGetInt(playerPed, "_PLAYER_TEAM")
				local relationship = TeamRelationships[CurrentTeam.Get()][team]

				SetPedAsEnemy(playerPed, relationship == TeamRelationshipType.Hostile)

				local blip = GetBlipFromEntity(playerPed)
				if relationship == TeamRelationshipType.Hostile and team ~= TeamId.President then
					if DoesBlipExist(blip) then
						RemoveBlip(blip)
					end
				else
					if not DoesBlipExist(blip) then
						blip = AddBlipForEntity(playerPed)
						ShowHeadingIndicatorOnBlip(blip, true)
					end
					SetBlipColour(blip, TeamBlipColors[team])
				end
			end
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Wait(500)

		if CurrentTeam.Get() == TeamId.None and not GetScreenEffectIsActive("FocusIn") then
			StartScreenEffect("FocusIn")
		end
	end
end)