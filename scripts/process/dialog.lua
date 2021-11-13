local process = Process("dialog")

process.onSetup(function(this)

    Dialog(
        "选择难度",
        {
            { hotkey = "Q", label = "一般困难", value = 1 },
            { hotkey = "W", label = "非常困难", value = 2 },
            { hotkey = "E", label = "极奇困难", value = 3 },
            { hotkey = "R", label = "破天荒难", value = 4 },
        },
        function(btnData)
            if (btnData.hotkey == "Q") then
                --搞点事情
            elseif (btnData.hotkey == "W") then
                --搞点事情
            elseif (btnData.hotkey == "E") then
                --搞点事情
            else
                --搞点事情
            end
            echo("选择了：" .. btnData.label .. "等级：" .. btnData.value)
        end
    ).show()

end)
