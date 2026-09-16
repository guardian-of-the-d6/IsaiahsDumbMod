SMODS.Joker{
    key = "pokerjoker",
    atlas = "sprites2",
    pos = {
        x = 1,
        y = 0
    },
    rarity = 3,
    cost = 11,
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual then
            card.ability.extra.xmult = card.ability.extra.xmult + 0.01
        end
        if context.joker_main then
            return{
                xmult = card.ability.extra.xmult
            }
        end
    end

}