---@param getData noteOnAbilityGetData
---@param loseData noteOnAbilityLoseData
---@param lvcData noteOnAbilityLevelChangeData
---@param attackData noteOnUnitAttackData
TPL_ABILITY.King = AbilityTpl()
    .name("唯我独尊")
    .targetType(ABILITY_TARGET_TYPE.PAS)
    .icon("AB3")
    .description({ "强击单人特效: +{50+this.level()*100}攻击" })
    .levelMax(5)
    .levelUpNeedPoint(101)
    .onEvent(EVENT.Ability.Get, function(getData) getData.triggerUnit.attack("+=" .. 100 * getData.triggerAbility.level()) end)
    .onEvent(EVENT.Ability.Lose, function(loseData) loseData.triggerUnit.attack("+=" .. 100 * loseData.triggerAbility.level()) end)
    .onEvent(EVENT.Ability.LevelChange,
    function(lvcData)
        if (lvcData.value > 0) then
            lvcData.triggerUnit.attack("+=" .. 100 * lvcData.value)
        elseif (evtData.value < 0) then
            lvcData.triggerUnit.attack("-=" .. 100 * math.abs(lvcData.value))
        end
    end)
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
                attackData.triggerUnit.crit("+=" .. (diff * 5))
                attackData.triggerUnit.odds("crit", "+=" .. (diff * 2.5))
            elseif (diff < 0) then
                attackData.triggerUnit.crit("-=" .. (-diff * 5))
                attackData.triggerUnit.odds("crit", "-=" .. (-diff * 2.5))
            end
            attackData.triggerAbility.prop("atkTimer", time.setTimeout(3, function()
                local a = attackData.triggerAbility.prop("atk")
                if (a > 0) then
                    attackData.triggerUnit.crit("-=" .. (a * 5))
                    attackData.triggerUnit.odds("crit", "-=" .. (a * 2.5))
                end
                attackData.triggerAbility.prop("atkTimer", NIL)
                attackData.triggerAbility.prop("atkTarget", NIL)
                attackData.triggerAbility.prop("atk", 0)
            end))
        end
    end)
