require("scripts.setup") -- setup 游戏准备

-- The game starts here 游戏从 __SINGLUAR__ 函数开始运行
function __SINGLUAR__()

    SETUP()

    local TheBansheeQueen = UnitTpl("TheBansheeQueen")
        .attackAble(true)
        .reborn(3)
    local CenariusNightmare = UnitTpl("Cenarius_Nightmare")
        .attackAble(true)
        .reborn(3)

    local u1 = TheBansheeQueen.create(Player(1), 0, 0, 66.6)
                              .hp(600).hpRec(5)
                              .mp(100).mpRec(-5)
                              .move(522)
                              .attack(100).attackRange(600).attackSpeed(300)
                              .missileAlias("DragonHawkMissile").missileHoming(true)
                              .missileHeight(300).missileSpeed(700).missileShake("random")
                              .missileScatter(10)
                              .knocking(100).knockingOdds(25)
                              .hpSuck(10)
                              .mpSuck(10)
                              .enchantWeapon("grass", "+1")
                              .enchantWeapon("poison", "+1")
                              .punish(2000)
                              .level(1)
                              .weight(10)

    u1.onDamage(function(evtData)
        u1.exp("+" .. evtData.damage * 50)
    end)

    time.setInterval(0.5, function(curTimer)
        local attr = table.random({ "attack", "defend", "move", "attackSpeed", "str", "agi", "int" })
        local val = table.random({ "+", "-" }) .. math.random(5, 10) .. ";" .. math.random(3, 40)
        u1[attr](val)
    end)

    for _ = 1, 2 do
        local u2 = Player(2).unit(CenariusNightmare, -1000, 500, 66.6)
                            .period(1000)
                            .move(0)
                            .hp(1000000)
                            .mpRec("+10")
                            .attack(10992430)
                            .punish(1000)
                            .avoid(75)
                            .primary("agi")
    end

    u1.abilityPush(Ability("技能1", ABILITY_TARGET_TYPE.TAG_UL_600, "AB1"), 2)
    u1.abilityPush(Ability("技能2", ABILITY_TARGET_TYPE.E, "AB2"), 5)
    u1.abilityPush(Ability(string.random(10), ABILITY_TARGET_TYPE.FREE_1, "AB3"))
    u1.abilityPush(Ability(string.random(10), ABILITY_TARGET_TYPE.FREE_2, "AB4"))
    u1.abilityPush(Ability(string.random(10), ABILITY_TARGET_TYPE.TAG_E, "AB5"))

end