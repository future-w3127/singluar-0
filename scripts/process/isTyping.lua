local process = Process("isTyping")

process.onStart(function(this)

    time.setInterval(0.1, function()
        async.call(Player(1), function()
            print("IsTyping=", japi.IsTyping())
        end)
    end)

end)

