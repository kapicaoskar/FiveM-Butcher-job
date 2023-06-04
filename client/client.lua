local variables = {
    clothesOn = false,
    jobStarted = false,
    clothesOn = false,
    playerSkin = "",
    blip1 = "",
    blip2 = "" ,
    blip3 = "",
    blip4 = "",
    blip5 = "",
    blip6 = "",
    blip7 = "",
    beefClip = true,
    BOX = "",
    BOX2 = "",
    beef1 = false,
    beef2 = false,
    croper = false,
    nestus = true,
    vehicle = "",
    vehiclePlate = "",
    carOut = false
}

local function loadModel(model)
    RequestModel(model)
    local repeater = 0
    repeat
        Wait(1)
        repeater = HasModelLoaded(model)
    until (repeater == 1)
end

local function loadAnimDict(dict)
    RequestAnimDict(dict)
    local repeater = 0
    repeat
        Wait(1)
        repeater = HasAnimDictLoaded(dict)
    until (repeater == 1)
end


local function clothes(type)
    loadAnimDict("move_m@_idles@shake_off")
    if type == "on" then
        variables.clothesOn = true
        ESX.ShowNotification("Przebierasz się")
        TaskPlayAnim(PlayerPedId(), "move_m@_idles@shake_off", "shakeoff_1", 8.0, 8.0, -1, 0, 1, true, true, true)
        Wait(2000)
        ESX.ShowNotification("Udaj się do następnego celu na mapie")
            ESX.ShowNotification("Schowano prywatne ubrania do torby")
        TriggerEvent('skinchanger:getSkin', function(skin)
            variables.playerSkin = skin
            local uniformObject
            if skin.sex == 0 then
                uniformObject = Config.Clothes.male
            else
                uniformObject = Config.Clothes.female
            end
            if uniformObject then
                TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
            end
        end)
    else
        variables.clothesOn = false
        ESX.ShowNotification("Wyjmujesz ubrania z torby i przebierasz się")
        TaskPlayAnim(PlayerPedId(), "move_m@_idles@shake_off", "shakeoff_1", 8.0, 8.0, -1, 0, 1, true, true, true)
        Wait(2000)
        TriggerEvent('skinchanger:loadClothes', variables.playerSkin)
    end
end


local function startJob() --
    variables.jobStarted = true
    ESX.ShowNotification("Zobacz mape aby podążać dalej")
    variables.blip1 = AddBlipForCoord(987.9542, -2175.64, 30.02908)
    SetBlipSprite(variables.blip1, 73)
    SetBlipDisplay(variables.blip1, 4)
    SetBlipScale(variables.blip1, 0.8)
    SetBlipColour(variables.blip1, 66)
    SetBlipAsShortRange(variables.blip1, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("#1 Przebierz się")
    EndTextCommandSetBlipName(variables.blip1)



    variables.blip2 = AddBlipForCoord(996.6536, -2123.42, 30.47575)
    SetBlipSprite(variables.blip2, 154)
    SetBlipDisplay(variables.blip2, 4)
    SetBlipScale(variables.blip2, 0.8)
    SetBlipColour(variables.blip2, 66)
    SetBlipAsShortRange(variables.blip2, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("#2 Oskóruj świnie")
    EndTextCommandSetBlipName(variables.blip2)


    variables.blip3 = AddBlipForCoord(998.088, -2143.706, 29.47639)
    SetBlipSprite(variables.blip3, 154)
    SetBlipDisplay(variables.blip3, 4)
    SetBlipScale(variables.blip3, 0.8)
    SetBlipColour(variables.blip3, 66)
    SetBlipAsShortRange(variables.blip3, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("#3 Podziel mięso")
    EndTextCommandSetBlipName(variables.blip3)




    variables.blip4 = AddBlipForCoord(985.6012, -2118.228, 30.75702)
    SetBlipSprite(variables.blip4, 317)
    SetBlipDisplay(variables.blip4, 4)
    SetBlipScale(variables.blip4, 0.8)
    SetBlipColour(variables.blip4, 66)
    SetBlipAsShortRange(variables.blip4, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("#4 Przeróbka mięsa")
    EndTextCommandSetBlipName(variables.blip4)



    variables.blip5 = AddBlipForCoord(963.6665, -2110.298, 31.46465)
    SetBlipSprite(variables.blip5, 326)
    SetBlipDisplay(variables.blip5, 4)
    SetBlipScale(variables.blip5, 0.8)
    SetBlipColour(variables.blip5, 66)
    SetBlipAsShortRange(variables.blip5, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("#5 Wyjmij pojazd")
    EndTextCommandSetBlipName(variables.blip5)



    
    variables.blip6 = AddBlipForCoord(-2205.664, -373.9778, 13.32048)
    SetBlipSprite(variables.blip6, 278)
    SetBlipDisplay(variables.blip6, 4)
    SetBlipScale(variables.blip6, 0.8)
    SetBlipColour(variables.blip6, 66)
    SetBlipAsShortRange(variables.blip6, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("#6 Kupiec mięsa 5 Tysięcy")
    EndTextCommandSetBlipName(variables.blip6)



    variables.blip7 = AddBlipForCoord(-136.3312, 6198.552, 32.38443)
    SetBlipSprite(variables.blip7, 278)
    SetBlipDisplay(variables.blip7, 4)
    SetBlipScale(variables.blip7, 0.8)
    SetBlipColour(variables.blip7, 66)
    SetBlipAsShortRange(variables.blip7, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("#7 Kupiec mięsa 10 Tysięcy")
    EndTextCommandSetBlipName(variables.blip7)


end




Citizen.CreateThread(function()
    loadModel("MP_F_Meth_01")
    local ped = CreatePed(4, "MP_F_Meth_01", 961.0293, -2186.655, 29.52565, 50.62575, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    loadModel("MP_M_Meth_01")
    local ped2 = CreatePed(4, "MP_M_Meth_01", 963.611, -2111.248, 30.46502, 280.3041, false, true)
    FreezeEntityPosition(ped2, true)
    SetEntityInvincible(ped2, true)
    SetBlockingOfNonTemporaryEvents(ped2, true)


    loadModel("a_m_m_socenlat_01")
    local ped3 = CreatePed(4, "a_m_m_socenlat_01", -2205.725, -373.8284, 12.32048, 320.2493, false, true)
    FreezeEntityPosition(ped3, true)
    SetEntityInvincible(ped3, true)
    SetBlockingOfNonTemporaryEvents(ped3, true)
end)


local function beefClip2() 
loadAnimDict('anim@gangops@facility@servers@bodysearch@')
TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 1, 0, false, false, false )
TriggerEvent("VL_Progressbar:client:progress", {
    name = "unique_action_name",
    duration = 25000,
    label = "Skórowanie drugiej krowy",
    useWhileDead = false,
    canCancel = true,
    controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },
}, function(status)
    if not status then
        variables.beef2 = true
        ClearPedTasksImmediately(PlayerPedId())
        loadAnimDict("anim@heists@box_carry@")
loc = GetEntityCoords(GetPlayerPed(-1))
    shloc = vector3(loc.x,loc.y,loc.z)
    variables.BOX = CreateObject("v_ind_coo_heed",shloc.x-3.50712600,shloc.y-4.13621600,shloc.z+15.89625800,false,false,false)
    local playerPed = PlayerPedId()
    local bone = GetPedBoneIndex(playerPed, 0xE5F3)
    AttachEntityToEntity(variables.BOX, playerPed, bone, -0.5, 0.44, 0.90, 340.0, 330.0, 330.0, true, true, false, true, 1, true)
    TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 2.0, 2.0, 50000000, 51, 0, false, false, false)
    ESX.ShowNotification("Udaj się do maszyny dzielącej mięso")
        variables.beefClip = false
        variables.croper = true
    end
end)
end



local function beefClip1() 
    loadAnimDict('anim@gangops@facility@servers@bodysearch@')
TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 1, 0, false, false, false )
    TriggerEvent("VL_Progressbar:client:progress", {
        name = "unique_action_name",
        duration = 25000,
        label = "Skórowanie krowy",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
    }, function(status)
        if not status then
            ClearPedTasksImmediately(PlayerPedId())
            variables.beef1 = true
            ESX.ShowNotification("Zeskóruj jeszcze krowy z drugiej strony!")
        end
    end)
    end


    local function cropBeef() 
DetachEntity(variables.BOX, nil, nil)
DeleteObject(variables.BOX)
ClearPedTasksImmediately(PlayerPedId())
loadAnimDict('anim@gangops@facility@servers@bodysearch@')
TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 1, 0, false, false, false )
TriggerEvent("VL_Progressbar:client:progress", {
    name = "unique_action_name",
    duration = 30000,
    label = "Dzielenie mięsa",
    useWhileDead = false,
    canCancel = true,
    controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },
}, function(status)
    if not status then
        ClearPedTasksImmediately(PlayerPedId())
        ESX.ShowNotification("Przedzielono mięso udaj sie do stołu z mięsem!")
            
            loc = GetEntityCoords(GetPlayerPed(-1))
            shloc = vector3(loc.x,loc.y,loc.z - 100)
            variables.BOX2 = CreateObject('v_serv_abox_04',shloc.x-3.50712600,shloc.y-4.13621600,shloc.z+1.89625800,false,false,false)
            local playerPed = PlayerPedId()
            local bone = GetPedBoneIndex(playerPed, 0xE5F3)
            AttachEntityToEntity(variables.BOX2, playerPed, bone, 0.0, 0.24, 0.10, 340.0, 330.0, 330.0, true, true, false, true, 1, true)
            RequestAnimDict("anim@heists@box_carry@")
            while (not HasAnimDictLoaded("anim@heists@box_carry@")) do Citizen.Wait(0) end
            TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 2.0, 2.0, 50000000, 51, 0, false, false, false)
            variables.croper = false

    end
end)
    end






    local function cropBeef2() 
        DetachEntity(variables.BOX2, nil, nil)
        DeleteObject(variables.BOX2)
        ClearPedTasksImmediately(PlayerPedId())
        loadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 1, 0, false, false, false )
        TriggerEvent("VL_Progressbar:client:progress", {
            name = "unique_action_name",
            duration = 120000,
            label = "Przerabianie mięsa",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
        }, function(status)
            if not status then
                ClearPedTasksImmediately(PlayerPedId())
                ESX.ShowNotification("Przerobiono mięso udaj sie po samochód!")
                    variables.nestus = false
                    ESX.TriggerServerCallback("butcher:addMeat", function()
                    end)
        
            end
        end)
            end


local function getCar() 
    if IsAnyVehicleNearPoint(954.4785, -2108.584, 30.55155, 10.0) == false then
        ESX.TriggerServerCallback("butcher:removeMoney", function(validate)
            if validate then
                ESX.ShowNotification("Zabrano 500 dollarów w formie zaliczki")
                ESX.ShowNotification("Teraz wybierz kupca pamiętaj że ten na Paleto zapłaci więcej a ten bliżej mniej")
                ESX.Game.SpawnVehicle('bobcatxl', {
                    x = 954.4785,
                    y = -2108.584,
                    z =  30.55155
                }, 87.16113, function(vehicle)
                    SetEntityAsMissionEntity(vehicle, true, true);
                    variables.vehiclePlate = GetVehicleNumberPlateText(vehicle)
                    variables.vehicle = vehicle
                    variables.carOut = true
                end)
            else
                ESX.ShowNotification("Nie posiadasz pieniędzy na zaliczke!")
            end
        end)
    else
        ESX.ShowNotification("Niestety nie można wyjąć auta w momencie gdy miejsce parkingowe jest zajęte")
    end
end



Citizen.CreateThread(function ()
    

exports['qtarget']:AddBoxZone("butcher_first_poly", vector3(961.18, -2186.45, 30.51), 1, 1, {
    name = "butcher_first_poly",
    heading = 0,
}, {
    options = {
        {
            action = function()
                startJob()
            end,
            icon = "fa-solid fa-briefcase",
            label = "Rozpocznij pracę",
            canInteract = function()
                return  not variables.jobStarted
            end,
        },
    },
    distance = 2.0
})






exports['qtarget']:AddBoxZone("butcher_second_poly", vector3(988.06, -2174.44, 30.03), 0.5, 2.7, {
    name = "butcher_second_poly",
    heading = 1,
}, {
    options = {
        {
            action = function()
                clothes("on")
            end,
            icon = "fas fa-shirt",
            label = "Przebierz się w ubrania do pracy",
            canInteract = function()
                return  variables.jobStarted and not variables.clothesOn
            end,
        }
    },
    distance = 2.0
})









exports['qtarget']:AddBoxZone("butcher_third_poly", vector3(993.33, -2122.7, 30.48), 5, 15.65, {
    name = "butcher_third_poly",
    heading=268,
}, {
    options = {
        {
            action = function()
                beefClip1()
            end,
            icon = "fas fa-cow",
            label = "Zacznij skórowanie krowy",
            canInteract = function()
                return  variables.jobStarted and variables.clothesOn and variables.beefClip and  not variables.beef1 and  not variables.beef1
            end,
        }
    },
    distance = 2.0
})


exports['qtarget']:AddBoxZone("butcher_fourth_poly", vector3(1000.38, -2125.79, 30.48), 5, 14.3, {
    name = "butcher_fourth_poly",
    heading=86,
}, {
    options = {
        {
            action = function()
                beefClip2()
            end,
            icon = "fas fa-cow",
            label = "Zacznij skórowanie drugiej krowy",
            canInteract = function()
                return  variables.jobStarted and variables.clothesOn and variables.beefClip  and  not variables.beef2 and variables.beef1
            end,
        }
    },
    distance = 2.0
})






exports['qtarget']:AddBoxZone("butcher_fifth_poly", vector3(998.18, -2143.05, 29.48), 1, 2.8, {
    name = "butcher_fifth_poly",
    heading=355,
    minZ=28.08,
    maxZ=32.08
}, {
    options = {
        {
            action = function()
                cropBeef()
            end,
            icon = "fas fa-cow",
            label = "Podziel mięso",
            canInteract = function()
                return variables.croper and not variables.beefClip 
            end,
        }
    },
    distance = 2.0
})




exports['qtarget']:AddBoxZone("butcher_sixth_poly", vector3(983.61, -2118.69, 30.48), 5, 12.8, {
    name = "butcher_sixth_poly",
    heading=264,
}, {
    options = {
        {
            action = function()
                cropBeef2()
            end,
            icon = "fas fa-cow",
            label = "Przerób mięso",
            canInteract = function()
                return   variables.jobStarted and variables.clothesOn and not variables.beefClip and not variables.croper and variables.nestus
            end,
        }
    },
    distance = 2.0
})








exports['qtarget']:AddBoxZone("butcher_carped_poly", vector3(963.6, -2111.12, 31.47), 1, 1, {
    name = "butcher_carped_poly",
    heading=0,
}, {
    options = {
        {
            action = function()
                getCar()
            end,
            icon = "fas fa-car",
            label = "Wyjmij auto",
            canInteract = function()
                return  variables.jobStarted and variables.clothesOn and not variables.carOut
            end,
        },
    },
    distance = 2.0
})

end)