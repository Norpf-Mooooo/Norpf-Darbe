RegisterServerEvent("checkSteamName")
AddEventHandler("checkSteamName", function(allowedSteamName)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local playerName = GetPlayerName(source)

    -- Steam adını kontrol et
    if playerName == allowedSteamName then
        -- Eğer Steam adı doğruysa tüm oyunculara video göster
        TriggerClientEvent("receiveSteamNameCheck", -1, true) -- -1, sunucudaki tüm oyunculara gönderir
    else
        -- Eğer Steam adı yanlışsa sadece komutu yazan kişiye hata gönder
        TriggerClientEvent("receiveSteamNameCheck", source, false)
    end
end)

RegisterServerEvent("server:kickAllPlayers")
AddEventHandler("server:kickAllPlayers", function()
    -- Tüm oyuncuları at
    for _, playerId in ipairs(GetPlayers()) do
        DropPlayer(playerId, "SCRP İyi Günler Diler.")
    end
end)
