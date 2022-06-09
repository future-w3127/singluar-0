local process = Process("item")

process.onStart(function(this)

    local u1 = Player(1)
        .unit(TPL_UNIT.HeroFlameLord, 0, 0, 66.6)
        .level(1)
        .reborn(0.5)
        .hp(1500).hpRegen(10)
        .mp(100)--.mpRegen(-1)
        .move(522)
        .attackSpaceBase(1).attack(91).attackRange(1000).attackSpeed(100)
        .missilePush(Missile("PriestMissile").homing(true).height(300).speed(500))
        .crit(10).odds("crit", 10)
        .hpSuckAttack("+=10")
        .mpSuckAttack("+=10")
        .enchantWeapon("grass", "+=1")
        .enchantWeapon("fire", "+=1")
        .punish(2000)
        .weight("+=10")

    u1.onEvent(EVENT.Unit.Damage, function(evtData)
        evtData.triggerUnit.exp("+=10")
    end)
    this.stage("u1", u1)

    local u3 = Player(3)
        .unit(TPL_UNIT.HeroFlameLord, 300, 0, 180)
        .level(1)
        .reborn(3)
        .hp(1500)
        .mp(100)
        .move(0)

    local x1 = os.clock()
    local its = {}
    for _ = 1, 10 do
        local it = Item(TPL_ITEM.IT1).position(0, -300)
        table.insert(its, it)
    end
    for _ = 1, 10 do
        local it = Item(TPL_ITEM.IT2).position(0, -300)
        table.insert(its, it)
    end
    this.stage("its", its)

    local x2 = os.clock()
    print(string.format("run time: %.2f\n", x2 - x1))

    mouse.onMove("ItemUnderMouse", function(_)
        local under = japi.DzGetUnitUnderMouse()
        if (type(under) == "number" and under > 0) then
            local it = h2i(under)
            if (instanceof(it, "Item")) then
                print(japi.MouseRX(), japi.MouseRY())
            end
        end
    end)

end)

process.onOver(function(this)
    this.stage("u1").destroy()
    for _, it in ipairs(this.stage("its")) do
        it.destroy()
    end
end)
