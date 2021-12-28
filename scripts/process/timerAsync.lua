local process = Process("timerAsync")

process.onSetup(function(this)

    Async.call(Player(1), function()
        local t1 = time.setInterval(1, function(curTimer)
            print("t1")
        end)
        this.stage("t1", t1)
    end)

    Async.call(Player(2), function()
        local t2 = time.setInterval(1, function(curTimer)
            print("t2")
        end)
        this.stage("t2", t2)
    end)

end)

process.onDestroy(function(this)
    Async.call(Player(1), function()
        this.stage("t1").destroy()
    end)
    Async.call(Player(2), function()
        this.stage("t2").destroy()
    end)
end)

