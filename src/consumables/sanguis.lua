SMODS.Consumable {
    key = "sanguis",
    atlas = "consumables1",
    pos = {x = 1, y = 0},

    set = 'isaiah_scryer',
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                #G.GAME.fossilisations
            }
        }
    end,
    use = function(self, card, area, copier)
        ease_dollars(#G.GAME.fossilisations)
    end,
    can_use = function(self, card)
        return true
    end
}