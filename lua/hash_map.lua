local player = {
    name = "Hero",
    hp = 100,
    speed = 10.5
}

print(player.name)
print(player["hp"])

player.level = 2

for key, value in pairs(player) do
	print(key, value)
end