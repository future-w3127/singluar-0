-- 事件反应
---@param u Unit
local function _z(u, offset)
    return u.z() + u.flyHeight() + 130 + offset
end

---@param evtData noteOnCritData
event.reaction(EVENT.crit, function(evtData)
    evtData.targetUnit.attach("Singluar\\crit.mdl", "origin", 0.5, 1)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\crit.mdl",
        scale = 1.2,
        x = evtData.targetUnit.x(),
        y = evtData.targetUnit.y(),
        z = _z(evtData.targetUnit, -24),
        height = 250,
        duration = 0.3,
    })
end)
---@param evtData noteOnAvoidData
event.reaction(EVENT.avoid, function(evtData)
    evtData.triggerUnit.attach("Singluar\\ttg\\evt\\avoid.mdl", "overhead", 0.3, 0.2)
end)
---@param evtData noteOnImmuneInvincibleData
event.reaction(EVENT.immuneInvincible, function(evtData)
    evtData.triggerUnit.attach("DivineShieldTarget", "origin", 1)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\immuneInvincible.mdl",
        scale = 1.4,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnImmuneDefendData
event.reaction(EVENT.immuneDefend, function(evtData)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\immune.mdl",
        scale = 1.2,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnImmuneReductionData
event.reaction(EVENT.immuneReduction, function(evtData)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\immune.mdl",
        scale = 1.2,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnImmuneDecreaseData
event.reaction(EVENT.immuneDecrease, function(evtData)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\immune.mdl",
        scale = 1.2,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, -44),
        height = 100,
        duration = 1,
    })
end)
---@param evtData noteOnHPSuckData
event.reaction(EVENT.HPSuck, function(evtData)
    evtData.triggerUnit.attach("HealTarget2", "origin", 0.5)
end)
---@param evtData noteOnHPSuckSpellData
event.reaction(EVENT.HPSuckSpell, function(evtData)
    evtData.triggerUnit.attach("HealTarget2", "origin", 0.5)
end)
---@param evtData noteOnMPSuckData
event.reaction(EVENT.MPSuck, function(evtData)
    evtData.triggerUnit.attach("AImaTarget", "origin", 0.5)
end)
---@param evtData noteOnMPSuckSpellData
event.reaction(EVENT.MPSuckSpell, function(evtData)
    evtData.triggerUnit.attach("AImaTarget", "origin", 0.5)
end)
---@param evtData noteOnPunishData
event.reaction(EVENT.punish, function(evtData)
    evtData.triggerUnit.rgba(140, 140, 140, 255, evtData.duration)
    evtData.triggerUnit.attach("Singluar\\ttg\\evt\\punish.mdl", "head", 4.9, 0.2)
end)
---@param evtData noteOnBeStunData
event.reaction(EVENT.beStun, function(evtData)
    evtData.triggerUnit.attach("ThunderclapTarget", "overhead", evtData.duration)
end)
---@param evtData noteOnBeSplitData
event.reaction(EVENT.beSplit, function(evtData)
    evtData.triggerUnit.effect("SpellBreakerAttack", 0)
end)
---@param evtData noteOnBeSplitSpreadData
event.reaction(EVENT.beSplitSpread, function(evtData)
    evtData.triggerUnit.effect("CleaveDamageTarget", 0)
end)
---@param evtData noteOnHurtData
event.reaction(EVENT.hurt, function(evtData)
    ttg.char({
        int = math.floor(evtData.damage), 11, 0.26,
        x = evtData.triggerUnit.x(),
        y = evtData.triggerUnit.y(),
        z = _z(evtData.triggerUnit, 0),
        height = 150,
        duration = 0.3,
    })
end)
---@param evtData noteOnEnchantData
event.reaction(EVENT.enchant, function(evtData)
    ttg.mdx({
        model = "Singluar\\ttg\\evt\\e_" .. evtData.enchantType .. ".mdl",
        scale = 0.8,
        x = evtData.targetUnit.x(),
        y = evtData.targetUnit.y(),
        z = _z(evtData.targetUnit, -24),
        height = math.rand(700, 1200),
        duration = 2,
    })
end)