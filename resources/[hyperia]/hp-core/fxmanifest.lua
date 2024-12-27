fx_version 'cerulean'
game 'gta5'

version '1.0.0'
author 'xjoshryan'

dependencies{
    'oxmysql'
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/events.lua',
    'server/functions.lua',
    'server/callbacks.lua',
    'server/utils.lua',
}

client_scripts{
    'client/cl_main.lua',
    'client/cl_events.lua',
    'client/cl_functions.lua',
}

shared_scripts{
    'config.lua',
}