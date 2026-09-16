SMODS.Joker{
    key = "twentyfourhours",
    atlas = "sprites2",
    pos = {
        x = 0, y = 0
    },
    rarity = 1,
    cost = 3,
    config = {
        extra = {
            mult = 50
        }
    },
    loc_vars = function(self, info_queue, cards)
        return {
            vars = {

            }
        }
    end,
    calculate = function(self, card, context)
         if context.before and next(context.poker_hands['Pair']) then
            SMODS.destroy_cards(card, nil, nil, false)
            return {
                message = "Sleep deprived",
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return{
                mult = card.ability.extra.mult
            }
        end
    end
}