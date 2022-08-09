local process = Process("t2r")

process.onStart(function(this)

    local u1 = Unit(TPL_UNIT.HeroFlameLord, Player(1), 0, 0, 0)
    this.stage("u1", u1)

    local t2rFrame = FrameBackdrop("t2r", FrameGameUI)
        .relation(FRAME_ALIGN_CENTER, FrameGameUI, FRAME_ALIGN_LEFT_BOTTOM, 0, 0)
        .size(0.08, 0.004)
        .texture(TEAM_COLOR_BLP_PURPLE)

    japi.Refresh("t2r", function()
        local rx, ry = japi.DzConvertWorldPosition(u1.x(), u1.y(), 155 + u1.stature() + u1.h())
        if (rx == -1 or ry == -1) then
            t2rFrame.show(false)
            return
        end
        print("屏幕x2", rx)
        print("屏幕y2", ry)
        t2rFrame.relation(FRAME_ALIGN_CENTER, FrameGameUI, FRAME_ALIGN_LEFT_BOTTOM, rx, ry).show(true)
    end)

end)

process.onOver(function(this)
    this.stage("u1").destroy()
end)