RegisterCommand(rd.ShowId.CommandName, function()
    Wait(rd.waittime)
    local player = GetPlayerServerId(PlayerId())
    local template = rd.ShowId.Message

    local replacements = {
        ["{ID}"] = player,
    }

    local pattern = "{(.-)}"
    local result = template:gsub(pattern, function(key)
        return replacements['{' .. key .. '}'] or key
    end)

    Notify(result)
end)


function Notify(result)
    Wait(250)
    if rd.ShowId.Notification == "ESX" then
        ESX = exports["es_extended"]:getSharedObject()
        ESX.ShowNotification(result)
    elseif rd.ShowId.Notification == "OKOK" then
        exports['okokNotify']:Alert('ID', result, 3000, 'info', playSound)
    elseif rd.ShowId.Notification == "OXLIB" then
        lib.notify({
            title = "ID",
            description = result,
            type = "inform"
        })
    elseif rd.ShowId.Notification == "CUSTOM" then
        print("[WARNING] Set your own notification in client/main.lia at line 35.") 
        -- Here you set your own notification!
        -- For text set variable "result" btw without ""! :D
    end
end


Citizen.CreateThread(function()
    local command = rd.ShowId.CommandName
    local description = rd.ShowId.CommandDescription

    TriggerEvent('chat:addSuggestion', '/' ..command.. '', '' ..description.. '')
end)




