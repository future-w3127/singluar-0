TPL_ABILITY = {

    AB1 = AbilityTpl("技能1", ABILITY_TARGET_TYPE.TAG_U)
        .icon("AB1")
        .coolDownBase(2.5).hpCostBase(10).mpCostBase(1).castChantBase(2).castKeepBase(10)
        .coolDownVary(-0.05).hpCostVary(5).mpCostVary(7).castChantVary(-0.1).castKeepVary(0.5)
        .levelMax(9)
        .castTargetAllow(function(this, targetUnit)
        return targetUnit ~= nil and targetUnit.isAlive() and targetUnit.isEnemy(this.bindUnit().Owner())
    end)
        .description({
        "基础消耗：" .. colour.purple("{this|mpCost|1}"),
        "对目标造成伤害：" .. colour.gold("{this|level|100}") .. "(技能等级x100)"
    })
        .onEffect(
        function(evtData)
            evtData.triggerUnit.effect("slash/Red_swing")
            local ftp = 1
            time.setInterval(ftp, function(curTimer)
                if (not evtData.triggerUnit.isAbilityKeepCasting()) then
                    curTimer.destroy()
                    return
                end
                evtData.triggerUnit.effect("slash/Red_swing")
                evtData.triggerUnit.abilityPoint("+=1")
            end)
        end),

    AB2 = AbilityTpl("主动技能测试", ABILITY_TARGET_TYPE.TAG_L)
        .icon("AB1")
        .coolDownBase(2.5).hpCostBase(10).mpCostBase(1)
        .coolDownVary(-0.05).hpCostVary(5).mpCostVary(7)
        .levelMax(9)
        .description({
        "基础消耗：" .. colour.purple("{this|mpCost|1}"),
        "对目标造成伤害：" .. colour.gold("{this|level|100}") .. "(技能等级x100)"
    })
        .onEffect(
        function(evtData)
            --ability.unArm(evtData.targetUnit, 3, "SilenceTarget", "weapon")
            ability.silent(evtData.targetUnit, 3, "SilenceTarget", "overhead")
        end),

    AB3 = AbilityTpl("唯我独尊", ABILITY_TARGET_TYPE.PAS)
        .icon("AB2")
        .description({ "强击单人特效: +{this|level|100}攻击" })
        .levelMax(5)
        .levelUpNeedPoint(101)
        .onGet(function(evtData) evtData.triggerUnit.attr().attack("+=" .. 100 * evtData.triggerAbility.level()) end)
        .onLose(function(evtData) evtData.triggerUnit.attr().attack("-=" .. 100 * evtData.triggerAbility.level()) end)
        .onLevelChange(
        function(evtData)
            if (evtData.value > 0) then
                evtData.triggerUnitt.attr().attack("+=" .. 100 * evtData.value)
            elseif (evtData.value < 0) then
                evtData.triggerUnitt.attr().attack("-=" .. 100 * math.abs(evtData.value))
            end
        end),
}