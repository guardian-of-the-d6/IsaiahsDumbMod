SMODS.Joker{
    key = "cartoonspade",
    atlas = "sprites2",
    pos = {
        x = 2,
        y = 3
    },
    rarity = 3,
    cost = 10,
    config = {
        extra = {
            xmult = 1,
            scaling = 0.1
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.scaling
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult", 
                scalar_value = "scaling", 
            })
            return {
                message = "Upgrade!",
                colour = G.C.BLACK
            }
        end
        if context.joker_main then
            return{
                xmult = card.ability.extra.xmult
            }
        end
    end
}