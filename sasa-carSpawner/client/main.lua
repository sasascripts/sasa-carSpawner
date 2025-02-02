function OpenModelInput()
    if not CheckAdmin() then
        Notify(Config.Locales[Config.Locale].notAuthorized, "", "error")
        return
    end

    local input = lib.inputDialog(Config.Locales[Config.Locale].spawnCarTitle, {
        {type = 'input', label = Config.Locales[Config.Locale].carModelInput, description = Config.Locales[Config.Locale].enterCarModel, required = true, min = 1, max = 16}
    })
    
    if input then
        local carModel = input[1]
        SpawnCarByModel(carModel)
    end
end

function SpawnCarByModel(carModel)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local oldVehicle = GetVehiclePedIsIn(playerPed, false)

    if oldVehicle ~= 0 then
        if Config.DeletePreviousVehicleAfterSpawnNew then
            SetEntityAsMissionEntity(oldVehicle, true, true)
            DeleteVehicle(oldVehicle)
        else
            local backOffset = GetOffsetFromEntityInWorldCoords(oldVehicle, -4.0, 0.0, 0.3)
            SetEntityCoordsNoOffset(oldVehicle, backOffset.x, backOffset.y, backOffset.z, false, false, false)
            SetVehicleOnGroundProperly(oldVehicle)
        end
    end

    if Config.FrameWork == "esx" then
        ESX.Game.SpawnVehicle(carModel, coords, heading, function(newVehicle)
            TaskWarpPedIntoVehicle(playerPed, newVehicle, -1)

            if Config.SpawnCarWithEngineON then
                SetVehicleEngineOn(newVehicle, true, true, false)
            end

            Notify(Config.Locales[Config.Locale].carSpawned, "", "success")
        end)
    elseif Config.FrameWork == "qbcore" then
        local QBCore = exports['qb-core']:GetCoreObject()
        QBCore.Functions.SpawnVehicle(carModel, function(newVehicle)
            SetEntityCoordsNoOffset(newVehicle, coords.x, coords.y, coords.z, false, false, false)
            SetEntityHeading(newVehicle, heading)
            TaskWarpPedIntoVehicle(playerPed, newVehicle, -1)

            if Config.SpawnCarWithEngineON then
                SetVehicleEngineOn(newVehicle, true, true, false)
            end

            Notify(Config.Locales[Config.Locale].carSpawned, "", "success")
        end, coords, true)
    else
        Notify(Config.Locales[Config.Locale].unknownFramework, "", "error")
    end
end

function DeleteCar()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)

        Notify(Config.Locales[Config.Locale].carDeleted, "", "success")
    else
        Notify(Config.Locales[Config.Locale].noCarToDelete, "", "error")
    end
end

RegisterNetEvent("sasa-carSpawner:DeleteCar")
AddEventHandler("sasa-carSpawner:DeleteCar", function()
    DeleteCar()
end)

RegisterNetEvent("sasa-carSpawner:SpawnCarByModel")
AddEventHandler("sasa-carSpawner:SpawnCarByModel", function()
    OpenModelInput()
end)

function SpawnCar(carModel)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local oldVehicle = GetVehiclePedIsIn(playerPed, false)

    if oldVehicle ~= 0 then
        if Config.DeletePreviousVehicleAfterSpawnNew then
            SetEntityAsMissionEntity(oldVehicle, true, true)
            DeleteVehicle(oldVehicle)
        else
            local backOffset = GetOffsetFromEntityInWorldCoords(oldVehicle, -4.0, 0.0, 0.3)
            SetEntityCoordsNoOffset(oldVehicle, backOffset.x, backOffset.y, backOffset.z, false, false, false)
            SetVehicleOnGroundProperly(oldVehicle)
        end
    end

    if Config.FrameWork == "esx" then
        ESX.Game.SpawnVehicle(carModel, coords, heading, function(newVehicle)
            TaskWarpPedIntoVehicle(playerPed, newVehicle, -1)

            if Config.SpawnCarWithEngineON then
                SetVehicleEngineOn(newVehicle, true, true, false)
            end
        end)
    elseif Config.FrameWork == "qbcore" then
        local QBCore = exports['qb-core']:GetCoreObject()
        QBCore.Functions.SpawnVehicle(carModel, function(newVehicle)
            SetEntityCoordsNoOffset(newVehicle, coords.x, coords.y, coords.z, false, false, false)
            SetEntityHeading(newVehicle, heading)
            TaskWarpPedIntoVehicle(playerPed, newVehicle, -1)

            if Config.SpawnCarWithEngineON then
                SetVehicleEngineOn(newVehicle, true, true, false)
            end
        end, coords, true)
    else
        Notify(Config.Locales[Config.Locale].unknownFramework, "", "error")
    end
end

function SetupMenu()
    if not CheckAdmin() then
        Notify(Config.Locales[Config.Locale].notAuthorized, "", "error")
        return
    end

    local options = {}

    table.insert(options, {
        title = Config.Locales[Config.Locale].spawnCarTitle,
        event = "sasa-carSpawner:SpawnCarByModel",
        description = Config.Locales[Config.Locale].spawnCarDescription,
    })

    table.insert(options, {
        title = Config.Locales[Config.Locale].deleteCar,
        event = "sasa-carSpawner:DeleteCar",
        description = Config.Locales[Config.Locale].deleteCarDescription,
    })

    if Config.EnableQuickSpawnCars == true then
        table.insert(options, {
            title = Config.Locales[Config.Locale].quickSpawns,
            description = Config.Locales[Config.Locale].quickSpawnDescription,
            disabled = true,
        })
        
        for _, car in ipairs(Config.QuickSpawnCars) do
            table.insert(options, {
                title = car.label,
                description = car.description,
                onSelect = function()
                    SpawnCar(car.carModel)
                end
            })
        end
    end

    lib.registerContext({
        id = 'car_spawner_menu',
        title = Config.Locales[Config.Locale].menuTitle,
        options = options
    })

    lib.showContext("car_spawner_menu")
end

RegisterCommand('carmenu', function()
    if not CheckAdmin() then
        Notify(Config.Locales[Config.Locale].notAuthorized, "", "error")
        return
    end

    SetupMenu()
end, false)
