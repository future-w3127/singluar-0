local process = Process("orderRoute")

process.onStart(function(this)

    local lineMap = {
        {
            -500, -1000,
            ---@param orderUnit Unit
            function(orderUnit)
                orderUnit.effect("HCancelDeath")
                orderUnit.orderRouteResume()
            end
        },
        {
            500, -1000,
            ---@param orderUnit Unit
            function(orderUnit)
                ability.leap({
                    sourceUnit = orderUnit,
                    targetPoint = { 0, -1000, 0 },
                    speed = 3000,
                    height = 500,
                    reflex = 2,
                    onEnd = function(options)
                        options.sourceUnit.orderRouteResume()
                    end
                })
            end
        },
        {
            500, -2000,
            ---@param orderUnit Unit
            function(orderUnit)
                ability.crackFly({
                    targetUnit = orderUnit,
                    distance = 300,
                    height = 500,
                    bounce = { qty = 3 },
                    onEnd = function(options)
                        options.targetUnit.orderRouteResume()
                    end
                })
            end },
        { -500, -2000 },
    }
    local routes = {}
    for i = 1, #lineMap do
        routes[i] = table.wheel(lineMap, 1 * (i - 1))
    end

    local us = {}
    this.stage("us", us)
    for i = 1, #routes do
        local r = routes[i]
        local u = Unit(TPL_UNIT.HeroFlameLord, Player(i), r[1][1], r[1][2], 0)
        us[i] = u
        u.orderRoute(true, r)
        u.period(3)
    end

end)

process.onOver(function(this)
    local us = this.stage("us")
    for _, u in ipairs(us) do
        u.destroy()
    end
end)