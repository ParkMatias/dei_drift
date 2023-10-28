fx_version 'adamant'
game 'gta5'

author 'Dei'
description 'Sistema simple de drift con entrega de dinero'

client_script "Client/client.lua"

shared_script {
    "config.lua",
    "Shared/functions.lua"
}

server_script "Server/server.lua"
