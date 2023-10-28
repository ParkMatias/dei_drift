ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('dei_drift:GiveCash')
AddEventHandler('dei_drift:GiveCash', function(player, cash)
    local xPlayer = ESX.GetPlayerFromId(player)
    cash = cash/100 * Config.porcentaje
    cash = math.floor(cash)
    xPlayer.addMoney(cash)
    xPlayer.showNotification('Has ganado ' .. cash .. ' pesos por tu drift!')
end)

