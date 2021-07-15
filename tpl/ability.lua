TPL_ABILITY = {

    AB1 = AbilityTpl("技能1", ABILITY_TARGET_TYPE.TAG_UL_600)
        .icon("AB1")
        .coolDown(6).hpCast(1).mpCast(1).chantCast(2).keepCast(10)
        .coolDownVary(-0.05).hpCastVary(3).mpCastVary(7).chantCastVary(-0.1).keepCastVary(0.5)
        .levelMax(9)
        .description(
        {
            "基础消耗：" .. colour.purple("{this|mpCast|1}"),
            "对目标造成伤害：" .. colour.gold("{this|level|100}") .. "(技能等级x100)"
        })
        .onSpell(function(evtData)
        evtData.triggerUnit.effect("slash/Red_swing")
        local i = 0
        local ftp = 0.5
        time.setInterval(ftp, function(curTimer)
            if (not evtData.triggerUnit.abilityKeepCasting()) then
                curTimer.destroy()
                print("i=", i)
                return
            end
            i = i + ftp
            evtData.triggerAbility.exp("+3")
            evtData.triggerUnit.effect("slash/Red_swing")
        end)
    end),

    AB2 = AbilityTpl("唯我独尊", ABILITY_TARGET_TYPE.E)
        .icon("AB2")
        .description({ "强击单人特效: +{this|level|100}攻击" })
        .levelMax(5)
        .onGain(
        function(evtData) evtData.triggerUnit.attack("+" .. 100 * evtData.triggerAbility.level()) end)
        .onLose(function(evtData) evtData.triggerUnit.attack("-" .. 100 * evtData.triggerAbility.level()) end)
        .onLevelChange(
        function(evtData)
            if (evtData.value > 0) then
                evtData.triggerUnit.attack("+" .. 100 * evtData.value)
            elseif (evtData.value < 0) then
                evtData.triggerUnit.attack("-" .. 100 * math.abs(evtData.value))
            end
        end),
}