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
attribute.enchant("fire", "火", {
    strengthen = 0,
    resistance = 0,
    attach = {
        { attach = 'origin', effect = 'Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl' },
        { attach = 'left hand', effect = 'Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl' },
        { attach = 'right hand', effect = 'Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl' },
        { attach = 'head', effect = 'Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl' },
    },
    reaction = {
        grass = attribute.enchantReaction(function(evtData)
            evtData.triggerUnit.attr().hpRegen("-=200;5")
        end)
    },
})

attribute.enchant("rock", "岩")
attribute.enchant("water", "水")
attribute.enchant("ice", "冰")
attribute.enchant("wind", "风")
attribute.enchant("light", "光")
attribute.enchant("dark", "暗")
attribute.enchant("grass", "草")
attribute.enchant("thunder", "雷")
attribute.enchant("poison", "毒")