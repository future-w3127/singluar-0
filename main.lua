require("scripts.setup") -- setup 游戏准备
require("tpl.ability") -- 技能模版
require("tpl.unit") -- 单位模版

-- The game starts here 游戏从 __SINGLUAR__ 函数开始运行
function __SINGLUAR__()

    SETUP()

    local u1 = TPL_UNIT.TheBansheeQueen.create(Player(1), 0, 0, 66.6)
                       .hp(600).hpRec(5)
                       .mp(100).mpRec(-5)
                       .move(522)
                       .level(1)
                       .attack(91).attackRange(600).attackSpeed(300)
                       .attackRipple(30)
                       .missileAlias("DragonHawkMissile").missileHoming(true)
                       .missileHeight(300).missileSpeed(700).missileShake("random")
                       .missileScatter(10)
                       .knocking("+=10;20").knockingOdds("+=10;20")
                       .hpSuck("+=10")
                       .mpSuck("+=10")
                       .enchantWeapon("grass", "+=1;60")
                       .enchantWeapon("poison", "+=1;60")
                       .punish(2000)
                       .weight("+=10;60")

    u1.onDamage(function(evtData)
        u1.exp("+=10")
    end)

    time.setInterval(3, function()
        u1.attack("+=10;2")
    end)

    for _ = 1, 2 do
        local u2 = Player(2).unit(TPL_UNIT.CenariusNightmare, -1000, 500, 66.6)
                            .period(1000)
                            .move(200)
                            .hp(1000000)
                            .mpRec("+=10")
                            .attack(10992430)
                            .punish(1000)
                            .avoid(35)
                            .primary("agi")
    end

    u1.abilityPush(TPL_ABILITY.AB1)
    u1.abilityPush(TPL_ABILITY.AB2, 4)


end