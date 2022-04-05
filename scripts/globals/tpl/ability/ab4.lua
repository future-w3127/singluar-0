---@param effectiveData noteOnAbilityEffectiveData
TPL_ABILITY.AB4 = AbilityTpl()
    .name("技能4")
    .targetType(ABILITY_TARGET_TYPE.TAG_E)
    .icon("AB2")
    .coolDownAdv(5, 0)
    .mpCostAdv(80, 5)
    .onEvent(EVENT.Ability.Effective,
    function(effectiveData)
        effectiveData.triggerUnit.attack("+=100;6")
    end)