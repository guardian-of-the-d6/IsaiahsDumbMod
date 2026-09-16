SMODS.Joker{
    key = "sneakersotool",
    atlas = "placeholders",
    pos = {
        x = 2,
        y = 3
    },
    rarity = 1, 
    cost = 2,
    config = {
        extra = {
            mult = -4
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            G.GAME.dollars  = G.GAME.dollars - card.ability.extra.mult
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}