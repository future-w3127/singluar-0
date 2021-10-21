local process = Process("bgm")

process.onSetup(function(this)

    Game().async(Player(1), function()
        Bgm().play("gbl")
    end)

end)

