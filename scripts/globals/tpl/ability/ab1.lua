TPL_ABILITY.AB1 = AbilityTpl()
    .name("技能1")
    .targetType(ABILITY_TARGET_TYPE.TAG_R)
    .icon("AB1")
    .coolDownAdv(2.5, -0.05)
    .hpCostAdv(10, 5)
    .mpCostAdv(1, 7)
    .castChantAdv(2, -0.1)
    .castKeepAdv(10, 0.5)
    .castRadiusAdv(500, 50)
    .levelMax(9)
    .description({
    "基础消耗：" .. colour.purple("{this.mpCost()}"),
    "对目标造成伤害：" .. colour.gold("{math.floor(this.bindUnit().attack()*100)}") .. "(攻击x100)"
})
    .castTargetAllow(function(this, targetUnit)
    return targetUnit ~= nil and targetUnit.isEnemy(this.bindUnit().owner())
end)
    .onEffect(function(evtData)
    local ftp = 1
    time.setInterval(ftp, function(curTimer)
        if (not evtData.triggerUnit.isAbilityKeepCasting()) then
            curTimer.destroy()
            return
        end
        evtData.triggerAbility.exp("+=10")
        evtData.triggerUnit.abilityPoint("+=1")
        effect.xy("slash/Red_swing", evtData.targetX, evtData.targetY, evtData.targetZ, 0)
    end)
end)