local fiber = require('fiber')

local worker_fiber = fiber.create(function ()
    while true do
        print("The background process is cleaning up old data...")
        fiber.sleep(5)
    end
end)

-- fiber.cancel(worker_fiber)