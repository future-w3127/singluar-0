local process = Process("item")

process.onSetup(function(this)

    local u1 = TPL_UNIT.U1.create(Player(1), 0, 0, 66.6).level(1)
    u1.attr()
      .reborn(0.5)
      .hp(1500).hpRegen(10)
      .mp(100)--.mpRegen(-1)
      .move(522)
      .attackSpaceBase(1).attack(91).attackRange(1000).attackSpeed(100)
      .missileAdd({
        priority = 1,
        model = "PriestMissile",
        homing = true, height = 300, speed = 500,
    })
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

    local x1 = os.clock()
    local its = {}
    for _ = 1, 20 do
        local it = TPL_ITEM.IT1.create(0, 0)
        table.insert(its, it)
    end
    this.stage("its", its)

    local x2 = os.clock()
    print(string.format("run time: %.2f\n", x2 - x1))

    u1.itemPick(its[25])
end)

process.onDestroy(function(this)
    this.stage("u1").destroy()
    for _, it in ipairs(this.stage("its")) do
        it.destroy()
    end
end)
