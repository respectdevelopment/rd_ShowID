RegisterNetEvent('RespectDevelopment:GetUserData', function()
    local activePlayers = GetPlayers()
    local playerName = GetPlayerName(source)
    local maxServerCapacity = GetConvarInt("sv_maxClients", 48)
    local template = rd.ShowId.Message

    local replacements = {
        ["{ID}"] = source,
    }

    local pattern = "{(.-)}"
    local result = template:gsub(pattern, function(key)
        return replacements['{' .. key .. '}'] or key
    end)

    TriggerClientEvent('RespectDevelopment:ReciveUserData', source, result)
end)