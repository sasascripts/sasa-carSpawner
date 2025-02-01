fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'SASA CAR SPAWNER'
author 'SASA SCRIPTS'
description 'FiveM car spawner script using ox_lib'
version '1.0'

shared_scripts {
    'config/config.lua',
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
}

client_scripts {
    'client/**.lua',
    'config/cl_edit.lua'
}

server_scripts {
    'server/**.lua',
}