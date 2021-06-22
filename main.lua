require("scripts.setup") -- setup 游戏准备

-- The game starts here 游戏从 __SINGLUAR__ 函数开始运行
function __SINGLUAR__()

    SETUP()

    local HeroBladeMaster = UnitTpl("HeroBladeMaster")
        .attackAble(true)
        .reborn(1)

    local u1 = HeroBladeMaster.create(Player(1), 0, 0, 66.6)
                              .hp(600).hpRec(5)
                              .mp(100).mpRec(-5)
                              .move(522)
                              .attack(100).attackRange(2000).attackSpeed(100)
                              .missileAlias("M暗影刀").missileHoming(true).missileHeight(50).missileSpeed(300)
                              .knocking(100).knockingOdds(25)
                              .hpSuck(10)
                              .mpSuck(10)
                              .enchantAttack("fire", "+3")
                              .enchantAttack("water", "+1")
                              .enchantAttack("poison", "+2")
                              .enchantAmplify("poison", "+100")


    --u1.onKnocking(function(evtData)
    --    print_mb("暴击")
    --end)
    --u1.onHPSuck(function(evtData)
    --    print_mb("攻击吸血")
    --end)
    --u1.onMPSuck(function(evtData)
    --    print_mb("攻击吸蓝")
    --end)

    for _ = 1, 1 do
        local u2 = Player(2).unit(HeroBladeMaster, 400, 400, 66.6)
                            .move(150)
                            .hp(10000000)
                            .mpRec("+10")
                            .attack(10992430)
                            .punish(100)
                            .avoid(75)
                            .primary("agi")
    end

    time.setTimeout(5, function()
        u1.lightning(LIGHTING_TYPE.thunderRed)
    end)

end