local process = Process("server")

process.onStart(function(this)

    Server(Player(1))["save"]("hello", 1)
    Server(Player(1))["save"]("hello2", "you")
    Server(Player(1))["save"]("hello3", true)
    Server(Player(1))["save"]("hello4", "看这里")

    local t = time.setInterval(1, function(curTimer)
        print(Server(Player(1))["load"]("hello"))
        print(Server(Player(1))["load"]("hello2"))
        print(Server(Player(1))["load"]("hello3"))
        print(Server(Player(1))["load"]("hello4"))
    end)
    this.stage().set("t", t)

end)

process.onOver(function(this)
    this.stage().get("t").destroy()
end)
