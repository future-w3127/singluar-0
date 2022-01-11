TPL_ABILITY.King = AbilityTpl()
    .name("唯我独尊")
    .targetType(ABILITY_TARGET_TYPE.PAS)
    .icon("AB3")
    .description({ "强击单人特效: +{50+this.level()*100}攻击" })
    .levelMax(5)
    .levelUpNeedPoint(101)
    .onGet(
    function(evtData)
        evtData.triggerUnit.attack("+=" .. 100 * evtData.triggerAbility.level())
        evtData.triggerUnit.onAttack(function(ed)
            ability.lightningChain({
                qty = 3,
                sourceUnit = ed.triggerUnit,
                targetUnit = ed.targetUnit,
                damage = 100,
                damageSrc = DAMAGE_SRC.ability,
                damageType = { DAMAGE_TYPE.thunder }
            })
        end, "唯我独尊")
    end)
    .onLose(
    function(evtData)
        evtData.triggerUnit.attack("-=" .. 100 * evtData.triggerAbility.level())
        evtData.triggerUnit.onAttack(nil, "唯我独尊")
    end)
    .onLevelChange(
    function(evtData)
        if (evtData.value > 0) then
            evtData.triggerUnitt.attack("+=" .. 100 * evtData.value)
        elseif (evtData.value < 0) then
            evtData.triggerUnitt.attack("-=" .. 100 * math.abs(evtData.value))
        end
    end)