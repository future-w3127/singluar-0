local process = Process("ram")

process.onSetup(function(this)

    local r1 = function()
        collectgarbage("collect")
        local rem0 = collectgarbage("count")
        local a = {}
        for i = 1, 100000, 1 do
            local b = { name = "123" }
            table.insert(a, b)
        end
        print("R1=" .. (collectgarbage("count") - rem0) / 1024 .. ' MB')
    end

    local r2 = function()
        collectgarbage("collect")
        local rem0 = collectgarbage("count")
        local a = {}
        local class = { name = "123" }
        for i = 1, 100000, 1 do
            local b = setmetatable({}, { __index = class })
            table.insert(a, b)
        end
        print("R2=" .. (collectgarbage("count") - rem0) / 1024 .. ' MB')
    end

    r1()
    r2()

end)
