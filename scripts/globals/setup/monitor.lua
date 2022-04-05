--- 恢复生命监听器
---@param obj Unit
monitor.create("monitor-life_back", 0.1,
    function(obj) obj.hpCur("+=" .. 0.1 * obj.hpRegen()) end,
    function(obj) return obj.isDead() or obj.hpRegen() == nil or obj.hpRegen() == 0 end
)

--- 恢复魔法监听器
---@param obj Unit
monitor.create("monitor-mana_back", 0.1,
    function(obj) obj.mpCur("+=" .. 0.1 * obj.mpRegen()) end,
    function(obj) return obj.isDead() or obj.mpRegen() == nil or obj.mpRegen() == 0 end
)

--- 硬直监听器
---@param obj Unit
monitor.create("monitor-punish_back", 1,
    function(obj) obj.punishCur("+=" .. obj.mpRegen()) end,
    function(obj) return obj.isDead() or obj.punishRegen() == nil or obj.punishRegen() == 0 end
)