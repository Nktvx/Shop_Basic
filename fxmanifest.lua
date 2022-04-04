fx_version 'adamant'
game 'gta5'

-- RageUI
client_scripts {
  "libs/RMenu.lua",
  "libs/menu/RageUI.lua",
  "libs/menu/Menu.lua",
  "libs/menu/MenuController.lua",
  "libs/components/*.lua",
  "libs/menu/elements/*.lua",
  "libs/menu/items/*.lua",
  "libs/menu/panels/*.lua",
  "libs/menu/panels/*.lua",
  "libs/menu/windows/*.lua",
}

client_scripts { 
  "Client/Cl_main.lua",
  "Config.lua",
}

server_scripts {
    "Server/Sv_main.lua",
}
