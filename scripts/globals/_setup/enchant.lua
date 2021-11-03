-- 方便伤害类型引用
DAMAGE_TYPE.fire = nil
DAMAGE_TYPE.rock = nil
DAMAGE_TYPE.water = nil
DAMAGE_TYPE.ice = nil
DAMAGE_TYPE.wind = nil
DAMAGE_TYPE.light = nil
DAMAGE_TYPE.dark = nil
DAMAGE_TYPE.grass = nil
DAMAGE_TYPE.thunder = nil
DAMAGE_TYPE.poison = nil

-- 附魔设定
attr.enchant("rock", "火", {
    grass = function(evtData)
        print("烧起来了")
    end,
})
attr.enchant("rock", "岩")
attr.enchant("water", "水")
attr.enchant("ice", "冰")
attr.enchant("wind", "风")
attr.enchant("light", "光")
attr.enchant("dark", "暗")
attr.enchant("grass", "草")
attr.enchant("thunder", "雷")
attr.enchant("poison", "毒")

-- 默认负-10%的各附魔抵抗
attr_enchant.forEach(function(key, _)
    this.enchantResistance(key, -10)
end)
