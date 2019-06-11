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

local cloudOpacity = 0.02 -- (default: 0.01)

-- setting this to false will NOT mute the sound as soon as the game loads 
-- (you will hear background noises while on the loading screen, so not recommended)
local muteSound = true -- (default: true)

-- Mutes or un-mutes the game's sound using a short fade in/out transition.
function ToggleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE");
    else
        StopAudioScene("MP_LEADERBOARD_SCENE");
    end
end

-- Runs the initial setup whenever the script is loaded.
function InitialSetup()
    -- Stopping the loading screen from automatically being dismissed.
    SetManualShutdownLoadingScreenNui(true)
    -- Disable sound (if configured)
    ToggleSound(muteSound)
    -- Switch out the player if it isn't already in a switch state.
    if not IsPlayerSwitchInProgress() then
        SwitchOutPlayer(PlayerPedId(), 0, 1)
    end
end


-- Hide radar & HUD, set cloud opacity, and use a hacky way of removing third party resource HUD elements.
function ClearScreen()
    SetCloudHatOpacity(cloudOpacity)
    HideHudAndRadarThisFrame()
    
    -- nice hack to 'hide' HUD elements from other resources/scripts. kinda buggy though.
    --SetDrawOrigin(0.0, 0.0, 0.0, 0)
end

-- Sometimes this gets called too early, but sometimes it's perfectly timed,
-- we need this to be as early as possible, without it being TOO early, it's a gamble!
InitialSetup()


Citizen.CreateThread(function()

    -- In case it was called too early before, call it again just in case.
    InitialSetup()
    
    -- Wait for the switch cam to be in the sky in the 'waiting' state (5).
    while GetPlayerSwitchState() ~= 5 do
        Citizen.Wait(0)
        ClearScreen()
    end
    
    -- Shut down the game's loading screen (this is NOT the NUI loading screen).
    ShutdownLoadingScreen()
    
    ClearScreen()
    Citizen.Wait(0)
    DoScreenFadeOut(0)
    
	SetLoadingPromptTextEntry("STRING")
	AddTextComponentSubstringPlayerName("Please Wait...")
	ShowLoadingPrompt()
    -- Shut down the NUI loading screen.
    ShutdownLoadingScreenNui()
    
    ClearScreen()
    Citizen.Wait(0)
    ClearScreen()
    DoScreenFadeIn(500)
    while not IsScreenFadedIn() do
        Citizen.Wait(0)
        ClearScreen()
    end
    
    local timer = GetGameTimer()
    
    -- Re-enable the sound in case it was muted.
    ToggleSound(false)
    SpawnMenu:Visible(not SpawnMenu:Visible())
	
    while true do
        ClearScreen()
        Citizen.Wait(0)
        
        -- wait 5 seconds before starting the switch to the player
        if SpawnSelected then
            
            -- Switch to the player.
            SwitchInPlayer(PlayerPedId())
            
            ClearScreen()
            
			Citizen.Wait(8000)
            -- Stop the infinite loop.
			RemoveLoadingPrompt()
            break
        end
    end
    
    -- Reset the draw origin, just in case (allowing HUD elements to re-appear correctly)
    --ClearDrawOrigin()
	RemoveLoadingPrompt()
	
end)

RegisterNetEvent("ptp:openmenu")
AddEventHandler("ptp:openmenu", function()
SpawnMenu:Visible(not SpawnMenu:Visible())
end)