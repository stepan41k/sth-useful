local fruits = { "apple", "banana", "pear" }

print(fruits[1])
print(#fruits)

for index, value in ipairs(fruits) do
    print(index, value)
end