-- insert
users:insert(1, 'Ivan', 25)
users:insert(2, 'Olga', 35)

-- replace
users:replace(1, 'Ivan Ivanov', 26)

-- select (primary)
local user = users:get(1)

if user then
    print("Имя", user[2])
    print("Имя:", user.name)
end

-- select (secondray)
local user_under_30 = users.index.age_idx:select({ 30 }, { iterator = 'LE' }) -- <= 30

-- delete
users:delete(2)

-- update
users:update(1, {
    -- Available operations:
    -- '=' assign, '+' add, '-' subtract,
    -- '#' delete field, '!' insert field, ':' string slice
    { '=', 2, 'Ivan Petrov' },
    { '+', 3, 1 }
})
