local users = box.schema.space.create('users', {
    if_not_exists = true,
    format = {
        { name = 'id',   type = 'unsigned' },
        { name = 'name', type = 'string' },
        { name = 'age',  type = 'unsigned' },
    }
})

users:create_index('primary', {
    type = 'TREE',
    parts = { 'id' },
    if_not_exists = true,
})

users:create_index('age_idx', {
    type = 'TREE',
    parts = { 'age' },
    unique = false,
    if_not_exists = true,
})
