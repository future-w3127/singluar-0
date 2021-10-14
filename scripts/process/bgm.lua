local process = Process("bgm")

process.onSetup(function(this)

    Bgm().stop()

    Bgm().musicAlias("gbl").play()

    Player(3).bgm().musicAlias("gbl").play()

end)

