Citizen.CreateThread(function()
	while true do
		NetworkOverrideClockTime(6, 0, 0)
		Citizen.Wait(60000)
	end
end)