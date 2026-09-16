local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()

SMODS.Consumable {
    key = "gladius",
    atlas = "consumables1",
    pos = {
        x = 4, 
        y = 0
    },
    set = "isaiah_scryer",
    loc_vars = function(self, info_queue, card)
        return{
            vars = {

            }
        }
    end,
    use = function(self, card, area, copier)
        for i,cards in ipairs(G.jokers.cards) do
            fossil.fossilise(cards)
            ease_dollars(25)
        end
    end,
    can_use = function(self, card)
        return true
    end
}