local process = Process("server")

process.onStart(function(this)

    Server(Player(1))["save"]("hello", 1)
    Server(Player(1))["save"]("hello", "you")
    Server(Player(1))["save"]("hello", true)
    Server(Player(1))["save"]("hello", "看这里")

    time.setTimeout(0.1, function(curTimer)
        print(Server(Player(1))["load"]("hello"))
    end)

end)
