RegisterServerEvent("checkSteamName")
AddEventHandler("checkSteamName", function(allowedSteamName)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local playerName = GetPlayerName(source)

    if playerName == allowedSteamName then
        TriggerClientEvent("receiveSteamNameCheck", -1, true)
    else
        TriggerClientEvent("receiveSteamNameCheck", source, false)
    end
end)

RegisterServerEvent("server:kickAllPlayers")
AddEventHandler("server:kickAllPlayers", function()
    for _, playerId in ipairs(GetPlayers()) do
        DropPlayer(playerId, "SCRP İyi Günler Diler.")
    end
end)
