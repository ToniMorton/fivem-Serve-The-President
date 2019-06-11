Citizen.CreateThread(function()
	while true do
            for Player=0,NetworkGetNumConnectedPlayers() do
                local GamerTagId = 0
                local PlayerPed = GetPlayerPed(Player)
                
                -- If the player (loop id) is NOT the same as the current player, create a new GamerTagId.
                if Player ~= PlayerId() then
                    GamerTagId = CreateMpGamerTag(PlayerPed, GetPlayerName(Player), false, false, "", 0)
                end
                
                -- Using that GamerTagId, we remove the gamertag if the player is more than _distance_ away from another other player.
                if Vdist2(GetEntityCoords(PlayerPed, true), GetEntityCoords(PlayerPedId(), true)) > disable_player_names_distance * 10 or GamerTagId == PlayerId() then
                    RemoveMpGamerTag(GamerTagId)
                end
            end
		Citizen.Wait(0)
	end
end)