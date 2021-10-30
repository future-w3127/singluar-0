-- 资源设定
Game().resource("lumber", "木头", { "gold", 1000000 }) -- 1木 = 1000000金
Game().resource("gold", "黄金", { "silver", 100 }) -- 1金 = 100银
Game().resource("silver", "白银", { "copper", 100 }) -- 1银 = 100铜
Game().resource("copper", "青铜") -- 无下级