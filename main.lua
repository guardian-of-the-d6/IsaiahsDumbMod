--#region Atlases
SMODS.Atlas {
    key = 'placeholders',
    path = 'placeholders.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'sprites2',
    path = 'sprites2.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'sprites3',
    path = 'sprites3.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'soul1',
    path = 'soul1.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'consumables1',
    path = 'consumables1.png',
    px = 71,
    py = 95
}

SMODS.Sound {
    key = "letsgogambling",
    path = "lets-go-gambling.ogg"
}
--#endregion
SMODS.current_mod.optional_features = function()
    return {
        post_trigger = true,
        retrigger_joker = true,
        quantum_enhancements = true,
		object_weights = true,
		cardareas = {
            discard = true,
            deck = true
        }
    }
end

--Handling the Mythic rarity
SMODS.Rarity {
    key = "isaiah_mythic",
    badge_colour = HEX("b39f22"),
    loc_txt = {
        name = "Mythic"
    }, 
    pools = {
    ["Joker"] = { weight = 0 }
} 
}
--#Handling Scryer's Cards
SMODS.ConsumableType {
    key = "isaiah_scryer",
    primary_colour = HEX("46123f"),
    secondary_colour = HEX("a94e9d"),
    collection_rows = {6, 9},
    default = 'c_isaiah_signalum',
    shop_rate = 0.05
}
--#region File Loading
local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/"..file))()
end
local consumables_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/consumables")
for _, file in ipairs(consumables_src) do
    assert(SMODS.load_file("src/consumables/"..file))()
end
local boosters_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/boosters")
for _, file in ipairs(boosters_src) do
    assert(SMODS.load_file("src/boosters/"..file))()
end

--#endregion