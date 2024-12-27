AddEventHandler("playerConnecting", function(playerName, _, defferals)
    local src = source
    defferals.defer()

    defferals.update(("Welcome %s, please hold tight whilst we check your steam license"):format(playerName))
    
    local steamIdent = Hyperia.Functions.GetSteamIdentifier(src)
    if not steamIdent then
        defferals.done("You must be connected to steam and have it open in order to connect to HyperiaRP!")
        return
    end

    defferals.update("Making sure you're not banned...")
    local banResponse = MySQL.query.await('SELECT * FROM bans WHERE identifier = ?', {
        steamIdent
    })
    if banResponse and banResponse[1] then
        local row = banResponse[1]
        local reason = row.reason or "No reason provided"
        local bannedUntil = Hyperia.FormatDateTime(row.expiry) or "Never (perm banned)"

        defferals.done(("You are banned from HyperiaRP.\nReason: %s\nYou will be unbanned on the following date: %s"):format(reason, bannedUntil))
        return
    end

    defferals.done()
end)

RegisterNetEvent('Hyperia:ServerCallback', function(name, requestId, data)
    local src = source
    if Hyperia.Callbacks[name] then
        Hyperia.Callbacks[name](src, data, function(response)
            TriggerClientEvent('Hyperia:ClientCallback', src, requestId, response)
        end)
    else
        Hyperia.LogError(("Unregistered callback: %s"):format(name))
    end
end)