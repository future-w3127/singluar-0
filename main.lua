require("scripts.setup") -- setup 游戏准备
require("tpl.ability") -- 技能模版
require("tpl.item") -- 物品模版
require("tpl.unit") -- 单位模版

-- The game starts here 游戏从 __SINGLUAR__ 函数开始运行
function __SINGLUAR__()

    SETUP()

    local u1 = TPL_UNIT.TheBansheeQueen.create(Player(1), 0, 0, 66.6).level(1)
    u1.attr()
      .hp(600).hpRegen(5)
      .mp(100).mpRegen(-5)
      .move(522)
      .attack(91).attackRange(1000).attackSpeed(300)
      .attackRipple(30)
      .missileAdd("DragonHawkMissile").missileHoming(true)
      .missileHeight(300).missileSpeed(700).missileShake("random")
      .missileScatter(10)
      .crit(10).odds("crit", 10)
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
        u1.attr().attack("+=10;2")
    end)

    for _ = 1, 2 do
        local u2 = Player(2).unit(TPL_UNIT.CenariusNightmare, -1000, 500, 66.6).period(1000)
        u2.attr()
          .primary("agi")
          .move(200)
          .hp(1000000)
          .mpRegen("+=10")
          .attack(10992430)
          .punish(1000)
          .avoid(35)
    end

    u1.abilityPush(TPL_ABILITY.AB1)
    u1.abilityPush(TPL_ABILITY.AB2, 4)

    u1.itemPush(TPL_ITEM.IT1)
    u1.itemPush(TPL_ITEM.IT1)
    u1.itemPush(TPL_ITEM.IT1)

end