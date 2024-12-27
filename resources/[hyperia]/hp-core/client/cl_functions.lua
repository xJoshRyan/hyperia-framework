Hyperia.Functions = {}

---### Sends a callback request to the server
---***
---The data will then be returned to the client
---
---This is used for easy Client -> Server -> Client communication
---***
---API: **Client**
---@param name string
---@param data any
---@param callback function
function Hyperia.Functions.SendServerRequest(name, data, callback)
    local requestId = math.random(10000, 99999)
    Hyperia.Callbacks[requestId] = callback

    TriggerServerEvent('Hyperia:ServerCallback', name, requestId, data)
end