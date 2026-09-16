SMODS.Joker{
    key = "cartoonheart",
    atlas = "sprites2",
    pos = {
        x = 1,
        y = 3
    },
    rarity = 3,
    cost = 10,
    config = {
        extra = {
            xchips = 1,
            scaling = 0.2
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.scaling
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xchips", 
                scalar_value = "scaling", 
            })
            return {
                message = "Upgrade!",
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return{
                xchips = card.ability.extra.xchips
            }
        end
    end
}