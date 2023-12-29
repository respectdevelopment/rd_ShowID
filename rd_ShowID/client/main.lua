if rd.ShowId.Notification == "ESX" then
    ESX = exports["es_extended"]:getSharedObject()
end

RegisterNetEvent("RespectDevelopment:ReciveUserData", function(result)

    if rd.ShowId.Notification == "ESX" then
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
        print("[WARNING] Set your own notification in client/main.lia at line 16.") 
        -- Here you set your own notification!
        -- For text set variable "result" btw without ""! :D
    end
end)

RegisterCommand(rd.ShowId.CommandName, function (ShowId,rawShowId)
    TriggerServerEvent('RespectDevelopment:GetUserData')
end)


Citizen.CreateThread(function()
    local command = rd.ShowId.CommandName
    local description = rd.ShowId.CommandDescription

    TriggerEvent('chat:addSuggestion', '/' ..command.. '', '' ..description.. '')
end)



