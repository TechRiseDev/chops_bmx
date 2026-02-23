local pedModel = `a_m_y_stwhi_02`

local pedCoords = vector4(-355.02, -226.24, 37.18, 29.70)

local spawnCoords = vector4(-348.97, -247.23, 39.10, 224.64)

local rentedBike = nil


CreateThread(function()
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(0)
    end

    local ped = CreatePed(
        0,
        pedModel,
        pedCoords.x,
        pedCoords.y,
        pedCoords.z - 1.0,
        pedCoords.w,
        false,
        true
    )

    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'bmx_shop',
            icon = 'fa-solid fa-bicycle',
            label = 'Acheter un BMX',
            onSelect = OpenBmxMenu
        }
    })
end)

function OpenBmxMenu()
    lib.registerContext({
        id = 'bmx_menu',
        title = 'Vendeur de BMX',
        options = {
            {
                title = 'BMX 5 minutes',
                description = 'Prix : 100$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'bmx', 100, 5)
                end
            },
            {
                title = 'BMX 10 minutes',
                description = 'Prix : 200$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'bmx', 200, 10)
                end
            },
            {
                title = 'Cruiser 10 minutes',
                description = 'Prix : 300$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'cruiser', 300, 10)
                end
            },
            {
                title = 'Scorcher 20 minutes',
                description = 'Prix : 600$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'scorcher', 600, 20)
                end
            },
            {
                title = 'TriBike Course 1h',
                description = 'Prix : 1000$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'tribike2', 1000, 60000)
                end
            }
        }
    })

    lib.showContext('bmx_menu')
end


RegisterNetEvent('bmxshop:spawnBike', function(vehicleModel, minutes)
    if rentedBike and DoesEntityExist(rentedBike) then
        lib.notify({
            title = 'Vendeur de BMX',
            description = 'Tu as deja un BMX en location',
            type = 'error'
        })
        return
    end

    local model = joaat(vehicleModel)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    rentedBike = CreateVehicle(model, spawnCoords.xyz, spawnCoords.w, true, false)

    SetVehicleOnGroundProperly(rentedBike)
    TaskWarpPedIntoVehicle(PlayerPedId(), rentedBike, -1)
    SetEntityAsMissionEntity(rentedBike, true, true)

    lib.notify({
        title = 'Vendeur de BMX',
        description = 'Location commencee pour ' .. minutes .. ' minutes',
        type = 'success'
    })

    StartRentalTimer(minutes)
end)

function StartRentalTimer(minutes)
    CreateThread(function()
        Wait(minutes * 60000)

        if rentedBike and DoesEntityExist(rentedBike) then
            local ped = PlayerPedId()

            if IsPedInVehicle(ped, rentedBike, false) then
                ClearPedTasksImmediately(ped)
                SetEntityCoords(ped, spawnCoords.x, spawnCoords.y, spawnCoords.z)
            end

            DeleteEntity(rentedBike)
            rentedBike = nil

            lib.notify({
                title = 'Vendeur de BMX',
                description = 'La location est terminee, le BMX a ete recupere',
                type = 'inform'
            })
        end
    end)
end


CreateThread(function()
    local blip = AddBlipForCoord(pedCoords.xyz)

    SetBlipSprite(blip, 226)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.85)
    SetBlipColour(blip, 2)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Vendeur de BMX")
    EndTextCommandSetBlipName(blip)
end)
