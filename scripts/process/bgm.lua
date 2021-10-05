local process = Process("bgm")

process.onSetup(function(this)

    bgm.stop()
    bgm.play("gbl", Player(1))

end)

