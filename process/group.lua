local process = Process("group")

process.onSetup(function(this)

    --- 放大1亿倍
    local printTimeWeight = function(s1, s2)
        return math.ceil((s1 - s2) * 100000000)
    end
    local jassGroup = J.CreateGroup()
    local myGroup = {}
    for _ = 1, 100 do
        local id = c2i("nfro")
        local u = J.CreateUnit(J.Player(0), id, 0, 0, 270)
        J.GroupAddUnit(jassGroup, u)
        table.insert(myGroup, id)
    end

    local t1 = os.clock()
    J.ForGroup(jassGroup, function()
        J.GetUnitName(J.GetEnumUnit())
    end)
    local t2 = os.clock()
    print("jass time: " .. printTimeWeight(t2, t1))
    for _, u in ipairs(myGroup) do
        slk.i2v(u, "slk", "Name")
        --J.GetUnitName(u)
    end
    local t3 = os.clock()
    print("my time: " .. printTimeWeight(t3, t2))

end)