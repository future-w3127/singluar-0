-- 事件反应
---@param u Unit
local function _z(u, offset)
    return u.h() + 130 + offset
end

---@param evtData noteOnUnitCritData
event.reaction(EVENT.Unit.Crit, function(evtData)
    evtData.targetUnit.attach("Singluar\\crit.mdl", "origin", 0.5, 1)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\crit.mdl",
        size = 1.2,
        x = evtData.targetUnit.x(),
        y = evtData.targetUnit.y(),
        z = _z(evtData.targetUnit, -24),
        height = 250,
        duration = 0.3,
    })
end)
---@param evtData noteOnUnitAvoidData
event.reaction(EVENT.Unit.Avoid, function(evtData)
    evtData.triggerUnit.attach("Singluar\\ttg\\evt\\avoid.mdl", "overhead", 0.3, 0.2)
end)
---@param evtData noteOnUnitImmuneInvincibleData
event.reaction(EVENT.Unit.ImmuneInvincible, function(evtData)
    evtData.triggerUnit.attach("DivineShieldTarget", "origin", 1)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\immuneInvincible.mdl",
        size = 1.4,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnUnitImmuneDefendData
event.reaction(EVENT.Unit.ImmuneDefend, function(evtData)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\immune.mdl",
        size = 1.2,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnUnitImmuneReductionData
event.reaction(EVENT.Unit.ImmuneReduction, function(evtData)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\immune.mdl",
        size = 1.2,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnUnitHPSuckAttackData
event.reaction(EVENT.Unit.HPSuckAttack, function(evtData)
    evtData.triggerUnit.attach("HealTarget2", "origin", 0.5)
end)
---@param evtData noteOnUnitHPSuckAbilityData
event.reaction(EVENT.Unit.HPSuckAbility, function(evtData)
    evtData.triggerUnit.attach("HealTarget2", "origin", 0.5)
end)
---@param evtData noteOnUnitMPSuckAttackData
event.reaction(EVENT.Unit.MPSuckAttack, function(evtData)
    evtData.triggerUnit.attach("AImaTarget", "origin", 0.5)
end)
---@param evtData noteOnUnitMPSuckAbilityData
event.reaction(EVENT.Unit.MPSuckAbility, function(evtData)
    evtData.triggerUnit.attach("AImaTarget", "origin", 0.5)
end)
---@param evtData noteOnUnitPunishData
event.reaction(EVENT.Unit.Punish, function(evtData)
    evtData.triggerUnit.rgba(140, 140, 140, 255, evtData.duration)
    evtData.triggerUnit.attach("Singluar\\ttg\\evt\\punish.mdl", "head", 4.9, 0.2)
end)
---@param evtData noteOnUnitBeStunData
event.reaction(EVENT.Unit.Be.Stun, function(evtData)
    evtData.triggerUnit.attach("ThunderclapTarget", "overhead", evtData.duration)
end)
---@param evtData noteOnUnitBeSplitData
event.reaction(EVENT.Unit.Be.Split, function(evtData)
    evtData.triggerUnit.effect("SpellBreakerAttack", 0)
end)
---@param evtData noteOnUnitBeSplitSpreadData
event.reaction(EVENT.Unit.Be.SplitSpread, function(evtData)
    evtData.triggerUnit.effect("CleaveDamageTarget", 0)
end)
---@param evtData noteOnUnitHurtData
event.reaction(EVENT.Unit.Hurt, function(evtData)
    ttg.char({
        int = math.floor(evtData.damage),
        width = 10,
        size = 0.25,
        scale = { 1, 0.9 },
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, 0),
        height = 250,
        duration = 0.5,
    })
end)
---@param evtData noteOnUnitEnchantData
event.reaction(EVENT.Unit.Enchant, function(evtData)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\e_" .. evtData.enchantType .. ".mdl",
        size = 0.8,
        scale = { 1, 0.9 },
        x = evtData.targetUnit.x() - math.rand(0, 50),
        y = evtData.targetUnit.y() - math.rand(0, 50),
        z = _z(evtData.targetUnit, -24),
        height = 300,
        duration = 0.5,
    })
end)