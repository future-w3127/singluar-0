local process = Process("__init__")

process.onSetup(function(this)

    if (this.stage("init") == nil) then
        -- 资源转化
        Game().convert("gold", "lumber", 1000000) -- 1木 = 1000000金
        Game().convert("silver", "gold", 100) -- 1金 = 100银
        Game().convert("copper", "silver", 100) -- 1银 = 100铜

        -- 命令
        --- -gg 投降
        Game().command("^-gg$", function()
            evtData.triggerPlayer.quit("GG")
        end)
        --- -apm 查看玩家分钟操作数
        Game().command("^-apm$", function(evtData)
            echo("您的apm为:" .. evtData.triggerPlayer.apm(), evtData.triggerPlayer.__HANDLE__)
        end)
        --- -d [+|-|=][NUMBER]减少/增加/设置视距
        Game().command("^-d [-+=]%d+$", function(evtData)
            local cds = string.explode(" ", string.lower(evtData.chatString))
            local first = string.sub(cds[2], 1, 1)
            if (first == "+" or first == "-" or first == "=") then
                --视距
                local v = string.sub(cds[2], 2, string.len(cds[2]))
                v = math.abs(tonumber(v))
                if (v > 0) then
                    local val = math.abs(v)
                    if (first == "+") then
                        evtData.triggerPlayer.cameraDistance("+=" .. val)
                    elseif (first == "-") then
                        evtData.triggerPlayer.cameraDistance("-=" .. val)
                    elseif (first == "=") then
                        evtData.triggerPlayer.cameraDistance(val)
                    end
                end
            end
        end)
        if (DEBUGGING) then
            --- -apm 查看玩家分钟操作数
            Game().command("^-proc [a-zA-Z0-9_]+$", function(evtData)
                local p = string.trim(evtData.matchedString)
                p = string.sub(p, 7, string.len(p))
                local proc = Processes.get(p)
                if (instanceof(proc, "Process")) then
                    print_mb(p .. "流程已重置")
                    proc.start()
                end
            end)
        end

        --- 任务
        Quest("主动投降", "right")
            .icon("ReplaceableTextures\\CommandButtons\\BTNTomeOfRetraining.blp")
            .description("-gg 投降并退出")
        Quest("查看你的APM数值", "right")
            .icon("ReplaceableTextures\\CommandButtons\\BTNTomeOfRetraining.blp")
            .description("-apm 查看你的APM数值")
        Quest("调整你的视距", "right")
            .icon("ReplaceableTextures\\CommandButtons\\BTNTomeOfRetraining.blp")
            .description({
            "-d +[number] 增加视距",
            "-d -[number] 减少视距",
            "-d =[number] 设置视距",
        })
    end

    -- 调试自动去除迷雾
    Game().fog(not DEBUGGING).mark(not DEBUGGING)

    --- 事件反应
    local function _z(z, offset)
        return z + 130 + offset
    end

    ---@param evtData onCritData
    event.reaction(EVENT.crit, function(evtData)
        evtData.targetUnit.effect("Singluar\\crit.mdl")
        ttg.mdx({
            model = "Singluar\\ttg\\evt\\crit.mdl",
            scale = 1.2,
            x = evtData.targetUnit.x(),
            y = evtData.targetUnit.y(),
            z = _z(evtData.targetUnit.z(), -24),
            height = 250,
            duration = 0.3,
        })
    end)
    ---@param evtData onAvoidData
    event.reaction(EVENT.avoid, function(evtData)
        evtData.triggerUnit.attach("Singluar\\ttg\\evt\\avoid.mdl", "overhead", 0.3, 0.2)
    end)
    ---@param evtData onImmuneInvincibleData
    event.reaction(EVENT.immuneInvincible, function(evtData)
        evtData.triggerUnit.attach("Abilities\\Spells\\Human\\DivineShield\\DivineShieldTarget.mdl", "origin", 1)
        ttg.mdx({
            model = "Singluar\\ttg\\evt\\immuneInvincible.mdl",
            scale = 1.4,
            x = evtData.triggerUnit.x(),
            y = evtData.triggerUnit.y(),
            z = _z(evtData.triggerUnit.z(), -44),
            height = 100,
            duration = 1,
        })
    end)
    ---@param evtData onImmuneDefendData
    event.reaction(EVENT.immuneDefend, function(evtData)
        ttg.mdx({
            model = "Singluar\\ttg\\evt\\immune.mdl",
            scale = 1.2,
            x = evtData.triggerUnit.x(),
            y = evtData.triggerUnit.y(),
            z = _z(evtData.triggerUnit.z(), -44),
            height = 100,
            duration = 1,
        })
    end)
    ---@param evtData onImmuneReductionData
    event.reaction(EVENT.immuneReduction, function(evtData)
        ttg.mdx({
            model = "Singluar\\ttg\\evt\\immune.mdl",
            scale = 1.2,
            x = evtData.triggerUnit.x(),
            y = evtData.triggerUnit.y(),
            z = _z(evtData.triggerUnit.z(), -44),
            height = 100,
            duration = 1,
        })
    end)
    ---@param evtData onImmuneDecreaseData
    event.reaction(EVENT.immuneDecrease, function(evtData)
        ttg.mdx({
            model = "Singluar\\ttg\\evt\\immune.mdl",
            scale = 1.2,
            x = evtData.triggerUnit.x(),
            y = evtData.triggerUnit.y(),
            z = _z(evtData.triggerUnit.z(), -44),
            height = 100,
            duration = 1,
        })
    end)
    ---@param evtData onHPSuckData
    event.reaction(EVENT.HPSuck, function(evtData)
        evtData.triggerUnit.attach("Abilities\\Spells\\Other\\HealTarget2\\HealTarget2.mdl", "origin", 0.5)
    end)
    ---@param evtData onHPSuckSpellData
    event.reaction(EVENT.HPSuckSpell, function(evtData)
        evtData.triggerUnit.attach("Abilities\\Spells\\Other\\HealTarget2\\HealTarget2.mdl", "origin", 0.5)
    end)
    ---@param evtData onMPSuckData
    event.reaction(EVENT.MPSuck, function(evtData)
        evtData.triggerUnit.attach("Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl", "origin", 0.5)
    end)
    ---@param evtData onMPSuckSpellData
    event.reaction(EVENT.MPSuckSpell, function(evtData)
        evtData.triggerUnit.attach("Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl", "origin", 0.5)
    end)
    ---@param evtData onPunishData
    event.reaction(EVENT.punish, function(evtData)
        evtData.triggerUnit.rgba(140, 140, 140, 255, evtData.duration)
        evtData.triggerUnit.attach("Singluar\\ttg\\evt\\punish.mdl", "head", 4.9, 0.2)
    end)
    ---@param evtData onBeStunData
    event.reaction(EVENT.beStun, function(evtData)
        evtData.triggerUnit.attach("Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl", "overhead", evtData.duration)
    end)
    ---@param evtData onBeSplitData
    event.reaction(EVENT.beSplit, function(evtData)
        evtData.triggerUnit.effect("Abilities\\Spells\\Human\\Feedback\\SpellBreakerAttack.mdl", 0)
    end)
    ---@param evtData onBeSplitSpreadData
    event.reaction(EVENT.beSplitSpread, function(evtData)
        evtData.triggerUnit.effect("Abilities\\Spells\\Other\\Cleave\\CleaveDamageTarget.mdl", 0)
    end)
    ---@param evtData onHurtData
    event.reaction(EVENT.hurt, function(evtData)
        ttg.char({
            int = math.floor(evtData.damage), 11, 0.26,
            x = evtData.triggerUnit.x(),
            y = evtData.triggerUnit.y(),
            z = _z(evtData.triggerUnit.z(), 0),
            height = 150,
            duration = 0.5,
        })
    end)
    ---@param evtData onEnchantData
    event.reaction(EVENT.enchant, function(evtData)
        ttg.mdx({
            model = "Singluar\\ttg\\evt\\e_" .. evtData.enchantType .. ".mdl",
            scale = 0.8,
            x = evtData.targetUnit.x(),
            y = evtData.targetUnit.y(),
            z = _z(evtData.targetUnit.z(), -24),
            height = math.rand(700, 1200),
            duration = 2,
        })
    end)

    this.stage("init", true)
    this.next("test")

end)
