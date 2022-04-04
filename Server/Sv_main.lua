TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Shop_Basic:Buy')
AddEventHandler('Shop_Basic:Buy', function(item , price)
  local src = source 
  local xPlayer = ESX.GetPlayerFromId(src)
  
  
  if xPlayer.getAccount('cash').money >= price then
    xPlayer.removeAccountMoney('cash', price)
    xPlayer.addInventoryItem(item, 1)
    TriggerClientEvent('::{korioz#0110}::esx:showNotification', src , 'Merci de votre achat')
  end
end)
