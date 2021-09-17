local process = Process("test")

process.onSetup(function(this)

    local u1 = TPL_UNIT.U1.create(Player(1), 0, 0, 66.6).level(1)
    u1.attr()
      .reborn(0.5)
      .hp(1000).hpRegen(5)
      .mp(100)--.mpRegen(-1)
      .move(522)
      .attack(91).attackRange(1000).attackSpeed(100)
      .attackRipple(30)
      .missileAdd({
        priority = 1,
        model = "DragonHawkMissile",
        homing = true, height = 300, speed = 700, shake = 'rand',
        scatter = 100, radius = 10000,
    })
      .crit(10).odds("crit", 10)
      .hpSuck("+=10")
      .mpSuck("+=10")
      .enchantWeapon("grass", "+=1")
      .enchantWeapon("poison", "+=1")
      .punish(2000)
      .weight("+=10")

    u1.onDamage(function(evtData)
        u1.exp("+=10")
    end)
    this.stage("u1", u1)

    --time.setInterval(3, function()
    --    u1.attr().attack("+=10;2")
    --end)
    --time.setInterval(3, function()
    --    Player(1).alert(string.random(10))
    --end)

    local u2s = {}
    for _ = 1, 20 do
        local u2 = Player(2).unit(TPL_UNIT.CenariusNightmare, -400, 400, 66.6).period(1000).primary("agi")
        u2.attr()
          .move(50)
          .hp(1000000)
          .mpRegen("+=10")
          .attack(109).attackRange(300)
          .punish(1000)
          .avoid(35)
          .lightningAdd({ lightingType = LIGHTING_TYPE.thunderRed, focus = 2 })
        table.insert(u2s, u2)
    end
    this.stage("u2s", u2s)

    u1.abilityPush(TPL_ABILITY.AB1)
    u1.abilityPush(TPL_ABILITY.AB2)
    u1.abilityPush(TPL_ABILITY.AB3, 6)

    u1.itemPush(TPL_ITEM.IT1, 2) -- 物品A
    u1.itemPush(TPL_ITEM.IT2, 3) -- 物品B

end)

process.onDestroy(function(this)
    this.stage("u1").destroy()
    for _, u in ipairs(this.stage("u2s")) do
        u.destroy()
    end
end)
