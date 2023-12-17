fx_version 'adamant'
game 'gta5'

author 'Dei'
description 'Sistema simple de drift con entrega de dinero'

client_script "client/main.lua"

shared_script {
    "config.lua",
    "shared/functions.lua"
}

server_script "server/main.lua"
