SpawnSelected = false

_menuPool = NativeUI.CreatePool()
SpawnMenu = NativeUI.CreateMenu("Select Team", "", 730, 0)
_menuPool:Add(SpawnMenu)

function CreateMenu(menu)
	
	local notifstring = ""
	
    local item1 = NativeUI.CreateItem("President", "Spawn as the President")
	menu:AddItem(item1)    
	
	local item2 = NativeUI.CreateItem("Vice President", "Spawn as the Vice President")
	menu:AddItem(item2)
	
	local item3 = NativeUI.CreateItem("Bodyguard", "Spawn as a Secret Service Agent")
	menu:AddItem(item3)
	
	local item4 = NativeUI.CreateItem("Terrorist", "Spawn as a Terrorist")
	menu:AddItem(item4)	
	
	local item5 = NativeUI.CreateItem("Civilian", "Spawn as a Civilian")
	menu:AddItem(item5)
	
    menu.OnItemSelect = function(sender, item, index)
        if item == item1 then
			TriggerEvent("ptp:selectteam", 1)
			SpawnMenu:Visible(not SpawnMenu:Visible())
		    SpawnSelected = true
        end
		if item == item2 then
			TriggerEvent("ptp:selectteam", 2)
			SpawnMenu:Visible(not SpawnMenu:Visible())
			SpawnSelected = true
        end
		if item == item3 then
			TriggerEvent("ptp:selectteam", 3)
			SpawnMenu:Visible(not SpawnMenu:Visible())
			SpawnSelected = true
        end				
		if item == item4 then
			TriggerEvent("ptp:selectteam", 4)
			SpawnMenu:Visible(not SpawnMenu:Visible())
			SpawnSelected = true
        end			
		if item == item5 then
			TriggerEvent("ptp:selectteam", 5)
			SpawnMenu:Visible(not SpawnMenu:Visible())
			SpawnSelected = true
        end
    end
end

CreateMenu(SpawnMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
    end
end)

local cloudOpacity = 0.02
local muteSound = true

function ToggleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE");
    else
        StopAudioScene("MP_LEADERBOARD_SCENE");
    end
end

function Setup()
    SetManualShutdownLoadingScreenNui(true)
    ToggleSound(muteSound)
    if not IsPlayerSwitchInProgress() then
        SwitchOutPlayer(PlayerPedId(), 0, 1)
    end
end

function CloudAndRadar()
    SetCloudHatOpacity(cloudOpacity)
    HideHudAndRadarThisFrame()
end

Setup()


Citizen.CreateThread(function()
    Setup()	
    while GetPlayerSwitchState() ~= 5 do
        Citizen.Wait(0)
        CloudAndRadar()
    end	
    ShutdownLoadingScreen()  
    CloudAndRadar()
    Citizen.Wait(0)
    DoScreenFadeOut(0) 
	SetLoadingPromptTextEntry("STRING")
	AddTextComponentSubstringPlayerName("Please Wait...")
	ShowLoadingPrompt()
    ShutdownLoadingScreenNui()
    CloudAndRadar()
    Citizen.Wait(0)
    CloudAndRadar()
    DoScreenFadeIn(500)
    while not IsScreenFadedIn() do
        Citizen.Wait(0)
        CloudAndRadar()
    end
    local timer = GetGameTimer()
    ToggleSound(false)
    SpawnMenu:Visible(not SpawnMenu:Visible())
    while true do
        CloudAndRadar()
        Citizen.Wait(0)  
        if SpawnSelected then
            SwitchInPlayer(PlayerPedId())
            CloudAndRadar()
			Citizen.Wait(8000)
			RemoveLoadingPrompt()
            break
        end
    end
	RemoveLoadingPrompt()
end)

RegisterNetEvent("ptp:openmenu")
AddEventHandler("ptp:openmenu", function()
SpawnMenu:Visible(not SpawnMenu:Visible())
end)