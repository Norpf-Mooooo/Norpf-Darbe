-- İzin verilen Steam adını belirtin
local allowedSteamName = "Stravechi" -- Buraya kendi Steam adınızı ekleyin

-- /darbe komutunu kaydet
RegisterCommand("darbe", function()
    local playerId = PlayerId()
    -- Sunucuya oyuncunun Steam adını gönder
    TriggerServerEvent("checkSteamName", allowedSteamName)
end)

-- NUI'nin kapanmasıyla ilgili olay
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    -- Video bitiminde sunucudan oyuncuları atacak komut
    TriggerServerEvent("server:kickAllPlayers")
    cb("ok")
end)

-- Sunucudan yanıt al
RegisterNetEvent("receiveSteamNameCheck")
AddEventHandler("receiveSteamNameCheck", function(isAllowed)
    if isAllowed then
        -- NUI'yi aç ve video oynamasını başlat
        SendNUIMessage({
            type = "open",
            video = "darbe.mp4" -- Oynatmak istediğiniz video dosyasının adı
        })
        -- NUI odağını aç
        SetNuiFocus(true, true)
    else
        -- Oyuncunun izinli olup olmadığını kontrol etme mesajı
        TriggerEvent('chat:addMessage', { args = { '^1Error', 'Bu komutu kullanma izniniz yok!' } })
    end
end)
