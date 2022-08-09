---@param effectiveData noteOnAbilityEffectiveData
TPL_ABILITY.AB3 = AbilityTpl()
    .name("技能3")
    .targetType(ABILITY_TARGET_TYPE.TAG_L)
    .icon("AB3")
    --.coolDownAdv(5, 0)
    --.mpCostAdv(10, 5)
    .castDistanceAdv(1000, 0)
    .worthCostAdv({ gold = 1, silver = 2, copper = 3 }, { silver = 1, copper = 2 })
    .levelMax(5)
    .levelUpNeedPoint(1)
    .onEvent(EVENT.Ability.Effective,
    function(effectiveData)
        ability.leap({
            sourceUnit = effectiveData.triggerUnit,
            targetPoint = { effectiveData.targetX, effectiveData.targetY },
            modelAlias = "WarStompCaster",
            speed = 500,
            animate = "attack",
            acceleration = 0,
            height = 100,
            onMove = function(options)
                print("move")
            end,
            onEnd = function()
                print("end")
            end,
        })
    end)