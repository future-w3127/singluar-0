local process = Process("resource")

process.onSetup(function(this)

    time.setTimeout(1, function()
        Player(1).gold("+=20")
    end)
    time.setTimeout(3, function()
        Player(1).silver("+=145")
    end)
    time.setTimeout(5, function()
        Player(1).copper("+=166")
    end)

    print('Compare1 ', Game().resourceCompare({ silver = 1, gold = 1 }, { silver = 98, copper = 22 }))
    print('Compare2 ', Game().resourceCompare({ silver = 10, copper = 1000 }, { copper = 2000 }))
    print('Compare3 ', Game().resourceCompare({ gold = 2 }, { copper = 1001, silver = 190 }))

end)

