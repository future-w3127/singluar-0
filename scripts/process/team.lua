local process = Process("team")

process.onStart(function(this)

    local t1 = Team("xxcfd")
        .name("小小吃饭队")
        .nameSync(true)
        .colorSync(true)
        .members({ 2, 3, 4, 5, 6 })
        .color(2)

    this.stage("t1", t1)

    time.setTimeout(5, function()
        t1.name("小小吐饭队").color(7)
    end)

    local us = {}
    for _ = 1, 20 do
        local u = t1.unit(TPL_UNIT.HeroPitLord, 0, 0)
        table.insert(us, u)
    end
    this.stage("us", us)

end)

process.onOver(function(this)
    this.stage("t1").destroy()
    for _, u in ipairs(this.stage("us")) do
        u.destroy()
    end
end)

