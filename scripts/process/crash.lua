local process = Process("crash")

process.onSetup(function(this)

    local types = {
        var = "变量清空",
        unit = "创建单位",
        ttg = "创建飘浮字",
        ttgs = "创建带缩放漂浮字",
        ttgm = "创建模型漂浮字",
        effect = "创建特效",
        timer = "创建计时器",
    }

    local var_text = {}

    local tips = hjapi.DzCreateFrameByTagName("TEXT", "StandardSmallTextTemplate", hdzui.origin.game(), "DEBUG-UI", 0)
    hjapi.DzFrameSetPoint(tips, FRAME_ALIGN_RIGHT_TOP, hdzui.origin.game(), FRAME_ALIGN_RIGHT_TOP, -0.002, -0.04)
    hjapi.DzFrameSetTextAlignment(tips, TEXT_ALIGN_LEFT)
    hjapi.DzFrameSetText(tips, string.implode('|n', {
        "测试例子，进入游戏，敲入聊天信息",
        "-var [concurrent] [frequency] [number]",
        "-unit [concurrent] [frequency] [number] [during]",
        "-ttg [concurrent] [frequency] [number] [during]",
        "-ttgs [concurrent] [frequency] [number] [during]",
        "-ttgm [concurrent] [frequency] [number] [during]",
        "-effect [concurrent] [frequency] [number] [during]",
        "-timer [concurrent] [frequency] [number] [during]",
    }))

    henemy.set("敌人", nil, { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 })
    hevent.onChat(hplayer.players[1], '-', function(evtData)
        local chatString = evtData.chatString
        local chatOptions = string.explode(' ', chatString)
        local type = string.gsub(chatOptions[1] or "", "-", "")
        local concurrent = tonumber(chatOptions[2]) or 1
        local frequency = tonumber(chatOptions[3]) or 0.5
        local number = tonumber(chatOptions[4]) or 1000
        local during = tonumber(chatOptions[5]) or 3
        if (type == "" or table.includes({
            "var",
            "unit",
            "ttg",
            "ttgs",
            "ttgm",
            "effect",
            "timer",
            "stop",
        }, type) == false) then
            print_err('error:' .. type)
            return
        end
        if (type == 'stop') then
            running = false;
            return
        end
        running = true;
        print_mb("========测试开始"
            .. "\n->type:" .. types[type]
            .. "\n->concurrent:" .. concurrent
            .. "\n->frequency:" .. frequency
            .. "\n->number:" .. number
            .. "\n->during:" .. during
            .. "\n->内存:" .. collectgarbage("count")
            .. "\n========")
        for _ = 1, concurrent do
            local n = 0
            local cache = {}
            local t = cj.CreateTimer()
            cj.TimerStart(
                t,
                frequency,
                true,
                function()
                    n = n + 1
                    if (n % 1000 == 0) then
                        print_mb("====== = >" .. types[type] .. n .. "次")
                    end
                    if (n > number or running == false) then
                        cj.PauseTimer(t)
                        cj.DestroyTimer(t)
                        running = false;
                        print_mb("========" .. types[type] .. "测试结束，内存" .. collectgarbage("count") .. "========")
                        cache = {}
                        return
                    end
                    local x = math.random(0, 1000)
                    local y = math.random(0, 1000)
                    if (type == "var") then
                        --测试全局/局部变量清空，成绩：100万 clear
                        cache[n] = x + y
                        var_text[n] = x + y
                        var_text[n] = nil
                    elseif (type == "unit") then
                        --测试创建单位，成绩：83万
                        local e = henemy.create({
                            id = "u00U",
                            x = x,
                            y = y,
                            during = during,
                        })
                    elseif (type == "ttgs") then
                        --测试飘浮字，成绩：100万 clear
                        htextTag.create2XY(
                            x, y,
                            math.random(0, 100),
                            math.random(5, 10),
                            nil,
                            1,
                            during,
                            math.random(0, 50)
                        )
                    elseif (type == "ttgs") then
                        --测试飘浮字，成绩：100万 clear
                        htextTag.style(
                            htextTag.create2XY(
                                x, y,
                                math.random(0, 100),
                                math.random(5, 10),
                                nil,
                                1,
                                during,
                                math.random(0, 50)
                            ),
                            'toggle',
                            10,
                            10
                        )
                    elseif (type == "ttgm") then
                        --测试模型漂浮字，成绩：50万 clear
                        htextTag.model({
                            msg = tostring(math.random(1, 50000)),
                            x = x,
                            y = y,
                            red = math.random(100, 255),
                            green = math.random(100, 255),
                            blue = math.random(100, 255),
                        })
                    elseif (type == "effect") then
                        --测试特效，成绩：100万 clear
                        heffect.toXY(
                            "Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl",
                            x, y,
                            during
                        )
                    elseif (type == "timer") then
                        --测试计时器，成绩：150万 clear
                        --每个占用 0.1764KB 左右，上限不变则不再增加
                        htime.setTimeout(math.random(1, 50), function(tt)
                            tt.destroy()
                        end)
                    end
                end
            )
        end
    end)

end)

process.onDestroy(function(this)

end)
