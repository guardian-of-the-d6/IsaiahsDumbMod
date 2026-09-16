SMODS.Joker{
    key = "cartoondiamond",
    atlas = "sprites2",
    pos = {
        x = 3,
        y = 3
    },
    rarity = 3,
    cost = 10,
    config = {
        extra = {
            money = 0,
            scaling = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.money,
                card.ability.extra.scaling
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamond") then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "money", 
                scalar_value = "scaling", 
            })
            return {
                message = "Upgrade!",
                colour = G.C.ORANGE
            }
        end
        if context.end_of_round then
            ease_dollars(card.ability.extra.money)
            return{
                true
            }
        end
    end
}