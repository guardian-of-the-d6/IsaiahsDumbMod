SMODS.Consumable {
    key = "animus",
    atlas = "consumables1",
    pos = {x = 0, y = 1},
    set = 'isaiah_scryer',
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
            }
        }
    end,
    use = function(self, card, area, copier)

        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        ease_discard(1)
    return true 
    end,
 
    can_use = function(self, card)
        return true
    end
}