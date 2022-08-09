---@param attackData noteOnUnitAttackData
TPL_ABILITY.King = AbilityTpl()
    .name("唯我独尊")
    .targetType(ABILITY_TARGET_TYPE.PAS)
    .icon("AB3")
    .levelMax(5)
    .levelUpNeedPoint(1)
    .attributes(
    {
        { "attack", 100, 50 },
        { "enchant", DAMAGE_TYPE.thunder.value, 10, 1 },
    })
    .onUnitEvent(EVENT.Unit.Attack, "lightningChain",
    function(attackData)
        ability.lightningChain({
            qty = 3,
            sourceUnit = attackData.triggerUnit,
            targetUnit = attackData.targetUnit,
            damage = 100,
            damageSrc = DAMAGE_SRC.ability,
            damageType = { DAMAGE_TYPE.thunder }
        })
    end)
    .prop("atk", 0)
    .onUnitEvent(EVENT.Unit.Attack,
    function(attackData)
        local triggerUnit = attackData.triggerUnit
        local atk = attackData.triggerAbility.prop("atk")
        local atkTarget = attackData.triggerAbility.prop("atkTarget")
        local atkTimer = attackData.triggerAbility.prop("atkTimer")
        if (isObject(atkTimer, "Timer")) then
            atkTimer.destroy()
        end
        local curAtk = 0
        if (atkTarget == nil) then
            curAtk = 1
        elseif (attackData.targetUnit.id() == atkTarget) then
            curAtk = atk + 1
        end
        local diff = curAtk - atk
        attackData.triggerAbility.prop("atk", curAtk)
        attackData.triggerAbility.prop("atkTarget", attackData.targetUnit.id())
        if (diff ~= 0) then
            if (diff > 0) then
                triggerUnit.crit("+=" .. (diff * 5))
                triggerUnit.odds("crit", "+=" .. (diff * 2.5))
            elseif (diff < 0) then
                triggerUnit.crit("-=" .. (-diff * 5))
                triggerUnit.odds("crit", "-=" .. (-diff * 2.5))
            end
            attackData.triggerAbility.prop("atkTimer", time.setTimeout(3, function()
                if (attackData.triggerAbility.isDestroy() == false) then
                    local a = attackData.triggerAbility.prop("atk")
                    if (a > 0) then
                        triggerUnit.crit("-=" .. (a * 5))
                        triggerUnit.odds("crit", "-=" .. (a * 2.5))
                    end
                    attackData.triggerAbility.prop("atkTimer", NIL)
                    attackData.triggerAbility.prop("atkTarget", NIL)
                    attackData.triggerAbility.prop("atk", 0)
                end
            end))
        end
    end)
