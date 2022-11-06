local process = Process("zzjy")

process.onStart(function(this)

    local me = Unit(TPL_UNIT.Footman, Player(1), 0, 0, 270).abilityPoint(5)
    me.abilitySlot().push(TPL_ABILITY.Rebound, 1)
    ability.invulnerable(me, 2)

    me.onEvent(EVENT.Unit.Dead, function() print("meDead") end)
    me.onEvent(EVENT.Unit.FeignDead, function() print("meFeignDead") end)

    Unit(TPL_UNIT.MortarTeam, Player(2), 500, 300, 270)
    Unit(TPL_UNIT.Rifleman, Player(2), 500, -300, 270)
    Unit(TPL_UNIT.BloodElfDragonHawk, Player(2), -500, 300, 270)
    Unit(TPL_UNIT.WyvernRider, Player(2), -500, -300, 270)
    local u5 = Unit(TPL_UNIT.ChaosWarlockGreen, Player(2), 0, -500, 270)

    u5.onEvent(EVENT.Unit.Dead, function() print("5Dead") end)
    u5.onEvent(EVENT.Unit.FeignDead, function() print("5FeignDead") end)

end)

process.onOver(function(this)
end)
