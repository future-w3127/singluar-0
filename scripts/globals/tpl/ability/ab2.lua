TPL_ABILITY. AB2 = AbilityTpl()
    .name("沉默一波")
    .targetType(ABILITY_TARGET_TYPE.TAG_U)
    .icon("AB2")
    .coolDownAdv(1, 0)
    .hpCostAdv(10, 5)
    .mpCostAdv(1, 7)
    .levelMax(9)
    .castTargetAllow(function(this, targetUnit)
    return targetUnit ~= nil and targetUnit.isAlive() and targetUnit.isEnemy(this.bindUnit().owner())
end)
    .onEffect(function(evtData)
    ability.silent(evtData.targetUnit, 3, "SilenceTarget", "overhead")
end)
