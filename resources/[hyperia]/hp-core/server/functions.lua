Hyperia.Functions = {}

---### Registers a callback on the server to be ran
---***
---Will then return the data to the client<br>
---
---This is used for easy Client -> Server -> Client communication
---***
---API: **Server**
---@param name string The name of the callback
---@param callback function The function to be ran
function Hyperia.Functions.RegisterServerCallback(name, callback)
    Hyperia.Callbacks[name] = callback
end

---### Returns a players steam identifier from their player id
---***
---Will return nil if no steam identifier is found belonging to the player
---***
---API: **Server**
---@param playerId any The server ID (source) of the player
---@return string|nil
function Hyperia.Functions.GetSteamIdentifier(playerId)
    local steamIdent = GetPlayerIdentifierByType(playerId, 'steam')
    if steamIdent then
        return steamIdent
    end
    return nil
end