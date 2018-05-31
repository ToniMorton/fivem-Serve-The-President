-- 666 is a placeholder for no players
President = 666
VicePresident = 666
--[[
    SAMPLE STRUCTURE:
    {
        [ID] = {"steam:xxxxxx","ip:xxxxxxxxxxxx","license:xxxxxxxxxxxxxx"}
    }
]]--

BodyGuards = {}
Civilians = {}
Terrorists = {}

--[[
 ________  __     __  ________  __    __  ________   ______  
|        \|  \   |  \|        \|  \  |  \|        \ /      \ 
| $$$$$$$$| $$   | $$| $$$$$$$$| $$\ | $$ \$$$$$$$$|  $$$$$$\
| $$__    | $$   | $$| $$__    | $$$\| $$   | $$   | $$___\$$
| $$  \    \$$\ /  $$| $$  \   | $$$$\ $$   | $$    \$$    \ 
| $$$$$     \$$\  $$ | $$$$$   | $$\$$ $$   | $$    _\$$$$$$\
| $$_____    \$$ $$  | $$_____ | $$ \$$$$   | $$   |  \__| $$
| $$     \    \$$$   | $$     \| $$  \$$$   | $$    \$$    $$
 \$$$$$$$$     \$     \$$$$$$$$ \$$   \$$    \$$     \$$$$$$      
                                                                                                                                      
]]


RegisterNetEvent("ServeThePresident:RequestTeamInfos")
AddEventHandler("ServeThePresident:RequestTeamInfos", function()
    local PresidentStatus = false
    local VicePresidentStatus = false
    local TerroristsStatus = false
    local CiviliansStatus = false
    local BodyGuardsStatus = false
    local TerroristsNumber = GetTableLength(Terrorists)
    local CiviliansNumber = GetTableLength(Civilians)
    local BodyGuardsNumber = GetTableLength(BodyGuards)
    if not VicePresident == source then
    if President == 666 then
        PresidentStatus = true
    end
    if VicePresident == 666 then
        VicePresidentStatus = true
    end
    if TerroristsNumber - CiviliansNumber < 3 and TerroristsNumber - BodyGuardsNumber < 3 then
        TerroristsStatus = true
    end
    if CiviliansNumber - TerroristsNumber < 3 and CiviliansNumber - BodyGuardsNumber < 3 then
        CiviliansStatus = true
    end
    if BodyGuardsNumber - CiviliansNumber < 3 and BodyGuardsNumber - TerroristsNumber < 3 then
        BodyGuardsStatus = true
    end
    end
    TriggerClientEvent("ServeThePresident:ReceiveTeamInfos", source, {["President"]=PresidentStatus, ["VicePresident"]=VicePresidentStatus, ["Terrorist"]=TerroristsStatus, ["Civilian"]=CiviliansStatus, ["BodyGuard"]=BodyGuardsStatus})
end)

RegisterNetEvent("ServeThePresident:JoinTeam")
AddEventHandler("ServeThePresident:JoinTeam", function(team)
    if type(_G[team]) == "table" then
        _G[team][source] = GetPlayerIdentifiers(source)
    else
        _G[team] = source
    end
    local oldteam = GetPlayerTeam(source)
    if oldteam ~= nil then
        if type(oldteam) == "table" then
            _G[oldteam][source] = nil
        else
            _G[oldteam] = 666
        end
    end
end)


--[[
 ________ __    __ __    __  ______ ________ ______  ______  __    __  ______  
|        |  \  |  |  \  |  \/      |        |      \/      \|  \  |  \/      \ 
| $$$$$$$| $$  | $| $$\ | $|  $$$$$$\$$$$$$$$\$$$$$|  $$$$$$| $$\ | $|  $$$$$$\
| $$__   | $$  | $| $$$\| $| $$   \$$ | $$    | $$ | $$  | $| $$$\| $| $$___\$$
| $$  \  | $$  | $| $$$$\ $| $$       | $$    | $$ | $$  | $| $$$$\ $$\$$    \ 
| $$$$$  | $$  | $| $$\$$ $| $$   __  | $$    | $$ | $$  | $| $$\$$ $$_\$$$$$$\
| $$     | $$__/ $| $$ \$$$| $$__/  \ | $$   _| $$_| $$__/ $| $$ \$$$|  \__| $$
| $$      \$$    $| $$  \$$$\$$    $$ | $$  |   $$ \\$$    $| $$  \$$$\$$    $$
 \$$       \$$$$$$ \$$   \$$ \$$$$$$   \$$   \$$$$$$ \$$$$$$ \$$   \$$ \$$$$$$

 ]]


function GetTableLength(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

function GetPlayerTeam(id)
    for k,v in pairs(Terrorists) do
        if k == id then 
            return "Terrorists" 
        end
    end
    for k,v in pairs(Civilians) do
        if k == id then 
            return "Civilians" 
        end
    end
    for k,v in pairs(BodyGuards) do
        if k == id then 
            return "BodyGuards" 
        end
    end
    if President == id then
        return "President"
    end
    if VicePresident == id then
        return "VicePresident"
    end
    return nil
end
