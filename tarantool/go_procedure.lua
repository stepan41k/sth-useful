box.cfg { listen = 3301 }

function proccess_user_registration(user_id, name, age)
    if age < 18 then
        return { success = false, error = "The user is a minor" }
    end

    local ok, result = pcall(function()
        return box.space.users:insert { user_id, name, age }
    end)

    if not ok then
        return { success = false, error = "User already exists" }
    end

    return { success = true, user = result }
end

-- resp, err := conn.Call("process_user_registration", []interface{}{10, "Alexey", 22})
