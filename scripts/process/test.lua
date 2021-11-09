local process = Process("test")

process.onSetup(function(this)

    --J.EnablePreSelect(false, false)

    local u1 = TPL_UNIT.U1.create(Player(1), 0, 0, 66.6)
                       .level(1)
                       .reborn(0.5)
                       .hp(1500).hpRegen(10)
                       .mp(100)--.mpRegen(-1)
                       .move(522)
                       .attackSpaceBase(1).attack(91).attackRange(1000).attackSpeed(100)
                       .missileAdd({ priority = 1, model = "PriestMissile", homing = true, height = 300, speed = 500 })
                       .crit(10).odds("crit", 10)
                       .hpSuck("+=10")
                       .mpSuck("+=10")
                       .enchantWeapon("grass", "+=1")
                       .enchantWeapon("fire", "+=1")
                       .punish(2000)
                       .weight("+=10")

    u1.onDamage(function(evtData)
        u1.exp("+=10")
    end)
    this.stage("u1", u1)

    time.setInterval(3, function()
        u1.attack("+=10;2")
    end)

    --local u2s = {}
    --for _ = 1, 1 do
    --    local u2 = Player(2)
    --        .unit(TPL_UNIT.CenariusNightmare, -768, 500, 66.6)
    --        .period(1000)
    --        .primary(UNIT_PRIMARY.agi)
    --        .flyHeight(300)
    --      .move(300)
    --      .hp(1000000)
    --      .mpRegen("+=10")
    --      .attack(109)
    --      .attackRange(300)
    --      .punish(1000)
    --      .avoid(35)
    --      .lightningAdd({ lightingType = LIGHTING_TYPE.thunderRed, focus = 2 })
    --    table.insert(u2s, u2)
    --end
    --this.stage("u2s", u2s)
    --
    --local as = u1.abilitySlot()
    --as.push(TPL_ABILITY.AB1)
    --as.push(TPL_ABILITY.AB2)
    --as.push(TPL_ABILITY.AB3, 6)
    --time.setInterval(3, function()
    --    as.storage()[1].castRadiusAdv(math.rand(300, 1000), nil)
    --end)
end)

process.onDestroy(function(this)
    this.stage("u1").destroy()
    for _, u in ipairs(this.stage("u2s")) do
        u.destroy()
    end
end)
