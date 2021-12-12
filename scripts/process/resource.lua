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

    print_mb("对比测试")
    print('Compare1 ', Game().resourceCompare({ silver = 1, gold = 1 }, { silver = 98, copper = 22 }))
    print('Compare2 ', Game().resourceCompare({ silver = 10, copper = 1000 }, { copper = 2000 }))
    print('Compare3 ', Game().resourceCompare({ gold = 2 }, { copper = 1001, silver = 190 }))

    print_mb("上->下转换")
    print_r(Game().resourceU2L({ silver = 44, gold = 1 }))
    print_r(Game().resourceU2L({ gold = 1, silver = 2, copper = 3 }))
    print_r(Game().resourceU2L({ gold = 2, copper = 1234 }))

    print_mb("下->上转换")
    print_r(Game().resourceL2U({ copper = 16400 }))
    print_r(Game().resourceL2U({ copper = 11203 }))
    print_r(Game().resourceL2U({ copper = 21374 }))

    print_mb("比例计算")
    print_r(Game().resourceCale({ gold = 1, silver = 2, copper = 3 }, 0.5))
    print_r(Game().resourceCale({ gold = 2, silver = 1, copper = 7 }, 0.3))
    print_r(Game().resourceCale({ gold = 7, silver = 13, copper = 1111 }, 0.5))

end)

