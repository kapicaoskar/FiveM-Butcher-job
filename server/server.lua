ESX.RegisterServerCallback("butcher:addMeat", function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if exports['ox_inventory']:CanCarryItem(source, "good_meat", 100) then
        xPlayer.addInventoryItem("good_meat", 100)
    else
        xPlayer.showNotification("Nie masz miejsca w ekwipunku")
    end
end)



ESX.RegisterServerCallback("butcher:removeMoney", function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getMoney() >= 500 then
        cb(true)
        xPlayer.removeMoney(500)
    else
        cb(false)
    end
end)