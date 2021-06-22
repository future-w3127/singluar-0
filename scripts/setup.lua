SETUP = function()

    SINGLUAR_MAP_NAME = "特异图-0"

    -- 设定玩家支持的默认命令
    cmd.conf({ "-gg", "-apm", "-d" }, { 1 })

    -- 调试自动去除迷雾
    env.setFogStatus(not DEBUGGING, not DEBUGGING)

end
