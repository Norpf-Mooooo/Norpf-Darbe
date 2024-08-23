local allowedSteamName = "Stravechi" -- Buraya kendi Steam adınızı ekleyin

RegisterCommand("darbe", function()
    local playerId = PlayerId()
    TriggerServerEvent("checkSteamName", allowedSteamName)
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent("server:kickAllPlayers")
    cb("ok")
end)

RegisterNetEvent("receiveSteamNameCheck")
AddEventHandler("receiveSteamNameCheck", function(isAllowed)
    if isAllowed then
        SendNUIMessage({
            type = "open",
            video = "darbe.mp4"
        })
        SetNuiFocus(true, true)
    else
        TriggerEvent('chat:addMessage', { args = { '^1Error', 'Bu komutu kullanma izniniz yok!' } })
    end
end)
