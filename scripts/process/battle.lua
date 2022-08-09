local process = Process("battle")

process.onStart(function(this)
    local u1 = Unit(TPL_UNIT.HeroFlameLord, Player(1), 0, -1300, 66.6)

    --time.setTimeout(5, function(curTimer)
    --    u1.cost(-10)
    --end)
    --time.setTimeout(5, function(curTimer)
    --    u1.castChant(-50)
    --end)

    u1.attack("+10;1")

    --ability.silent(u1, 30, "SilenceTarget", "overhead")
    --ability.unArm(u1, 30, "SilenceTarget", "weapon")

    ---@param damageData noteOnUnitDamageData
    u1.onEvent(EVENT.Unit.Damage, function(damageData)
        damageData.triggerUnit.exp("+=10")
    end)
    this.stage("u1", u1)

    ---@type Unit[]
    local u2s = {}
    for _ = 1, 1 do
        table.insert(u2s, Unit(TPL_UNIT.HeroPitLord, Player(2), 0, -200, 0))
    end
    this.stage("u2s", u2s)

end)

process.onOver(function(this)
    this.stage("u1").destroy()
    local u2s = this.stage("u2s")
    for _, v in ipairs(u2s) do
        v.destroy()
    end
end)
