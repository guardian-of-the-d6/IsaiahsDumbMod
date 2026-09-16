SMODS.Joker{
    key = "cartoonclub",
    atlas = "sprites2",
    pos = {
        x = 4,
        y = 3
    },
    rarity = 3,
    cost = 10,
    config = {
        extra = {
            mult = 0,
            scaling = 7
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.mult,
                card.ability.extra.scaling
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult", 
                scalar_value = "scaling", 
            })
            return {
                message = "Upgrade!",
                colour = G.C.GREEN
            }
        end
        if context.joker_main then
            return{
                mult = card.ability.extra.mult
            }
        end
    end
}