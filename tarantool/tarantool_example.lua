box.cfg { listen = 3301 }

box.once('init_app', function ()
    local users = box.schema.space.create('users')

    users:format({
        { name = 'id', type = 'unsigned' },
        { name = 'name', type = 'string' },
        { name = 'age', type = 'unsigned' }
    })

    users:create_index('primary', { parts = { 'id' } })

    box.schema.user.grant('guest', 'read,write,execute', 'universe')
end)