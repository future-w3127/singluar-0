local process = Process("performance")

process.onSetup(function(this)

    local x1 = os.clock()

    for i = 1, 20 do
        FrameTooltip("test" .. i)
    end

    local x2 = os.clock()
    print(string.format("Time: %.6f\n", x2 - x1))

end)