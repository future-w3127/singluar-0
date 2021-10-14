local process = Process("camera")

process.onSetup(function(this)

    Player(1).camera().shake(10, 0.2, 10)
    Player(1).camera().quake(10, 5)

    print(Player(1).camera().isShaking())
    print(Player(1).camera().isQuaking())

    time.setTimeout(7.5, function()
        print(Player(1).camera().isShaking())
        print(Player(1).camera().isQuaking())
    end)

end)

