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



end)

