_assets_selection("Common")
_assets_font("字魂59号-创粗黑")

_assets_sound("metal_bash_heavy", nil, "vwp")
_assets_sound("voice/clickhero/level_up", "lv", "v3d")
_assets_sound("voice/action/打鼓", "drum", "v3d")
_assets_sound("bgm/dnf/Dungeon and Fighter - GBL女神殿 - goddess temple", "gbl", "bgm")

_assets_model("buff/ApaceGrowth")
_assets_model("slash/Red_swing")
_assets_model("buff/Echo")

_assets_ui("singluar_debug")
_assets_ui("singluar_echo")
_assets_ui("singluar_chat")

--_assets_ui("singluar_menu")
--_assets_ui("singluar_alert")
--_assets_ui("singluar_buff")
--_assets_ui("singluar_controller")
--_assets_ui("singluar_ability")
--_assets_ui("singluar_item")
--_assets_ui("singluar_warehouse")
--_assets_ui("singluar_cursor") --指针置顶

_assets_ui("hunzsig_dz")
_assets_ui("hunzsig_menu")
_assets_ui("hunzsig_alert")
_assets_ui("hunzsig_buff")
_assets_ui("hunzsig_controller")
_assets_ui("hunzsig_ability")
_assets_ui("hunzsig_item")
_assets_ui("hunzsig_warehouse")
_assets_ui("hunzsig_cursor") --指针置顶

_assets_icon("ability\\red\\DeathKnightSpellDeflection", "AB1")
_assets_icon("ability\\blue\\AbsorbMagic", "AB2")
_assets_icon("ability\\blue\\ArcaneArcaneResilience", "AB3")
_assets_icon("ability\\green\\Banish", "AB4")
_assets_icon("ability\\yellow\\Aftershock2", "AB5")

-- 绵羊
_assets_model(":units\\critters\\Sheep\\Sheep", "Sheep", "unit", {
    Art = ":ReplaceableTextures\\CommandButtons\\BTNSheep.blp",
    unitSound = "Sheep", scale = 1.20,
})

-- 步兵
_assets_model(":units\\human\\Footman\\Footman", "Footman", "unit", {
    Art = ":ReplaceableTextures\\CommandButtons\\BTNFootman.blp",
    unitSound = "Footman", scale = 1.10, backSw1 = 0.5, dmgpt1 = 0.5,
})

-- 骑士
_assets_model(":units\\human\\Knight\\Knight", "Knight", "unit", {
    Art = ":ReplaceableTextures\\CommandButtons\\BTNKnight.blp",
    unitSound = "Knight", scale = 1.10, backSw1 = 0.44, dmgpt1 = 0.66,
})
