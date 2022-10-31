local process = Process("worthRatio")

process.onStart(function(this)

    -- 100

    Player(1).worth("+", { gold = 10 })
    Player(1).worthRatio("-=50") -- 50

    time.setTimeout(5, function()
        Player(1).worth("+", { silver = 44 })
        Player(1).worthRatio("+=150") -- 200
    end)

    time.setTimeout(10, function()
        Player(1).worth("+", { copper = 33 })
    end)

end)

