require("scripts.setup") -- setup 游戏准备

-- The game starts here 游戏从 __SINGLUAR__ 函数开始运行
function __SINGLUAR__()

    SETUP()

    local HeroBladeMaster = UnitTpl("HeroBladeMaster")
        .attackAble(true)
        .reborn(1)

    local u1 = Player(1)
        .unit(HeroBladeMaster, 0, 0, 66.6)
        .hp(200).hpRec(5)
        .move(100)
        .attack(10).attackRange(100).attackSpeed(-20)
    --.missileAlias("M暗影刀").missileHoming(true).missileHeight(50).missileSpeed(400)
        .knocking(100).knockingOdds(50)

    u1.onKnocking(function(evtData)
        print_mb("暴击")
    end)

    u1.onMoveStart(function(evtData) print_mb("开始移动") end)
    u1.onMoveStop(function(evtData) print_mb("停止移动") end)
    u1.onMoving(function(evtData) print_mb("第" .. evtData.step .. "步") end)
    u1.onMoveTurn(function(evtData)
        print_mb("转啥弯呢?")
        evtData.triggerUnit.effect("slash_Red_swing", 0)
    end)

    for _ = 1, 1 do
        Player(2)
            .unit(HeroBladeMaster, 400, 400, 66.6)
            .hp(10000).attack(100)
            .hurtRebound(50)
            .hurtReboundOdds(100)
    end

end