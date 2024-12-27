RegisterNetEvent("Hyperia:ClientCallback", function(requestId, response)
    if Hyperia.Callbacks[requestId] then
        Hyperia.Callbacks[requestId](response)
        Hyperia.Callbacks[requestId] = nil
    end
end)