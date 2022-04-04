TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
  for k,v in pairs(Shops.Pos) do
    local blips = AddBlipForCoord(v.x, v.y, v.z)
    SetBlipSprite(blips, 628)
    SetBlipDisplay(blips, 4)
    SetBlipScale(blips, 0.7)
    SetBlipColour(blips, 69)
    SetBlipAsShortRange(blips, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('LTD')
    EndTextCommandSetBlipName(blips)
  end
end)



Citizen.CreateThread(function()
  while true do
    local wait = 750
    for k in pairs(Shops.Pos) do
      local plyCoords = GetEntityCoords(PlayerPedId())
      local pos = Shops.Pos
      local distance = GetDistanceBetweenCoords(plyCoords, pos[k], true)
      local interval = 1

      if distance > 10 then
        interval = 200
      else
        interval = 1
        DrawMarker(29, pos[k].x, pos[k].y, pos[k].z-0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
        
        if distance < 1 then
          RageUI.Text({ message="~b~Appuyez sur [E~p~] pour parler au vendeur", time_display = 1 })

          if IsControlJustPressed(1, 38) then
            NkShop()
          end
        end
      end
    end
    Wait(interval)
  end
end)

Citizen.CreateThread(function()
  Citizen.Wait(750)
  for _, v in pairs(Config.npc) do
    RequestModel(GetHashKey(v.model))
    while not HasModelLoaded(GetHashKey(v.model)) do Wait(10) end
      npc = CreatePed(4, v.model, v.coords, v.heading, false, true)
      SetEntityInvincible(npc, true)
      FreezeEntityPosition(npc, true)
  end
end)


function NkShop()
  RMenu.Add('Shops', 'main', RageUI.CreateMenu('LTD', "Boutique 24/7 ?"))
  RMenu.Add('Nourriture', 'main', RageUI.CreateSubMenu(RMenu:Get('Shops', 'main'), 'LTD','Boutique 24/7'))
  RMenu.Add('Boisson', 'main', RageUI.CreateSubMenu(RMenu:Get('Shops', 'main'), 'LTD','Boutique 24/7'))
  RMenu.Add('Divers', 'main', RageUI.CreateSubMenu(RMenu:Get('Shops', 'main'), 'LTD','Boutique 24/7'))
  if open then
    open = false
    RageUI.Visible(RMenu:Get('Shops', 'main'), false)
  else
    open = true 
    RageUI.Visible(RMenu:Get('Shops', 'main'), true)
    Citizen.CreateThread(function()
      while open do 


        RageUI.IsVisible(RMenu:Get('Shops', 'main'), true, true, true,function()

          RageUI.Separator('~g~nourriture')

          RageUI.ButtonWithStyle('Nourriture', nil, {RightLabel = '>>'}, true, function()
          end, RMenu:Get('Nourriture', 'main'))

          RageUI.Separator('~g~Boissons')

          RageUI.ButtonWithStyle('Boissons', nil, {RightLabel = '>>'}, true, function()
          end, RMenu:Get('Boisson', 'main'))

          RageUI.Separator('~g~Divers')

          RageUI.ButtonWithStyle('Divers', nil, {RightLabel = '>>'}, true, function()
          end, RMenu:Get('Divers', 'main'))
          
        end, function()end, 1)




        RageUI.IsVisible(RMenu:Get('Nourriture', 'main'), true, true, true, function()

          RageUI.ButtonWithStyle('Pain', nil, {RightLabel = '7$  >>'}, true, function(h,a,s)
            if s then 
              local price = 7
              local item = 'bread'
              TriggerServerEvent('Shop_Basic:Buy',item, price)
            end
          end)

          RageUI.ButtonWithStyle('Burger', nil, {RightLabel = '12$  >>'}, true, function(h,a,s)
            if s then 
              local price = 12
              local item = 'burger'
              TriggerServerEvent('Shop_Basic:Buy',item, price)
            end
          end)
          

        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get('Boisson', 'main'), true, true, true, function()

          RageUI.Separator('~w~--~g~Eau~w~--')

          RageUI.ButtonWithStyle('Bouteille d\'eau', nil, {RightLabel = '4$  >>'}, true, function(h,a,s)
            if s then
              local price = 4
              local item = 'water'
              TriggerServerEvent('Shop_Basic:Buy', item, price)
            end
          end)

          RageUI.Separator('~w~--~g~Boissons Gazeuses~w~--')
          RageUI.ButtonWithStyle('RedBull', nil, {RightLabel = '8$  >>'}, true, function(h,a,s)
            if s then
              local price = 8
              local item = 'redbull'
              TriggerServerEvent('Shop_Basic:Buy', item, price)
            end
          end)

          RageUI.ButtonWithStyle('Coca Cola', nil, {RightLabel = '6$  >>'}, true, function(h,a,s)
            if s then
              local price = 6
              local item = 'coca'
              TriggerServerEvent('Shop_Basic:Buy', item, price)
            end
          end)

          RageUI.ButtonWithStyle('FreeWay Cola', nil, {RightLabel = '3$  >>'}, true, function(h,a,s)
            if s then
              local price = 3
              local item = 'cola'
              TriggerServerEvent('Shop_Basic:Buy', item, price)
            end
          end)

          RageUI.Separator('~w~--~g~Alcool~w~--')

          RageUI.ButtonWithStyle('Biere', nil, {RightLabel = '13$  >>'}, true, function(h,a,s)
            if s then
              local price = 13
              local item = 'beer'
              TriggerServerEvent('Shop_Basic:Buy', item, price)
            end
          end)
          
          
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get('Divers', 'main'), true, true, true, function()

          RageUI.Separator('~w~--~g~Divers~w~--')

          RageUI.ButtonWithStyle('Télécommande', nil, {RightLabel = '500$  >>'}, true, function(h,a,s)
            if s then 
              local price = 500
              local item = 'remotecontrol'
              TriggerServerEvent('Shop_Basic:Buy',item, price)
            end
          end)

          RageUI.ButtonWithStyle('Téléphone', nil, {RightLabel = '2000$  >>'}, true, function(h,a,s)
            if s then 
              local price = 2000
              local item = 'phone'
              TriggerServerEvent('Shop_Basic:Buy',item, price)
            end
          end)


      end, function()end, 1)

        Citizen.Wait(0)
        if not RageUI.Visible(RMenu:Get('Shops', 'main')) and not RageUI.Visible(RMenu:Get('Nourriture', 'main')) and not RageUI.Visible(RMenu:Get('Boisson', 'main')) and not RageUI.Visible(RMenu:Get('Divers', 'main')) then
          open = false 
        end
      end
    end)
  end
end