--- 蝎子
TPL_UNIT.BloodBeetle = UnitTpl("BloodBeetle")
    .superposition("attack", 1)
    .itemSlot({ TPL_ITEM.IT1, TPL_ITEM.IT2 })
    .hp(10000).hpRegen(100)
    .mp(80).mpRegen(10)
    .abilitySlot({ TPL_ABILITY.AB4, TPL_ABILITY.King })