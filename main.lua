-- The game starts here 游戏从 __SINGLUAR__ 函数开始运行
function __SINGLUAR__()

    require("scripts.setup") -- setup 游戏准备
    require("tpl.ability") -- 技能模版
    require("tpl.item") -- 物品模版
    require("tpl.unit") -- 单位模版

    local u1 = TPL_UNIT.U1.create(Player(1), 0, 0, 66.6).level(1)
    u1.attr()
      .reborn(0.5)
      .hp(5000).hpRegen(5)
      .mp(100)--.mpRegen(-1)
      .move(522)
      .attack(91).attackRange(1000).attackSpeed(300)
      .attackRipple(30)
      .missileAdd({
        priority = 1,
        model = "DragonHawkMissile",
        homing = true, height = 300, speed = 700, shake = 'random',
        scatter = 10,
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

    --time.setInterval(3, function()
    --    u1.attr().attack("+=10;2")
    --end)
    --time.setInterval(3, function()
    --    Player(1).alert(string.random(10))
    --end)

    for _ = 1, 5 do
        local u2 = Player(2).unit(TPL_UNIT.CenariusNightmare, -400, 400, 66.6).period(1000)
        u2.attr()
          .primary("agi")
          .move(50)
          .hp(1000000)
          .mpRegen("+=10")
          .attack(109).attackRange(300)
          .punish(1000)
          .avoid(35)
          .lightningAdd({ lightingType = LIGHTING_TYPE.thunderRed, focus = 2 })
    end

    u1.abilityPush(TPL_ABILITY.AB1)
    u1.abilityPush(TPL_ABILITY.AB2)
    u1.abilityPush(TPL_ABILITY.AB3, 4)

    time.setInterval(5, function()
        u1.ability()[1].castRadiusAdv(math.random(50, 1200), nil)
    end)

    u1.itemPush(TPL_ITEM.IT1, 2) -- 物品A
    u1.itemPush(TPL_ITEM.IT2, 3) -- 物品B

end