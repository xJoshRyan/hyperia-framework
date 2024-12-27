Hyperia = {}
Hyperia.Callbacks = {}

exports('GetHyperiaCore', function()
    return Hyperia
end)

-- EXAMPLE: DELETE LATER --
RegisterCommand('testcallback', function()
    Hyperia.Functions.SendServerRequest("GetPlayerData", { playerId = 1 }, function(response)
        print("Received player data: ", json.encode(response))
    end)
end)
----------------------------