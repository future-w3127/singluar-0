local process = Process("array")

process.onStart(function(this)

    local a = Array()
    a.set("q", 1)
    a.set("w", 2)
    a.set("e", 3)
    a.set("r", 4)

    dump(a)
    a.forEach(function(key, value)
        print(key, value)
        print("========")
        a.set("e", nil)
        a.forEach(function(k2, v2)
            print("inner=", k2, v2)
            a.set("e", 77)
        end)
    end)
    dump(a)

end)