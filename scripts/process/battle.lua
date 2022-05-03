local process = Process("battle")

process.onStart(function(this)
    local u1 = Unit(TPL_UNIT.HeroFlameLord, Player(1), 400, -1000, 66.6)
        .primary(UNIT_PRIMARY.agi)
        .level(1)
        .reborn(0.5)
        .move(522)
        .attackSpaceBase(1).attack("+=100").attackRange(800).attackSpeed(100)
        .crit(10)
        .odds("crit", 10)
        .hpSuckAttack("+=10")
        .mpSuckAttack("+=10")
    --.enchantWeapon("grass", "+=1")
    --.enchantWeapon("fire", "+=1")
        .punish(2000)
        .weight("+=10")

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
    for _ = 1, 4 do
        table.insert(u2s, Unit(TPL_UNIT.BloodBeetle, Player(2), -500, 500, 0)
            .primary(UNIT_PRIMARY.int)
            .reborn(0.5)
            .move(0)
            .attackSpaceBase(1).attack(30).attackRange(1000)
            .lightningPush(Lightning(LIGHTNING_TYPE.suckBlue))
            .enchantWeapon("lightning", "+=1")
            .punish(1000)
        )
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
