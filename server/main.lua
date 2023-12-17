if Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent('dei_drift:GiveCash')
AddEventHandler('dei_drift:GiveCash', function(player, cash)
    cash = math.floor(cash/100 * Config.Percentage)
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(player)
        xPlayer.addMoney(cash)
    elseif Config.Framework == 'qb' then
        local xPlayer = QBCore.Functions.GetPlayer(player)
        xPlayer.Functions.AddMoney('cash', cash)
    end
end)