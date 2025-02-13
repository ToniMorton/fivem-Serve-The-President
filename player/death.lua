local drawDeathScaleform
local deathScaleform

Citizen.CreateThread(function()
	while true do
		Wait(100)
		
		if DoesEntityExist(PlayerPedId()) and IsEntityDead(PlayerPedId()) then
			-- time to find out if this was a suicide or if he was killed! :o
			local killer, killerweapon = NetworkGetEntityKillerOfPlayer(player)
			--TeamMenu.OverrideGreyedOut(true)
			drawDeathScaleform = true
			
			PlaySoundFrontend(-1, "Bed", "WastedSounds", true)
			if Countdown.Get() and Countdown.Get() > 30 then
				TriggerMusicEvent("KILL_LIST_START_MUSIC")
			end
			DisplayRadar(false)
			
			StartScreenEffect("DeathFailMPIn", 0, false)
			if killer ~= PlayerPedId() then
				-- killed
				local killerid = GetPlayerByEntityID(killer)
				if killer ~= PlayerPedId() and killerid ~= nil and NetworkIsPlayerActive(killerid) then 
					killerid = GetPlayerServerId(killerid)
					TriggerServerEvent("stp:server:playerDied", killerid)
					print("we got killed!")
				else	
					-- suicide
					TriggerServerEvent("stp:server:playerDied")
					print("we committed suicide!")
				end
				Wait(10000)
				if Countdown.Get() and Countdown.Get() > 30 then
					TriggerMusicEvent("KILL_LIST_STOP_MUSIC")
				end
				
				drawDeathScaleform = false
				if CurrentTeam.Get() ~= TeamId.None then
					DoScreenFadeOut(500)
					
					Wait(4000)
					Spawner.Respawn(true)
					StopScreenEffect("DeathFailMPIn")
					DoScreenFadeIn(500)
				end
				
				--TeamMenu.OverrideGreyedOut(false)
			end
		end
	end
end)

Citizen.CreateThread(function()
	deathScaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
	while not HasScaleformMovieLoaded(deathScaleform) do
		Wait(1)
	end
	
	while true do
		Wait(1)
		
		if drawDeathScaleform then
			PushScaleformMovieFunction(deathScaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
			PushScaleformMovieFunctionParameterString("~r~wasted")
			PopScaleformMovieFunction()
			
			DrawScaleformMovieFullscreen(deathScaleform, 255, 255, 255, 255, 0)
		end
	end
end)

function GetPlayerByEntityID(id)
	for i=0,32 do
		if(NetworkIsPlayerActive(i) and GetPlayerPed(i) == id) then return i end
	end
	return nil
end