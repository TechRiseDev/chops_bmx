ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('bmxshop:buyBike', function(vehicle, price, minutes)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('bmxshop:spawnBike', src, vehicle, minutes)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Vendeur de BMX',
            description = 'Tu n as pas assez d argent',
            type = 'error'
        })
    end
end)