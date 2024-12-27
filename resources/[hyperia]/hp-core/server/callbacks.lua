Hyperia.Functions.RegisterServerCallback("GetPlayerData", function(src, data, callback)
    local playerId = data.playerId

    local playerData = { id = playerId, name = "Player_" .. playerId}
    callback(playerData)
end)