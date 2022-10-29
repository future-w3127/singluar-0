---@param effectiveData noteOnAbilityEffectiveData
TPL_ABILITY.AB1 = AbilityTpl()
    .name("技能1")
    .targetType(ABILITY_TARGET_TYPE.TAG_C)
    .icon("AB1")
    .coolDownAdv(5.5, -0.05)
    .hpCostAdv(10, 5)
    .mpCostAdv(1, 7)
    .castChantAdv(2, -0.1)
    .castKeepAdv(10, 0.5)
    .castRadiusAdv(500, 50)
    .levelMax(9)
    .description(
    function(this)
        local dmg = 0
        if (this.bindUnit and this.bindUnit()) then
            dmg = math.floor(this.bindUnit().attack() * 100)
        else
            dmg = "（基于攻击）"
        end
        return {
            "基础消耗：" .. colour.hex(colour.violet, this.mpCost()),
            "对目标造成伤害：" .. colour.hex(colour.gold, dmg) .. "[攻击x100]"
        }
    end)
    .castTargetFilter(
    function(this, targetUnit)
        return targetUnit ~= nil and targetUnit.isEnemy(this.bindUnit().owner())
    end)
    .onEvent(EVENT.Ability.Effective,
    function(effectiveData)
        local ftp = 1
        time.setInterval(ftp, function(curTimer)
            -- 只是一个持续施法技能，施法后使用isAbilityKeepCasting判定是否仍在施法
            -- 从而可以实现各种周期的效果
            if (not effectiveData.triggerUnit.isAbilityKeepCasting()) then
                curTimer.destroy()
                return
            end
            effectiveData.triggerAbility.exp("+=10")
            effectiveData.triggerUnit.abilityPoint("+=1")
            effect.xyz("Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl", effectiveData.targetX, effectiveData.targetY, effectiveData.targetZ, 0)
        end)
    end)