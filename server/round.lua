local firstRound = true

RegisterNetEvent("stp:server:playerDied")
AddEventHandler("stp:server:playerDied", function(killer)
	print("someone died")
	local source = source
	CreateThread(function()
		if Players.GetPlayerTeam(source) == TeamId.Vice then
			print("it was the VP!!!")
			TriggerClientEvent("ptp:selectteam", source, 5)
		end		
		if Players.GetPlayerTeam(source) == TeamId.President then
			print("it was the president!!!")
			if killer ~= nil then
				TriggerClientEvent("stp:client:RoundEnd", -1, GetPlayerName(killer))
			else
				TriggerClientEvent("stp:client:RoundEnd", -1, nil)
			end
			-- ensure everyone finished seeing the winner screen by adding another 100ms
			Wait(5100)
			print("restarting...")
			Round.Restart()
		end
	end)
	
end)

AddEventHandler("playerConnecting", function()
	if #Players.GetAll() == 1 then
		Round.Restart()
	end
end)

Round = {}
function Round.Restart()
	if not firstRound then
		TriggerClientEvent("stp:toTeam", -1, TeamId.None)
	end
	
	Countdown.Set(1800)
	firstRound = false
end

Round.Restart()