function Notify(title, desc, type)
    lib.notify({
        title = title,
        description = desc,
        type = type,
    })
end

function CheckAdmin()
    if Config.AdminGroups == false then
        return true  -- Pokud je Config.AdminGroups false, povolí přístup všem.
    end
    ESX = exports["es_extended"]:getSharedObject()

    local playerData = {}  -- Data hráče
    local playerGroup = ""

    -- Pro ESX framework
    if Config.FrameWork == "esx" then
        local xPlayer = ESX.GetPlayerData()  -- Získání dat hráče
        playerGroup = xPlayer.group  -- Skupina hráče (group)

        -- Ověření, zda je hráč v některé z adminským skupinách
        for _, group in ipairs(Config.AdminGroups) do
            if playerGroup == group then
                return true  -- Hráč má admin práva
            end
        end

    -- Pro QBcore framework
    elseif Config.FrameWork == "qbcore" then
        local QBCore = exports['qb-core']:GetCoreObject()
        local playerJob = QBCore.Functions.GetPlayerData().job.name  -- Získání jobu hráče

        -- Ověření, zda má hráč admin job
        for _, group in ipairs(Config.AdminGroups) do
            if playerJob == group then
                return true  -- Hráč má admin práva
            end
        end
    else
        print("Unknown Framework in Config.FrameWork")
    end

    return false  -- Pokud hráč není v žádné adminské skupině
end
