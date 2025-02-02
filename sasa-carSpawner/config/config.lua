Config = {}

--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝

Config.Version = "1.2" -- Dont change this!
Config.Locale = "en" -- en, cs, de, fr, es | Select language
Config.FrameWork = "esx" -- esx, qbcore | Select your framework
Config.AdminGroups = {"owner", "superadmin", "admin", "mod"} -- false/table | if false = the car menu can open everyone
Config.SpawnCarWithEngineON = true -- true/false | True makes the vehicle after spawn will be got engine ON
Config.EnableQuickSpawnCars = true -- true/false | true makes enabled and false makes disabled
Config.QuickSpawnCars = {  -- table | These cars will be showed in Quick Spawn
    { 
        label = "Spawn Adder",  -- Car Label
        description = "Car 1", -- Car Description
        carModel = "adder",      -- Car Model
    },
    { 
        label = "Spawn Zentorno", 
        description = "Car 2",
        carModel = "zentorno",
    },
    { 
        label = "Spawn Osiris", 
        description = "Car 3",
        carModel = "osiris",
    }
}

--██╗      ██████╗  ██████╗ █████╗ ██╗     ███████╗███████╗
--██║     ██╔═══██╗██╔════╝██╔══██╗██║     ██╔════╝██╔════╝
--██║     ██║   ██║██║     ███████║██║     █████╗  ███████╗
--██║     ██║   ██║██║     ██╔══██║██║     ██╔══╝  ╚════██║
--███████╗╚██████╔╝╚██████╗██║  ██║███████╗███████╗███████║
--╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

Config.Locales = {
    en = {
        notAuthorized = "You are not authorized to perform this action.",
        spawnCarTitle = "Spawn car by model",
        carModelInput = "Car model",
        enterCarModel = "Enter the car model",
        unknownFramework = "Unknown Framework in Config.FrameWork",
        spawnCarDescription = "Spawn your needed car by model",
        deleteCar = "Delete car",
        deleteCarDescription = "Delete the vehicle you are in.",
        quickSpawns = "Quick Spawns",
        quickSpawnDescription = "Select a car to spawn quickly",
        menuTitle = "Car Spawner Menu",
        carSpawned = "Car has been successfully spawned!",
        carDeleted = "Car has been successfully deleted!",
        noCarToDelete = "There is no car to delete!"
    },
    cs = {
        notAuthorized = "Nemáte oprávnění k provedení této akce.",
        spawnCarTitle = "Spawn auta podle modelu",
        carModelInput = "Model auta",
        enterCarModel = "Zadejte model auta",
        unknownFramework = "Neznámý Framework v Config.FrameWork",
        spawnCarDescription = "Spawnuje auto podle modelu",
        deleteCar = "Smazat auto",
        deleteCarDescription = "Smažte vozidlo, ve kterém se nacházíte.",
        quickSpawns = "Rychlé spawnování",
        quickSpawnDescription = "Vyberte auto k rychlému spawnování",
        menuTitle = "Menu spawneru aut",
        carSpawned = "Auto bylo úspěšně spawnuto!",
        carDeleted = "Auto bylo úspěšně smazáno!",
        noCarToDelete = "Není žádné auto k smazání!"
    },
    de = {
        notAuthorized = "Sie sind nicht berechtigt, diese Aktion auszuführen.",
        spawnCarTitle = "Spawnen Sie ein Auto nach Modell",
        carModelInput = "Autotyp",
        enterCarModel = "Geben Sie das Auto-Modell ein",
        unknownFramework = "Unbekanntes Framework in Config.FrameWork",
        spawnCarDescription = "Spawnen Sie das benötigte Auto nach Modell",
        deleteCar = "Auto löschen",
        deleteCarDescription = "Löschen Sie das Fahrzeug, in dem Sie sich befinden.",
        quickSpawns = "Schnelle Spawns",
        quickSpawnDescription = "Wählen Sie ein Auto für schnellen Spawn",
        menuTitle = "Auto-Spawner Menü",
        carSpawned = "Auto wurde erfolgreich gespawnt!",
        carDeleted = "Auto wurde erfolgreich gelöscht!",
        noCarToDelete = "Es gibt kein Auto zum Löschen!"
    },
    fr = {
        notAuthorized = "Vous n'êtes pas autorisé à effectuer cette action.",
        spawnCarTitle = "Spawn d'une voiture par modèle",
        carModelInput = "Modèle de voiture",
        enterCarModel = "Entrez le modèle de la voiture",
        unknownFramework = "Framework inconnu dans Config.FrameWork",
        spawnCarDescription = "Faites apparaître votre voiture selon le modèle",
        deleteCar = "Supprimer la voiture",
        deleteCarDescription = "Supprimez le véhicule dans lequel vous vous trouvez.",
        quickSpawns = "Spawns rapides",
        quickSpawnDescription = "Sélectionnez une voiture pour un spawn rapide",
        menuTitle = "Menu du spawner de voitures",
        carSpawned = "La voiture a été spawnée avec succès !",
        carDeleted = "La voiture a été supprimée avec succès !",
        noCarToDelete = "Il n'y a pas de voiture à supprimer !"
    },
    es = {
        notAuthorized = "No estás autorizado para realizar esta acción.",
        spawnCarTitle = "Spawn de coche por modelo",
        carModelInput = "Modelo de coche",
        enterCarModel = "Introduce el modelo del coche",
        unknownFramework = "Framework desconocido en Config.FrameWork",
        spawnCarDescription = "Spawn tu coche necesario por modelo",
        deleteCar = "Eliminar coche",
        deleteCarDescription = "Elimina el vehículo en el que te encuentras.",
        quickSpawns = "Spawns rápidos",
        quickSpawnDescription = "Selecciona un coche para un spawn rápido",
        menuTitle = "Menú de spawner de coches",
        carSpawned = "¡Coche ha sido spawnado exitosamente!",
        carDeleted = "¡Coche ha sido eliminado exitosamente!",
        noCarToDelete = "¡No hay coche para eliminar!"
    }
}
