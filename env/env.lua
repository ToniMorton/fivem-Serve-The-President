Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
		SetAutoGiveParachuteWhenEnterPlane(GetPlayerPed(-1), true)
	end
end)

Citizen.CreateThread(function()
    while true do
    SetVehicleModelIsSuppressed(GetHashKey("taco"), true)
    SetVehicleModelIsSuppressed(GetHashKey("sabregt"), true)
    SetVehicleModelIsSuppressed(GetHashKey("bison"), true)
    SetVehicleModelIsSuppressed(GetHashKey("buffalo2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("contender"), true)
    SetVehicleModelIsSuppressed(GetHashKey("infernus"), true)
    SetVehicleModelIsSuppressed(GetHashKey("dubsta"), true)
    SetVehicleModelIsSuppressed(GetHashKey("felon"), true)
    SetVehicleModelIsSuppressed(GetHashKey("frogger"), true)
    SetVehicleModelIsSuppressed(GetHashKey("oracle"), true)
    SetVehicleModelIsSuppressed(GetHashKey("pranger"), true)
    SetVehicleModelIsSuppressed(GetHashKey("raiden"), true)
    SetVehicleModelIsSuppressed(GetHashKey("rancherxl"), true)
    SetVehicleModelIsSuppressed(GetHashKey("taxi"), true)
    SetVehicleModelIsSuppressed(GetHashKey("t20"), true)
    SetVehicleModelIsSuppressed(GetHashKey("trash"), true)
    SetVehicleModelIsSuppressed(GetHashKey("vacca"), true)
    SetVehicleModelIsSuppressed(GetHashKey("rhino"), true)
    SetVehicleModelIsSuppressed(GetHashKey("buzzard"), true)
    SetVehicleModelIsSuppressed(GetHashKey("buzzard2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("polmav"), true)
    SetVehicleModelIsSuppressed(GetHashKey("lazer"), true)
    SetVehicleModelIsSuppressed(GetHashKey("titan"), true)
    SetVehicleModelIsSuppressed(GetHashKey("voltic"), true)
    SetVehicleModelIsSuppressed(GetHashKey("buffalo"), true)
    SetVehicleModelIsSuppressed(GetHashKey("adder"), true)
    Citizen.Wait(0)
    end
end)


SetAudioFlag("DisableFlightMusic", true)
SetAudioFlag("PlayMenuMusic", false)
SetAudioFlag("WantedMusicDisabled", true)

local WaitTime = 10000 -- How often do you want to update the status (In MS)
trafficDensity = 0.12
pedDensity = 0.20
Citizen.CreateThread(function()
	while true do
	    SetVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetPedDensityMultiplierThisFrame(pedDensity)
	    SetRandomVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetParkedVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetScenarioPedDensityMultiplierThisFrame(pedDensity, pedDensity)    
		Citizen.Wait(0)
	end
end)

SetDiscordAppId('586405578402955298')
SetDiscordRichPresenceAsset('LOGO')
SetRichPresence("Playing Protect The President")



Citizen.CreateThread(function()
    while true do
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame( 13 ) -- Cash Change
    HideHudComponentThisFrame( 6 ) -- Vehicle Name
    HideHudComponentThisFrame( 7 ) -- Area Name
    HideHudComponentThisFrame( 8 ) -- Vehicle Class      
    HideHudComponentThisFrame( 9 ) -- Street Name
    HideHudComponentThisFrame( 17 ) -- Save Game  
    HideHudComponentThisFrame( 20 ) -- Weapon Stats
	HideHudComponentThisFrame( 1 ) -- Wanted Stars
    HideHudComponentThisFrame( 2 ) -- Weapon Icon
        Citizen.Wait(0)
    end
end)

AddEventHandler("playerSpawned", function(spawn)
StatSetInt("MP0_STAMINA", 95, true)
StatSetInt("MP0_LUNG_CAPACITY", 100, true)
StatSetInt("MP0_SHOOTING_ABILITY", 100, true)
StatSetInt("MP0_FLYING_ABILITY", 100, true)
StatSetInt("MP0_WHEELIE_ABILITY", 100, true)
StatSetInt("MP0_STRENGTH", 100, true)
StatSetInt("MP0_STEALTH_ABILITY", 100, true)
StatSetFloat("MP0_PLAYER_MENTAL_STATE", 0.0, true)
NetworkSetFriendlyFireOption(true)
SetCanAttackFriendly(PlayerPedId(), true, true)
end)