---@param effectiveData noteOnAbilityEffectiveData
TPL_ABILITY.AB5 = AbilityTpl()
    .name("技能5")
    .targetType(ABILITY_TARGET_TYPE.TAG_S)
    .icon("AB1")
    .coolDownAdv(5, 0)
    .mpCostAdv(50, 5)
    .onEvent(EVENT.Ability.Effective,
    function(effectiveData)
        print("666")
    end)